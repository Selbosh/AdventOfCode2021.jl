module Day07

using ..Utils: input
using Statistics: median, mean

function fuel_cost(input::Union{String,IOBuffer} = input(7))
    crabs = parse.(Int, split(readline(input), ","))
    # Minimize the L1 distance:
    best1 = median(crabs)
    fuel1 = sum(x -> abs(x - best1), crabs)
    # Minimize the L2 distance:
    best2 = round(mean(crabs))
    fuel2 = sum(x -> x * (x + 1) ÷ 2, abs.(crabs .- best2)) |> round
    (fuel1, fuel2)
end

end