using UnitfulGaussian
using Documenter

DocMeta.setdocmeta!(UnitfulGaussian, :DocTestSetup, :(using UnitfulGaussian); recursive=true)

makedocs(;
    modules=[UnitfulGaussian],
    authors="Abhro R. and contributors",
    sitename="UnitfulGaussian.jl",
    format=Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Reference table" => "reference-table.md",
        "Closures" => "closures.md",
    ],
)

deploydocs(;
    repo = "github.com/abhro/UnitfulGaussian.jl",
)
