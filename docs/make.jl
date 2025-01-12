using UnitfulGaussian
using Documenter
using DocumenterInterLinks

DocMeta.setdocmeta!(UnitfulGaussian, :DocTestSetup, :(using UnitfulGaussian); recursive=true)

links = InterLinks(
    "Unitful" => "https://painterqubits.github.io/Unitful.jl/stable/",
)

makedocs(;
    modules = [UnitfulGaussian],
    authors = "Abhro R. and contributors",
    sitename = "UnitfulGaussian.jl",
    format = Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages = [
        "Home" => "index.md",
        "Reference table" => "reference-table.md",
        "Closures" => "closures.md",
    ],
    plugins = [links],
)

deploydocs(;
    repo = "github.com/abhro/UnitfulGaussian.jl",
)
