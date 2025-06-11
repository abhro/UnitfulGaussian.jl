using Test
using Aqua
using Unitful, UnitfulGaussian, UnitfulEquivalences
using Unitful: q, ε0, μ0, C, V, T, m, cm, dyn, erg
using UnitfulGaussian: Fr, G, statV

@testset "UnitfulGaussian.jl" begin
    @testset "Code quality (Aqua)" begin
        Aqua.test_all(UnitfulGaussian)
    end

    @testset "Test elementary charge" begin
        @test uconvert(Fr, q, ChargeEquivalence()) ≈ 4.803204e-10Fr rtol=1e-6
    end

    @testset "Test Coulomb's law" begin
        q₁ = 1Fr
        q₂ = 1Fr
        r = 1cm
        F = 1dyn
        @test q₁*q₂/r^2 ≈ F
    end

    @testset "Test conversions" begin
        # 1 gauss == 1e-4 tesla
        @test uconvert(T, 1G, MagneticFieldEquivalence()) ≈ 1e-4T
        # 1 tesla == 1e4 gauss
        @test uconvert(G, 1T, MagneticFieldEquivalence()) == 1e4G

        # 1 statV/cm == 29979V/m
        @test uconvert(V/m, 1statV/cm, ElectricFieldEquivalence()) ≈ 29979.2458V/m
        @test uconvert(statV/cm, 1V/m, ElectricFieldEquivalence()) ≈ 3.3356409e-5statV/cm rtol=1e-6

        @test uconvert(Fr, 1C, ChargeEquivalence()) ≈ 299_792_4580Fr
        @test uconvert(C, 1Fr, ChargeEquivalence()) ≈ 3.335640e-10C rtol=1e-6

        @test 1erg/cm^3 == 1G^2

        # TODO other conversions
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
