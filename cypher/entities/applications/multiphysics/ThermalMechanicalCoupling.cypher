// Thermal-Mechanical Coupling Application Domain Concept
CREATE (tmc:ApplicationDomain {
  name: "ThermalMechanicalCoupling",
  description: "The study of interconnected thermal and mechanical phenomena where temperature fields affect mechanical behavior and vice versa",
  applicationDomain: "Multiphysics",
  subdomain: "Coupled Problems",
  fundamentalPrinciples: [
    "Thermal expansion and contraction effects on mechanics",
    "Mechanical dissipation generating heat",
    "Temperature-dependent material properties",
    "Thermal stress development and relaxation"
  ],
  governingEquations: [
    "Heat equation with mechanical coupling: ρcₚ∂T/∂t - ∇·(k∇T) = Q + α·T₀·tr(ε̇)",
    "Mechanical equilibrium with thermal effects: ∇·σ + ρb = 0 where σ includes thermal strain",
    "Thermal strain: εᵗʰ = α(T-T₀)",
    "Coupled constitutive relations: σ = C:(ε-εᵗʰ)"
  ],
  physicalParameters: [
    "Thermal expansion coefficient",
    "Thermal conductivity",
    "Elastic moduli (potentially temperature-dependent)",
    "Heat generation coefficients"
  ],
  applicationAreas: [
    "Metal forming processes",
    "Welding and joining",
    "Thermomechanical fatigue",
    "Structural integrity under temperature variations"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Thermal-mechanical coupling addresses the interdependent relationship between thermal and mechanical phenomena, where temperature changes cause mechanical deformation through thermal expansion while mechanical work generates heat through dissipation.",
  tier_L2_file: "applications/multiphysics/thermal_mechanical_coupling_L2.md"
})
