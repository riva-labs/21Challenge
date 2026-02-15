/// GUN 4: Vector + Ownership Temelleri
///
/// Bugun yapacaklariniz:
/// 1. Vector'ler (dinamik dizi) hakkinda bilgi edinmek
/// 2. Bir aliskanlik listesi olusturmak
/// 3. Temel ownership (sahiplik) kavramlarini anlamak

module challenge::day_04 {
    use std::vector;

    // day_03'ten Habit struct'ini (veri yapisi) kopyalayin
    public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // TODO: Asagidaki ozelliklere sahip 'HabitList' adinda bir struct olusturun:
    // - habits: vector<Habit>
    // 'drop' ability (yetenek) ekleyin (copy degil, cunku vector'ler kopyalanamaz)
    // public struct HabitList has drop {
    //     // Alaniniz buraya
    // }

    // TODO: Bos bir HabitList donduren 'empty_list' function'i (fonksiyon) yazin
    // public fun empty_list(): HabitList {
    //     // Bos bir vector olusturmak icin vector::empty() kullanin
    // }

    // TODO: Asagidakileri alan 'add_habit' function'i yazin:
    // - list: &mut HabitList (degistirilebilir referans)
    // - habit: Habit (deger ile, ownership'i aktarir)
    // Aliskanlik eklemek icin vector::push_back kullanin
    // public fun add_habit(list: &mut HabitList, habit: Habit) {
    //     // Kodunuz buraya
    // }
}
