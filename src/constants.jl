""" centralized location for physical parameters.
"""

using Unitful

const k = 1.380649e-23 * u"m"^2 * u"kg" / u"s"^2 / u"K"

const Nₐ = 6.022140857e23 / u"mol"

# Gas constant in J mol^-1 K^-1 = m^2 kg mol^-1 s^-2 K^-1
# J = kg m^2 s^-2
const R = k * Nₐ

const e = 1.60217662e-19 * u"C"

# Relative permittivity of air at approx.
# 296.15 K and 101325 Pa and 40% RH
# See https://www.osti.gov/servlets/purl/1504063
# Previously known as the "dielectric constant"
# Often denoted as epsilon
const ε_air_room = 1.000530569 # unitless
# At STP (273.15 K, 1 atm):
# see: https://en.wikipedia.org/wiki/Relative_permittivity
const ε_air_stp = 1.00058986 # unitless

# select one of the two:
const ε = ε_air_room

# permittivity of free space in F/m
# Also known as the electric constant, permittivity of free space
# Often denoted by epsilon_0
const ε₀ = 8.85418782e-12 * u"F" / u"m"

# These values are used to calculate the dynamic viscosity of air
# Here, REF temperature and viscosity are at STP:
# Standard temperature and pressure (273.15 K and 101325 Pa)
const µ₀_air_stp = 1.716e-5 * u"Pa" * u"s"
const T₀_air_stp = 273.15 * u"K"

const Sₖ = 110.4 * u"K"
const M_air = 28.9644 * u"g" / u"mol" |> upreferred