/// DAY 5: Control Flow & Mark Habit as Done
/// 
/// Today you will:
/// 1. Learn if/else statements
/// 2. Learn how to access vector elements
/// 3. Write a function to mark a habit as completed

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
   
    public fun complete_habit(list: &mut HabitList, index: u64) {

        let len = vector::length(&list.habits);

        if(index < len){

            let habit_ref = vector::borrow_mut(&mut list.habits,index);
            habit_ref.completed = true;
        }

        
    }

    /*#[test]
    fun test_complete_habit() {
        let mut list = empty_list();
        add_habit(&mut list, new_habit(b"Su Ic"));
        
        // 0. index'teki alışkanlığı tamamla
        complete_habit(&mut list, 0);
        
        let habit = vector::borrow(&list.habits, 0);
        assert!(habit.completed == true, 0);
    }*/
}

