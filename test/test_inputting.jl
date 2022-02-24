""" testing the input handling
"""

import Particula as P
using Unitful
using Test

@testset "inputting.jl" begin

    @testset "in_temperature" begin
        @test P.in_temperature(300) == 300 * u"K"
        @test P.in_temperature(300 * u"K") == 300 * u"K"
        @test_throws ArgumentError P.in_temperature(1e-5 * u"kg/m")
    end

    @testset "in_viscosity" begin
        @test P.in_viscosity(1e-5) == 1e-5 * u"kg/m/s"
        @test P.in_viscosity(1e-5 * u"Pa*s") == 1e-5 * u"kg/m/s"
        @test_throws ArgumentError P.in_viscosity(1e-5 * u"kg/m")
    end
end
