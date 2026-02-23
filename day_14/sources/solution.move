/// GUN 14: Bounty Board icin Testler - COZUM
///
/// Bu, gun 14'un cozum dosyasidir.
/// Ogrenciler bu dosyayi degil, main.move dosyasini tamamlamalidir.

module challenge::day_14_solution {
    use std::vector;
    use std::string::String;
    use std::option::{Self, Option};

    #[test_only]
    use std::unit_test::assert_eq;
    use std::string;

    // Onceki gunlerden tum kodlar kopyalandi
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

    public fun complete_task(task: &mut Task) {
        task.status = TaskStatus::Completed;
    }

    public fun total_reward(board: &TaskBoard): u64 {
        let len = vector::length(&board.tasks);
        let mut total = 0;
        let mut i = 0;
        while (i < len) {
            let task = vector::borrow(&board.tasks, i);
            total = total + task.reward;
            i = i + 1;
        };
        total
    }

    public fun completed_count(board: &TaskBoard): u64 {
        let len = vector::length(&board.tasks);
        let mut count = 0;
        let mut i = 0;
        while (i < len) {
            let task = vector::borrow(&board.tasks, i);
            if (task.status == TaskStatus::Completed) {
                count = count + 1;
            };
            i = i + 1;
        };
        count
    }

    // Test: Pano olusturma ve gorev ekleme
    #[test]
    fun test_create_board_and_add_task() {
        let owner = @0x1;
        let mut board = new_board(owner);

        let task = new_task(string::utf8(b"Fix bug"), 100);
        add_task(&mut board, task);

        let len = vector::length(&board.tasks);
        assert_eq!(len, 1);
    }

    // Test: Gorev tamamlama
    #[test]
    fun test_complete_task() {
        let owner = @0x1;
        let mut board = new_board(owner);

        let task1 = new_task(string::utf8(b"Task 1"), 50);
        let task2 = new_task(string::utf8(b"Task 2"), 100);

        add_task(&mut board, task1);
        add_task(&mut board, task2);

        // Ilk gorevi tamamla
        let task = vector::borrow_mut(&mut board.tasks, 0);
        complete_task(task);

        assert_eq!(completed_count(&board), 1);
    }

    // Test: Toplam odul hesaplama
    #[test]
    fun test_total_reward() {
        let owner = @0x1;
        let mut board = new_board(owner);

        let task1 = new_task(string::utf8(b"Task 1"), 50);
        let task2 = new_task(string::utf8(b"Task 2"), 100);
        let task3 = new_task(string::utf8(b"Task 3"), 25);

        add_task(&mut board, task1);
        add_task(&mut board, task2);
        add_task(&mut board, task3);

        let total = total_reward(&board);
        assert_eq!(total, 175);
    }
}

