using UnitfulGaussian
using Documenter
using DocumenterInterLinks

DocMeta.setdocmeta!(UnitfulGaussian, :DocTestSetup, :(using UnitfulGaussian); recursive=true)

links = InterLinks(
    "Unitful" => "https://painterqubits.github.io/Unitful.jl/stable/objects.inv",
)

pages = [
    "Home" => "index.md",
    "Reference table of Gaussian and SI Units" => "reference-table.md",
    "Closures" => "closures.md",
    "API Reference" => "api.md",
]

makedocs(;
    modules = [UnitfulGaussian],
    authors = "Abhro R. and contributors",
    sitename = "UnitfulGaussian.jl",
    format = Documenter.HTML(;
        edit_link = "main",
        assets = String[],
    ),
    pages,
    plugins = [links],
)

deploydocs(;
    repo = "github.com/abhro/UnitfulGaussian.jl",
)
