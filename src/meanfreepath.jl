"""
    calculate the mean free path
"""

using Unitful

include("inputting.jl")
include("constants.jl")
include("dviscosity.jl")

_ƒμ = μ

"""
    λg(T, p, M_wt, ..., μ, µ₀, T₀, ...)

Calculate the mean free path based on gas kinetic theory.

Inputs:
T       Temperature             [K]         (default: 298.15)
p       Pressure                [Pa]        (default: 101325)
M_wt    Molar mass              [g/mol]     (default: M_wt_air)
...
μ       Viscosity               [kg/m/s]    (default: μ(T, μ₀, T₀))

Output:
        Mean free path          [m]

Output:
    Dynamic viscosity       [kg/m/s]

# Notes:
* M_wt_air comes from the the constants.jl file.
* Two additional inputs are possible:
    µ₀  Reference viscosity     [kg/m/s]    (default: µ₀_air_stp)
    T₀  Reference temperature   [K]         (default: T₀_air_stp)
    where  µ₀_air_stp and T₀_air_stp come from the constants.jl file.
* μ(T, μ₀, T₀) is defined in dviscosity.jl

# Examples:
```julia-repl
julia> λg()
6.647984982685411e-8 m
julia> using Unitful
julia> uconvert(u"nm", λg(T = 300, p = 1e5))
67.8918099704083 nm
```
"""
function λg(; kwargs...)
    T = ℞T(get(kwargs, :T, 298.15))
    p = ℞p(get(kwargs, :p, 101325))
    M_wt = ℞M_wt(get(kwargs, :M_wt, M_air))
    μ = _ƒμ(; kwargs...)
    μ = ℞μ(get(kwargs, :μ, μ))
    return (2 * μ / p) / (8 * M_wt / (π * R * T)).^ 0.5 |> upreferred
end