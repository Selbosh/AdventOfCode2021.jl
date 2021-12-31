for filename in readdir(@__DIR__)
    if occursin(r"TestDay[0-9]{2}", filename)
        include(filename)
    end
end