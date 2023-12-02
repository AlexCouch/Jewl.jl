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
function walk(f, project, frame)
    f(frame)
    subframes = map(frame.subframes) do fidx
        project.frames[fidx+1]
    end
    subframes = filter(subframes) do sub 
        sub.name != frame.name
    end
    foreach(subframe -> walk(f, project, subframe), subframes)
end


