
"""
    flatten(vecofvec) -> vec

Flatten a nested vector, returning a single vector containing the elements
of each nested vector.

This is used for **@piping.**

**Warning.**
The type of the returned vector should be checked before further use.

**Example**
```julia
flatten([[1, 2], [3, 4]])  # returns [1, 2, 3, 4]
```
"""
flatten(vecofvec) = vcat(vecofvec...)
