""" handling the inputs
"""

using Unitful

function in_temperature(temperature)

    if temperature |> upreferred |> unit == u"K"
        return temperature |> upreferred
    elseif temperature |> upreferred |> unit == Unitful.NoUnits
        return temperature * u"K"
    else
        throw(
            ArgumentError(
                "Temperature must be in kelvin or equivlanet;
                      if no units are given, it will be assumed kelvin."
            )
        )
    end

end


function in_viscosity(viscosity)

    if viscosity |> upreferred |> unit == u"kg"/u"m"/u"s"
        return viscosity |> upreferred
    elseif viscosity |> upreferred |> unit == Unitful.NoUnits
        return viscosity * u"kg"/u"m"/u"s"
    else
        throw(
            ArgumentError(
                "Viscosity must be in Pascal-seconds or equivlanet;
                      if no units are given, it will be assumed kg/m/s."
            )
        )
    end

end