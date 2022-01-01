module TestDay03
import AdventOfCode2021.Day03
using Test

example = IOBuffer("00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010")

# @test Day03.diagnostic(example) == (198, 230)
@test Day03.solve(example) == (198, 230)

end