
"""
    commasplit(line: String) -> String[]

Return a line as a vector, splitting on a comma.

This is used for **@piping.**

**Example**
```julia
arrowsplit("a,b")  # returns ["a", "b"]
```
"""
commasplit(line) = split(line, ",")
