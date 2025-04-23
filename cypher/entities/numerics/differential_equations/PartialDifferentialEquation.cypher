// Partial Differential Equation Mathematical Concept
CREATE (pde:MathematicalConcept {
  name: "PartialDifferentialEquation",
  description: "An equation involving partial derivatives of a function with respect to multiple independent variables",
  domain: "Differential Equations",
  subdomain: "Partial Differential Equations",
  fundamentalPrinciples: [
    "Involves derivatives with respect to multiple variables",
    "Describes relationships in multi-dimensional systems",
    "Classified by order, linearity, and type",
    "Requires boundary and/or initial conditions"
  ],
  mathematicalProperties: [
    "Classification into elliptic, parabolic, hyperbolic types",
    "Well-posedness under appropriate conditions",
    "Solution behavior dependent on equation type",
    "Uniqueness properties under boundary/initial conditions"
  ],
  keyEquations: [
    "Heat equation (parabolic): ∂u/∂t = α∇²u",
    "Wave equation (hyperbolic): ∂²u/∂t² = c²∇²u",
    "Laplace equation (elliptic): ∇²u = 0",
    "Advection equation: ∂u/∂t + v·∇u = 0"
  ],
  theoreticalFoundation: "Multivariable calculus and functional analysis",
  paperSources: ["Evans2010", "Taylor2011"],
  taxonomyLevel: "Core",
  tier_L1: "Partial differential equations involve derivatives of a function with respect to multiple independent variables, describing a wide range of physical phenomena in continuous media including heat flow, wave propagation, and fluid behavior.",
  tier_L2_file: "numerics/differential_equations/partial_differential_equation_L2.md"
})
