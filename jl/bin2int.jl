
"""
    bin2int(bin: String) -> Integer

Return the decimal integer for the given `bin`.

This is used for **@piping.**

**Example**
```julia
bin2int("101")  # returns 5
```
"""
bin2int(str)::Integer = parse(Int, str; base=2)
