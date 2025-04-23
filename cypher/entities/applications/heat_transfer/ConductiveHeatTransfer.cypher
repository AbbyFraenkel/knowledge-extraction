// Conductive Heat Transfer Application Domain Concept
CREATE (ct:ApplicationDomain {
  name: "ConductiveHeatTransfer",
  description: "The transfer of thermal energy through a medium without bulk motion, driven by temperature gradients",
  applicationDomain: "Thermal Physics",
  subdomain: "Heat Transfer Modes",
  fundamentalPrinciples: [
    "Energy transfer through molecular motion",
    "Temperature gradient as driving force",
    "Material property dependence",
    "Boundary and initial condition effects"
  ],
  governingEquations: [
    "Fourier's law: q = -k∇T",
    "Heat equation: ∂T/∂t = α∇²T",
    "Steady-state form: ∇²T = 0",
    "Boundary conditions: Dirichlet, Neumann, Robin"
  ],
  physicalParameters: [
    "Thermal conductivity (k)",
    "Thermal diffusivity (α)",
    "Specific heat capacity (c_p)",
    "Density (ρ)"
  ],
  applicationAreas: [
    "Building insulation",
    "Electronic component design",
    "Material processing",
    "Food thermal processing"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Conductive heat transfer involves energy transport through a medium without bulk movement, where heat flows from higher to lower temperature regions at a rate determined by the material's thermal conductivity and the temperature gradient.",
  tier_L2_file: "applications/heat_transfer/conductive_heat_transfer_L2.md"
})
