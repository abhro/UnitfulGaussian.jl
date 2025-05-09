# SPDX-License-Identifier: MIT

using UnitfulEquivalences
using Unitful: Charge, Voltage, Current, EField, BField, DField, HField
using Unitful: C, V, T, A, Wb, m

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

Equivalence type for converting between V⋅m and statV⋅cm (electric field flux),
and between coulombs and franklins (displacement field flux).
"""
struct ElectricFluxEquivalence <: Equivalence end
@eqrelation ElectricFluxEquivalence GD.EFlux/ISQD.EFlux = error() # TODO
@eqrelation ElectricFluxEquivalence GD.DFlux/ISQD.DFlux = 4π*c_α*10^9 * Fr/C

"""
    ElectricFieldEquivalence <: Equivalence

Equivalence type for converting between V/m and statV/cm (E-field),
and between C/m² and Fr/cm² (D-field).
"""
struct ElectricFieldEquivalence <: Equivalence end
@eqrelation ElectricFieldEquivalence EField/GD.EField = c_α*10^4*(V/m)/(statV/cm)
@eqrelation ElectricFieldEquivalence DField/GD.DField = 4π*c_α*10^5*(C/m^2)/(Fr/cm^2)

"""
    PotentialEquivalence <: Equivalence

Equivalence type for converting between volts and statvolts (potential difference).
"""
struct PotentialEquivalence <: Equivalence end
@eqrelation PotentialEquivalence Voltage/GD.Voltage = c_α*100 * V/statV

"""
    MagneticFieldEquivalence <: Equivalence

Equivalence type for converting between tesla and gauss (B-field),
and between A/m and oersted (H-field).
"""
struct MagneticFieldEquivalence <: Equivalence end
@eqrelation MagneticFieldEquivalence GD.BField/BField = 10^4 * G/T
@eqrelation MagneticFieldEquivalence GD.HField/HField = (4π*10^-3)Oe/(A/m)

"""
    MagneticFluxEquivalence <: Equivalence

Equivalence type for converting between weber and maxwell (B-field flux).
"""
struct MagneticFluxEquivalence <: Equivalence end
@eqrelation MagneticFluxEquivalence GD.BFlux/ISQD.BFlux = (10^8)Mx/Wb
