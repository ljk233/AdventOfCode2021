### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ f11532a5-f060-4e45-99b3-a946e4481ac2
include("..\\shared\\commasplit.jl")

# ╔═╡ 4df7707b-1616-4420-8775-2933d64ea2a1
include("..\\shared\\str2int.jl")

# ╔═╡ 2a4cd270-6566-11ec-1521-57c6ef64156d
md"""
# Day 4: Giant Squid

**Reference:** [Day 4 - Advent of Code 2021](https://adventofcode.com/2021/day/4)

**Source:** []()
"""

# ╔═╡ 28035f33-3422-4527-b40d-051a1fa3474c
md"""
## Imports
"""

# ╔═╡ bf5eeafe-ecdb-4283-85b8-313360e5ffe1
md"""
## Functions
"""

# ╔═╡ 173ea467-080a-4701-9769-8c9e1dd1ba19
"""
	prepare(lines)
"""
function prepare(lines)
	numbers = lines[1] |> commasplit .|> str2int
	boards = []
	for line in filter(!isempty, lines[3:end])
		numvec = line |> split .|> str2int
		push!(boards, numvec...)
	end
	return numbers, reshape(boards, (5, 5, Int(length(boards)/25)))
end

# ╔═╡ 23f4436b-3d29-4f11-a969-308432dd30ea
"""
	won(board)

Return true if either the sum of a colum or row equals -5.
"""
function won(board)
	for row ∈ eachrow(board)
		all(row .== -1) && (return true)
    end
	for col ∈ eachcol(board)
		all(col .== -1) && (return true)
    end
    return false
end

# ╔═╡ d1c2af3b-55cb-4861-8d7d-f0751b6fbaf7
md"""
## Part One: Beat The Squid

To guarantee victory against the giant squid, figure out which board will win first.

**What will your final score be if you choose that board?**
"""

# ╔═╡ b16c6443-16be-4769-83f5-3c04168db3de
"""
	main1(f: String) -> Integer
"""
function main1(f::String)
	lines = readlines(f)
	numbers, boards = prepare(lines)
	nb = size(boards)[3]  # number of boards

	winners = []; winningnumbers = []
	for called ∈ numbers
		for ijk ∈ eachindex(boards)
			boards[ijk] == called ? boards[ijk] = -1 : nothing
		end

		for b ∈ 1:nb
			if won(boards[:, :, b])
				push!(winners, boards[:, :, b])
				push!(winningnumbers, called)
			end
		end
	end

	for I in eachindex(first(winners))
		first(winners)[I] == -1 ? first(winners)[I] = 0 : nothing
	end

	return sum(first(winners)) * first(winningnumbers)
end

# ╔═╡ 44407de0-82f0-433f-b58c-6763090b41f3
md"""
**Test #1.**
Expected result = 4512.
"""

# ╔═╡ cf0a9202-2944-427e-829a-b80e0d615539
main1("test1.in")

# ╔═╡ 8ebc516f-8ebd-44d8-868c-ff60a414809b
md"""
**Solution.**
Confirmed result = 10680.
"""

# ╔═╡ 69cc5dfc-afa7-47ef-85f4-1f842fc803ca
main1("data.in")

# ╔═╡ 63a674e5-334f-4439-bf3d-bd00f8e65556
md"""
## Part Two: Let The Squid Win
"""

# ╔═╡ 6e18f565-26f3-4dc9-9016-269ed9d2d3f5
"""
	main2(f: String) -> Integer
"""
function main2(f::String)
	lines = readlines(f)
	numbers, boards = prepare(lines)
	nb = size(boards)[3]  # number of boards

	winners, winningnumbers, completed = [], [], []
	for called ∈ numbers
		for ijk ∈ eachindex(boards)
			boards[ijk] == called ? boards[ijk] = -1 : nothing
		end

		for b ∈ 1:nb
			if won(boards[:, :, b]) && b ∉ completed
				push!(completed, b)
				push!(winners, boards[:, :, b])
				push!(winningnumbers, called)
			end
		end
	end

	for I in eachindex(first(winners))
		last(winners)[I] == -1 ? last(winners)[I] = 0 : nothing
	end

	return sum(last(winners)) * last(winningnumbers)
end

# ╔═╡ 2b1b3a84-9ad0-47b1-af98-efc48ab89ed4
md"""
**Test #2.**
Expected result = 1924.
"""

# ╔═╡ b87f3fbe-6793-4034-9881-10c0bd0069c4
main2("test1.in")

# ╔═╡ 29887ce0-77b1-4ef7-a117-0c5e9b7ac829
md"""
**Solution.**
Confirmed result = 31892.
"""

# ╔═╡ 7b9e8191-43eb-437e-805d-5fa6b4356a0d
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
# ╟─2a4cd270-6566-11ec-1521-57c6ef64156d
# ╟─28035f33-3422-4527-b40d-051a1fa3474c
# ╠═f11532a5-f060-4e45-99b3-a946e4481ac2
# ╠═4df7707b-1616-4420-8775-2933d64ea2a1
# ╟─bf5eeafe-ecdb-4283-85b8-313360e5ffe1
# ╟─173ea467-080a-4701-9769-8c9e1dd1ba19
# ╟─23f4436b-3d29-4f11-a969-308432dd30ea
# ╟─d1c2af3b-55cb-4861-8d7d-f0751b6fbaf7
# ╠═b16c6443-16be-4769-83f5-3c04168db3de
# ╟─44407de0-82f0-433f-b58c-6763090b41f3
# ╠═cf0a9202-2944-427e-829a-b80e0d615539
# ╟─8ebc516f-8ebd-44d8-868c-ff60a414809b
# ╠═69cc5dfc-afa7-47ef-85f4-1f842fc803ca
# ╟─63a674e5-334f-4439-bf3d-bd00f8e65556
# ╠═6e18f565-26f3-4dc9-9016-269ed9d2d3f5
# ╟─2b1b3a84-9ad0-47b1-af98-efc48ab89ed4
# ╠═b87f3fbe-6793-4034-9881-10c0bd0069c4
# ╟─29887ce0-77b1-4ef7-a117-0c5e9b7ac829
# ╠═7b9e8191-43eb-437e-805d-5fa6b4356a0d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
