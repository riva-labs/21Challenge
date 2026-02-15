/// GUN 11: TaskBoard ve Address Tipi
///
/// Bugun yapacaklariniz:
/// 1. Address tipi hakkinda bilgi edinme
/// 2. Sahipligi takip eden bir TaskBoard olusturma
/// 3. Sahipligi pratikte anlama
///
/// Not: Gerekirse day_10/sources/solution.move dosyasindan kod kopyalayabilirsiniz
///
/// Ilgili: Gun 10 (Visibility), Gun 12 (TaskBoard uzerine insa etme)

module challenge::day_11 {
    use std::vector;
    use std::string::String;

    // day_10'dan kopyalandi: TaskStatus enum'u ve Task struct'i
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

    public fun complete_task(task: &mut Task) {
        task.status = TaskStatus::Completed;
    }

    // TODO: Asagidakilere sahip 'TaskBoard' adinda bir struct tanimlayin:
    // - owner: address (bu panoya sahip olan adres)
    // - tasks: vector<Task>
    // 'drop' ability'si ekleyin
    // public struct TaskBoard has drop {
    //     // Alanlariniz buraya
    // }

    // TODO: owner: address alan ve bos bir TaskBoard donduren 'new_board' constructor'i yazin
    // public fun new_board(owner: address): TaskBoard {
    //     // Kodunuz buraya
    // }

    // TODO: Su ozelliklere sahip bir 'add_task' fonksiyonu yazin:
    // - board: &mut TaskBoard ve task: Task parametreleri alir
    // - Gorevi panonun vector'une ekler
    // Gorev panonun verisinin bir parcasi olur
    // public fun add_task(board: &mut TaskBoard, task: Task) {
    //     // Kodunuz buraya
    // }
}

