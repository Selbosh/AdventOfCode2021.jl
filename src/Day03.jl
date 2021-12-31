module Day03

using ..Utils: input

function diagnostic(input = input(3))
  bits = readlines(input)
  m, n = length(bits), length(bits[1])
  CO₂ = O₂ = parse.(Int, bits, base = 2)
  # Part 1
  Γ = BitVector([sum(O₂ .>> i .% 2) >= m/2 for i in 0:(n-1)])
  ε = .!Γ
  # Part 2
  for i in 1:n
    if length(O₂) > 1
      mode = sum(O₂ .>> (n - i) .% 2) >= length(O₂) / 2
      O₂ = O₂[O₂ .>> (n - i) .% 2 .== mode]
    end
    if length(CO₂) > 1
      mode = sum(CO₂ .>> (n - i) .% 2) >= length(CO₂) / 2
      CO₂ = CO₂[CO₂ .>> (n - i) .% 2 .!= mode]
    end
  end
  (Int64(Γ.chunks[1] * ε.chunks[1]), prod([O₂; CO₂]))
end

end