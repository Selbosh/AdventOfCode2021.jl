module TestDay05
import AdventOfCode2021.Day05
using Test

example = IOBuffer("0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2")

lines = Day05.read_segments(example)
@test (Day05.count_intersections(lines), Day05.count_intersections(lines, true)) == (5, 15)

end