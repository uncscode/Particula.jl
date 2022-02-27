""" testing the input handling
"""

using Unitful, Test

import Particula as P

@testset "℞X" begin

    @testset "in_temperature" begin

        @test P.℞T(300) == 300 * u"K"
        @test P.℞T(300 * u"K") == 300 * u"K"
        @test_throws ArgumentError P.℞T(1e-5 * u"kg/m")

    end

    @testset "in_viscosity" begin

        @test P.℞µ(1e-5) == 1e-5 * u"kg/m/s"
        @test P.℞µ(1e-5 * u"Pa*s") == 1e-5 * u"kg/m/s"
        @test_throws ArgumentError P.℞µ(1e-5 * u"kg/m")

    end

end
