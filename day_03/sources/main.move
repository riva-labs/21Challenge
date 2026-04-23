/// DAY 3: Structs (Habit Model Skeleton)
/// 
/// Today you will:
/// 1. Learn about structs
/// 2. Create a Habit struct
/// 3. Write a constructor function

module challenge::day_03 {
    use std::vector;

    // TODO: Define a struct called 'Habit' with:
    // - name: vector<u8> (we'll use String later)
    // - completed: bool
    // Add 'copy' and 'drop' abilities

    public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    // TODO: Write a constructor function 'new_habit'
    // that takes a name (vector<u8>) and returns a Habit
    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    ///#[test_only]
    ///use std::unit_test::assert_eq;

    ///#[test]
    ///fun test_habit_creation() {
    ///    let name = b"Sui Move";
    ///    let habit = new_habit(name);
    ///    assert_eq!(habit.name, name);
    ///    assert_eq!(habit.completed, false);
    ///}
}

