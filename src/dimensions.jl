module GaussianDimensions
    using Unitful: @derived_dimension, 𝐌, 𝐋, 𝐓

    @derived_dimension Charge   𝐌^(1 // 2) * 𝐋^( 3 // 2) * 𝐓^-1
    @derived_dimension Current  𝐌^(1 // 2) * 𝐋^( 3 // 2) * 𝐓^-2
    @derived_dimension Voltage  𝐌^(1 // 2) * 𝐋^( 1 // 2) * 𝐓^-1
    @derived_dimension EField   𝐌^(1 // 2) * 𝐋^(-1 // 2) * 𝐓^-1
    @derived_dimension DField   𝐌^(1 // 2) * 𝐋^(-1 // 2) * 𝐓^-1
    @derived_dimension BField   𝐌^(1 // 2) * 𝐋^(-1 // 2) * 𝐓^-1
    @derived_dimension HField   𝐌^(1 // 2) * 𝐋^(-1 // 2) * 𝐓^-1
    @derived_dimension EFlux    𝐌^(1 // 2) * 𝐋^( 3 // 2) * 𝐓^-1
    @derived_dimension DFlux    𝐌^(1 // 2) * 𝐋^( 3 // 2) * 𝐓^-1
    @derived_dimension BFlux    𝐌^(1 // 2) * 𝐋^( 3 // 2) * 𝐓^-1
end


module ISQDimensions
    using Unitful: @derived_dimension, 𝐌, 𝐋, 𝐓, 𝐈, MagneticFlux
    const BFlux = MagneticFlux
    @derived_dimension EFlux    𝐌 * 𝐋^3 * 𝐓^-3 * 𝐈^-1
    @derived_dimension DFlux    𝐈 * 𝐓
end
