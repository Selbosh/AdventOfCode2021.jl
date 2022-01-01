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
println("Day 04: ", Day04.winners())
println("Day 05: ", Day05.solve())
println("Day 06: ", Day06.lanternfish())
println("Day 07: ", Day07.fuel_cost())

end
