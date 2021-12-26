### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ d7b19f60-6348-11ec-11b8-abe5c0a6cee7
md"""
# Day Two: Dive!

**Reference:** [Day 2 (Advent of Code 2021)](https://adventofcode.com/2021/day/2)

**Source:** [ljk233/AdventOfCode2021/days/02/d2.jl](https://github.com/ljk233/AdventOfCode2021/blob/main/days/02/d2.jl)
"""

# ╔═╡ 1a85b479-29dc-4240-ad27-f04002c3f021
"""
	cmds(lines: String[]) -> NamedTuple(:dir, :step)

Return each line in `lines` as a named tuple, keywords **dir, step.**

**Example**
```julia
# line is "forward 7"
(dir="fowards", step=7)
```
"""
cmds(lines) = map(lines) do line
	d, s = split(line)
	return (dir=d, step=parse(Int, s))
end

# ╔═╡ aeba97ec-fd96-4ef4-99b0-726665015217
md"""
## Part One: Dive Dive!

Calculate the horizontal position and depth you would have after following the planned course.

**What do you get if you multiply your final horizontal position by your final depth?**
"""

# ╔═╡ 7f03ad5e-bf73-4b16-958b-592ba4b6d923
"""
	main1(f: String) -> Integer
"""
function main1(f::String)::Integer
	lines = readlines(f)
	x, y = 0, 0
	for cmd in cmds(lines)
		if cmd.dir == "down"
	    	y += cmd.step
		elseif cmd.dir == "up"
	    	y -= cmd.step
		else
			x += cmd.step
	    end
	end
	return x*y
end

# ╔═╡ 8cc55754-6815-4c08-8538-b6f4c74d5c28
md"""
**Test #1.**
Expected result = 150.
"""

# ╔═╡ d0d5ecd6-fa56-4fca-a293-fb0a682e4a7b
main1("test.in")

# ╔═╡ 63a48804-1a55-48c6-832f-74f52ac1d583
md"""
**Solution.**
Confirmed output = 2036120.
"""

# ╔═╡ 6c58e558-21fe-4221-b324-1efd90c7911a
main1("data.in")

# ╔═╡ 0e681b8a-82bc-425c-a374-e36d360559d2
md"""
## Part Two: Dive Dive! (With Thinking)

Using this new interpretation of the commands, calculate the horizontal position and depth you would have after following the planned course.

**What do you get if you multiply your final horizontal position by your final depth?**
"""

# ╔═╡ 774f7d4b-9d47-41eb-a6d7-e9d0fc579fbb
"""
	main2(f: String) -> Integer
"""
function main2(f::String)::Integer
	lines = readlines(f)
	x, y, aim = 0, 0, 0
	for cmd in cmds(lines)
		if cmd.dir == "down"
	    	aim += cmd.step
		elseif cmd.dir == "up"
	    	aim -= cmd.step
		else
	    	x += cmd.step
	    	y += cmd.step * aim
	    end
	end
	return x*y
end

# ╔═╡ 2e90f5d0-e5ee-4abb-932b-5638afb3a146
md"""
**Test #2.**
Expected result = 900.
"""

# ╔═╡ b5db6a00-eb1d-4cf0-bfad-d04b0d7d9968
main2("test.in")

# ╔═╡ 4d9b89d5-7f30-4031-a619-57fdb5936dc5
md"""
**Solution.**
Confirmed results = 2015547716.
"""

# ╔═╡ 17e05631-6ee0-49f0-b273-c151812220af
main2("data.in")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─d7b19f60-6348-11ec-11b8-abe5c0a6cee7
# ╠═1a85b479-29dc-4240-ad27-f04002c3f021
# ╟─aeba97ec-fd96-4ef4-99b0-726665015217
# ╠═7f03ad5e-bf73-4b16-958b-592ba4b6d923
# ╟─8cc55754-6815-4c08-8538-b6f4c74d5c28
# ╟─d0d5ecd6-fa56-4fca-a293-fb0a682e4a7b
# ╟─63a48804-1a55-48c6-832f-74f52ac1d583
# ╟─6c58e558-21fe-4221-b324-1efd90c7911a
# ╟─0e681b8a-82bc-425c-a374-e36d360559d2
# ╠═774f7d4b-9d47-41eb-a6d7-e9d0fc579fbb
# ╟─2e90f5d0-e5ee-4abb-932b-5638afb3a146
# ╟─b5db6a00-eb1d-4cf0-bfad-d04b0d7d9968
# ╟─4d9b89d5-7f30-4031-a619-57fdb5936dc5
# ╟─17e05631-6ee0-49f0-b273-c151812220af
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
