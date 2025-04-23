// Convective Heat Transfer Application Domain Concept
CREATE (cht:ApplicationDomain {
  name: "ConvectiveHeatTransfer",
  description: "The transfer of thermal energy due to fluid motion relative to a surface with a different temperature",
  applicationDomain: "Thermal Physics",
  subdomain: "Heat Transfer Modes",
  fundamentalPrinciples: [
    "Heat transfer through fluid motion",
    "Boundary layer development",
    "Thermal and momentum coupling",
    "Natural and forced convection mechanisms"
  ],
  governingEquations: [
    "Newton's law of cooling: q = h(T_s - T_∞)",
    "Energy equation: ρc_p(∂T/∂t + v·∇T) = ∇·(k∇T) + Φ",
    "Boundary layer equations for forced convection",
    "Nusselt number correlations: Nu = f(Re, Pr)"
  ],
  physicalParameters: [
    "Heat transfer coefficient (h)",
    "Fluid thermal properties (k, c_p, μ, ρ)",
    "Flow rate or velocity",
    "Characteristic dimensions"
  ],
  applicationAreas: [
    "Heat exchangers",
    "Electronic cooling",
    "Process heating and cooling",
    "HVAC systems"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Convective heat transfer involves thermal energy transport due to fluid motion relative to surfaces with different temperatures, characterized by heat transfer coefficients and dimensionless parameters that depend on flow conditions and fluid properties.",
  tier_L2_file: "applications/heat_transfer/convective_heat_transfer_L2.md"
})
