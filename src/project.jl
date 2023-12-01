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
    ret = findfirst(proj.frames) do subframe
        subframe.name == name
    end
    if isnothing(ret)
        return nothing
    end
    return proj.frames[ret]
end

function CollectFrame(proj, name::String)
    frames = findall(proj.frames) do subframe
        subframe.name == name
    end
    return frames
end
