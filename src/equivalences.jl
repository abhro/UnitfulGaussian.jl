# SPDX-License-Identifier: MIT
using UnitfulEquivalences

module GaussianEquivalences
using Unitful: @derived_dimension
using Unitful: 𝐋, 𝐌, 𝐓, Charge
using UnitfulEquivalences


@derived_dimension GaussianCharge 𝐋^(3//2)*𝐌^(1//2)*𝐓^-1

struct ChargeEquivalence <: Equivalence end
@eqrelation ChargeEquivalence GaussianCharge/Charge = c_cgs÷10

end
