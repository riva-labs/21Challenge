/// GUN 5: Control Flow (Kontrol Akisi) & Aliskanligi Tamamlanmis Olarak Isaretleme - COZUM
///
/// Bu, gun 5'in cozum dosyasidir.
/// Ogrenciler bu dosyayi degil, main.move dosyasini tamamlamalidir.

module challenge::day_05_solution {
    use std::vector;

    // day_04'ten kopyalandi
    public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun new_habit(name: vector<u8>): Habit {
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

    // Bir aliskanligi index'e gore tamamlanmis olarak isaretler
    public fun complete_habit(list: &mut HabitList, index: u64) {
        let len = vector::length(&list.habits);
        if (index < len) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
        // Not: Gercek bir uygulamada, index gecersizse abort etmek isteyebilirsiniz
        // Basitlik acisindan, index sinir disindaysa hicbir sey yapmiyoruz
    }
}
