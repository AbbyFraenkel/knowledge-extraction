// Differentiation Matrix Mathematical Concept
CREATE (dm:MathematicalConcept {
  name: "DifferentiationMatrix",
  description: "Matrix representation of a differential operator that converts function values at discrete points to approximate derivative values at those same points",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  fundamentalPrinciples: [
    "Linearization of differential operators",
    "Matrix representation of derivatives",
    "Exact differentiation of interpolants",
    "Point-wise derivative approximation"
  ],
  mathematicalProperties: [
    "Accuracy determined by underlying basis functions",
    "Typically dense for spectral methods, sparse for finite difference",
    "Higher derivatives obtained by matrix powers or specific constructions",
    "Eigenvalue structure affects stability of time integration"
  ],
  keyEquations: [
    "Definition: D_{ij} = dℓ_j(x)/dx|_{x=x_i} where ℓ_j are basis functions",
    "Derivative approximation: u'(x_i) ≈ ∑_{j=0}^N D_{ij} u(x_j)",
    "Finite difference case: D_{ij} = coefficients from Taylor series",
    "Spectral case: D_{ij} = P'_j(x_i) for polynomial basis P_j"
  ],
  theoreticalFoundation: "Polynomial interpolation and approximation theory",
  historicalContext: "Formalized in the context of spectral methods in the 1970s but conceptually present in earlier finite difference methods",
  alternateForms: ["Discrete differential operator", "Derivative matrix", "Pseudospectral differentiation matrix"],
  paperSources: ["Fornberg1998", "Trefethen2000", "Weideman2000"],
  taxonomyLevel: "Core",
  formalDefinition: "A matrix D such that given a vector of function values [u(x_0), u(x_1), ..., u(x_N)]^T, the product D·[u(x_0), u(x_1), ..., u(x_N)]^T approximates the derivative values [u'(x_0), u'(x_1), ..., u'(x_N)]^T",
  tier_L1: "A differentiation matrix is a matrix representation of a differential operator that transforms function values at discrete points to approximate derivative values at those same points, enabling differential equations to be converted to algebraic systems.",
  tier_L2_file: "numerics/discretization_methods/differentiation_matrix_L2.md"
})
