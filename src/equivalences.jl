# SPDX-License-Identifier: MIT


using UnitfulEquivalences
using Unitful: Charge, Voltage
using Unitful: C, V, T

include("dimensions.jl")

const c_cgs = Int64(29_979_245_800) # speed of light in cm/s
const c_α = Int64(299_792_458) // Int64(10^8) # from Griffith's Electrodynamics
const c_α² = c_α^2

const GD = GaussianDimensions

"""
    ChargeEquivalence <: Equivalence

Equivalence type for converting between franklins and coulombs.
"""
struct ChargeEquivalence <: Equivalence end
@eqrelation ChargeEquivalence GD.Charge/Charge = c_cgs÷10 * Fr/C
export ChargeEquivalence

struct ElectricFluxEquivalence <: Equivalence end
@eqrelation ElectricFluxEquivalence GD.Charge/Charge = c_cgs÷10 * Fr/C

struct ElectricFieldEquivalence <: Equivalence end


struct PotentialEquivalence <: Equivalence end
@eqrelation PotentialEquivalence Voltage/GD.Voltage = c_α*100 * V/statV
export PotentialEquivalence



struct MagneticFieldEquivalence <: Equivalence end
struct MagneticFluxEquivalence <: Equivalence end
