using JSON3

const FrameData = Dict{String, Any}

struct Frame 
    Location::String
    Name::String
    Start::Int
    var"End"::Int
    Duration::Int
    Args::FrameData
    Subframes::Array{Int}
    Calls::Array{Int}
end

"""
Recursively walk through the frame tree and apply the given function `f` to each frame encountered
"""
function walk(f, project, frame)
    f(frame)
    subframes = map(frame.Subframes) do fidx
        project.Frames[fidx+1]
    end
    subframes = filter(subframes) do sub 
        sub.Name != frame.Name
    end
    foreach(subframe -> walk(f, project, subframe), subframes)
end


