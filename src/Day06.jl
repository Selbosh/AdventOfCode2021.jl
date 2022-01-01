module Day06

using ..Utils: input

function lanternfish(input = input(6), days::Vector{Int} = [80, 256])
    init = parse.(UInt8, split(readline(input), ","))
    fish = Dict{UInt8, UInt}(k => count(==(k), init) for k in 0:8)
    result = Int[]
    for i in 1:maximum(days)
        resets = fish[0]
        for j in 0:7
            fish[j] = fish[j + 1]
        end
        fish[6] += resets
        fish[8] =  resets
        if i in days
            push!(result, sum(values(fish)))
        end
    end
    result
end

end