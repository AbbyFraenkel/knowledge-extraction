// Polynomial Order Mathematical Concept
CREATE (po:MathematicalConcept {
  name: "PolynomialOrder",
  description: "The degree or highest power of the polynomial basis functions used in numerical approximations",
  domain: "Numerical Analysis",
  subdomain: "Approximation Theory",
  fundamentalPrinciples: [
    "Determines resolution capacity of polynomial approximation",
    "Controls number of degrees of freedom in spectral methods",
    "Key parameter in p-refinement strategies",
    "Directly related to approximation accuracy"
  ],
  mathematicalProperties: [
    "Higher order enables representation of higher frequencies",
    "Error typically decreases as O(h^p) for non-smooth solutions",
    "Error decreases as O(e^{-αp}) for analytic solutions",
    "Related to number of collocation points"
  ],
  keyEquations: [
    "p: degree of polynomial approximation",
    "Approximation: u(x) ≈ ∑_{i=0}^p c_i φ_i(x)",
    "Error bound: ||u - u_p|| ≤ C h^{p+1} |u^{(p+1)}|"
  ],
  theoreticalFoundation: "Polynomial approximation theory and spectral methods",
  historicalContext: "Core parameter in p-type and hp-adaptive finite element methods",
  paperSources: ["Babuska1981", "Szabo1991", "Karniadakis2005"],
  taxonomyLevel: "Core",
  tier_L1: "Polynomial order represents the highest power or degree of polynomial basis functions used in numerical approximations, determining the resolution capacity and accuracy of the approximation while serving as a key parameter in p-refinement strategies.",
  tier_L2_file: "numerics/discretization_methods/polynomial_order_L2.md"
})
