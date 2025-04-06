# SPDX-License-Identifier: MIT


using UnitfulEquivalences
using Unitful: Charge, Voltage, Current, EField, BField, DField, HField
using Unitful: C, V, T, A, Wb

export ChargeEquivalence, ElectricFluxEquivalence, ElectricFieldEquivalence,
       PotentialEquivalence, MagneticFieldEquivalence, MagneticFluxEquivalence

include("dimensions.jl")

const c_cgs = ustrip(u"cm/s", Unitful.c0) |> Int64 # speed of light in cm/s
const c_α = c_cgs // Int64(10^10) # = 2.99_792_458 from Griffith's Electrodynamics
const c_α² = c_α^2

const GD = GaussianDimensions
const ISQD = ISQDimensions

"""
    ChargeEquivalence <: Equivalence

Equivalence type for converting between franklins and coulombs (charge),
and between statamperes and amperes (current).
"""
struct ChargeEquivalence <: Equivalence end
@eqrelation ChargeEquivalence GD.Charge/Charge = c_cgs÷10 * Fr/C
@eqrelation ChargeEquivalence GD.Current/Current = c_cgs÷10 * statA/A

"""
    ElectricFluxEquivalence <: Equivalence

Equivalence type for converting between ??? and ??? (???),
and between ???and ??? (???).
"""
struct ElectricFluxEquivalence <: Equivalence end
@eqrelation ElectricFluxEquivalence GD.EFlux/ISQD.EFlux = error()
@eqrelation ElectricFluxEquivalence GD.DFlux/ISQD.DFlux = error()

"""
    ElectricFieldEquivalence <: Equivalence

Equivalence type for converting between ??? and ??? (???),
and between ??? and ??? (???).
"""
struct ElectricFieldEquivalence <: Equivalence end
@eqrelation ElectricFieldEquivalence EField/GD.EField = c_α*10^4*(statV/cm)/(V/m)
@eqrelation ElectricFieldEquivalence GD.DField/DField = 4π*c_α*10^5*(Fr/cm^2)/(C/m^2)

"""
    PotentialEquivalence <: Equivalence

Equivalence type for converting between volts and statvolts (potential difference)
and between ??? and ??? (???).
"""
struct PotentialEquivalence <: Equivalence end
@eqrelation PotentialEquivalence Voltage/GD.Voltage = c_α*100 * V/statV

"""
    MagneticFieldEquivalence <: Equivalence

Equivalence type for converting between ??? and ??? (???),
and between ??? and ??? (???).
"""
struct MagneticFieldEquivalence <: Equivalence end
@eqrelation MagneticFieldEquivalence BField/GD.BField = error()
@eqrelation MagneticFieldEquivalence GD.HField/HField = (4pi*10^-3)Oe/(A/m)

"""
    MagneticFluxEquivalence <: Equivalence

Equivalence type for converting between ??? and ??? (???),
"""
struct MagneticFluxEquivalence <: Equivalence end
@eqrelation MagneticFluxEquivalence GD.BFlux/ISQD.BFlux = (10^8)Mx/Wb
