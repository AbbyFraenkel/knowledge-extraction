// Numerics to Applications Cross-Domain Relationships

// Connect spectral methods to PDE solvers
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (mloc:MathematicalConcept {name: "MultiLevelOrthogonalCollocation"})
MATCH (pdes:ApplicationDomain {name: "PDESolvers"})

CREATE (oc)-[:APPLIES_TO {
  relevance: "High accuracy discretization method",
  adaptations: ["Boundary condition handling", "Matrix operations optimization"]
}]->(pdes)

CREATE (mloc)-[:APPLIES_TO {
  relevance: "Adaptive high-accuracy method",
  adaptations: ["Local refinement capabilities", "Error estimation for adaptivity"]
}]->(pdes)

// Connect heat transfer to numerical methods
MATCH (ht:ApplicationDomain {name: "HeatTransfer"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (fdm:MathematicalConcept {name: "FictitiousDomainMethod"})

CREATE (ht)-[:UTILIZES {
  context: "High-accuracy thermal modeling",
  description: "For accurate temperature gradients at boundaries"
}]->(oc)

CREATE (ht)-[:UTILIZES {
  context: "Complex geometry handling",
  description: "For realistic container shapes"
}]->(fdm)

// Connect tunnel pasteurization to numerical methods
MATCH (tp:ApplicationDomain {name: "TunnelPasteurization"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (mloc:MathematicalConcept {name: "MultiLevelOrthogonalCollocation"})

CREATE (tp)-[:UTILIZES {
  context: "Accurate heat transfer modeling",
  description: "For precise pasteurization unit calculation"
}]->(oc)

CREATE (tp)-[:UTILIZES {
  context: "Efficient container modeling",
  description: "For computational efficiency with accuracy"
}]->(mloc)

// Connect cross-domain bridge to applications
MATCH (smtp:CrossDomainBridge {name: "SpectralMethodsToPasteurization"})
MATCH (tp:ApplicationDomain {name: "TunnelPasteurization"})
MATCH (ht:ApplicationDomain {name: "HeatTransfer"})

CREATE (smtp)-[:BRIDGES {
  source_domain: "Numerical Methods",
  target_domain: "Food Processing",
  description: "Connects numerical approaches to pasteurization applications"
}]->(tp)

CREATE (smtp)-[:APPLIES {
  context: "Thermal modeling",
  description: "Application of spectral methods to heat transfer"
}]->(ht)
