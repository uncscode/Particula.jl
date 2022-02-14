import Particula as P
using Unitful
using Test

@testset "constants.jl" begin

    @test P.GAS_CONSTANT ==
          P.BOLTZMANN_CONSTANT *
          P.AVOGADRO_NUMBER

    @test unit(P.GAS_CONSTANT) ==
          unit(P.BOLTZMANN_CONSTANT) *
          unit(P.AVOGADRO_NUMBER)

    @test unit(P.BOLTZMANN_CONSTANT) ==
          u"m^2" * u"kg" / u"s^2" / u"K"

end
