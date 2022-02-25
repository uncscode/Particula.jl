"""
    ℞X(X)

Ensure X in the base unit U (assuming unit(X)=U).

If X has units of U or equivalent, or if it has no units,
it returns it in U. If X has any units other than K, 
it then rasies an ArgumentError. 

# Notes
It accepts vectors, but will throw an error if elements have different units.

# Examples
```julia-repl
julia> ℞T(300)
300 K
```
"""

using Unitful

"""
    ℞T(T)

Ensure T is in K.
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
