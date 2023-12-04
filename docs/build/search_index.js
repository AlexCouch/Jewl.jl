var documenterSearchIndex = {"docs":
[{"location":"#Introduction","page":"Introduction","title":"Introduction","text":"","category":"section"},{"location":"#What-is-Jewl?","page":"Introduction","title":"What is Jewl?","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"Jewl is a basic data-science driven debug tool which allows developers to analyze the data throughput and performance metrics without needing to step through their code or use a logger or print statements.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Jewl provides functions for extracting, tabulating, and plotting your data as you need it.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"warning: Warning\nThis is in active development. However, this documentation is based on it's current release. Also, the only producer library available is in Go. Please refer to jewl-go documentation to learn how  to use the jewl-go library.","category":"page"},{"location":"#How-It-Works","page":"Introduction","title":"How It Works","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"There's some terminology to learn first.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Producer\nThe Jewl library used in code to produce the frames\nAuxillary\nThe medium that stores the produced data and accessed by the processor\nProcessor\nJewl.jl library","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"note: Note\nThe Jewl.jl library is the only processor. It may be possible to write it in Python, however, Julia is made specifically for data analysis","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Frame \nA section of code which contains \nThe start time in nanoseconds\nThe end time in nanoseconds\nThe duration in nanoseconds\nThe location in the code (aka the name of the function) that the frame is created\nAny variables attached for processing\nFunction calls\nSubframes (frames created within the frame)\nRecorder\nThe object in the producer which records and produces the frames\nConfig Schema\nThe schematic of the current configuration. This combines the configuration in both the processor and the producer to store the frames elsewhere (such as a server)","category":"page"},{"location":"#Installation","page":"Introduction","title":"Installation","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"Step 1. Install Julia","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"To use Jewl, you will need to install Julia.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Step 2. Install Jewl After that, you will need to enter the julia prompt","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"$ julia","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Then you can install the Jewl package","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"pkg> add https://github.com/AlexCouch/Jewl.jl.git","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"For now, using the github link will be needed until it's added to the registrar.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Step 3. Installing jewl-go in your go project In your go package, install the jewl-go package","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"go get github.com/alexcouch/jewl-go","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"That's it! That's all you need for a basic setup!","category":"page"}]
}