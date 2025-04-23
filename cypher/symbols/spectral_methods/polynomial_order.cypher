// Polynomial Order Symbol Node
CREATE (p:Symbol {
  name: "p",
  context: "Polynomial approximation",
  latex: "p",
  meaning: "Order/degree of polynomial approximation",
  
  // Optional properties
  dimensionality: "Scalar integer",
  constraints: "Positive integer",
  paperSources: ["Canuto1988", "Karniadakis2005"],
  mathematicalDomain: "Spectral Methods",
  computationalRole: "Accuracy parameter"
})

// Connect Symbol to Papers
MATCH (paper:Paper {id: "Karniadakis2005"})
CREATE (p)-[:APPEARS_IN {
  section: "Chapter 3",
  firstAppearance: "Section 3.1",
  role: "Parameter"
}]->(paper)

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "PolynomialOrder"})
CREATE (p)-[:REPRESENTS {
  context: "In spectral approximation methods"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "PDESolvers"})
CREATE (p)-[:HAS_INTERPRETATION_IN {
  meaning: "Determines accuracy of spectral approximation",
  standardUsage: "Primary parameter for h-p adaptive methods",
  units: "Dimensionless integer"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (p:Symbol {name: "p", context: "Polynomial approximation"})
SET p.implementationNote = "Implemented as order parameter in OrthogonalCollocation type"
