function GetVariable(frame::Frame, varname::String)::Union{Any, Nothing}
    if haskey(frame.args, varname)
        return frame.args[varname]
    end
    return nothing
end

function CollectVariable(data::Frame, varname::String)
    vars = Array{Tuple{Float64, Any}}(undef, 0)
    # walk(frame -> vars = vcat(vars, [arg for arg in frame.args if arg[1] == varname]), data)
    walk(data) do frame
        var = GetVariable(frame, varname)
        if !isnothing(var)
            push!(vars, (frame.duration, var))
        end
    end
    return vars
end

function Sample(data::Frame, base::String, sample::String, varname::String)
    base_frames = CollectFrame(data, base)
    samples = Array{Array{Any}}(undef, 0)
    for base_frame in base_frames
        sample_frames = CollectFrame(base_frame, sample)
        sample_data = Array{Any}(undef, 0)
        for sample_frame in sample_frames
            var = GetVariable(sample_frame, varname)
            if isnothing(var)
                continue
            end
            push!(sample_data, var)
        end
        push!(samples, sample_data)
    end
    return samples
end
