using JSON3
using MsgPack

struct Project
    Header::Dict{String, Array{Int}}
    Frames::Array{Frame}
end

MsgPack.msgpack_type(::Type{Project}) = MsgPack.StructType()
MsgPack.msgpack_type(::Type{Frame}) = MsgPack.StructType()

function getPath(proj_name::String)::String
    return string(".jewl/", proj_name)
end

function LoadBinary(proj_name::String)::Project
    bytes = read(getPath(proj_name))
    return MsgPack.unpack(bytes, Project)
end

function Load(proj_name::String)::Project
    json_str = read(getPath(proj_name), String)
    proj = JSON3.read(json_str, Project)
    return proj
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