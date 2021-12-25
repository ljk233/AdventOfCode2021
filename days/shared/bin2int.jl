
"""
    bin2int(str: String) -> Integer

Return the decimal integer for the given binary string.
"""
function bin2int(str::String)::Integer
    return parse(Int, str; base=2)
end
