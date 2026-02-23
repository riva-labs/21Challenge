/// GUN 11: TaskBoard ve Address Tipi - COZUM
///
/// Bu, gun 11'in cozum dosyasidir.
/// Ogrenciler bu dosyayi degil, main.move dosyasini tamamlamalidir.

module challenge::day_11_solution {
    use std::vector;
    use std::string::String;

    // Onceki gunlerden Task ve TaskStatus kopyalandi
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

    // Sahip ve gorevleri olan TaskBoard struct'i
    public struct TaskBoard has drop {
        owner: address,
        tasks: vector<Task>,
    }

    // Yeni bir gorev panosu olusturma
    public fun new_board(owner: address): TaskBoard {
        TaskBoard {
            owner,
            tasks: vector::empty(),
        }
    }

    // Panoya gorev ekleme (sahipligi transfer eder)
    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }
}

