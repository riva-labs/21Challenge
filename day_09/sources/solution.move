/// GUN 9: Enum'lar ve TaskStatus - COZUM
///
/// Bu, gun 9'un cozum dosyasidir.
/// Ogrenciler bu dosyayi degil, main.move dosyasini tamamlamalidir.

module challenge::day_09_solution {
    use std::string::String;

    // Gorev durumu enum'u
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    // bool yerine TaskStatus kullanan Task struct'i
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    // Durumu Open olarak ayarlayan constructor
    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    // Bir gorevin acik olup olmadigini kontrol eder
    public fun is_open(task: &Task): bool {
        task.status == TaskStatus::Open
    }
}

