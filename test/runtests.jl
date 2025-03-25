using UnitfulGaussian
using Test
using Aqua

@testset "UnitfulGaussian.jl" begin
    @testset "Code quality (Aqua)" begin
        Aqua.test_all(UnitfulGaussian)
    end

    # Write your tests here.
end
