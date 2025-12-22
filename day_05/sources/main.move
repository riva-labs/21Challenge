/// DAY 5: Control Flow & Mark Habit as Done
/// 
/// /// Today (Done in main.move)
/// 1. Learn if/else statements
/// 2. Learn how to access vector elements
/// 3. Wrote a function to mark a habit as completed

module challenge::day_05 {
    use std::vector;

    // Copy from day_04
    public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }

    // Control flow lets your code make decisions and repeat actions:
    // if/else (Make decisions based on conditions
    // Loops (Repeat actions while conditions are true
    // while loops (Repeat actions while a condition is true

    // vector::length(&vec) - Get the length of a vector
    // vector::borrow_mut(&mut vec, index) - Get a mutable reference to an element at index
    // vector::borrow(&vec, index) - Get an immutable reference to an element at index


    // Mark a habit as completed by index
    public fun complete_habit(list: &mut HabitList, index: u64) {
        let len = vector::length(&list.habits);
        if (index < len) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
        // Note: In a real app, you might want to abort if index is invalid
        // For simplicity, we just do nothing if index is out of bounds
    }
}