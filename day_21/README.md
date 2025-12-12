# Day 21: Final Tests & Cleanup

## What You'll Learn Today

Today is your final day! You'll:

- Write comprehensive tests for the farm
- Test error conditions and edge cases
- Clean up your code
- Review everything you've learned

## Understanding Test Coverage

Good test coverage includes:

- **Happy path** - Normal operations work
- **State changes** - Counters update correctly
- **Multiple operations** - Complex scenarios work
- **Edge cases** - Boundary conditions
- **Error handling** - Invalid inputs are rejected

## Farm Features to Test

The farm now includes:

- **PlotId validation**: PlotIds must be between 1 and 20
- **Plot tracking**: A vector tracks all planted plots
- **Duplicate prevention**: Cannot plant the same plotId twice
- **Limit enforcement**: Maximum of 20 plots
- **Harvest validation**: Cannot harvest plots that don't exist

## Your Task

1. The code from day_20 is already in `sources/main.move` (you can also check `day_20/sources/solution.move` if needed)
2. Write comprehensive tests (8 tests total):

   **Test 1: test_create_farm**

   - Create a farm (shared object)
   - Check initial counters are zero
   - Use `test_scenario::take_shared` to get the farm

   **Test 2: test_planting_increases_counter**

   - Create farm, plant plotId 1
   - Verify planted counter is 1
   - Use `test_scenario::take_shared` and `test_scenario::return_shared`

   **Test 3: test_harvesting_increases_counter**

   - Create farm, plant plotId 1, then harvest plotId 1
   - Verify both counters are 1

   **Test 4: test_multiple_operations**

   - Plant plotIds 3, 5, 18 (in any order)
   - Harvest plotId 5
   - Verify planted counter is 3, harvested counter is 1

   **Test 5: test_invalid_plot_id**

   - Try to plant plotId 0 (should abort with `E_INVALID_PLOT_ID`)
   - Try to plant plotId 21 (should abort with `E_INVALID_PLOT_ID`)
   - Use `#[expected_failure(abort_code = E_INVALID_PLOT_ID)]`

   **Test 6: test_duplicate_plot**

   - Plant plotId 1, then try to plant plotId 1 again
   - Should abort with `E_PLOT_ALREADY_EXISTS`
   - Use `#[expected_failure(abort_code = E_PLOT_ALREADY_EXISTS)]`

   **Test 7: test_plot_limit**

   - Plant 20 plots (plotIds 1-20)
   - Try to plant a 21st plot
   - Should abort with `E_PLOT_LIMIT_EXCEEDED`
   - Use `#[expected_failure(abort_code = E_PLOT_LIMIT_EXCEEDED)]`

   **Test 8: test_harvest_nonexistent_plot**

   - Try to harvest a plot that doesn't exist
   - Should abort with `E_PLOT_NOT_FOUND`
   - Use `#[expected_failure(abort_code = E_PLOT_NOT_FOUND)]`

3. Clean up your code (remove unnecessary comments, ensure consistency)

## Testing Shared Objects

Since the farm is now a shared object (using `transfer::share_object`), you need to use:

- `test_scenario::take_shared<Farm>(&scenario)` instead of `take_from_sender`
- `test_scenario::return_shared(farm)` instead of `return_to_sender`

## Testing Error Conditions

Use the `#[expected_failure]` attribute to test that functions abort correctly:

```move
#[test]
#[expected_failure(abort_code = E_INVALID_PLOT_ID)]
fun test_invalid_plot_id() {
    // Test code that should abort
}
```

## Reading Materials

1. **Code Quality Checklist** - Review best practices:
   [https://move-book.com/guides/code-quality-checklist/](https://move-book.com/guides/code-quality-checklist/)

## Commit

```bash
cd day_21
sui move test
git add day_21/
git commit -m "Day 21: polish code and finalize 3 projects"
```

## 🎉 Congratulations!

You've completed the 21-day Sui Move challenge! You now understand:

- Move syntax and basics
- Structs, enums, vectors
- Ownership concepts
- Sui object model
- Entry functions
- Events

Keep practicing and building!
