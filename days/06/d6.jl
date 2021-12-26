### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ 2e1d1184-4d32-453f-804b-a0d19d2f3184
include("..\\..\\jl\\commasplit.jl")

# ╔═╡ 03375a9f-a288-4f3b-a6f6-595fba65b042
include("..\\..\\jl\\str2int.jl")

# ╔═╡ 20114b30-2029-4513-9103-5b27cb1885cb
include("..\\..\\jl\\flatten.jl")

# ╔═╡ 87c8c810-657e-11ec-2114-4b4ad4af6ec8
md"""
# Day 6: Lanternfish

**Reference:** [Day 6 - Advent of Code 2021](https://adventofcode.com/2021/day/6)

**Source:** [ljk233/AdventOfCode2021/days/06/d6.jl](https://github.com/ljk233/AdventOfCode2021/blob/main/days/06/d6.jl)
"""

# ╔═╡ b86823bf-1386-449f-8940-17aa45a0d242
md"""
## Imports
"""

# ╔═╡ e05f10b5-f57e-42ca-8ee6-5df06c0baa59
md"""
## Functions
"""

# ╔═╡ 47e4af0d-02ba-4ec8-ae11-87230eff4d32
"""
	scan(line: String) -> Integer[]
"""
scan(line) = line |> commasplit |> flatten .|> str2int

# ╔═╡ 70ceeb78-51ad-4821-8d40-b30883fb8a71
"""
	survey(ocean: Integer[]) -> Integer[]
"""
function survey(ocean)
	state = zeros(Integer, 8)
	for lf ∈ ocean
		state[lf] += 1
	end
	pushfirst!(state, 0)
	return state
end

# ╔═╡ 16929d30-5cbe-4f6e-9034-2f2b0c78065b
"""
	simulate!(ocean: Integer[]) -> NoReturn
"""
function simulate!(ocean)
	push!(ocean, popfirst!(ocean))
	ocean[7] += last(ocean)
	return nothing
end

# ╔═╡ 1a9694c2-923b-4f98-83f6-2b2bf3ff55ab
"""
	main(f: String, days: Integer) -> Integer
"""
function main(f, days)
	ocean::Vector{Integer} = readline(f) |> scan |> survey
	for day ∈ 1:days
		simulate!(ocean)
	end
	return sum(ocean)
end

# ╔═╡ 4c202df3-62b5-4446-b3e1-0afae48210b8
md"""
## Part One: 80 Days

Find a way to simulate lanternfish.

**How many lanternfish would there be after 80 days?**
"""

# ╔═╡ c2a8fd18-c49e-48e0-8780-0591a3c59fa6
md"""
**Test #1.**
Expected result = 5934.
"""

# ╔═╡ a5ac2615-cae0-4a16-901d-687fd46f3145
main("test.in", 80)

# ╔═╡ a957d84e-b1a4-4a95-8539-fcaf07f1f1e5
md"""
**Solution.**
Confirmed result = 388419.
"""

# ╔═╡ d6b93da4-1ef1-48d6-83fe-8424acbcfaf2
main("data.in", 80)

# ╔═╡ cede829f-55f0-4f4d-96b5-a380acd16394
md"""
## Part Two: 256 Days

Suppose the lanternfish live forever and have unlimited food and space.
Would they take over the entire ocean?

**How many lanternfish would there be after 256 days?**
"""

# ╔═╡ 2d234229-dbea-40cc-be6e-0267a04bd1b0
md"""
**Test #2.**
Expected result = 26984457539.
"""

# ╔═╡ e099ec40-a9fe-4446-9db7-9619cb3adc5d
main("test.in", 256)

# ╔═╡ a9688396-74a2-4989-95bf-381b7904f521
md"""
**Solution.**
Confirmed result = 1740449478328..
"""

# ╔═╡ 488943e4-d1ba-4818-b8d9-1f886dc7529f
main("data.in", 256)

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
# ╠═2e1d1184-4d32-453f-804b-a0d19d2f3184
# ╠═03375a9f-a288-4f3b-a6f6-595fba65b042
# ╠═20114b30-2029-4513-9103-5b27cb1885cb
# ╟─e05f10b5-f57e-42ca-8ee6-5df06c0baa59
# ╠═47e4af0d-02ba-4ec8-ae11-87230eff4d32
# ╠═70ceeb78-51ad-4821-8d40-b30883fb8a71
# ╠═16929d30-5cbe-4f6e-9034-2f2b0c78065b
# ╠═1a9694c2-923b-4f98-83f6-2b2bf3ff55ab
# ╟─4c202df3-62b5-4446-b3e1-0afae48210b8
# ╟─c2a8fd18-c49e-48e0-8780-0591a3c59fa6
# ╠═a5ac2615-cae0-4a16-901d-687fd46f3145
# ╟─a957d84e-b1a4-4a95-8539-fcaf07f1f1e5
# ╠═d6b93da4-1ef1-48d6-83fe-8424acbcfaf2
# ╟─cede829f-55f0-4f4d-96b5-a380acd16394
# ╟─2d234229-dbea-40cc-be6e-0267a04bd1b0
# ╠═e099ec40-a9fe-4446-9db7-9619cb3adc5d
# ╟─a9688396-74a2-4989-95bf-381b7904f521
# ╠═488943e4-d1ba-4818-b8d9-1f886dc7529f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
