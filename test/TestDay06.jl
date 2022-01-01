module TestDay06
import AdventOfCode2021.Day06
using Test

example = IOBuffer("3,4,3,1,2")
@test Day06.lanternfish(example) == [5934, 26984457539]

end