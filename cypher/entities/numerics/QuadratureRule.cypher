// Quadrature Rule Mathematical Concept
CREATE (qr:MathematicalConcept {
  name: "QuadratureRule",
  description: "Numerical method for approximating definite integrals using a weighted sum of function values at specified points",
  domain: "Numerical Analysis",
  subdomain: "Numerical Integration",
  fundamentalPrinciples: [
    "Approximation of integrals by weighted sums",
    "Strategic selection of evaluation points and weights",
    "Exactness for polynomial functions up to specific degree",
    "Error bounds based on function smoothness"
  ],
  mathematicalProperties: [
    "Accuracy determined by point distribution and weight selection",
    "Gaussian quadrature optimal for given number of points",
    "Different weight functions for different integral types",
    "Error related to higher derivatives of the integrand"
  ],
  keyEquations: [
    "General form: ∫_a^b f(x)w(x)dx ≈ ∑_{i=1}^n w_i f(x_i)",
    "Gaussian quadrature: ∫_{-1}^1 f(x)w(x)dx = ∑_{i=1}^n w_i f(x_i) exactly for polynomials of degree ≤ 2n-1",
    "Gauss points: zeros of the orthogonal polynomial of degree n with respect to w(x)",
    "Gauss weights: w_i = ∫_{-1}^1 ℓ_i(x)w(x)dx where ℓ_i are Lagrange polynomials"
  ],
  theoreticalFoundation: "Orthogonal polynomials and approximation theory",
  historicalContext: "Developed from the early 19th century with Gauss's work, with extensive development through the 20th century",
  alternateForms: ["Numerical integration rule", "Gaussian integration", "Weighted quadrature"],
  paperSources: ["Gauss1814", "Golub1969", "Davis2007"],
  taxonomyLevel: "Core",
  formalDefinition: "A numerical approximation of a definite integral using a weighted sum of function values at specified points: ∫_a^b f(x)w(x)dx ≈ ∑_{i=1}^n w_i f(x_i) where x_i are quadrature points and w_i are quadrature weights",
  tier_L1: "A quadrature rule approximates definite integrals using a weighted sum of function values at strategically selected points, with weights and points chosen to maximize accuracy for a given number of function evaluations.",
  tier_L2_file: "numerics/discretization_methods/quadrature_rule_L2.md"
})
