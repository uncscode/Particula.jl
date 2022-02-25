using Particula, Unitful, Test

@testset "Particula.jl" begin
    # Write your tests here.
    @test Particula.R |> ustrip >= 0


end

include("test_constants.jl")
include("test_inputting.jl")
include("test_dviscosity.jl")
include("test_meanfreepath.jl")