// Basis Function Mathematical Concept
CREATE (bf:MathematicalConcept {
  name: "BasisFunction",
  description: "Function used as building block for approximating solutions in numerical methods",
  domain: "Numerical Analysis",
  subdomain: "Approximation Theory",
  fundamentalPrinciples: [
    "Linear combination for solution approximation",
    "Completeness property in function space",
    "Minimization of approximation error",
    "Orthogonality for numerical stability"
  ],
  mathematicalProperties: [
    "Form complete or overcomplete sets",
    "Often orthogonal or orthonormal",
    "Usually have specific smoothness properties",
    "May satisfy boundary conditions by construction"
  ],
  keyEquations: [
    "Function approximation: u(x) ≈ ∑ᵢ cᵢ φᵢ(x)",
    "Orthogonality condition: ∫ φᵢ(x)φⱼ(x)w(x)dx = δᵢⱼ",
    "Completeness property: lim_{N→∞} ∑ᵢ₌₀ᴺ cᵢφᵢ(x) = f(x)"
  ],
  theoreticalFoundation: "Functional analysis and approximation theory",
  historicalContext: "Formalized in the early 20th century with functional analysis",
  alternateForms: ["Basis", "Expansion functions", "Trial functions"],
  paperSources: ["Courant1953", "Szabó1991", "Boyd2001"],
  taxonomyLevel: "Fundamental",
  formalDefinition: "A set of functions {φᵢ}ᵢ₌₀^∞ that form a basis for a function space, allowing any function in that space to be represented as a (possibly infinite) linear combination of the basis functions",
  tier_L1: "Basis functions are fundamental building blocks used to represent solutions in numerical methods. A solution is approximated as a weighted sum of these functions, with the weights (coefficients) determined to minimize error according to specific criteria.",
  tier_L2_file: "numerics/discretization_methods/basis_function_L2.md"
})
