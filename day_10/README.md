# Day 10: Visibility & API Design

## What You'll Learn Today

Today you'll learn:
- The difference between `public` and private functions
- How to design a good public API
- When to make functions public vs private

## Understanding Visibility

In Move, functions can be:
- **`public fun`** - Can be called from outside the module
- **`fun`** (no public) - Can only be called from within the same module (private)

**API Design Principle:**
- Make functions `public` if users of your module need to call them
- Keep helper functions `private` (just `fun`) if they're only used internally

## Your Task

1. The code from day_09 is already in `sources/main.move` (you can also check `day_09/sources/solution.move` if needed)
2. Write a `public fun complete_task()` that marks a task as completed
3. (Optional) Write a private helper function to show the difference

## Reading Materials

1. **Visibility Modifiers** - Learn about public vs private:
   [https://move-book.com/move-basics/visibility/](https://move-book.com/move-basics/visibility/)

## Related Days

- **Day 9** - Task struct and enums (prerequisite)
- **Day 11** - Building on visibility with TaskBoard

## Commit

```bash
cd day_10
sui move test
git add day_10/
git commit -m "Day 10: design simple public API for tasks"
```

