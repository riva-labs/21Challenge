/// GUN 13: Basit Aggregation'lar (Toplam Odul, Tamamlanan Sayisi)
///
/// Bugun yapacaklariniz:
/// 1. Vector'ler uzerinde dongu yapan fonksiyonlar yazma
/// 2. Toplam ve sayim hesaplama
/// 3. Kontrol akisi ile pratik yapma
///
/// Not: Gerekirse day_12/sources/solution.move dosyasindan kod kopyalayabilirsiniz

module challenge::day_13 {
    use std::vector;
    use std::string::String;
    use std::option::{Self, Option};

    // day_12'den kopyalandi: Tum struct'lar ve fonksiyonlar
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

    public fun find_task_by_title(board: &TaskBoard, title: &String): Option<u64> {
        let len = vector::length(&board.tasks);
        let mut i = 0;
        while (i < len) {
            let task = vector::borrow(&board.tasks, i);
            if (*&task.title == *title) {
                return option::some(i)
            };
            i = i + 1;
        };
        option::none()
    }

    // TODO: Su ozelliklere sahip bir 'total_reward' fonksiyonu yazin:
    // - board: &TaskBoard parametresi alir
    // - u64 dondurur (tum gorev odullerinin toplami)
    // - Tum gorevler uzerinde dongu yapar ve odullerini toplar
    // public fun total_reward(board: &TaskBoard): u64 {
    //     // Kodunuz buraya
    //     // total = 0 olarak baslatin
    //     // Gorevler uzerinde dongu yapin, her odulu toplama ekleyin
    // }

    // TODO: Su ozelliklere sahip bir 'completed_count' fonksiyonu yazin:
    // - board: &TaskBoard parametresi alir
    // - u64 dondurur (tamamlanan gorevlerin sayisi)
    // - Gorevler uzerinde dongu yapar ve status == Completed olanlari sayar
    // public fun completed_count(board: &TaskBoard): u64 {
    //     // Kodunuz buraya
    // }
}

