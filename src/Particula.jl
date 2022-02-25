module Particula

using Unitful

include("inputting.jl")
include("dviscosity.jl")
include("meanfreepath.jl")

# Write your package code here.
function greet()

    print("Hello World! \n")
    print("Oh wow, molar mass of air is: ", M_air)
    print("\t and viscosity is: ", µ(T = 300 * u"K"))

end

end # end the Particula module
