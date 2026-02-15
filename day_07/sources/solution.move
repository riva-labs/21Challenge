/// GUN 7: Habit Tracker icin Birim Testleri - COZUM
///
/// Bu, gun 7'nin cozum dosyasidir.
/// Ogrenciler bu dosyayi degil, main.move dosyasini tamamlamalidir.

module challenge::day_07_solution {
    use std::vector;
    use std::string::{Self, String};

    // day_06'dan son kodu kopyalayın
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


    // Test: Liste olusturun ve aliskanlik ekleyin
    #[test]
    fun test_add_habits() {
        let mut list = empty_list();
        // b"...".to_string() byte literallerini (b"...") String'e donusturur
        // Bu, Move'da String degerleri olusturmanin standart yoludur
        let habit1 = new_habit(b"Exercise".to_string());
        let habit2 = new_habit(b"Read".to_string());

        add_habit(&mut list, habit1);
        add_habit(&mut list, habit2);

        let len = vector::length(&list.habits);
        assert!(len == 2, 0);
    }

    // Test: Bir aliskanligi tamamlayin
    #[test]
    fun test_complete_habit() {
        let mut list = empty_list();
        let habit = new_habit(string::utf8(b"Exercise"));
        add_habit(&mut list, habit);

        complete_habit(&mut list, 0);

        let completed_habit = vector::borrow(&list.habits, 0);
        assert!(completed_habit.completed == true);
    }
}
