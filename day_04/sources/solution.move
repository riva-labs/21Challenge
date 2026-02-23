/// GUN 4: Vector + Ownership Temelleri - COZUM
///
/// Bu cozum dosyasidir.
/// Ogrenciler main.move dosyasini tamamlamalidir, bu dosyayi degil.

module challenge::day_04_solution {
    use std::vector;
    use std::string::String;

    // day_03'ten Habit struct'ini (veri yapisi) kopyalayin
    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // Aliskanliklarin vector'unu iceren HabitList struct'i
    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    // Bos bir aliskanlik listesi olusturur
    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    // Listeye bir aliskanlik ekler (habit'in ownership'ini aktarir)
    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }
}
