
"""
    str2numvec(str: String) -> Integer[]

Return the given string as a vector of numbers.

```julia
str2numvec("1,2,3,4")
```
    [1, 2, 3, 4]
"""
function str2numvec(str::String)::Vector{Integer}
    return parse.(Int, split(str, ","))
end
