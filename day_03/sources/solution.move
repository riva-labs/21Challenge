/// GUN 3: Struct'lar (Aliskanlik Modeli Iskeleti) - COZUM
///
/// Bu cozum dosyasidir.
/// Ogrenciler main.move dosyasini tamamlamalidir, bu dosyayi degil.

module challenge::day_03_solution {
    use std::vector;

    // Isim ve tamamlanma durumuna sahip Habit struct'i
    public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    // Yeni bir aliskanlik olusturmak icin constructor function (yapici fonksiyon)
    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }
}
