""" test the viscosity routine
"""

import Particula as P
using Unitful
using Test

@testset "dviscosity.jl" begin

    @test P.dviscosity() |> upreferred |> unit == u"kg/m/s"
    @test P.dviscosity(temperature=300) |> unit == u"kg/m/s"
    @test_throws MethodError P.dviscosity(pressure=1e5) |> unit == u"kg/m/s"
    @test_throws ArgumentError P.dviscosity(temperature=300*u"C")

end

