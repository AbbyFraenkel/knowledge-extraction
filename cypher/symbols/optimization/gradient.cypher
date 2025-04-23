// Gradient Symbol Node
CREATE (grad:Symbol {
  name: "∇f",
  context: "Multivariable calculus",
  latex: "\\nabla f",
  meaning: "Gradient of function f - vector of all partial derivatives",
  
  // Optional properties
  dimensionality: "Vector",
  constraints: "Function must be differentiable",
  paperSources: ["Various"],
  mathematicalDomain: "Calculus",
  computationalRole: "Direction of steepest ascent"
})

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "Gradient"})
CREATE (grad)-[:REPRESENTS {
  context: "In multivariable calculus and optimization"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "UnconstrainedOptimization"})
CREATE (grad)-[:HAS_INTERPRETATION_IN {
  meaning: "Direction of steepest ascent of a function",
  standardUsage: "First-order optimality conditions",
  units: "Context-dependent"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (grad:Symbol {name: "∇f", context: "Multivariable calculus"})
SET grad.implementationNote = "Implemented using gradient() function in ForwardDiff or FiniteDiff"
