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

## Your Task

1. The code from day_18 is already in `sources/main.move` (you can also check `day_18/sources/solution.move` if needed)
2. Write `total_planted()` that returns the planted count
3. Write `total_harvested()` that returns the harvested count

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

