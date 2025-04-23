// Spectral Methods Symbol-Concept Relationships

// Connect basis function symbol to concept
MATCH (phi:Symbol {name: "Φₙ(x)", context: "Spectral basis functions"})
MATCH (bf:MathematicalConcept {name: "BasisFunction"})
CREATE (phi)-[:REPRESENTS {
  context: "In spectral approximation methods"
}]->(bf)

// Connect collocation points symbol to concept
MATCH (xi:Symbol {name: "ξᵢ", context: "Spectral discretization"})
MATCH (cp:MathematicalConcept {name: "CollocationPoint"})
CREATE (xi)-[:REPRESENTS {
  context: "In orthogonal collocation methods"
}]->(cp)

// Connect polynomial order symbol to concept
MATCH (p:Symbol {name: "p", context: "Polynomial approximation"})
MATCH (po:MathematicalConcept {name: "PolynomialOrder"})
CREATE (p)-[:REPRESENTS {
  context: "In spectral approximation methods"
}]->(po)

// Connect these concepts to orthogonal collocation
MATCH (bf:MathematicalConcept {name: "BasisFunction"})
MATCH (cp:MathematicalConcept {name: "CollocationPoint"})
MATCH (po:MathematicalConcept {name: "PolynomialOrder"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (bf)-[:COMPONENT_OF {
  role: "Essential building block",
  description: "Provides approximation basis"
}]->(oc)
CREATE (cp)-[:COMPONENT_OF {
  role: "Discretization points",
  description: "Locations where equations are enforced"
}]->(oc)
CREATE (po)-[:PARAMETER_OF {
  role: "Accuracy parameter",
  description: "Determines resolution of approximation"
}]->(oc)
