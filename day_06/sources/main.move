/// GUN 6: Aliskanlik Isimleri icin String Tipi
///
/// Bugun yapacaklariniz:
/// 1. String tipini ogrenin
/// 2. vector<u8>'i String'e donusturun
/// 3. Habit'i vector<u8> yerine String kullanacak sekilde guncelleyin
///
/// Not: Gerekirse day_05/sources/solution.move dosyasindan kod kopyalayabilirsiniz

module challenge::day_06 {
    use std::vector;
    use std::string::{Self, String};

    // day_05'ten kopyalayin: Habit struct'i (String kullanacak sekilde guncellenecek)
    public struct Habit has copy, drop {
        name: vector<u8>,  // TODO: Bunu String olarak degistirin
        completed: bool,
    }

    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // day_05'ten kopyalayin: HabitList struct'i
    public struct HabitList has drop {
        habits: vector<Habit>,
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

    // TODO: Habit struct'ini vector<u8> yerine String kullanacak sekilde guncelleyin
    // Not: String, Move'da metin verisi icin tercih edilen tiptir.
    // String'i dogrudan kullanabilirsiniz - vector<u8> ile calismaniza gerek yok!
    // public struct Habit has copy, drop {
    //     name: String,  // vector<u8>'den degistirildi - String daha iyidir!
    //     completed: bool,
    // }

    // TODO: new_habit fonksiyonunu String kabul edecek sekilde guncelleyin
    // public fun new_habit(name: String): Habit {
    //     // Kodunuz buraya
    // }

    // TODO: Asagidakileri yapan bir 'make_habit' yardimci fonksiyonu yazin:
    // - name_bytes: vector<u8> parametresi alir (deger olarak, referans degil)
    // - string::utf8() kullanarak String'e donusturur
    // - Bir Habit olusturur ve dondurur
    // public fun make_habit(name_bytes: vector<u8>): Habit {
    //     // Kodunuz buraya
    //     // Ipucu: let name = string::utf8(name_bytes);
    // }
}
