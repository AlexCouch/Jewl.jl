# Jewl

[![Build Status](https://github.com/alexcouch/Jewl.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/alexcouch/Jewl.jl/actions/workflows/CI.yml?query=branch%3Amain)

A julia powered debug tool that allows the use of data science to debug your application.

## How to Use 
In your julia prompt, install this git repo
```julia
(@v1.9) pkg> add https://github.com/AlexCouch/Jewl.jl.git 
```
Then, in your project, after producing the `dump.json` file, run the following code:
```julia
data_name = Jewl.Load("dump.json")
perfdata = Jewl.Performance(data_name)
labels, data = Jewl.RelativePerformance(perfdata)
ShowPieChart(labels, data, "[Program Name] Relative Performance")
```
This code will show a piechart.

For generating frames and a dump.json file, see [jewl-go](https://github.com/AlexCouch/jewl-go)

*This project is a Work-In-Progress. Library and data format is subject to change!*
