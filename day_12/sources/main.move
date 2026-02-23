/// GUN 12: Gorev Arama icin Option
///
/// Bugun yapacaklariniz:
/// 1. Option<T> tipi hakkinda bilgi edinme
/// 2. Gorevleri basliga gore bulan bir fonksiyon yazma
/// 3. Gorev bulunamadigi durumu ele alma
///
/// Not: Gerekirse day_11/sources/solution.move dosyasindan kod kopyalayabilirsiniz

module challenge::day_12 {
    use std::vector;
    use std::string::String;
    use std::option::{Self, Option};

    // day_11'den kopyalandi: TaskStatus, Task ve TaskBoard
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public struct TaskBoard has drop {
        owner: address,
        tasks: vector<Task>,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    public fun new_board(owner: address): TaskBoard {
        TaskBoard {
            owner,
            tasks: vector::empty(),
        }
    }

    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }

    // TODO: Su ozelliklere sahip bir 'find_task_by_title' fonksiyonu yazin:
    // - board: &TaskBoard ve title: &String parametreleri alir
    // - Option<u64> dondurur (bulunursa index, bulunmazsa None)
    // - Gorevler arasinda dongu yapip basliklari karsilastirir
    // public fun find_task_by_title(board: &TaskBoard, title: &String): Option<u64> {
    //     // Kodunuz buraya
    //     // Dongu icin while kullanin
    //     // Bulunursa option::some(index) kullanin
    //     // Bulunmazsa option::none() kullanin
    // }
}

