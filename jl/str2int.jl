
"""
    str2int(digit: String) -> Integer

Return the given digit string as an integer value.

This is used for **@piping.**

**Example**
```julia
str2int("5")  # returns 5
```
"""
str2int(digit) = parse(Int, digit)
