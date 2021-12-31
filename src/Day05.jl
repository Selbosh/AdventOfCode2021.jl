module Day05

using ..Utils: input
using DelimitedFiles: readdlm

function read_segments(input = input(5))
    lines = parse.(Int, vcat(split.(readlines(input), r",| -> ")...))
    transpose(reshape(lines, 4, :))
end

function count_intersections(lines::AbstractArray{Int, 2}, diagonal::Bool = false)
    if !diagonal
        is_diag = mapslices(s -> (s[1] != s[3]) & (s[2] != s[4]), lines, dims = 2) |> vec
        lines = lines[.!is_diag, :]
    end
    x = mapslices(s -> [min(s[1], s[3]):max(s[1], s[3])], lines, dims = 2) |> vec
    y = mapslices(s -> [min(s[2], s[4]):max(s[2], s[4])], lines, dims = 2) |> vec
    points = Dict{Array{Int, 1},Int}()
    for i in 1:length(x)
        for p in vcat.(x[i], y[i])
            if !haskey(points, p)
                points[p] = 1
            else
                points[p] += 1
            end
        end
    end
    count(n -> n >= 2, values(points))
end

function solve()
    segments = read_segments()
    (count_intersections(segments), count_intersections(segments, true))
end

end