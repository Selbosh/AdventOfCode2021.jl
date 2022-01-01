module Day03

using ..Utils: input

"Read in a binary matrix"
function readbinary2decimal(input::Union{String,IOBuffer})::Vector{UInt16}
  parse.(UInt16, readlines(input), base = 2)
end

"Get the most common bit at position `n`"
function most_common(vec::Vector{UInt16}, n::Integer)::Bool
  sum(vec .>> n .% 2) >= length(vec) / 2
end

"Convert from (reversed) binary vector to decimal"
toInt(bvec::BitVector) = Int(bvec.chunks[1])

"Calculate the power consumption rating"
function part1(x::Vector{UInt16})::Integer
  nbits = trunc(UInt8, log2(maximum(x)))
  gamma = BitVector(most_common(x, i) for i in 0:nbits)
  epsilon = .!gamma
  toInt(gamma) * toInt(epsilon)
end

"Oxygen generator and carbon dioxide scrubber ratings"
function gas_rating(x::Vector{UInt16}, negate::Bool = false)::Integer
  nbits = trunc(Int, log2(maximum(x)))
  which = trues(length(x))
  for i in nbits:-1:0
    mode = most_common(x[which], i)
    mode = negate ? !mode : mode
    which .&= x .>> i .% 2 .== mode
    count(which) == 1 && break
  end
  only(x[which])
end

o2_generator(bmat) = gas_rating(bmat, false)
co2_scrubber(bmat) = gas_rating(bmat, true)

function part2(x::Vector{UInt16})::Int
  oxygen = o2_generator(x)
  co2 = co2_scrubber(x)
  Int(oxygen * co2)
end

function solve(input::Union{String,IOBuffer} = input(3))
  nums = readbinary2decimal(input)
  (part1(nums), part2(nums))
end

end