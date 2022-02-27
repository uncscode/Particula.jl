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

using Particula: µ₀_air_stp, T₀_air_stp
using Particula: ℞T, ℞μ

export µ
"""
    µ(T, µ₀, T₀, ...)

Caclulate the dynamic viscosity via Sutherland formula.


# Inputs:
* Temperature `T` in K (default: 298.15)
* Reference viscosity `µ₀` in kg/m/s (default: `µ₀_air_stp`)
* Reference temperature `T₀` in K (default: `T₀_air_stp`)

# Outputs:
* Dynamic viscosity in kg/m/s

# Notes:
- `µ₀_air_stp` and `T₀_air_stp` come from the constants.jl file.

# Examples:
```jldoctest
> µ()
1.8371493734583912e-5 kg m⁻¹ s⁻¹
julia> µ(T = 300)
1.8459162511975804e-5 kg m⁻¹ s⁻¹
julia> µ(T = 300, µ₀ = 1.0e-5, T₀ = 300)
1.0e-5 kg m⁻¹ s⁻¹
```

# Definiton:

The dynamic vicosity ``\\mu`` is defined as:

``\\mu = \\frac{\\mu_{0} \\, (T/T_{0})^{3/2} \\, (T_{0}+C) }{T+C}`` 

where ``\\mu_{0}`` is the reference viscosity, ``T`` is the temperature, ``T_{0}`` is the reference temperature, and ``C`` is the Sutherland's constant.
"""
function µ(; kwargs...)
    T = ℞T(get(kwargs, :T, 298.15))
    µ₀ = ℞µ(get(kwargs, :µ₀, µ₀_air_stp))
    T₀ = ℞T(get(kwargs, :T₀, T₀_air_stp))
    return µ₀ .* (T ./ T₀) .^ (3 / 2) .* (T₀ .+ Sₖ) ./ (T .+ Sₖ) .|> upreferred
end

