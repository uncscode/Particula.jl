""" handling the inputs
"""

using Unitful

function ℞T(T)

    if T |> upreferred |> unit == u"K"
        return T |> upreferred
    elseif T |> upreferred |> unit == Unitful.NoUnits
        return T * u"K"
    else
        throw(
            ArgumentError(
                "Temperature must be in kelvin or equivlanet;
                      if no units are given, it will be assumed kelvin."
            )
        )
    end

end


function ℞µ(µ)

    if µ |> upreferred |> unit == u"kg" / u"m" / u"s"
        return µ |> upreferred
    elseif µ |> upreferred |> unit == Unitful.NoUnits
        return µ * u"kg" / u"m" / u"s"
    else
        throw(
            ArgumentError(
                "Viscosity must be in Pascal-seconds or equivlanet;
                      if no units are given, it will be assumed kg/m/s."
            )
        )
    end

end