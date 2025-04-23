// Collocation Point Mathematical Concept
CREATE (cp:MathematicalConcept {
  name: "CollocationPoint",
  description: "Specific points within the computational domain where governing equations are enforced exactly in collocation methods",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  fundamentalPrinciples: [
    "Point-wise equation satisfaction",
    "Strategic selection for optimal approximation",
    "Transformation of differential equations to algebraic equations",
    "Relationship to interpolation nodes"
  ],
  mathematicalProperties: [
    "Often chosen as roots of orthogonal polynomials",
    "Typically include or exclude domain boundaries based on problem type",
    "Distribution affects approximation accuracy and stability",
    "Related to optimal quadrature points in many cases"
  ],
  keyEquations: [
    "Collocation condition: L[u_N](ξⱼ) = f(ξⱼ) for j = 0,1,...,N",
    "Gauss points: roots of P_{N+1}(x) where P is orthogonal polynomial",
    "Gauss-Lobatto points: roots of P'_N(x) plus endpoints ±1",
    "Lagrange basis property: ℓᵢ(ξⱼ) = δᵢⱼ (Kronecker delta)"
  ],
  theoreticalFoundation: "Polynomial interpolation theory and orthogonal polynomials",
  historicalContext: "Developed in the 1960-70s for spectral and finite element methods",
  alternateForms: ["Collocation nodes", "Interpolation points", "Quadrature points"],
  paperSources: ["Villadsen1967", "Canuto1988", "Trefethen2000"],
  taxonomyLevel: "Core",
  formalDefinition: "A set of points {ξⱼ}ⱼ₌₀ᴺ within the computational domain at which the residual of the governing equations is forced to be zero in collocation methods",
  tier_L1: "Collocation points are strategically selected positions within the computational domain where the governing equations are enforced exactly in collocation methods, transforming differential equations into a system of algebraic equations for the unknown coefficients.",
  tier_L2_file: "numerics/discretization_methods/collocation_point_L2.md"
})
