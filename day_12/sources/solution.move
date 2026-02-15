/// GUN 12: Gorev Arama icin Option - COZUM
///
/// Bu, gun 12'nin cozum dosyasidir.
/// Ogrenciler bu dosyayi degil, main.move dosyasini tamamlamalidir.

module challenge::day_12_solution {
    use std::vector;
    use std::string::String;
    use std::option::{Self, Option};

    // day_11'den TaskBoard ve ilgili struct'lar kopyalandi
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

    // Basliga gore gorev bulma, bulunursa index ile Option<u64> dondurur
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
}

