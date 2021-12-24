### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ d7b19f60-6348-11ec-11b8-abe5c0a6cee7
md"""
# Day Three: Binary Diagnostic

**Reference:** [Day 3 (Advent of Code 2021)](https://adventofcode.com/2021/day/3)
"""

# ╔═╡ aeba97ec-fd96-4ef4-99b0-726665015217
md"""
## Part One: Power Consumption

Use the binary numbers in your diagnostic report to calculate the gamma rate and epsilon rate, then multiply them together.

**What is the power consumption of the submarine?**
"""

# ╔═╡ 7f03ad5e-bf73-4b16-958b-592ba4b6d923
"""
	main1(f: String) -> Integer
"""
function main1(f::String)
	lines = readlines(f)
	n = length(lines[1])
	gamma, epsilon = "", ""
	for i ∈ 1:n
		count = 0
		for line ∈ lines
			isequal(line[i], '1') ? count += 1 : count -= 1
		end

		if count > 1
			gamma *= "1"
			epsilon *= "0"
		else
			gamma *= "0"
			epsilon *= "1"
		end
	end
	return parse(Int, gamma; base=2) * parse(Int, epsilon; base=2)
end

# ╔═╡ 8cc55754-6815-4c08-8538-b6f4c74d5c28
md"""
**Test #1.**
Expected result = 198.
"""

# ╔═╡ d0d5ecd6-fa56-4fca-a293-fb0a682e4a7b
main1("test.in")

# ╔═╡ 63a48804-1a55-48c6-832f-74f52ac1d583
md"""
**Solution.**
Confirmed result = 3320834.
"""

# ╔═╡ 6c58e558-21fe-4221-b324-1efd90c7911a
main1("data.in")

# ╔═╡ 0e681b8a-82bc-425c-a374-e36d360559d2
md"""
## Part Two: Life Support Rating

Use the binary numbers in your diagnostic report to calculate the oxygen generator rating and CO2 scrubber rating, then multiply them together.

**What is the life support rating of the submarine?**
"""

# ╔═╡ 5012e220-d2e2-436c-9ce4-dfe34f365df5
"""
	search(lines: String[], common: Bool) -> String
"""
function search(lines::Vector{String}, common::Bool)::String
	for i ∈ 1:length(lines[1])
		count = 0
		for line ∈ lines
			isequal(line[i], '1') ? count += 1 : count -= 1
		end
		isequal(count, 0) ? count +=1 : nothing
		!common ? count *= -1 : nothing
		count ≥ 1 ? target = '1' : target = '0'

		lines = filter(line -> isequal(line[i], target), lines)
		isequal(length(lines), 1) ? (return lines[1]) : nothing
	end
end

# ╔═╡ 260588a3-ca55-46f3-a8f1-5d546057c637
bool2int(str) = parse(Int, str; base=2)

# ╔═╡ 774f7d4b-9d47-41eb-a6d7-e9d0fc579fbb
"""
	main2(f: String) -> Integer
"""
function main2(f::String)
	lines = readlines(f)
	o2 = search(lines, true) |> bool2int
	co2 = search(lines, false) |> bool2int
	return o2*co2
end

# ╔═╡ 2e90f5d0-e5ee-4abb-932b-5638afb3a146
md"""
**Test #2.**
Expected result = 230.
"""

# ╔═╡ b5db6a00-eb1d-4cf0-bfad-d04b0d7d9968
main2("test.in")

# ╔═╡ 4d9b89d5-7f30-4031-a619-57fdb5936dc5
md"""
**Solution.**
Confirmed result = 4481199.
"""

# ╔═╡ 17e05631-6ee0-49f0-b273-c151812220af
main2("data.in")

# ╔═╡ Cell order:
# ╟─d7b19f60-6348-11ec-11b8-abe5c0a6cee7
# ╟─aeba97ec-fd96-4ef4-99b0-726665015217
# ╠═7f03ad5e-bf73-4b16-958b-592ba4b6d923
# ╟─8cc55754-6815-4c08-8538-b6f4c74d5c28
# ╠═d0d5ecd6-fa56-4fca-a293-fb0a682e4a7b
# ╟─63a48804-1a55-48c6-832f-74f52ac1d583
# ╠═6c58e558-21fe-4221-b324-1efd90c7911a
# ╟─0e681b8a-82bc-425c-a374-e36d360559d2
# ╠═5012e220-d2e2-436c-9ce4-dfe34f365df5
# ╠═260588a3-ca55-46f3-a8f1-5d546057c637
# ╠═774f7d4b-9d47-41eb-a6d7-e9d0fc579fbb
# ╟─2e90f5d0-e5ee-4abb-932b-5638afb3a146
# ╠═b5db6a00-eb1d-4cf0-bfad-d04b0d7d9968
# ╟─4d9b89d5-7f30-4031-a619-57fdb5936dc5
# ╠═17e05631-6ee0-49f0-b273-c151812220af
