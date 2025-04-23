// Computational Fluid Dynamics Application Domain Concept
CREATE (cfd:ApplicationDomain {
  name: "ComputationalFluidDynamics",
  description: "The use of numerical methods to solve and analyze problems involving fluid flows",
  applicationDomain: "Fluid Mechanics",
  subdomain: "Computational Methods",
  fundamentalPrinciples: [
    "Discretization of fluid flow equations",
    "Conservation of mass, momentum, and energy",
    "Handling of advection-dominated flows",
    "Treatment of turbulence and multi-phase phenomena"
  ],
  governingEquations: [
    "Navier-Stokes equations: ρ(∂v/∂t + v·∇v) = -∇p + μ∇²v + ρg",
    "Continuity equation: ∂ρ/∂t + ∇·(ρv) = 0",
    "Energy equation: ρc_p(∂T/∂t + v·∇T) = ∇·(k∇T) + Φ",
    "Turbulence models (e.g., k-ε): ∂k/∂t + v·∇k = ∇·[(ν + ν_t/σ_k)∇k] + P_k - ε"
  ],
  computationalApproaches: [
    "Finite volume methods",
    "Finite element methods",
    "Lattice Boltzmann methods",
    "Spectral methods for specific problems"
  ],
  applicationAreas: [
    "Aerodynamics",
    "Hydrodynamics",
    "Heat exchangers",
    "Combustion processes"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Computational Fluid Dynamics (CFD) uses numerical methods to solve the equations governing fluid flow, enabling the analysis and prediction of fluid behavior in complex scenarios across engineering applications from aerodynamics to biomedical flows.",
  tier_L2_file: "applications/fluid_dynamics/computational_fluid_dynamics_L2.md"
})
