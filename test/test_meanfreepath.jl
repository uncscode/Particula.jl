"""
    testing the mean free path calculation
"""

import Particula as P
using Unitful, Test

@testset "λg" begin
    @test P.λg() |> upreferred |> unit == u"m"
    @test isapprox(P.λg() |> ustrip, 65e-9, atol=2e-9)
    @test P.λg(T = 300) |> unit == u"m"
    @test size(P.λg(T = [300, 301, 302])) == (3,)
    @test_throws ArgumentError P.λg(T = 300 * u"C")
end
