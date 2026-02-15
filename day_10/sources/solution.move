/// GUN 10: Visibility Degistiricileri (Public ve Private Fonksiyonlar) - COZUM
///
/// Bu, gun 10'un cozum dosyasidir.
/// Ogrenciler bu dosyayi degil, main.move dosyasini tamamlamalidir.

module challenge::day_10_solution {
    use std::string::String;

    // day_09'dan Task ve TaskStatus kopyalandi
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    public fun is_open(task: &Task): bool {
        task.status == TaskStatus::Open
    }

    // Public fonksiyon - kullanicilar bunu cagirabilir
    public fun complete_task(task: &mut Task) {
        task.status = TaskStatus::Completed;
    }

    // Private yardimci fonksiyon (ornek)
    // Bu fonksiyon yalnizca bu modul icinden cagrilabilir
    // Herkese acik olmamasi gereken dahili mantik icin kullanislidir
    fun internal_helper(task: &Task): bool {
        // Ornek: Dahili dogrulama mantigi
        // Yalnizca bu modul bunu cagirabilir, dis kullanicilar degil
        task.reward > 0
    }

    // Private internal_helper'i cagiran public fonksiyon
    public fun has_valid_reward(task: &Task): bool {
        internal_helper(task)
    }
}

