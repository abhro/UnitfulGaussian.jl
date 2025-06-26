using Test
using Aqua
using Unitful, UnitfulGaussian, UnitfulEquivalences
using Unitful: q, ε0, μ0, A, C, V, T, Wb, m, cm, dyn, N, erg
using UnitfulGaussian: qcgs, Fr, G, statA, statV, Oe, Mx

@testset "UnitfulGaussian.jl" begin
    @testset "Code quality (Aqua)" begin
        Aqua.test_all(UnitfulGaussian)
    end

    @testset "Test elementary charge" begin
        @test qcgs ≈ 4.8032047126e-10Fr
    end

    @testset "Test Coulomb's law" begin
        q₁ = 2Fr
        q₂ = 9Fr
        r = 11cm
        F = 0.14876033058dyn
        @test q₁*q₂/r^2 ≈ F

        # force between elementary charges at 1 cm
        @test qcgs^2/1cm^2 ≈ 2.30707755e-24N

        # test that this works with conversions too, and in SI units
        q₁ = uconvert(C, q₁, ChargeEquivalence())
        q₂ = uconvert(C, q₂, ChargeEquivalence())
        r = uconvert(m, r)
        F = uconvert(N, F)
        @test q₁*q₂/(4π*ε0*r^2) ≈ F
    end

    @testset "Test conversions" begin

        # values from  Cardarelli, F. (2004). Encyclopaedia of Scientific Units,
        # Weights and Measures: Their SI Equivalences and Origins (2nd ed.).
        # Springer. pp. 20–25. ISBN 978-1-85233-682-0. (via Wikipedia)

        # 1 gauss == 1e-4 tesla, 1 tesla == 1e4 gauss
        @test uconvert(T, 1G, MagneticFieldEquivalence()) ≈ 1e-4T
        @test uconvert(G, 1T, MagneticFieldEquivalence()) == 1e4G

        # 1 statV/cm == 29979V/m
        @test uconvert(V/m, 1statV/cm, ElectricFieldEquivalence()) ≈ 29979.2458V/m
        @test uconvert(statV/cm, 1V/m, ElectricFieldEquivalence()) ≈ 3.335640952e-5statV/cm

        @test uconvert(Fr/cm^2, 1C/m^2, ElectricFieldEquivalence()) ≈ 3.76730313e6Fr/cm^2
        @test uconvert(C/m^2, 1Fr/cm^2, ElectricFieldEquivalence()) ≈ 2.6544187294e-7C/m^2

        @test uconvert(Fr, 1C, ChargeEquivalence()) ≈ 299_792_4580Fr
        @test uconvert(C, 1Fr, ChargeEquivalence()) ≈ 3.33564095e-10C

        @test uconvert(statA, 1A, ChargeEquivalence()) ≈ 2.99_792_458e9statA
        @test uconvert(A, 1statA, ChargeEquivalence()) ≈ 3.33564095e-10A

        @test uconvert(Fr, 1C, ElectricFluxEquivalence()) ≈ 3.76730313e10Fr
        @test uconvert(C, 1Fr, ElectricFluxEquivalence()) ≈ 2.654418729e-11C

        @test uconvert(V, 1statV, PotentialEquivalence()) ≈ 299.792_458V
        @test uconvert(statV, 1V, PotentialEquivalence()) ≈ 3.33564095198e-3statV

        @test uconvert(Oe, 1A/m, MagneticFieldEquivalence()) ≈ 0.012566370614359173Oe
        @test uconvert(A/m, 1Oe, MagneticFieldEquivalence()) ≈ 79.57747154594766A/m

        @test uconvert(Mx, 1Wb, MagneticFluxEquivalence()) == 1e8Mx
        @test uconvert(Wb, 1Mx, MagneticFluxEquivalence()) ≈ 1e-8Wb

        @test 1erg/cm^3 == 1G^2

        # We can derive the Gaussian unit of E-flux as statV⋅cm, but it's not
        # used anywhere that we could find
        @test_throws ErrorException uconvert(V*m, 1statV*cm, ElectricFluxEquivalence())
        @test_throws ErrorException uconvert(statV*cm, 1V*m, ElectricFluxEquivalence())
    end

    @testset "Energy density of an electric field" begin
        # The energy density (in vacuum) is given as
        #       u = 1/2 ε₀ E²           in SI units
        #       u = 1/8π E²             in Gaussian units
        E_CGS = 1statV/cm
        E_SI = uconvert(V/m, E_CGS, ElectricFieldEquivalence())
        u_CGS = uconvert(erg/cm^3, E_CGS^2/8π)
        u_SI = uconvert(erg/cm^3, 1/2 * ε0 * E_SI^2)

        @test u_CGS ≈ u_SI
    end

    @testset "Energy density of a magnetic field" begin
        # The energy density (in vacuum) is given as
        #       u = 1/2 B²/μ₀           in SI units
        #       u = 1/8π B²             in Gaussian units
        B_CGS = 1G
        B_SI = uconvert(T, B_CGS, MagneticFieldEquivalence())
        u_CGS = uconvert(erg/cm^3, B_CGS^2/8π)
        u_SI = uconvert(erg/cm^3, 1/2 * B_SI^2 / μ0)

        @test u_CGS ≈ u_SI
    end
end
