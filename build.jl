using PackageCompiler

create_app(
    ".",
    "build",
    #precompile_execution_file="precompile.jl",
    precompile_statements_file="traced.jl",
    force=true
)

