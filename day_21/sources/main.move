/// GUN 21: Final Testleri ve Temizlik
///
/// Bugun yapacaklariniz:
/// 1. Farm icin kapsamli testler yazma
/// 2. Kodunuzu temizleme
/// 3. Ogrendiklerinizi gozden gecirme
///
/// Not: Gerekirse day_20/sources/solution.move dosyasindan kodu kopyalayabilirsiniz

module challenge::day_21 {
    use sui::event;

    // Not: test_scenario, Sui framework'unda test icin mevcuttur
    // Testleri yazarken ice aktarmaniz gerekecektir: use sui::test_scenario;

    // day_20'den kopyalayin: Tum struct'lar ve fonksiyonlar

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

    fun total_planted(farm: &Farm): u64 {
        farm.counters.planted
    }

    // Testlerde kullanilir (solution.move dosyasina bakiniz)
    fun total_harvested(farm: &Farm): u64 {
        farm.counters.harvested
    }

    public struct PlantEvent has copy, drop {
        planted_after: u64,
    }

    entry fun plant_on_farm_entry(farm: &mut Farm, plotId: u8) {
        plant_on_farm(farm, plotId);
        let planted_count = total_planted(farm);
        event::emit(PlantEvent {
            planted_after: planted_count,
        });
    }

    entry fun harvest_from_farm_entry(farm: &mut Farm, plotId: u8) {
        harvest_from_farm(farm, plotId);
    }

    // TODO: Kapsamli testler yazin:
    //
    // Test 1: test_create_farm
    // - Bir farm olusturun (shared object)
    // - Baslangic sayaclarinin sifir oldugunu kontrol edin
    // - Farm'i almak icin test_scenario::take_shared kullanin
    //
    // Test 2: test_planting_increases_counter
    // - Farm olusturun, plotId 1'i ekin
    // - Ekilen sayacinin 1 oldugunu dogrulayin
    // - test_scenario::take_shared ve test_scenario::return_shared kullanin
    //
    // Test 3: test_harvesting_increases_counter
    // - Farm olusturun, plotId 1'i ekin, sonra plotId 1'i hasat edin
    // - Her iki sayacin da 1 oldugunu dogrulayin
    //
    // Test 4: test_multiple_operations
    // - plotId'leri 3, 5, 18 ekin (herhangi bir sirada)
    // - plotId 5'i hasat edin
    // - Ekilen sayacinin 3, hasat edilen sayacinin 1 oldugunu dogrulayin
    //
    // Test 5: test_invalid_plot_id
    // - plotId 0 veya 21'i ekmeyi deneyin (iptal olmali)
    //
    // Test 6: test_duplicate_plot
    // - plotId 1'i ekin, sonra plotId 1'i tekrar ekmeyi deneyin (iptal olmali)
    //
    // Test 7: test_plot_limit
    // - 21 plot ekmeyi deneyin (21. plot'ta iptal olmali)
    //
    // Test 8: test_harvest_nonexistent_plot
    // - Var olmayan bir plot'u hasat etmeyi deneyin (iptal olmali)
    //
    // test_scenario::begin, test_scenario::next_tx, test_scenario::take_shared vb. kullanin
    // Not: Farm bir shared object oldugu icin take_from_sender yerine test_scenario::take_shared kullanin

    // TODO: Uc projenin tamamini gozden gecirin (habit_tracker, bounty_board, farm_simulator)
    // Fonksiyon adlarinin tutarli oldugundan emin olun
    // Gereksiz yorumlari kaldirin
    // Tum testlerin gectiginden emin olun
}
