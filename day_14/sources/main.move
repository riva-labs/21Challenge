/// GUN 14: Bounty Board icin Testler
///
/// Bugun yapacaklariniz:
/// 1. Kapsamli testler yazma
/// 2. Olusturdugunnuz tum fonksiyonlari test etme
/// 3. Test organizasyonu pratigi
///
/// Not: Gerekirse day_13/sources/solution.move dosyasindan kod kopyalayabilirsiniz

module challenge::day_14 {
    use std::vector;
    use std::string::String;
    use std::option::{Self, Option};

    #[test_only]
    use std::unit_test::assert_eq;
    use std::string;

    // day_13'ten kopyalandi: Tum struct'lar ve fonksiyonlar
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

    // Not: assert! Move 2024'te yerlesik bir makrodur - import gerekmez!

    // TODO: En az 3 test yazin:
    //
    // Test 1: test_create_board_and_add_task
    // - Bir sahip ile pano olusturun
    // - Gorev ekleyin
    // - Gorevin eklendigini dogrulayin
    //
    // Test 2: test_complete_task
    // - Pano olusturun, gorevler ekleyin
    // - Bir gorevi tamamlayin
    // - completed_count'un dogru oldugunu dogrulayin
    //
    // Test 3: test_total_reward
    // - Pano olusturun, farkli odullerle birden fazla gorev ekleyin
    // - total_reward'un dogru oldugunu dogrulayin
    //
    // #[test]
    // fun test_create_board_and_add_task() {
    //     // Kodunuz buraya
    // }
}

