/// DAY 16: Introduce Object with UID & key
/// 
/// Today you will:
/// 1. Learn about UID (Unique Identifier)
/// 2. Learn about the 'key' ability
/// 3. Create your first Sui object
///
/// Note: The code includes plotId support. You can copy code from 
/// day_15/sources/solution.move if needed (note: plotId functionality has been added)

module challenge::day_16 {


    // Copy from day_15: FarmCounters struct
    const MAX_PLOTS: u64 = 20;
    const E_PLOT_NOT_FOUND: u64 = 1;
    const E_PLOT_LIMIT_EXCEEDED: u64 = 2;
    const E_INVALID_PLOT_ID: u64 = 3;
    const E_PLOT_ALREADY_EXISTS: u64 = 4;

    public struct FarmCounters has copy, drop, store {
        planted: u64,
        harvested: u64,
        plots: vector<u8>,
    }

    fun new_counters(): FarmCounters {
        FarmCounters {
            planted: 0,
            harvested: 0,
            plots: vector::empty(),
        }
    }

    fun plant(counters: &mut FarmCounters, plotId: u8) {
        // Check if plotId is valid (between 1 and 20)
        assert!(plotId >= 1 && plotId <= (MAX_PLOTS as u8), E_INVALID_PLOT_ID);
        
        // Check if we've reached the plot limit
        let len = vector::length(&counters.plots);
        assert!(len < MAX_PLOTS, E_PLOT_LIMIT_EXCEEDED);
        
        // Check if plot already exists in the vector
        let mut i = 0;
        while (i < len) {
            let existing_plot = vector::borrow(&counters.plots, i);
            assert!(*existing_plot != plotId, E_PLOT_ALREADY_EXISTS);
            i = i + 1;
        };
        
        counters.planted = counters.planted + 1;
        vector::push_back(&mut counters.plots, plotId);
    }

    fun harvest(counters: &mut FarmCounters, plotId: u8) {
        let len = vector::length(&counters.plots);
                
        // Check if plot exists in the vector and find its index
        let mut i = 0;
        let mut found_index = len; 
        while (i < len) {
            let existing_plot = vector::borrow(&counters.plots, i);
            if (*existing_plot == plotId) {
                found_index = i;
            };
            i = i + 1;
        };
        
        // Assert that plot was found (found_index < len means we found it)
        assert!(found_index < len, E_PLOT_NOT_FOUND);
        
        // Remove the plot from the vector
        vector::remove(&mut counters.plots, found_index);
        counters.harvested = counters.harvested + 1;
    }

    // TODO: Define a struct called 'Farm' with:
    // - id: UID (this makes it a Sui object)
    // - counters: FarmCounters
    // Add 'key' ability (required for Sui objects)
    // public struct Farm has key {
    //     id: UID,
    //     counters: FarmCounters,
    // }

    // TODO: Write a constructor 'new_farm' that:
    // - Takes ctx: &mut TxContext
    // - Creates a UID using object::new(ctx)
    // - Returns a Farm with the UID and default counters
    // fun new_farm(ctx: &mut TxContext): Farm {
    //     // Your code here
    //     // Hint: let id = object::new(ctx);
    // }
}

