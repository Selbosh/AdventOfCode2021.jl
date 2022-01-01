module TestDay07
import AdventOfCode2021.Day07
using Test

example = IOBuffer("16,1,2,0,4,2,7,1,2,14")
@test Day07.fuel_cost(example) == (37, 168)

end