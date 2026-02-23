/// GUN 7: Habit Tracker icin Birim Testleri
///
/// Bugun yapacaklariniz:
/// 1. Move'da test yazmayi ogreneceksiniz
/// 2. Habit tracker'iniz icin testler yazacaksiniz
/// 3. assert! makrosunu kullanacaksiniz
///
/// Not: Gerekirse day_06/sources/solution.move dosyasindan kod kopyalayabilirsiniz

module challenge::day_07 {
    use std::vector;
    use std::string::{Self, String};

    // day_06'dan kopyalanan: String ile Habit struct (veri yapisi)
    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    public fun make_habit(name_bytes: vector<u8>): Habit {
        let name = string::utf8(name_bytes);
        new_habit(name)
    }

    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }

    public fun complete_habit(list: &mut HabitList, index: u64) {
        let len = vector::length(&list.habits);
        if (index < len) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
    }

    // Not: assert! Move 2024'te yerlesik bir makrodur - ice aktarmaya gerek yok!

    // TODO: Asagidakileri yapan bir 'test_add_habits' testi yazin:
    // - Bos bir liste olusturun
    // - 1-2 aliskanlik ekleyin
    // - Liste uzunlugunun dogru oldugunu kontrol edin
    // #[test]
    // fun test_add_habits() {
    //     // Kodunuz buraya
    //     // String olusturmak icin b"Exercise".to_string() kullanin
    // }

    // TODO: Asagidakileri yapan bir 'test_complete_habit' testi yazin:
    // - Bir liste olusturun ve bir aliskanlik ekleyin
    // - Aliskanligi tamamlayin
    // - completed == true oldugunu kontrol edin
    // #[test]
    // fun test_complete_habit() {
    //     // Kodunuz buraya
    // }
}
