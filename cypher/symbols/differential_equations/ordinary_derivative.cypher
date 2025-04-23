// Ordinary Derivative Symbol Node
CREATE (od:Symbol {
  name: "d/dx",
  context: "Differential calculus",
  latex: "\\frac{d}{dx}",
  meaning: "Ordinary derivative operator with respect to x",
  
  // Optional properties
  dimensionality: "Operator",
  constraints: "Applies to differentiable functions",
  paperSources: ["Various"],
  mathematicalDomain: "Calculus",
  computationalRole: "Differential operator"
})

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "OrdinaryDerivative"})
CREATE (od)-[:REPRESENTS {
  context: "In differential calculus"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "PDESolvers"})
CREATE (od)-[:HAS_INTERPRETATION_IN {
  meaning: "Rate of change with respect to one variable",
  standardUsage: "First-order derivatives in ODEs",
  units: "Context-dependent"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (od:Symbol {name: "d/dx", context: "Differential calculus"})
SET od.implementationNote = "Implemented using differentiation matrices in DifferentiationOperators module"
