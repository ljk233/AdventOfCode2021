### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ fabfbc71-7626-4a85-808c-8693d18ddef3
include("..\\..\\jl\\commasplit.jl")

# ╔═╡ 80d3dd1a-1b92-4042-849b-adabbea5a435
include("..\\..\\jl\\arrowsplit.jl")

# ╔═╡ 523ab597-6ce0-40fa-a198-5ff73cabc814
include("..\\..\\jl\\str2int.jl")

# ╔═╡ 610784be-9d2b-47c2-b8b3-623cb0aa9f42
include("..\\..\\jl\\flatten.jl")

# ╔═╡ 87c8c810-657e-11ec-2114-4b4ad4af6ec8
md"""
# Day 5: Hydrothermal Venture

**Reference:** [Day 5 - Advent of Code 2021](https://adventofcode.com/2021/day/5)

**Source:** [ljk233/AdventOfCode2021/days/05/d5.jl](https://github.com/ljk233/AdventOfCode2021/blob/main/days/05/d5.jl)
"""

# ╔═╡ b86823bf-1386-449f-8940-17aa45a0d242
md"""
## Imports
"""

# ╔═╡ e05f10b5-f57e-42ca-8ee6-5df06c0baa59
md"""
## Functions
"""

# ╔═╡ 46dac4eb-b5d9-4fa5-badb-9d69f223c883
"""
	V(line: String) -> NamedTuple(NamedTuble, NamedTuple)
"""
V(lines) = map(lines) do line
	r = line |> arrowsplit .|> commasplit |> flatten .|> str2int
	return (a=(x=r[1]+1, y=r[2]+1), b=(x=r[3]+1, y=r[4]+1))
end

# ╔═╡ a5a42a42-4601-408e-920a-72cf7c818ac2
"""
	mark!(grid, a, b, [inc45=false])
"""
function mark!(grid, a, b, inc45=false)
	if inc45 && abs((a.y-b.y)/(a.x-b.x)) == 1
		dx = 0
		if a.x > b.x
			a, b = b, a
		end
		for y ∈ a.y:cmp(b.y, a.y):b.y
			grid[a.x+dx, y] += 1
			dx+=1
		end
	elseif a.x == b.x
		for y ∈ a.y:cmp(b.y, a.y):b.y
			grid[a.x, y] += 1
		end
	elseif a.y == b.y
		for x ∈ a.x:cmp(b.x, a.x):b.x
			grid[x, a.y] += 1
		end
	end
end

# ╔═╡ 4c202df3-62b5-4446-b3e1-0afae48210b8
md"""
## Part One

To avoid the most dangerous areas, you need to determine the number of points where at least two lines overlap.
Consider only horizontal and vertical lines.

**At how many points do at least two lines overlap?**
"""

# ╔═╡ 1a9694c2-923b-4f98-83f6-2b2bf3ff55ab
"""
	main1(f: String) -> Integer
"""
function main1(f)
	lines = readlines(f)
	xmax = maximum(v -> max(v.a.x, v.b.x), V(lines))
	ymax = maximum(v -> max(v.a.x, v.b.x), V(lines))
	grid = zeros(Integer, (xmax+1, ymax+1))
	for (a, b) ∈ V(lines)
		mark!(grid, a, b)
	end
	return count(>(1), grid)
end

# ╔═╡ c2a8fd18-c49e-48e0-8780-0591a3c59fa6
md"""
**Test #1.**
Expected result = 5.
"""

# ╔═╡ a5ac2615-cae0-4a16-901d-687fd46f3145
main1("test.in")

# ╔═╡ a957d84e-b1a4-4a95-8539-fcaf07f1f1e5
md"""
**Solution.**
Confirmed result = 8350.
"""

# ╔═╡ d6b93da4-1ef1-48d6-83fe-8424acbcfaf2
main1("data.in")

# ╔═╡ cede829f-55f0-4f4d-96b5-a380acd16394
md"""
## Part Two

You still need to determine the number of points where at least two lines overlap.

**Consider all of the lines.**
**At how many points do at least two lines overlap?**
"""

# ╔═╡ 3bc8ca5f-ba0a-4943-a266-59e2079365cc
"""
	main2(f: String) -> Integer
"""
function main2(f)
	lines = readlines(f)
	xmax = maximum(v -> max(v.a.x, v.b.x), V(lines))
	ymax = maximum(v -> max(v.a.x, v.b.x), V(lines))
	grid = zeros(Integer, (xmax+1, ymax+1))
	for (a, b) ∈ V(lines)
		mark!(grid, a, b, true)
	end
	return count(>(1), grid)
end

# ╔═╡ 2d234229-dbea-40cc-be6e-0267a04bd1b0
md"""
**Test #2.**
Expected result = 12.
"""

# ╔═╡ e099ec40-a9fe-4446-9db7-9619cb3adc5d
main2("test.in")

# ╔═╡ a9688396-74a2-4989-95bf-381b7904f521
md"""
**Solution.**
Confirmed result = 19374.
"""

# ╔═╡ 488943e4-d1ba-4818-b8d9-1f886dc7529f
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
# ╟─87c8c810-657e-11ec-2114-4b4ad4af6ec8
# ╟─b86823bf-1386-449f-8940-17aa45a0d242
# ╠═fabfbc71-7626-4a85-808c-8693d18ddef3
# ╠═80d3dd1a-1b92-4042-849b-adabbea5a435
# ╠═523ab597-6ce0-40fa-a198-5ff73cabc814
# ╠═610784be-9d2b-47c2-b8b3-623cb0aa9f42
# ╟─e05f10b5-f57e-42ca-8ee6-5df06c0baa59
# ╠═46dac4eb-b5d9-4fa5-badb-9d69f223c883
# ╠═a5a42a42-4601-408e-920a-72cf7c818ac2
# ╟─4c202df3-62b5-4446-b3e1-0afae48210b8
# ╠═1a9694c2-923b-4f98-83f6-2b2bf3ff55ab
# ╟─c2a8fd18-c49e-48e0-8780-0591a3c59fa6
# ╠═a5ac2615-cae0-4a16-901d-687fd46f3145
# ╟─a957d84e-b1a4-4a95-8539-fcaf07f1f1e5
# ╠═d6b93da4-1ef1-48d6-83fe-8424acbcfaf2
# ╟─cede829f-55f0-4f4d-96b5-a380acd16394
# ╠═3bc8ca5f-ba0a-4943-a266-59e2079365cc
# ╟─2d234229-dbea-40cc-be6e-0267a04bd1b0
# ╠═e099ec40-a9fe-4446-9db7-9619cb3adc5d
# ╟─a9688396-74a2-4989-95bf-381b7904f521
# ╠═488943e4-d1ba-4818-b8d9-1f886dc7529f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
