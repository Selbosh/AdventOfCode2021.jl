module TestDay02
import AdventOfCode2021.Day02
using Test

example = IOBuffer("""forward 5
down 5
forward 8
up 3
down 8
forward 2""")

@test Day02.dive(example) == (150, 900)

end