module AdventOfCode2021

include("./Utils.jl")
for filename in readdir(@__DIR__)
    if occursin(r"Day[0-9]{2}", filename)
        include(filename)
    end
end

println("Day 01: ", Day01.increases())
println("Day 02: ", Day02.dive())
println("Day 03: ", Day03.diagnostic())

end
