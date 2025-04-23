// Basis Function Symbol Node
CREATE (phi:Symbol {
  name: "Φₙ(x)",
  context: "Spectral basis functions",
  latex: "\\Phi_n(x)",
  meaning: "Basis function of degree n for spectral approximation",
  
  // Optional properties
  dimensionality: "Scalar function",
  constraints: "Typically defined on normalized domain [-1,1]",
  paperSources: ["Canuto1988", "Trefethen2000"],
  mathematicalDomain: "Spectral Methods",
  computationalRole: "Approximation basis"
})

// Connect Symbol to Papers
MATCH (paper:Paper {id: "Canuto1988"})
CREATE (phi)-[:APPEARS_IN {
  section: "Chapter 2",
  firstAppearance: "Equation 2.3",
  role: "Basis function"
}]->(paper)

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "BasisFunction"})
CREATE (phi)-[:REPRESENTS {
  context: "In spectral approximation methods"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "PDESolvers"})
CREATE (phi)-[:HAS_INTERPRETATION_IN {
  meaning: "Expansion basis for solution approximation",
  standardUsage: "Fundamental component in spectral discretization",
  units: "Dimensionless"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (phi:Symbol {name: "Φₙ(x)", context: "Spectral basis functions"})
SET phi.basisFunctionType = "Generic orthogonal polynomial"
SET phi.implementationNote = "Implemented as evaluate_basis(basis, n, x) in BasisFunctions module"
