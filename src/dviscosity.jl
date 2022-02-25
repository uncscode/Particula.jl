""" 
    calculating the dynamic viscosity.

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

"""
    µ(T, µ₀, T₀, ...)

Caclulate the dynamic viscosity via Sutherland formula.

Inputs:
T   Temperature             [K]         (default: 298.15)
µ₀  Reference viscosity     [kg/m/s]    (default: µ₀_air_stp)
T₀  Reference temperature   [K]         (default: T₀_air_stp)

Output:
    Dynamic viscosity       [kg/m/s]

# Notes:
µ₀_air_stp and T₀_air_stp come from the constants.jl file.

# Examples:
```julia-repl
> µ()
1.8371493734583912e-5 kg m⁻¹ s⁻¹
julia> µ(T=300)
1.8459162511975804e-5 kg m⁻¹ s⁻¹
julia> µ(T=300, µ₀=1.0e-5, T₀=300)
1.0e-5 kg m⁻¹ s⁻¹
```
"""
function µ(; kwargs...)
    T = ℞T(get(kwargs, :T, 298.15))
    µ₀ = ℞µ(get(kwargs, :µ₀, µ₀_air_stp))
    T₀ = ℞T(get(kwargs, :T₀, T₀_air_stp))
    return µ₀ * (T / T₀)^(3 / 2) * (T₀ + Sₖ) / (T + Sₖ) |> upreferred
end
