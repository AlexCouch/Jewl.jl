using JSON3

const FrameData = Dict{String, Any}

struct Frame 
    location::String
    name::String
    start::Int
    var"end"::Int
    duration::Int
    args::FrameData
    subframes::Array{Int}
    calls::Array{Int}
end

"""
Recursively walk through the frame tree and apply the given function `f` to each frame encountered
"""
function walk(f, frame)
    f(frame)
    _ = walk.(f, frame.subframes)
end


