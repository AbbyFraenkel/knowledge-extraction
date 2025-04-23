// Heat Transfer Application Domain Concept
CREATE (ht:ApplicationDomain {
  name: "HeatTransfer",
  description: "Study of thermal energy transfer between physical systems",
  applicationDomain: "Thermal Physics",
  subdomain: "Energy Transport",
  fundamentalPrinciples: [
    "Conservation of energy",
    "Fourier's law of heat conduction",
    "Newton's law of cooling",
    "Stefan-Boltzmann law of radiation"
  ],
  governingEquations: [
    "Heat equation: ∂T/∂t = α∇²T",
    "Fourier's law: q = -k∇T",
    "Convection: q = h(T - T_∞)",
    "Radiation: q = εσ(T⁴ - T_∞⁴)"
  ],
  physicalParameters: [
    "Thermal conductivity (k)",
    "Thermal diffusivity (α)",
    "Heat transfer coefficient (h)",
    "Specific heat capacity (c_p)"
  ],
  applicationAreas: [
    "Thermal processing",
    "HVAC systems",
    "Electronic cooling",
    "Material processing"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Heat transfer is the study of thermal energy movement between systems due to temperature differences, governed by the principles of conduction, convection, and radiation.",
  tier_L2_file: "applications/heat_transfer/heat_transfer_fundamentals_L2.md"
})
