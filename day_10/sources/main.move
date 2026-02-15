/// GUN 10: Visibility Degistiricileri (Public ve Private Fonksiyonlar)
///
/// Bugun yapacaklariniz:
/// 1. Visibility degistiricilerini ogrenme (public ve private)
/// 2. Bir public API tasarlama
/// 3. Gorevleri tamamlamak icin bir fonksiyon yazma
///
/// Not: Gerekirse day_09/sources/solution.move dosyasindan kod kopyalayabilirsiniz

module challenge::day_10 {
    use std::string::String;

    // day_09'dan kopyalandi: TaskStatus enum'u ve Task struct'i
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

    // TODO: Su ozelliklere sahip bir public 'complete_task' fonksiyonu yazin:
    // - task: &mut Task parametresi alir
    // - task.status = TaskStatus::Completed olarak ayarlar
    // Kullanicilarin cagirabilmesi icin public olmalidir
    // public fun complete_task(task: &mut Task) {
    //     // Kodunuz buraya
    // }

    // TODO: (Opsiyonel) Bir private yardimci fonksiyon yazin
    // Private fonksiyonlar 'public fun' yerine 'fun' kullanir
    // Yalnizca ayni modul icinden cagrilabilirler
    // BONUS: Private yardimcinizi cagiran bir public fonksiyon ekleyin
    //        (ornegin dahili olarak 'internal_helper' cagiran 'has_valid_reward')
}

