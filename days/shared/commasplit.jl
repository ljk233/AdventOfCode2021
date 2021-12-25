
"""
    commasplit(line: String) -> String[]

Return a line as a vector, splitting on a comma.

This is used for piping.
"""
commasplit(line::String)::Vector{String} = split(line, ",")
