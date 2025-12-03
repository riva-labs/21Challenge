# Day 11: TaskBoard & Ownership Ideas (Address Type)

## What You'll Learn Today

Today you'll learn:
- What the `address` type is
- How to track ownership in your data structures
- How ownership works with structs containing addresses

## Understanding Address

An **address** in Move represents a blockchain address (like `0x123...`). It's used to:
- Identify who owns something
- Track who created something
- Control access to resources

## Understanding Ownership with Addresses

When you create a `TaskBoard` with an `owner: address`:
- The board "belongs" to that address
- You can check if someone is the owner
- This is a common pattern in blockchain programming

**Ownership Reminder:**
- When you add a task to the board, you transfer ownership of the task
- The board now "owns" the task in its vector
- This is similar to what we learned in day_04

## Your Task

1. The code from day_10 is already in `sources/main.move` (you can also check `day_10/sources/solution.move` if needed)
2. Define a `TaskBoard` struct with:
   - `owner: address`
   - `tasks: vector<Task>`
3. Write `new_board()` and `add_task()` functions

## Reading Materials

1. **Address Type** - Learn about addresses:
   [https://move-book.com/move-basics/address/](https://move-book.com/move-basics/address/)

2. **Ownership & Scope** - Review ownership concepts:
   [https://move-book.com/move-basics/ownership-and-scope/](https://move-book.com/move-basics/ownership-and-scope/)

## Related Days

- **Day 10** - Visibility modifiers (prerequisite)
- **Day 12** - Building on TaskBoard with more functions

## Commit

```bash
cd day_11
sui move test
git add day_11/
git commit -m "Day 11: add TaskBoard with owner and tasks"
```

