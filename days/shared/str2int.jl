
"""
    str2int(digit: String) -> Integer

Return the given digit string as an integer value.

This is used for piping.
"""
str2int(digit)::Integer = parse(Int, digit)
