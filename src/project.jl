using JSON3

struct Project
    header::Dict{String, Int}
    frames::Array{Frame}
end

function Load(path::String)::Project
    json_str = read(path, String)
    proj = JSON3.read(json_str, Project)
    return proj
end

function GetFrame(proj::Project, name::String)::Union{Frame, Nothing}
    ret = nothing
    walk(proj.frames) do subframe 
        if subframe.name == name
            ret = subframe
        end
    end
    return ret
end

function CollectFrame(proj, name::String)
    frames = Array{Frame}(undef, 0)
    walk(proj.frames) do subframe
        if subframe.name == name
            push!(frames, subframe)
        end
    end
    return frames
end
