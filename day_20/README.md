# Day 20: Events

## What You'll Learn Today

Today you'll learn:

- What events are and why they're useful
- How to define an event struct
- How to emit events

## Understanding Events

**Events** are messages that your code can send when something happens. They:

- Are stored on-chain
- Can be queried by clients
- Help track what happened in transactions

Common use cases:

- Logging important actions
- Notifying external systems
- Building transaction history

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

1. The code from day_19 is already in `sources/main.move` (you can also check `day_19/sources/solution.move` if needed)
2. Import the event module: `use sui::event;`
3. Define a `PlantEvent` struct with:
   - Field: `planted_after: u64`
   - Abilities: `copy, drop`
   - Format: `public struct PlantEvent has copy, drop { planted_after: u64, }`
4. Update `plant_on_farm_entry(farm: &mut Farm, plotId: u8)` to emit the event after planting:
   - First, call `plant_on_farm(farm, plotId)` to plant
   - Get the total planted count using `total_planted(farm)`
   - Emit the event using `event::emit(PlantEvent { planted_after: planted_count })`
   - Note: The function signature now includes `plotId: u8` parameter

## Reading Materials

1. **Events** - Learn about events:
   [https://move-book.com/programmability/events/](https://move-book.com/programmability/events/)

## Commit

```bash
cd day_20
sui move test
git add day_20/
git commit -m "Day 20: emit simple PlantEvent when planting"
```
