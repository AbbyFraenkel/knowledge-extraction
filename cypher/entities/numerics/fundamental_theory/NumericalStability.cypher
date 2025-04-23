// Numerical Stability Mathematical Concept
CREATE (ns:MathematicalConcept {
  name: "NumericalStability",
  description: "The property of a numerical algorithm to produce bounded errors when applied to a mathematically well-conditioned problem",
  domain: "Numerical Analysis",
  subdomain: "Fundamental Theory",
  fundamentalPrinciples: [
    "Bounded error propagation",
    "Resistance to perturbations",
    "Relationship to conditioning of the problem",
    "Algorithm behavior in floating-point arithmetic"
  ],
  mathematicalProperties: [
    "Error growth characteristics",
    "Sensitivity to perturbations",
    "Relationship to eigenvalues in linear problems",
    "Conservation properties in physical systems"
  ],
  keyEquations: [
    "Stability criterion: ||A||·||A^(-1)|| ≤ C for some constant C",
    "Von Neumann stability analysis: |g| ≤ 1 where g represents amplification factor",
    "CFL condition: Δt ≤ C·Δx for hyperbolic PDEs",
    "Eigenvalue stability region: S = {z : |R(z)| ≤ 1} where R is the stability function"
  ],
  theoreticalFoundation: "Perturbation theory and functional analysis",
  paperSources: ["Dahlquist1956", "Courant1928"],
  taxonomyLevel: "Core",
  tier_L1: "Numerical stability describes how errors propagate through an algorithm, determining whether small perturbations grow unboundedly (unstable) or remain controlled (stable) during computation.",
  tier_L2_file: "numerics/fundamental_theory/numerical_stability_L2.md"
})
