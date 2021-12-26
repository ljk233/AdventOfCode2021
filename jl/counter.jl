
#=
Counter ADT
===========
A simple interface for a counting bag.
=#

"""
    counter([seq])

Return an initialised counter.
"""
function counter()
    return Dict{Any, Int}()
end


"""
    add!(counter, item, [freq=1])

Add the item to the counter.
If freq is passed as an argument, then item is added freq times.
"""
function add!(counter, item, freq=1)
    if item ∈ keys(counter)
        counter[item] += freq
    else
        counter[item] = freq
    end
end


"""
    remove!(counter, item, [freq=1])

Remove the item from the counter.
If freq is passed as an argument, then item is removed freq times (down
to a minimum of zero).
"""
function remove!(counter, item, freq=1)
    if item ∈ keys(counter)
        counter[item] -= freq
        counter[item] == 0 ? counter[item] = 0 : nothing
    end
end


"""
    freq(counter, item)

Return the frequency of the item in the counter.
"""
function freq(counter, item)
    item ∈ keys(counter) ? counter[item] : 0
end


"""
    combine(A, B)

Return a combined counter with items from A and B.
"""
function combine(A, B)
    counter = counter()
    for (item, freq) ∈ pairs(A)
        add!(counter, item, freq)
    end
    for (item, freq) ∈ pairs(B)
        add!(counter, item, freq)
    end
    return counter
end
