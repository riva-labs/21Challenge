/// GUN 8: Yeni Module & Basit Task Struct - COZUM
///
/// Bu, gun 8 icin cozum dosyasidir.
/// Ogrenciler bu dosya yerine main.move dosyasini tamamlamalidir.

module challenge::day_08_solution {
    use std::string::String;

    // Baslik, odul ve tamamlanma durumuna sahip Task struct'i
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        done: bool,
    }

    // Yeni bir gorev olusturmak icin constructor function (yapici fonksiyon)
    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            done: false,
        }
    }
}
