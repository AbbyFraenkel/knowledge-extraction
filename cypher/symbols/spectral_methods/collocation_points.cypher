// Collocation Points Symbol Node
CREATE (xi:Symbol {
  name: "ξᵢ",
  context: "Spectral discretization",
  latex: "\\xi_i",
  meaning: "Collocation points where equations are enforced exactly",
  
  // Optional properties
  dimensionality: "Scalar",
  constraints: "Points within the computational domain",
  paperSources: ["Canuto1988", "Trefethen2000"],
  mathematicalDomain: "Orthogonal Collocation",
  computationalRole: "Discretization nodes"
})

// Connect Symbol to Papers
MATCH (paper:Paper {id: "Trefethen2000"})
CREATE (xi)-[:APPEARS_IN {
  section: "Section 4.2",
  firstAppearance: "Equation 4.7",
  role: "Collocation points"
}]->(paper)

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "CollocationPoint"})
CREATE (xi)-[:REPRESENTS {
  context: "In orthogonal collocation methods"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "PDESolvers"})
CREATE (xi)-[:HAS_INTERPRETATION_IN {
  meaning: "Points where PDE is enforced exactly",
  standardUsage: "Evaluation points for residual in collocation methods",
  units: "Dimensionless or problem-dependent"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (xi:Symbol {name: "ξᵢ", context: "Spectral discretization"})
SET xi.collocationPointType = "Gauss-Lobatto"
SET xi.implementationNote = "Implemented using collocation_points(basis, order) in CollocationPoints module"
