// Partial Derivative Symbol Node
CREATE (pd:Symbol {
  name: "∂/∂x",
  context: "Multivariable calculus",
  latex: "\\frac{\\partial}{\\partial x}",
  meaning: "Partial derivative operator with respect to x",
  
  // Optional properties
  dimensionality: "Operator",
  constraints: "Applies to partially differentiable functions",
  paperSources: ["Various"],
  mathematicalDomain: "Multivariable Calculus",
  computationalRole: "Differential operator"
})

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "PartialDerivative"})
CREATE (pd)-[:REPRESENTS {
  context: "In multivariable calculus"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "PDESolvers"})
CREATE (pd)-[:HAS_INTERPRETATION_IN {
  meaning: "Rate of change with respect to one variable while holding others constant",
  standardUsage: "Spatial and temporal derivatives in PDEs",
  units: "Context-dependent"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (pd:Symbol {name: "∂/∂x", context: "Multivariable calculus"})
SET pd.implementationNote = "Implemented using partial differentiation matrices for each dimension"
