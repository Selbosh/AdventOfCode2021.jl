module Day04

using ..Utils: input
using DelimitedFiles: readdlm

function read_bingo(input = input(4))
    draws = parse.(Int, split(readline(input), ','))
    cards = readdlm(input, Int, skipstart = 1)
    draws, cards
end

function play_bingo(draws::Array{Int, 1}, cards::Array{Int, 2})
    n = size(cards, 2)
    called = reshape(transpose(indexin(cards, draws)), n, n, :)
    # On which round would each card win?
    wins = min.(minimum(maximum(called, dims = 1), dims = 2),
                minimum(maximum(called, dims = 2), dims = 1))
    # Part 1
    when, whom = findmin(vcat(wins...))
    first = reshape(transpose(cards), n, n, :)[:, :, whom]
    score = sum(first[called[:, :, whom] .> when]) * draws[when]
    # Part 2
    when₂, whom₂ = findmax(vcat(wins...))
    last = reshape(transpose(cards), n, n, :)[:, :, whom₂]
    score₂ = sum(last[called[:, :, whom₂] .> when₂]) * draws[when₂]
    (score, score₂)
end

function winners()
    play_bingo(read_bingo()...)
end

end