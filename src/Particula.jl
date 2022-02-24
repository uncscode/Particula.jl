module Particula

using Unitful

include("constants.jl")
include("dviscosity.jl")
include("inputting.jl")


# Write your package code here.
function greet()
    print("Hello World! Oh wow, it is: ")
    print(M_air, dviscosity(300*u"K"))
end

end # end the Particula module
