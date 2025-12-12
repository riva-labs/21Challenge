# Day 17: Ownership of Objects & Simple Entry Function

## What You'll Learn Today

Today you'll learn:
- How object ownership works
- What entry functions are
- How to transfer objects to users

## Understanding Entry Functions

An **entry function** is a function that can be called directly in a transaction. It's marked with the `entry` keyword:

```move
entry fun create_farm(ctx: &mut TxContext) {
    // This can be called from a transaction
}
```

Entry functions are the "public API" of your module - they're what users call to interact with your code.

## Understanding Object Transfer

When you create an object, you need to give it to someone. You can:

1. **Transfer ownership** using `transfer::transfer()`:
   ```move
   transfer::transfer(farm, sender(ctx))
   ```
   This transfers ownership of `farm` to the address that sent the transaction.

2. **Share the object** using `transfer::share_object()`:
   ```move
   transfer::share_object(farm)
   ```
   This makes the object accessible to everyone on-chain. For this challenge, we use shared objects.

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

1. The code from day_16 is already in `sources/main.move` with plotId support added (you can also check `day_16/sources/solution.move` if needed)
2. Write an `entry fun create_farm(ctx: &mut TxContext)` that:
   - Creates a Farm using `new_farm(ctx)`
   - Shares it using `transfer::share_object(farm)`
3. Write helper functions:
   - `plant_on_farm(farm: &mut Farm, plotId: u8)` that calls `plant()` on farm.counters with plotId
   - `harvest_from_farm(farm: &mut Farm, plotId: u8)` that calls `harvest()` on farm.counters with plotId

## Reading Materials

1. **Ownership (objects)** - Learn about object ownership:
   [https://move-book.com/object/ownership/](https://move-book.com/object/ownership/)

2. **Transactions** - Understand entry functions:
   [https://move-book.com/concepts/what-is-a-transaction/](https://move-book.com/concepts/what-is-a-transaction/)

## Commit

```bash
cd day_17
sui move test
git add day_17/
git commit -m "Day 17: add Farm entry function and basic actions"
```

