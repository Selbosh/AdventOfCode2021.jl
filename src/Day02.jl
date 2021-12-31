module Day02

using ..Utils: input

function dive(input::Union{AbstractString, IO} = input(2))
  x, y₁, y₂, θ = (0, 0, 0, 0)
  for line in eachline(input)
    dir, value = split(line)
    value = parse(Int, value)
    Δθ = (dir == "down") * value - (dir == "up") * value
    Δx = (dir == "forward") * value
    θ += Δθ
    x += Δx
    y₁ += Δθ
    y₂ += Δx * θ
  end
  x .* (y₁, y₂)
end

end