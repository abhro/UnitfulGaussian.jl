module UnitfulGaussian
using Unitful

import Unitful: @unit, @u_str
import Unitful: cm, g, s, dyn, erg

export @u_str

function __init__()
    Unitful.register(UnitfulGaussian)
end

#       symbol  abbrev.     name        equals          tf     autodocs
"""
    UnitfulGaussian.Fr

The franklin, the CGS-ESU and Gaussian unit of charge.

Dimension: 𝐌^1/2 𝐋^3/2 𝐓^-1.

See also: `Unitful.C`
"""
@unit   Fr      "Fr"        franklin    1sqrt(dyn)*cm   false
"""
    UnitfulGaussian.statV

The statvolt, the CGS-ESU and Gaussian unit of electric potential.

Dimensions: 𝐌^1/2 𝐋^1/2 𝐓^-1.

See also: `Unitful.V`
"""
@unit   statV   "statV"     statvolt    1erg/Fr         false
"""
    UnitfulGaussian.Mx

The maxwell, the CGS-EMU and Gaussian unit of magnetic flux (flux of the
magnetic B-field).

Dimensions: 𝐌^1/2 𝐋^3/2 𝐓^-1.

See also: `Unitful.Wb`
"""
@unit   Mx      "Mx"        maxwell     1sqrt(cm^3*g)/s false
"""
    UnitfulGaussian.G

The gauss, the CGS-EMU and Gaussian unit of magnetic B field.

Dimensions: 𝐌^1/2 𝐋^3/2 𝐓^-1.

See also: `Unitful.T`
"""
@unit   G       "G"         gauss       1Mx/cm^2        false
"""
    UnitfulGaussian.statF

The statfarad, the CGS-ESU and Gaussian unit of capacitance. It is equal to
1cm, and the cm should be used in the Gaussian system of units for capacitance.

Dimensions: 𝐋

See also: `Unitful.F`
"""
@unit   statF   "statF"     statfarad   1cm             false
"""
    UnitfulGaussian.statH

The stathenry, the CGS-ESU and Gaussian unit of inductance. It is equal to 1s^2/cm.

Dimensions: 𝐋^-1 𝐓^2

See also: `Unitful.H`
"""
@unit   statH   "statH"     stathenry   1statV*s^2/Fr   false
"""
    UnitfulGaussian.Oe

The oersted, the CGS-EMU and Gaussian unit of the magnetic H field. It is
dimensionally equivalent to the [gauss (G)](@ref UnitfulGaussian.G). The
corresponding SI unit for the H field is A/m.

Dimensions: 𝐌^1/2 𝐋^3/2 𝐓^-1.

See also: `Unitful.A`
"""
@unit   Oe      "Oe"        oersted     1dyn/Mx         false


include("equivalences.jl")
end
