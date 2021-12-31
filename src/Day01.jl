module Day01

using ..Utils: input

function Base.diff(x::Vector{<:Number}, lag::Integer)
  x[(lag + 1):end] .- x[1:(length(x) - lag)]
end

function increases(input::Union{AbstractString, IO} = input(1))
  depths = parse.(Int, readlines(input))
  count(diff(depths) .> 0), count(diff(depths, 3) .> 0)
end

end