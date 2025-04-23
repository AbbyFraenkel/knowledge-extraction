// Hessian Symbol Node
CREATE (hess:Symbol {
  name: "∇²f",
  context: "Multivariable calculus",
  latex: "\\nabla^2 f",
  meaning: "Hessian matrix of function f - matrix of all second partial derivatives",
  
  // Optional properties
  dimensionality: "Matrix",
  constraints: "Function must be twice differentiable",
  paperSources: ["Various"],
  mathematicalDomain: "Calculus",
  computationalRole: "Second-order information for optimization"
})

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "Hessian"})
CREATE (hess)-[:REPRESENTS {
  context: "In multivariable calculus and optimization"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "UnconstrainedOptimization"})
CREATE (hess)-[:HAS_INTERPRETATION_IN {
  meaning: "Local curvature information of objective function",
  standardUsage: "Second-order optimality conditions and Newton-type methods",
  units: "Context-dependent"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (hess:Symbol {name: "∇²f", context: "Multivariable calculus"})
SET hess.implementationNote = "Implemented using hessian() function in ForwardDiff or FiniteDiff"
