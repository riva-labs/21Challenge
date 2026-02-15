/// GUN 17: Object'lerin (Nesnelerin) Sahipligi ve Basit Entry Function (Giris Fonksiyonu)
///
/// Bugun yapacaklariniz:
/// 1. Object (nesne) sahipligini ogrenmek
/// 2. Ilk entry function'inizi (giris fonksiyonunuzu) yazmak
/// 3. Object'leri (nesneleri) kullanicilara transfer etmek
///
/// Not: Kod plotId destegi icermektedir. Gerekirse
/// day_16/sources/solution.move dosyasindan kod kopyalayabilirsiniz (not: plotId islevi eklenmistir)

module challenge::day_17 {


    // day_16'dan kopyala: FarmCounters ve Farm
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

    // TODO: Asagidakileri yapan bir 'create_farm' entry function'i (giris fonksiyonu) yazin:
    // - ctx: &mut TxContext parametresi alir
    // - new_farm kullanarak bir Farm olusturur
    // - transfer::share_object(farm) kullanarak paylasilabilir object (nesne) yapar
    // entry fun create_farm(ctx: &mut TxContext) {
    //     // Kodunuz buraya
    // }

    // TODO: Asagidakileri yapan bir 'plant_on_farm' fonksiyonu yazin:
    // - farm: &mut Farm, plotId: u8 parametreleri alir
    // - farm.counters uzerinde plotId ile plant() fonksiyonunu cagirir
    // fun plant_on_farm(farm: &mut Farm, plotId: u8) {
    //     // Kodunuz buraya
    // }

    // TODO: Asagidakileri yapan bir 'harvest_from_farm' fonksiyonu yazin:
    // - farm: &mut Farm, plotId: u8 parametreleri alir
    // - farm.counters uzerinde plotId ile harvest() fonksiyonunu cagirir
    // fun harvest_from_farm(farm: &mut Farm, plotId: u8) {
    //     // Kodunuz buraya
    // }
}
