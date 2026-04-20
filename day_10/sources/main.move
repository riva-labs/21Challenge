/// DAY 10: Visibility Modifiers (Public vs Private Functions)
/// 
/// Today you will:
/// 1. Learn about visibility modifiers (public vs private)
/// 2. Design a public API
/// 3. Write a function to complete tasks

module challenge::day_10 {
    use std::string::String;

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

    public fun complete_task(task: &mut Task) {
        if (has_reward(task)) {
            task.status = TaskStatus::Completed;
        }
    }
   
    fun has_reward(task: &Task): bool {
        task.reward > 0
    }

    #[test_only]
    use std::string;

    #[test]
    fun test_complete_task_with_visibility() {
        let mut task = new_task(string::utf8(b"Learn Visibility"), 100);
        
        complete_task(&mut task);

        assert!(task.status == TaskStatus::Completed, 0);
    }
}