module Utils
export input
using Printf

function input(day::Integer)
  joinpath(@__DIR__, "..", "data", @sprintf("input%02d.txt", day))
end

end