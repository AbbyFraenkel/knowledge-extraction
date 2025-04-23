// Finite Element Method Mathematical Concept
CREATE (fem:MathematicalConcept {
  name: "FiniteElementMethod",
  description: "A numerical method that subdivides the domain into simple elements and approximates the solution using piecewise functions",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  fundamentalPrinciples: [
    "Domain decomposition into simple elements",
    "Piecewise polynomial approximation",
    "Weak formulation of differential equations",
    "Local-to-global assembly process"
  ],
  mathematicalProperties: [
    "Galerkin orthogonality",
    "Convergence rates dependent on element order",
    "Stability through appropriate function spaces",
    "Natural handling of complex geometries"
  ],
  keyEquations: [
    "Weak form: ∫_Ω a(u,v) dx = ∫_Ω f·v dx",
    "Solution approximation: u_h(x) = ∑_i u_i φ_i(x)",
    "Stiffness matrix: K_ij = ∫_Ω a(φ_j, φ_i) dx",
    "Load vector: F_i = ∫_Ω f·φ_i dx"
  ],
  theoreticalFoundation: "Variational principles and functional analysis",
  paperSources: ["Strang1973", "Hughes2000"],
  taxonomyLevel: "Core",
  tier_L1: "The finite element method subdivides a problem domain into simpler parts called elements, approximates the solution using piecewise functions, and formulates the problem in weak form, making it well-suited for complex geometries and diverse boundary conditions.",
  tier_L2_file: "numerics/discretization_methods/finite_element_method_L2.md"
})
