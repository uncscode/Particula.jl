""" handling the inputs
"""

using Unitful

"""
    ℞T(T)

Ensure T is in K.

If T has units of K or equivalent, or if it has no units, it returns it in K.
If T has any units other than K, it rases an ArgumentError. 

# Notes
It accepts vectors, but will throw an error if elements have different units.

# Examples
```julia-repl
julia> ℞T(300)
300 K
julia> ℞T(300*u"K")
300 K
julia> ℞T([290, 300, 310]*u"K")
3-element Vector{Quantity{Int64, 𝚯, Unitful.FreeUnits{(K,), 𝚯, nothing}}}:
 290 K
 300 K
 310 K
julia> ℞T([290*u"K^-1", 300]*u"K")
ERROR: ArgumentError: Input: in K (or equivalent) or unitless
```
"""
function ℞T(T)
    if unit.(upreferred.(T)) == unit.(ustrip.(T) * u"K")
        return T .|> upreferred
    elseif unit.(upreferred.(T)) == unit.(ustrip.(T) * Unitful.NoUnits)
        return T .* u"K"
    else
        throw(ArgumentError("Input: in K (or equivalent) or unitless"))
    end
end

"""
    ℞µ(µ)

Ensure µ is in kg/m/s.

If µ has units of kg/m/s or equivalent, or if it has no units,
it returns it in kg/m/s. If µ has any units other than kg/m/s,
it rases an ArgumentError. 

# Notes
It accepts vectors, but will throw an error if elements have different units.

# Examples
```julia-repl
julia> ℞µ(1e-5)
1.0e-5 kg m⁻¹ s⁻¹
julia> ℞µ([1e-5,1.2e-5]*u"kg"/u"m"/u"s")
2-element Vector{Quantity{Float64, 𝐌 𝐋⁻¹ 𝐓⁻¹, Unitful.FreeUnits{(kg, m⁻¹, s⁻¹), 𝐌 𝐋⁻¹ 𝐓⁻¹, nothing}}}:
 1.0e-5 kg m⁻¹ s⁻¹
 1.2e-5 kg m⁻¹ s⁻¹
julia> ℞µ([1e-5*u"m",1.2e-5]*u"kg"/u"m"/u"s")
ERROR: ArgumentError: Input: in kg/m/s (or equivalent) or unitless
"""
function ℞µ(µ)
    if unit.(upreferred.(µ)) == unit.(ustrip.(µ) * u"kg" / u"m" / u"s")
        return µ .|> upreferred
    elseif unit.(upreferred.(µ)) == unit.(ustrip.(µ) * Unitful.NoUnits)
        return µ .* u"kg" / u"m" / u"s"
    else
        throw(ArgumentError("Input: in kg/m/s (or equivalent) or unitless"))
    end
end