/// GUN 5: Control Flow (Kontrol Akisi) & Aliskanligi Tamamlanmis Olarak Isaretleme
///
/// Bugun yapacaklariniz:
/// 1. if/else ifadelerini ogrenme
/// 2. Vector (dinamik dizi) elemanlarina nasil erisilecegini ogrenme
/// 3. Bir aliskanligi tamamlanmis olarak isaretleyen bir function (fonksiyon) yazma

module challenge::day_05 {
    use std::vector;

    // day_04'ten kopyalayin
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

    // TODO: Asagidakileri yapan bir 'complete_habit' function'i yazin:
    // - list: &mut HabitList ve index: u64 parametrelerini alir
    // - index'in gecerli olup olmadigini kontrol eder (vector uzunlugundan kucuk olmali)
    // - Gecerliyse, o aliskanligin completed alanini true olarak isaretler
    // Uzunlugu almak icin vector::length() kullanin
    // Bir elemana degistirilebilir referans almak icin vector::borrow_mut() kullanin
    // public fun complete_habit(list: &mut HabitList, index: u64) {
    //     // Kodunuz buraya
    //     // Ipucu: if (index < length) { ... }
    // }
}
