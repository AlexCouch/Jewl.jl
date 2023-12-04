# Introduction

# What is Jewl?
Jewl is a basic data-science driven debug tool which allows developers to analyze the data throughput and performance metrics without needing to step through their code or use a logger or print statements.

Jewl provides functions for extracting, tabulating, and plotting your data as you need it.

!!! warning
    This is in active development. However, this documentation is based on it's current release.
    Also, the only producer library available is in Go. Please refer to jewl-go documentation to learn how 
    to use the jewl-go library.

# How It Works
There's some terminology to learn first.

1. Producer

    The Jewl library used in code to *produce* the frames

2. Auxillary

    The medium that stores the produced data and accessed by the processor

3. Processor

    Jewl.jl library

!!! note
    The Jewl.jl library is the only processor. It may be possible to write it in Python, however, Julia is made specifically for data analysis

4. Frame 

    A section of code which contains 
    * The start time in nanoseconds
    * The end time in nanoseconds
    * The duration in nanoseconds
    * The location in the code (aka the name of the function) that the frame is created
    * Any variables attached for processing
    * Function calls
    * Subframes (frames created within the frame)

5. Recorder

    The object in the producer which records and produces the frames

6. Config Schema
    
    The schematic of the current configuration. This combines the configuration in both the processor and the producer to store the frames elsewhere (such as a server)

# Installation
**Step 1. Install Julia**

To use Jewl, you will need to install [Julia](https://julialang.org/downloads/platform/).

**Step 2. Install Jewl**
After that, you will need to enter the julia prompt

```
$ julia
```
Then you can install the Jewl package
```julia-repl
pkg> add https://github.com/AlexCouch/Jewl.jl.git
```
For now, using the github link will be needed until it's added to the registrar.

**Step 3. Installing jewl-go in your go project**
In your go package, install the jewl-go package
```
go get github.com/alexcouch/jewl-go
```

That's it! That's all you need for a basic setup!

