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

function dviscosity(;
    temperature = 298.15,
    reference_viscosity = REF_VISCOSITY_AIR_STP,
    reference_temperature = REF_TEMPERATURE_STP,
)

    temperature = in_temperature(temperature)
    reference_viscosity = in_viscosity(reference_viscosity)
    reference_temperature = in_temperature(reference_temperature)

    return (
        reference_viscosity *
        (temperature / reference_temperature)^(3 / 2) *
        (reference_temperature + SUTHERLAND_CONSTANT) /
        (temperature + SUTHERLAND_CONSTANT)
    ) |> upreferred

end
