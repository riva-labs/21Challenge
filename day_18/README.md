# Day 18: Receiving Objects & Updating State

## What You'll Learn Today

Today you'll learn:
- How to write entry functions that receive objects
- How to update object state on-chain
- How objects are passed in transactions

## Understanding Object Parameters in Entry Functions

Entry functions can receive objects as parameters. When you call an entry function with an object:
- For owned objects: The object must be owned by the transaction sender
- For shared objects: The object can be accessed by anyone (shared objects are created with `transfer::share_object()`)
- The function receives a mutable reference (`&mut Object`)
- Changes to the object are persisted on-chain

## Farm Updates

The farm has been extended with plotId support:
- **PlotId validation**: PlotIds must be between 1 and 20
- **Plot tracking**: A vector tracks all planted plots
- **Duplicate prevention**: Cannot plant the same plotId twice
- **Limit enforcement**: Maximum of 20 plots
- **Harvest validation**: Cannot harvest plots that don't exist
- **Shared objects**: Farm is now a shared object (using `transfer::share_object`)

All functions now take `plotId: u8` parameters.

## Your Task

1. The code from day_17 is already in `sources/main.move` with plotId support added (you can also check `day_17/sources/solution.move` if needed)
2. Write an entry function `plant_on_farm_entry(farm: &mut Farm, plotId: u8)` that:
   - Takes `farm: &mut Farm` and `plotId: u8` as parameters
   - Calls `plant_on_farm(farm, plotId)` to plant on the specified plot
3. Write an entry function `harvest_from_farm_entry(farm: &mut Farm, plotId: u8)` that:
   - Takes `farm: &mut Farm` and `plotId: u8` as parameters
   - Calls `harvest_from_farm(farm, plotId)` to harvest from the specified plot

## Reading Materials

1. **Receiving as Object** - Learn about object parameters:
   [https://move-book.com/storage/transfer-to-object](https://move-book.com/storage/transfer-to-object)

## Commit

```bash
cd day_18
sui move test
git add day_18/
git commit -m "Day 18: add entry functions to plant and harvest on Farm"
```

