// Expanded Symbol-Concept Relationships

// Connect Differential Equation Symbols to Concepts
MATCH (od:Symbol {name: "d/dx", context: "Differential calculus"})
MATCH (pd:Symbol {name: "∂/∂x", context: "Multivariable calculus"})
MATCH (ode:MathematicalConcept {name: "OrdinaryDifferentialEquation"})
MATCH (pde:MathematicalConcept {name: "PartialDifferentialEquation"})

CREATE (od)-[:USED_IN {
  context: "Differential operator",
  description: "Core operator in ordinary differential equations"
}]->(ode)

CREATE (pd)-[:USED_IN {
  context: "Differential operator",
  description: "Core operator in partial differential equations"
}]->(pde)

// Connect Optimization Symbols to Concepts
MATCH (grad:Symbol {name: "∇f", context: "Multivariable calculus"})
MATCH (hess:Symbol {name: "∇²f", context: "Multivariable calculus"})
MATCH (uo:MathematicalConcept {name: "UnconstrainedOptimization"})
MATCH (co:MathematicalConcept {name: "ConstrainedOptimization"})

CREATE (grad)-[:USED_IN {
  context: "First-order optimality",
  description: "Gradient vanishing at critical points"
}]->(uo)

CREATE (grad)-[:USED_IN {
  context: "KKT conditions",
  description: "Gradient component in first-order conditions"
}]->(co)

CREATE (hess)-[:USED_IN {
  context: "Second-order optimality",
  description: "Hessian positive definite at local minimum"
}]->(uo)

// Connect Fluid Dynamics Symbols to Concepts
MATCH (vel:Symbol {name: "v", context: "Fluid dynamics"})
MATCH (cfd:ApplicationDomain {name: "ComputationalFluidDynamics"})
MATCH (fsi:ApplicationDomain {name: "FluidStructureInteraction"})

CREATE (vel)-[:USED_IN {
  context: "Primary variable",
  description: "Velocity field representing fluid motion"
}]->(cfd)

CREATE (vel)-[:USED_IN {
  context: "Fluid component",
  description: "Fluid velocity at fluid-structure interface"
}]->(fsi)

// Connect Symbol Conflicts
MATCH (alpha1:Symbol {name: "α", context: "Heat transfer equation"})
MATCH (alpha2:Symbol {name: "α", context: "Spectral methods"})

MATCH (grad:Symbol {name: "∇f", context: "Multivariable calculus"})
MATCH (vel:Symbol {name: "v", context: "Fluid dynamics"})

CREATE (grad)-[:SIMILAR_NOTATION_TO {
  distinction: "Vector field vs. operator",
  potential_confusion: "Both use vector notation",
  resolution: "Context-dependent interpretation"
}]->(vel)

// Connect Symbols to KitchenSink Implementation
MATCH (ks:Implementation {name: "KitchenSinkSolver"})
MATCH (phi:Symbol {name: "Φₙ(x)", context: "Spectral basis functions"})
MATCH (xi:Symbol {name: "ξᵢ", context: "Spectral discretization"})
MATCH (p:Symbol {name: "p", context: "Polynomial approximation"})

CREATE (phi)-[:IMPLEMENTED_IN {
  as: "basis_functions",
  type: "OrthogonalPolynomial{T}",
  module: "BasisFunctions"
}]->(ks)

CREATE (xi)-[:IMPLEMENTED_IN {
  as: "collocation_points",
  type: "Vector{T}",
  module: "CollocationPoints"
}]->(ks)

CREATE (p)-[:IMPLEMENTED_IN {
  as: "polynomial_order",
  type: "Int",
  module: "SpectralMethod"
}]->(ks)
