""" testing the viscosity routine
"""

import Particula as P
using Unitful, Test

@testset "µ" begin
    @test P.µ() |> upreferred |> unit == u"kg/m/s"
    @test P.µ(T = 300) |> unit == u"kg/m/s"
    @test_throws ArgumentError P.µ(T = 300 * u"C")
end

