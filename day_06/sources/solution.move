/// GUN 6: Aliskanlik Isimleri icin String Tipi - COZUM
///
/// Bu, gun 6 icin cozum dosyasidir.
/// Ogrenciler bu dosyayi degil, main.move dosyasini tamamlamalidir.

module challenge::day_06_solution {
    use std::vector;
    use std::string::{Self, String};

    // vector<u8> yerine String kullanan Habit struct'i
    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    // String kabul eden constructor (yapilandirici)
    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // Byte'lardan aliskanlik olusturan yardimci fonksiyon
    public fun make_habit(name_bytes: vector<u8>): Habit {
        let name = string::utf8(name_bytes);
        new_habit(name)
    }
}
