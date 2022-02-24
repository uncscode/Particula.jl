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

function µ(; T = 298.15, µ₀ = µ₀_air_stp, T₀ = T₀_air_stp)

    T = ℞T(T)
    µ₀ = ℞µ(µ₀)
    T₀ = ℞T(T₀)

    return µ₀ * (T / T₀)^(3 / 2) * (T₀ + Sₖ) / (T + Sₖ) |> upreferred

end
