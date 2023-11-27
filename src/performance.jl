using DataFrames
import Flatten
using PyPlot
using DataStructures

function FlattenFrame(data::Frame)
    arr = Array{Tuple}(undef, 0)
    use = Union{String, Float64}
    ignore = Array{Frame}
    frameFlat = Flatten.flatten(data, use, ignore)
    push!(arr, frameFlat)
    for sub in data.subframes
        arr = vcat(arr, FlattenFrame(sub))
    end
    return arr
end

function GetAverage(times)
    sm = sum(times)
    avg = sm / length(times)
    return sm, avg
end

function Separate(data)
    dict = Dict{String, Array{Float64}}()
    for (time, name) in data
        if !haskey(dict, name)
            times = Array{Float64}(undef, 0)
            push!(times, time)
            dict[name] = times
            continue
        end
        times = dict[name]
        push!(times, time)
    end
    return dict
end

function GetMinMax(data)
    return argmin(abs, data), argmax(abs, data)
end

function Performance(data::Frame)
    flat = FlattenFrame(data)
    df = DataFrame(flat)
    rename!(df, [:uuid, :name, :start, :end, :duration])
    times = df[:, :duration]
    names = df[:, :name]
    times_names = Separate(zip(times, names))
    frames = Array{OrderedDict}(undef, 0)
    for (name, times) in times_names
        total, avg = GetAverage(times)
        min, max = GetMinMax(times)
        push!(frames, OrderedDict(:name=>name, :total=>total, :avg=>avg, :min=>min, :max=>max))
    end
    return DataFrame(frames)
end

function RelativePerformance(df)
    names = df[:, :name]
    avgs = df[:, :avg]
    return names, avgs
end

function ShowPieChart(data, labels, _title)
    chart = pie(data, labels=labels, startangle=90, autopct="%1.1f%%")
    title(_title)
    display(chart)
end
