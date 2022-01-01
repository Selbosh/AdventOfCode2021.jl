module Day05

using ..Utils: input
using DelimitedFiles: readdlm

function read_segments(input = input(5))
    starts, ends = Vector{Tuple{Int, Int}}(), Vector{Tuple{Int, Int}}()
    for line in eachline(input)
        x0, y0, x1, y1 = parse.(Int, match(r"(\d+),(\d+) -> (\d+),(\d+)", line).captures)
        push!(starts, (x0, y0))
        push!(ends, (x1, y1))
    end
    (starts, ends)
end

function crossings(starts::Vector{Tuple{Int,Int}}, ends::Vector{Tuple{Int,Int}})
    m, n = (maximum([maximum(x -> x[i], x) for x in (starts, ends)]) for i in 1:2)
    grid = zeros(UInt8, m + 1, n + 1)
    # Vertical and horizontal line segments.
    for (s, e) in zip(starts, ends)
        if s[1] == e[1]
            grid[s[1] + 1, (min(s[2], e[2]):max(s[2], e[2])) .+ 1] .+= 1
        elseif s[2] == e[2]
            grid[(min(s[1], e[1]):max(s[1], e[1])) .+ 1, s[2] + 1] .+= 1
        end
    end
    p₁ = count(x -> x > 1, grid)
    # Now work through the diagonal line segments.
    for (s, e) in zip(starts, ends)
        if s[1] != e[1] && s[2] != e[2]
            by1 = e[1] - s[1] < 0 ? -1 : 1
            by2 = e[2] - s[2] < 0 ? -1 : 1
            for (i, j) in zip(s[1]:by1:e[1], s[2]:by2:e[2])
                grid[i + 1, j + 1] += 1
            end
        end
    end
    p₂ = count(x -> x > 1, grid)
    (p₁, p₂)
end

function solve()
    crossings(read_segments()...)
end

end