
using JSON3

struct Frame 
    uuid::String
    name::String
    start::String
    var"end"::String
    duration::Float64
    subframes::Array{Frame}
end

function Load(path::String)::Frame
    json_str = read(path, String)
    frame = JSON3.read(json_str, Frame)
    return frame
end
