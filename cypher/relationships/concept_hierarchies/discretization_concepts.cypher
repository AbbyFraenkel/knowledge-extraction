// Discretization Concepts Hierarchy Relationships

// Connect BasisFunction with related concepts
MATCH (bf:MathematicalConcept {name: "BasisFunction"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (oc)-[:UTILIZES {
  role: "Fundamental component",
  description: "Uses orthogonal polynomials as basis functions"
}]->(bf)

// Connect CollocationPoint with related concepts
MATCH (cp:MathematicalConcept {name: "CollocationPoint"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (oc)-[:UTILIZES {
  role: "Discretization mechanism",
  description: "Points where equations are enforced exactly"
}]->(cp)

// Connect AdaptiveRefinement with related concepts
MATCH (ar:MathematicalConcept {name: "AdaptiveRefinement"})
MATCH (mlm:MathematicalConcept {name: "MultiLevelMethod"})
CREATE (mlm)-[:IMPLEMENTS {
  role: "Core capability",
  description: "Provides systematic approach to local refinement"
}]->(ar)

// Connect ErrorEstimation with related concepts
MATCH (ee:MathematicalConcept {name: "ErrorEstimation"})
MATCH (ar:MathematicalConcept {name: "AdaptiveRefinement"})
CREATE (ar)-[:DEPENDS_ON {
  role: "Decision mechanism",
  description: "Guides where and when to refine"
}]->(ee)

// Connect SpectralConvergence with related concepts
MATCH (sc:MathematicalConcept {name: "SpectralConvergence"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (oc)-[:EXHIBITS {
  role: "Key property",
  description: "Achieves exponential convergence for smooth solutions"
}]->(sc)

// Connect DifferentiationMatrix with related concepts
MATCH (dm:MathematicalConcept {name: "DifferentiationMatrix"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (oc)-[:UTILIZES {
  role: "Implementation mechanism",
  description: "Represents derivatives in discrete form"
}]->(dm)

// Connect QuadratureRule with related concepts
MATCH (qr:MathematicalConcept {name: "QuadratureRule"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (oc)-[:UTILIZES {
  role: "Integration mechanism",
  description: "Used for inner products and weak forms"
}]->(qr)

// Connect DifferentiationMatrix with BasisFunction
MATCH (dm:MathematicalConcept {name: "DifferentiationMatrix"})
MATCH (bf:MathematicalConcept {name: "BasisFunction"})
CREATE (dm)-[:DERIVED_FROM {
  role: "Construction mechanism",
  description: "Created from derivatives of basis functions"
}]->(bf)

// Connect QuadratureRule with CollocationPoint
MATCH (qr:MathematicalConcept {name: "QuadratureRule"})
MATCH (cp:MathematicalConcept {name: "CollocationPoint"})
CREATE (qr)-[:RELATED_TO {
  role: "Point selection relationship",
  description: "Quadrature points often used as collocation points"
}]->(cp)

// Connect multi-level method concepts
MATCH (mloc:MathematicalConcept {name: "MultiLevelOrthogonalCollocation"})
MATCH (ee:MathematicalConcept {name: "ErrorEstimation"})
MATCH (ar:MathematicalConcept {name: "AdaptiveRefinement"})
CREATE (mloc)-[:UTILIZES {
  role: "Refinement guidance",
  description: "Uses error estimation to guide adaptive process"
}]->(ee)
CREATE (mloc)-[:IMPLEMENTS {
  role: "Core capability",
  description: "Provides systematic approach to multi-level refinement"
}]->(ar)

// Connect KitchenSink with foundational concepts
MATCH (ks:Implementation {name: "KitchenSinkSolver"})
MATCH (sc:MathematicalConcept {name: "SpectralConvergence"})
MATCH (dm:MathematicalConcept {name: "DifferentiationMatrix"})
MATCH (qr:MathematicalConcept {name: "QuadratureRule"})
CREATE (ks)-[:LEVERAGES {
  role: "Performance property",
  description: "Achieves high performance through spectral convergence"
}]->(sc)
CREATE (ks)-[:UTILIZES {
  role: "Discretization mechanism",
  description: "Uses differentiation matrices for spatial discretization"
}]->(dm)
CREATE (ks)-[:UTILIZES {
  role: "Integration mechanism",
  description: "Uses quadrature rules for integral evaluations"
}]->(qr)
