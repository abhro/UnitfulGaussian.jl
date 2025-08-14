# UnitfulGaussian

[![Documentation](https://img.shields.io/badge/docs-dev-blue.svg)](https://abhro.github.io/UnitfulGaussian.jl/dev)
[![Build Status](https://github.com/abhro/UnitfulGaussian.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/abhro/UnitfulGaussian.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Codecov Coverage](https://codecov.io/gh/abhro/UnitfulGaussian.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/abhro/UnitfulGaussian.jl)

Extension to [Unitful.jl](https://github.com/PainterQubits/Unitful.jl) with support for Gaussian electromagnetic units (CGS-ESU and CGS-EMU).

## Installation

In the Julia REPL, type the following to install UnitfulGaussian.jl and Unitful.jl (recommended):

```julia
julia> ] # type `]` to drop into pkg-mode
pkg> add UnitfulGaussian
```

Alternatively, you can also use Pkg.jl's `add()` function:
```julia
import Pkg
Pkg.add(["UnitfulGaussian", "Unitful"])
```

For more information about the package, please visit our documentation site (link in the "About" section)
