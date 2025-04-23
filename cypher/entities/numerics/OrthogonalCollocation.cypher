// Orthogonal Collocation Mathematical Concept
CREATE (oc:MathematicalConcept {
  name: "OrthogonalCollocation",
  description: "A spectral method that approximates solutions using orthogonal polynomials and enforces equations at collocation points",
  domain: "Numerical Analysis",
  subdomain: "Spectral Methods",
  fundamentalPrinciples: [
    "Orthogonal polynomial expansion",
    "Collocation (point-wise equation satisfaction)",
    "Spectral convergence for smooth functions"
  ],
  mathematicalProperties: [
    "Exponential convergence for analytic functions",
    "Exact derivative representation at collocation points",
    "High accuracy per degree of freedom"
  ],
  keyEquations: [
    "u(x) ≈ ∑ᵢ uᵢ ℓᵢ(x) where ℓᵢ(x) are Lagrange interpolation polynomials",
    "ℓᵢ(xⱼ) = δᵢⱼ (Kronecker delta property)"
  ],
  theoreticalFoundation: "Approximation theory for orthogonal polynomials",
  historicalContext: "Developed in the 1970s, building on earlier spectral methods",
  paperSources: ["Villadsen1978", "Finlayson1972"],
  taxonomyLevel: "Core",
  tier_L1: "Orthogonal collocation is a high-accuracy numerical method where solutions are approximated using orthogonal polynomial basis functions, with governing equations enforced exactly at specially chosen collocation points.",
  tier_L2_file: "numerics/discretization_methods/orthogonal_collocation_L2.md"
})
