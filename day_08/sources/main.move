/// DAY 8: New Module & Simple Task Struct
/// 
/// Today you will:
/// 1. Start a new project: Task Bounty Board
/// 2. Create a Task struct
/// 3. Write a constructor function

module challenge::day_08 {
    use std::string::String;
    
    public struct Task has copy, drop{
        title: String,
        reward: u64,
        done: bool,
    }

    public fun nwe_task(title: String, reward: u64): Task{
        Task{
            title,
            reward,
            done: false,
        }
    }

    #[test_only]
    use std::string;

    #[test]
    fun test_new_task(){
        let title = string::utf8(b"Fix Bug");
        let reward = 1000;
        let task = nwe_task(title,reward);

        assert!(task.title == title,0);
        assert!(task.reward == reward,1);
        assert!(task.done == false,2);
    }    
}

