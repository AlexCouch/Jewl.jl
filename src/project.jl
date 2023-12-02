using JSON3
using MsgPack

struct Project
    header::Dict{String, Array{Int}}
    frames::Array{Frame}
end

MsgPack.msgpack_type(::Type{Project}) = MsgPack.StructType()
MsgPack.msgpack_type(::Type{Frame}) = MsgPack.StructType()

function LoadBinary(path::String)::Project
    bytes = read(path)
    return MsgPack.unpack(bytes, Project)
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

function CollectFrame(proj, base, name::String)
    frames = Array{Frame}(undef, 0)
    walk(proj, base) do sub
        if sub.name == name
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
