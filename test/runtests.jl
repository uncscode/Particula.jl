using Particula
using Test
using Unitful

@testset "Particula.jl" begin
    # Write your tests here.
    @test Particula.GAS_CONSTANT |> ustrip >= 0


end

include("test_constants.jl")
include("test_dviscosity.jl")
include("test_inputting.jl")
