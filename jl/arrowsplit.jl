
"""
    arrowsplit(line: String) -> String[]

Return a line as a vector, splitting on an arrow " -> ".

This is used for **@piping.**

**Example**
```julia
arrowsplit("a -> b")  # returns ["a", "b"]
```
"""
arrowsplit(line) = split(line, " -> ")
