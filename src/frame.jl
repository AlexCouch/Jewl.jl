using JSON3

const FrameData = Dict{String, Any}

struct Frame 
    uuid::String
    name::String
    start::String
    var"end"::String
    duration::Float64
    args::FrameData
    subframes::Array{Frame}
end

function walk(f, frame)
    f(frame)
    _ = walk.(f, frame.subframes)
end

function Load(path::String)::Frame
    json_str = read(path, String)
    frame = JSON3.read(json_str, Frame)
    return frame
end

function GetFrame(frame::Frame, name::String)::Union{Frame, Nothing}
    ret = nothing
    walk(frame) do subframe 
        if subframe.name == name
            ret = subframe
        end
    end
    return ret
end

function CollectFrame(frame, name::String)
    frames = Array{Frame}(undef, 0)
    walk(frame) do subframe
        if subframe.name == name
            push!(frames, subframe)
        end
    end
    return frames
end
