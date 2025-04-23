// Finite Element Method Mathematical Concept
CREATE (fem:MathematicalConcept {
  name: "FiniteElementMethod",
  description: "A numerical method for solving differential equations by dividing the domain into discrete elements and approximating the solution using piecewise functions with local support",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  fundamentalPrinciples: [
    "Domain decomposition into elements",
    "Piecewise polynomial approximation",
    "Local basis functions with compact support",
    "Weak formulation of differential equations"
  ],
  mathematicalProperties: [
    "Geometric flexibility for complex domains",
    "Guaranteed continuity across elements",
    "Local approximation properties",
    "Sparse system matrices due to local support"
  ],
  keyEquations: [
    "u(x) ≈ ∑_{i=1}^N u_i φ_i(x) where φ_i are basis functions with local support",
    "∫_Ω ∇v·∇u dx = ∫_Ω vf dx for all test functions v in the appropriate space",
    "Error bound: ||u - u_h|| ≤ C h^k ||u^{(k+1)}|| for k-th order elements"
  ],
  theoreticalFoundation: "Variational principles and approximation theory",
  historicalContext: "Developed in the 1950s-60s, originally for structural analysis",
  alternateForms: ["Galerkin finite element method", "h-method", "p-method", "hp-method"],
  paperSources: ["Courant1943", "Zienkiewicz1977", "Hughes2000"],
  taxonomyLevel: "Core",
  tier_L1: "The finite element method solves differential equations by dividing the domain into elements and approximating the solution using piecewise functions with local support, offering geometric flexibility for complex domains while ensuring appropriate continuity across element boundaries.",
  tier_L2_file: "numerics/discretization_methods/finite_element_method_L2.md"
})
