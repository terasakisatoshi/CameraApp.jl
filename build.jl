using PackageCompiler

create_app(
    ".",
    "build",
    precompile_execution_file="precompile.jl",
    force=true
)

