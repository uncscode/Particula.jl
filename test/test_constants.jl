""" testing the constants
"""

using Unitful, Test

import Particula as P

@testset "consts" begin

    @test P.R == P.k * P.Nₐ
    @test unit(P.R) == unit(P.k) * unit(P.Nₐ)
    @test unit(P.k) == u"m^2" * u"kg" / u"s^2" / u"K"

end
