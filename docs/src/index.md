```@meta
CurrentModule = UnitfulGaussian
```

# UnitfulGaussian

Documentation for [UnitfulGaussian](https://github.com/abhro/UnitfulGaussian.jl).

## Installation
In the REPL, type

```julia-repl
julia> ]
pkg> add UnitfulGaussian
```

## Examples

### Coulomb's law
For this example, we're going to calculate the force between a proton and an electron, whose
distance is equal to the Bohr radius. You can think of this as an extremely simplified model
of the hydrogen atom.

Note that depending on the unit system, we have to use a different version of Coulomb's law:
```math
\begin{align*}
F_\text{Gauss} &= \frac{q_1 q_2}{r^2}, &
F_\text{SI} &= \frac{1}{4π ε_0} \frac{q_1 q_2}{r^2}
\end{align*}
```

Since we're only calculating the magnitude of the force, we won't bother ourselves with the
vector algebra. And we can also treat the electron charge as also being the elementary
charge, since the negative sign of an electron's charge only serves to tell us the direction
of the force.

First, let's take a look at what constants the Unitful.jl and UnitfulGaussian.jl packages
give us, and which ones we need to define for ourselves:
```jldoctest coulombs-law
julia> using Unitful, UnitfulGaussian

julia> u"q"         # Unitful.jl already gives us the elementary charge
1.602176634e-19 C

julia> u"qcgs"      # This package adds the conversion to franklins (aka statcoulombs)
4.803204712570263e-10 Fr

julia> a0 = 5.29772e-11u"m";   # Let's put the Bohr radius in a variable
```

Now, let's calculate the force (for the Greek letters, type `\pi<TAB>` and `\varepsilon<TAB>`):
```jldoctest coulombs-law
julia> F_SI = 1/(4π*u"ε0") * u"q"^2/a0^2
9.146244056036602e-25 C^2 H c^2 m^-3

julia> F_Gauss = u"qcgs"^2/a0^2
82.20234211353733 Fr^2 m^-2
```
Hmm. They don't look like any quantities that talk about force. Let's try converting with
the handy `|>` function.
```jldoctest coulombs-law
julia> F_SI |> u"N"
8.220234211353732e-8 N

julia> F_Gauss |> u"dyn"
0.008220234211353735 dyn
```
Finally! The numbers also look close enough. Let's see if we can confirm that the forces
really are equal. Because equality for floats is finicky, we'll instead use the `isapprox()`
or `≈` function.
```jldoctest coulombs-law
julia> F_SI ≈ F_Gauss   # type `\approx<TAB>` for ≈
true
```

## API Index
```@index
```
