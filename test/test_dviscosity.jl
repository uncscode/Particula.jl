""" testing the viscosity routine
"""

using Unitful, Test

import Particula as P

@testset "µ" begin
    @test P.µ() |> upreferred |> unit == u"kg/m/s"
    @test P.µ(T = 300) |> unit == u"kg/m/s"
    @test size(P.µ(T = [300, 310])) == (2,)
    @test_throws ArgumentError P.µ(T = 300 * u"C")
end

