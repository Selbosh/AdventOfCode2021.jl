module Day04

using ..Utils: input
using DelimitedFiles: readdlm

function read_bingo(input = input(4))
    draws = parse.(Int, split(readline(input), ','))
    cards = readdlm(input, Int, skipstart = 1)
    n = size(cards, 2)
    cards = reshape(transpose(cards), n, n, :)
    draws, cards
end

function play_bingo(draws::Array{Int, 1}, cards::AbstractArray{Int, 3})
    # On which round would each card win?
    when = indexin(cards, draws)
    wins = min.(minimum(maximum(when, dims = 1), dims = 2),
                minimum(maximum(when, dims = 2), dims = 1)) |> vec
    # Part 1: first winner
    t, i = findmin(wins)
    winner, unmarked = cards[:, :, i], when[:, :, i] .> t
    score₁ = sum(winner[unmarked]) * draws[t]
    # Part 2: last winner
    t, i = findmax(wins)
    winner, unmarked = cards[:, :, i], when[:, :, i] .> t
    score₂ = sum(winner[unmarked]) * draws[t]
    (score₁, score₂)
end

function winners()
    play_bingo(read_bingo()...)
end

end