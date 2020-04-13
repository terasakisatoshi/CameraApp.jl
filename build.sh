docker build -t cambuild .
docker run --rm -i \
	-v ${PWD}:/work \
	-w /work cambuild \
	julia --project=/work -e 'using Pkg; Pkg.instantiate(); include("/work/build.jl")'
