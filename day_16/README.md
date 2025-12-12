# Day 16: Introduce Object with UID & key

## What You'll Learn Today

Today you'll learn:
- What UID (Unique Identifier) is
- What the `key` ability means
- How to create your first Sui object

## Understanding UID

A **UID** (Unique Identifier) is what makes a struct a Sui object. Every Sui object must have:
- An `id: UID` field
- The `key` ability

The UID is created using `object::new(ctx)` where `ctx` is a transaction context.

## Understanding the `key` Ability

The `key` ability means:
- This struct can be used as a key in global storage
- It can be owned and transferred
- It can be stored on-chain

## Farm Updates

The farm has been extended with plotId support:
- **PlotId validation**: PlotIds must be between 1 and 20
- **Plot tracking**: A vector tracks all planted plots
- **Duplicate prevention**: Cannot plant the same plotId twice
- **Limit enforcement**: Maximum of 20 plots
- **Harvest validation**: Cannot harvest plots that don't exist

All functions now take `plotId: u8` parameters.

## Your Task

1. The `FarmCounters` from day_15 is already in `sources/main.move` with plotId support added (you can also check `day_15/sources/solution.move` if needed)
2. Define a `Farm` struct with:
   - `id: UID`
   - `counters: FarmCounters`
   - `has key` ability
3. Write `new_farm()` that creates a UID using `object::new(ctx)`

## Reading Materials

1. **Using Objects** - Learn about object creation:
   [https://move-book.com/storage/](https://move-book.com/storage/)

2. **Storage Functions** - Understand object::new:
   [https://move-book.com/storage/storage-functions/](https://move-book.com/storage/storage-functions/)

3. **UID & ID** - Learn about unique identifiers:
   [https://move-book.com/storage/uid-and-id/](https://move-book.com/storage/uid-and-id/)

## Related Days

- **Day 15** - FarmCounters struct (prerequisite)
- **Day 17** - Entry functions and transferring objects

## Commit

```bash
cd day_16
sui move test
git add day_16/
git commit -m "Day 16: create Farm object with UID and counters"
```

