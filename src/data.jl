"""
    GetVariable(frame, varname)::Union{Any, Nothing}

Check if the given `frame` contains an argument of name `varname` and return it.

If `varname` is not found in `frame.args`, then return nothing

# Arguments
- `frame::Frame`: The frame in which to search for the variable
- `varname::String`: The name of the variable to find in the given frame 

See also [`haskey`](@ref), [`Frame`](@ref)
"""
function GetVariable(frame::Frame, varname::String)::Union{Any, Nothing}
    if haskey(frame.args, varname)
        return frame.args[varname]
    end
    return nothing
end

"""
    CollectVariable(data, varname)

Walk through the given `frame` and find all variables with the name `varname`

Pair each found variable of name `varname` with the duration of it's frame

# Arguments
- `data::Frame`: The frame to walk through 
- `varname::String`: The name of the variable to collect

See also [`Frame`](@ref), [`GetVariable`](@ref)
"""
function CollectVariable(frame::Frame, varname::String)
    vars = Array{Tuple{Float64, Any}}(undef, 0)
    # walk(frame -> vars = vcat(vars, [arg for arg in frame.args if arg[1] == varname]), data)
    walk(frame) do subframe
        var = GetVariable(subframe, varname)
        if !isnothing(var)
            push!(vars, (subframe.duration, var))
        end
    end
    return vars
end

"""
    Sample(data, base, sample, varname)

Starting with the given data, find the base frame, collect the sample frames, and collect all the variables of the name `varname`

For each base frame, create a new array to collect the samples

For each sample frame, get the variable of the name `varname`

This creates a 2D array of samples which is good for creating boxplots or similar graphs

# Example
```jl-repl
julia> data = Load("data/bubble_sort.json")
julia> samples = Sample(data, "outer_loop", "inner_loop", "j")
```
"""
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
