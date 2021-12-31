module TestDay01
import AdventOfCode2021.Day01
using Test

example = IOBuffer("""199
200
208
210
200
207
240
269
260
263""")

@test Day01.increases(example) == (7, 5)

end