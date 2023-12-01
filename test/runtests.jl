import Jewl
using Test
using PyPlot

@testset "Load" begin
    proj = Jewl.Load("../data/bubble_sort.json")
    bubble_sort = Jewl.GetFrame(proj, "bubbleSort")
    js = Jewl.CollectVariable(bubble_sort, "j")
    x, y = ([time for (time, j) in js], [j for (time, j) in js])
    plot(x, y)
end

#@testset "Sample" begin
#    bubble_sort = Jewl.Load("../data/bubble_sort.json")
#    js = Jewl.Sample(bubble_sort, "outer_loop", "inner_loop", "j")
#    boxplot(js)
#end
