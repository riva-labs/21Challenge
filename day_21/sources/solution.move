/// GUN 21: Final Testleri ve Temizlik - COZUM
///
/// Bu cozum dosyasidir.
/// Ogrenciler main.move dosyasini tamamlamalidir.

module challenge::day_21_solution {

    use sui::event;

    #[test_only]
    use std::unit_test::assert_eq;
    #[test_only]
    use sui::test_scenario;

    // day_20'deki tum kodu plotId destegi ile kopyalayin
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

    // Test: Farm olusturun ve baslangic durumunu kontrol edin
    #[test]
    fun test_create_farm() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let farm = test_scenario::take_shared<Farm>(&scenario);
            assert_eq!(total_planted(&farm), 0);
            assert_eq!(total_harvested(&farm), 0);
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }

    // Test: Ekme islemi sayaci arttirir
    #[test]
    fun test_planting_increases_counter() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_shared<Farm>(&scenario);
            plant_on_farm(&mut farm, 1);
            assert_eq!(total_planted(&farm), 1);
            assert_eq!(total_harvested(&farm), 0);
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }

    // Test: Hasat islemi sayaci arttirir
    #[test]
    fun test_harvesting_increases_counter() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_shared<Farm>(&scenario);
            // Once ek
            plant_on_farm(&mut farm, 1);
            // Sonra hasat et
            harvest_from_farm(&mut farm, 1);
            assert_eq!(total_planted(&farm), 1);
            assert_eq!(total_harvested(&farm), 1);
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }

    // Test: Coklu islemler
    #[test]
    fun test_multiple_operations() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_shared<Farm>(&scenario);
            // plotId'leri 3, 5, 18 ekin (herhangi bir sirada)
            plant_on_farm(&mut farm, 3);
            plant_on_farm(&mut farm, 5);
            plant_on_farm(&mut farm, 18);
            // plotId 5'i hasat edin
            harvest_from_farm(&mut farm, 5);

            assert_eq!(total_planted(&farm), 3);
            assert_eq!(total_harvested(&farm), 1);
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }

    // Test 5: Gecersiz plot ID (plotId 0)
    #[test]
    #[expected_failure(abort_code = E_INVALID_PLOT_ID)]
    fun test_invalid_plot_id_zero() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_shared<Farm>(&scenario);
            plant_on_farm(&mut farm, 0);
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }

    // Test 5: Gecersiz plot ID (plotId 21)
    #[test]
    #[expected_failure(abort_code = E_INVALID_PLOT_ID)]
    fun test_invalid_plot_id_too_large() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_shared<Farm>(&scenario);
            plant_on_farm(&mut farm, 21);
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }

    // Test 6: Tekrarlanan plot
    #[test]
    #[expected_failure(abort_code = E_PLOT_ALREADY_EXISTS)]
    fun test_duplicate_plot() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_shared<Farm>(&scenario);
            plant_on_farm(&mut farm, 1);
            plant_on_farm(&mut farm, 1); // Ayni plotId'yi tekrar ekmeyi deneyin
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }

    // Test 7: Plot limiti asildi
    #[test]
    #[expected_failure(abort_code = E_PLOT_LIMIT_EXCEEDED)]
    fun test_plot_limit() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_shared<Farm>(&scenario);
            // 20 plot ekin (gecerli, plotId'ler 1-20)
            let mut i = 1;
            while (i <= 20) {
                plant_on_farm(&mut farm, (i as u8));
                i = i + 1;
            };
            // 21. plot'u gecerli bir plotId ile ekmeyi deneyin (limit nedeniyle iptal olmali)
            // Not: Bu, tekrar kontrolunden once limit kontrolunde basarisiz olacaktir
            plant_on_farm(&mut farm, 1);
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }

    // Test 8: Var olmayan plot'u hasat etme
    #[test]
    #[expected_failure(abort_code = E_PLOT_NOT_FOUND)]
    fun test_harvest_nonexistent_plot() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_shared<Farm>(&scenario);
            // Var olmayan bir plot'u hasat etmeyi deneyin
            harvest_from_farm(&mut farm, 5);
            test_scenario::return_shared(farm);
        };
        test_scenario::end(scenario);
    }
}
