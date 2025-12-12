# Day 19: Simple Query Functions (View-like)

## What You'll Learn Today

Today you'll learn:

- How to write read-only functions
- How to query object state
- How to return values from objects

## Understanding Query Functions

**Query functions** are read-only functions that:

- Take a reference (`&Object`, not `&mut`)
- Don't modify anything
- Return information about the object

These are useful for:

- Getting current state
- Calculating values
- Checking conditions

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

1. The code from day_18 is already in `sources/main.move` with plotId support added (you can also check `day_18/sources/solution.move` or `day_20/sources/main.move` if needed)
2. Write `total_planted()` that returns the planted count
   - Takes `farm: &Farm` (read-only reference)
   - Returns `u64` (the planted count)
3. Write `total_harvested()` that returns the harvested count
   - Takes `farm: &Farm` (read-only reference)
   - Returns `u64` (the harvested count)

## Testing

Tests for this day are located in `tests/day_19_test.move`. This is an independent test file that demonstrates how to test query functions using Sui's test scenario framework.

To run the tests:
```bash
sui move test
```

## Reading Materials

1. **Functions** - Review function syntax:
   [https://move-book.com/move-basics/function/](https://move-book.com/move-basics/function/)

## Commit

```bash
cd day_19
sui move test
git add day_19/
git commit -m "Day 19: add query helpers for Farm counters"
```
