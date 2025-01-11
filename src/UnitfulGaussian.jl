module UnitfulGaussian
import Unitful

function __init__()
    Unitful.register(UnitfulGaussian)
end

import Unitful: @unit, @u_str
import Unitful: cm, g, s, dyn, erg

export @u_str

#       symbol  abbrev.     name        equals          tf     autodocs
@unit   Fr      "Fr"        franklin    1sqrt(dyn)*cm   false
@unit   statV   "statV"     statvolt    1erg/Fr         false
@unit   Mx      "Mx"        maxwell     1sqrt(cm^3*g)/s false
@unit   G       "G"         gauss       1Mx/cm^2        false
@unit   statF   "statF"     statfarad   1cm             false
@unit   statH   "statH"     stathenry   1statV*s^2/Fr   false
@unit   Oe      "Oe"        oersted     1dyn/Mx         false


const c_cgs = 29_979_245_800 # speed of light in cm/s

include("equivalences.jl")
end
