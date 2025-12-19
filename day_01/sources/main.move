/// DAY 1: Modules + Primitive Types
/// 
/// Today (Done in main.move)
/// 1. Created a basic module
/// 2. Learn about primitive types
/// 3. Verified the module builds correctly

module challenge::day_01 {
    // Day 1: Basic module structure + primitive types

    // Rules: Use const keyword | Names must be UPPERCASE | Constants are immutable

    const NUMBER: u64 = 42; // Unsigned 64-bit integer (0, 1, 2, 3, ...)
    const FLAG: bool = true; // Boolean value (true or false)
    const MY_ADDRESS: address = @0x1; // A blockchain address (like 0x123...)
}