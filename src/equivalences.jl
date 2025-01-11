# SPDX-License-Identifier: MIT


using Unitful: @derived_dimension
using Unitful: 𝐋, 𝐌, 𝐓, Charge
using UnitfulEquivalences

using Unitful: C

@derived_dimension GaussianCharge 𝐋^(3//2)*𝐌^(1//2)*𝐓^-1

struct GaussianChargeEquivalence <: Equivalence end
@eqrelation GaussianChargeEquivalence GaussianCharge/Charge = c_cgs÷10*Fr/C
export GaussianChargeEquivalence
