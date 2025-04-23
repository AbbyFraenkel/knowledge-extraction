// Multiphase Flow Application Domain Concept
CREATE (mpf:ApplicationDomain {
  name: "MultiphaseFlow",
  description: "The simultaneous flow of materials with different phases (gas, liquid, solid) or different fluids with interfaces",
  applicationDomain: "Fluid Mechanics",
  subdomain: "Complex Flows",
  fundamentalPrinciples: [
    "Interface dynamics between phases",
    "Phase interaction and momentum exchange",
    "Surface tension and interfacial forces",
    "Phase distribution patterns and transitions"
  ],
  governingEquations: [
    "Continuity equation for each phase: ∂(αₖρₖ)/∂t + ∇·(αₖρₖvₖ) = 0",
    "Momentum equation with phase interactions: ∂(αₖρₖvₖ)/∂t + ∇·(αₖρₖvₖvₖ) = -αₖ∇p + ∇·(αₖτₖ) + αₖρₖg + Fₖ",
    "Interface tracking: ∂α/∂t + v·∇α = 0",
    "Jump conditions at interfaces: [p] = σκ, [v] = 0"
  ],
  physicalParameters: [
    "Volume fractions for each phase",
    "Interfacial area density",
    "Surface tension coefficient",
    "Phase interaction coefficients"
  ],
  applicationAreas: [
    "Oil and gas transportation",
    "Chemical reactors",
    "Boiling and condensation",
    "Particle-laden flows"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Multiphase flow involves the simultaneous flow of materials in different phases or immiscible fluids, characterized by interfaces between phases and complex interactions that lead to various flow regimes and patterns.",
  tier_L2_file: "applications/fluid_dynamics/multiphase_flow_L2.md"
})
