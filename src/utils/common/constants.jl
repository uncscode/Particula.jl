""" centralized location for physical parameters.
"""

using Unitful

# Boltzmann's constant in m^2 kg s^-2 K^-1
const BOLTZMANN_CONSTANT = 1.380649e-23 * u"m"^2 * u"kg" / u"s"^2 / u"K"

# Avogadro's number
const AVOGADRO_NUMBER = 6.022140857e23 / u"mol"

# Gas constant in J mol^-1 K^-1
const GAS_CONSTANT = BOLTZMANN_CONSTANT * AVOGADRO_NUMBER

# elementary charge in C
const ELEMENTARY_CHARGE_VALUE = 1.60217662e-19 * u"C"

# Relative permittivity of air at room temperature
# Previously known as the "dielectric constant"
# Often denoted as epsilon
const RELATIVE_PERMITTIVITY_AIR = 1.0005  # unitless

# permittivity of free space in F/m
# Also known as the electric constant, permittivity of free space
# Often denoted by epsilon_0
const VACUUM_PERMITTIVITY = 8.85418782e-12 * u"F" / u"m"

# permittivity of air
const ELECTRIC_PERMITTIVITY = RELATIVE_PERMITTIVITY_AIR * VACUUM_PERMITTIVITY

# these values are used to calculate the dynamic viscosity of air
# viscosity of air at 273.15 K
const REF_VISCOSITY_AIR = 1.716e-5 * u"Pa" * u"s"
const REF_TEMPERATURE = 273.15 * u"K"
const SUTHERLAND_CONSTANT = 110.4 * u"K"
const MOLECULAR_WEIGHT_AIR = 28.9644 * u"g" / u"mol" |> upreferred