/// GUN 17: Object'lerin (Nesnelerin) Sahipligi ve Basit Entry Function (Giris Fonksiyonu) - COZUM
///
/// Bu cozum dosyasidir.
/// Ogrenciler main.move dosyasini tamamlamalidir.

module challenge::day_17_solution {


    // day_16'dan Farm ve FarmCounters'i kopyala
    const MAX_PLOTS: u64 = 20;
    const E_PLOT_NOT_FOUND: u64 = 1;
    const E_PLOT_LIMIT_EXCEEDED: u64 = 2;
    const E_INVALID_PLOT_ID: u64 = 3;
    const E_PLOT_ALREADY_EXISTS: u64 = 4;

    public struct FarmCounters has copy, drop, store {
        planted: u64,
        harvested: u64,
        plots: vector<u8>,
    }

    fun new_counters(): FarmCounters {
        FarmCounters {
            planted: 0,
            harvested: 0,
            plots: vector::empty(),
        }
    }

    fun plant(counters: &mut FarmCounters, plotId: u8) {
        // plotId'nin gecerli olup olmadigini kontrol et (1 ile 20 arasinda)
        assert!(plotId >= 1 && plotId <= (MAX_PLOTS as u8), E_INVALID_PLOT_ID);

        // Plot limitine ulasilip ulasilmadigini kontrol et
        let len = vector::length(&counters.plots);
        assert!(len < MAX_PLOTS, E_PLOT_LIMIT_EXCEEDED);

        // Plot'un vector'de zaten var olup olmadigini kontrol et
        let mut i = 0;
        while (i < len) {
            let existing_plot = vector::borrow(&counters.plots, i);
            assert!(*existing_plot != plotId, E_PLOT_ALREADY_EXISTS);
            i = i + 1;
        };

        counters.planted = counters.planted + 1;
        vector::push_back(&mut counters.plots, plotId);
    }

    fun harvest(counters: &mut FarmCounters, plotId: u8) {
        let len = vector::length(&counters.plots);

        // Plot'un vector'de var olup olmadigini kontrol et ve indeksini bul
        let mut i = 0;
        let mut found_index = len;
        while (i < len) {
            let existing_plot = vector::borrow(&counters.plots, i);
            if (*existing_plot == plotId) {
                found_index = i;
            };
            i = i + 1;
        };

        // Plot'un bulundugunu dogrula (found_index < len ise bulduk demektir)
        assert!(found_index < len, E_PLOT_NOT_FOUND);

        // Plot'u vector'den kaldir
        vector::remove(&mut counters.plots, found_index);
        counters.harvested = counters.harvested + 1;
    }

    public struct Farm has key {
        id: UID,
        counters: FarmCounters,
    }

    fun new_farm(ctx: &mut TxContext): Farm {
        Farm {
            id: object::new(ctx),
            counters: new_counters(),
        }
    }

    // Farm olusturmak ve gonderene transfer etmek icin entry function (giris fonksiyonu)
    entry fun create_farm(ctx: &mut TxContext) {
        let farm = new_farm(ctx);
        transfer::share_object(farm);
    }

    // Farm uzerinde ekim yap (dahili fonksiyon)
    fun plant_on_farm(farm: &mut Farm, plotId: u8) {
        plant(&mut farm.counters, plotId);
    }

    // Farm'dan hasat yap (dahili fonksiyon)
    fun harvest_from_farm(farm: &mut Farm, plotId: u8) {
        harvest(&mut farm.counters, plotId);
    }
}
