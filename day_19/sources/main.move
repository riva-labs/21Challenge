/// GUN 19: Basit Sorgu Fonksiyonlari (View benzeri)
///
/// Bugun yapacaklariniz:
/// 1. Salt okunur fonksiyonlar yazma
/// 2. Object (nesne) durumunu sorgulama
/// 3. Sorgu fonksiyonlari icin testler yazma (istege bagli)
///
/// Not: Kod, tum farm fonksiyonlariyla birlikte plotId destegi icermektedir.
/// Temel yapi icin day_18/sources/solution.move dosyasina basvurabilirsiniz.


module challenge::day_19 {


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

    entry fun create_farm(ctx: &mut TxContext) {
        let farm = new_farm(ctx);
        transfer::share_object(farm);
    }

    fun plant_on_farm(farm: &mut Farm, plotId: u8) {
        plant(&mut farm.counters, plotId);
    }

    fun harvest_from_farm(farm: &mut Farm, plotId: u8) {
        harvest(&mut farm.counters, plotId);
    }

    entry fun plant_on_farm_entry(farm: &mut Farm, plotId: u8) {
        plant_on_farm(farm, plotId);
    }

    entry fun harvest_from_farm_entry(farm: &mut Farm, plotId: u8) {
        harvest_from_farm(farm, plotId);
    }

    // TODO: Asagidaki ozelliklere sahip 'total_planted' fonksiyonunu yazin:
    // - farm: &Farm alir (salt okunur referans)
    // - u64 dondurur (ekilen sayisi)
    // public fun total_planted(farm: &Farm): u64 {
    //     // Kodunuz buraya
    // }

    // TODO: Asagidaki ozelliklere sahip 'total_harvested' fonksiyonunu yazin:
    // - farm: &Farm alir
    // - u64 dondurur (hasat edilen sayisi)
    // public fun total_harvested(farm: &Farm): u64 {
    //     // Kodunuz buraya
    // }

    // TODO: (Istege bagli) Asagidaki ozelliklere sahip bir test yazin:
    // - Bir farm olusturun
    // - Bir kez ekin
    // - total_planted'in 1 dondurdugunu kontrol edin
}
