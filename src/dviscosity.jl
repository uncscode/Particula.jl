""" calculating the dynamic viscosity.

    The dynamic viscocity is calculated using the Sutherland formula,
    assuming ideal gas behavior, as a function of temperature.

        "The dynamic viscosity equals the product of the sum of
        Sutherland's constant and the reference temperature divided by
        the sum of Sutherland's constant and the temperature,
        the reference viscosity and the ratio to the 3/2 power
        of the temperature to reference temperature."

        https://resources.wolframcloud.com/FormulaRepository/resources/Sutherlands-Formula

"""

using Unitful

include("constants.jl")

function dviscosity(temp)
    return (
        REF_VISCOSITY_AIR * (temp/REF_TEMPERATURE)^(3/2) * (REF_TEMPERATURE + SUTHERLAND_CONSTANT) / (temp + SUTHERLAND_CONSTANT)
    )
end
