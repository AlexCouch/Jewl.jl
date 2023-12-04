using JSON3

struct Project
    Header::Dict{String, Array{Int}}
    Frames::Array{Frame}
end

serializer() = nothing

function getPath(proj_name::String)::String
    return string(".jewl/", proj_name)
end

function GetProject(proj_name::String)::Project
    ser = serializer()
    if isnothing(ser)
        error("serializer method is not set")
    end
    bytes = read(getPath(proj_name))
    return ser(bytes, Project)
end

function GetFrame(proj::Project, name::String)::Union{Frame, Nothing}
    ret = findfirst(proj.Frames) do subframe
        subframe.Name == name
    end
    if isnothing(ret)
        return nothing
    end
    return proj.Frames[ret]
end

function CollectFrame(proj, base, name::String)
    frames = Array{Frame}(undef, 0)
    walk(proj, base) do sub
        if sub.Name == name
            push!(frames, sub)
        end
    end
    return frames
end

function CollectFrame(proj, name::String)::Array{Frame}
    fids = findall(proj.frames) do subframe
        subframe.name == name
    end
    frames = map(fids) do fidx
        proj.frames[fidx]
    end
    return frames
end
