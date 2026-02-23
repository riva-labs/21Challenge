/// GUN 9: Enum'lar ve TaskStatus
///
/// Bugun yapacaklariniz:
/// 1. Enum'lar hakkinda bilgi edinme
/// 2. bool'u bir enum ile degistirme
/// 3. Match ifadelerini kullanma

module challenge::day_09 {
    use std::string::String;

    // day_08'den Task struct'ini kopyalayin, ama guncelleyecegiz

    // TODO: Iki varyantli 'TaskStatus' adinda bir enum tanimlayin:
    // - Open
    // - Completed
    // 'copy' ve 'drop' ability'lerini ekleyin
    // public enum TaskStatus has copy, drop {
    //     Open,
    //     Completed,
    // }

    // TODO: done: bool yerine TaskStatus kullanmak icin Task struct'ini guncelleyin
    // public struct Task has copy, drop {
    //     title: String,
    //     reward: u64,
    //     status: TaskStatus,  // done: bool'dan degistirildi
    // }

    // TODO: new_task fonksiyonunu status = TaskStatus::Open olarak ayarlayacak sekilde guncelleyin
    // public fun new_task(title: String, reward: u64): Task {
    //     // Kodunuz buraya
    // }

    // TODO: task.status == TaskStatus::Open olup olmadigini kontrol eden 'is_open' fonksiyonu yazin
    // public fun is_open(task: &Task): bool {
    //     // Kodunuz buraya
    //     // Ipucu: task.status == TaskStatus::Open
    // }
}

