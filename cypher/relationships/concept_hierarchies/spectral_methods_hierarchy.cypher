// Spectral Methods Concept Hierarchy Relationships

// Connect Multi-Level Orthogonal Collocation with parent concepts
MATCH (mloc:MathematicalConcept {name: "MultiLevelOrthogonalCollocation"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (ml:MathematicalConcept {name: "MultiLevelMethod"})
CREATE (mloc)-[:SPECIALIZES {
  nature: "Specializes by combining multi-level structure with orthogonal collocation",
  constraints: ["Requires proper inter-level communication", "Needs error estimation between levels"]
}]->(oc)
CREATE (mloc)-[:SPECIALIZES {
  nature: "Specializes by using orthogonal polynomials as basis functions",
  constraints: ["Maintains spectral accuracy properties", "Follows collocation discretization approach"]
}]->(ml)

// Connect Orthogonal Collocation on Finite Cells with parent concepts
MATCH (ocfc:MathematicalConcept {name: "OrthogonalCollocationOnFiniteCells"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (fdm:MathematicalConcept {name: "FictitiousDomainMethod"})
CREATE (ocfc)-[:SPECIALIZES {
  nature: "Specializes by applying orthogonal collocation on potentially non-conforming domains",
  constraints: ["Requires appropriate boundary condition enforcement", "Needs quadrature for cut cells"]
}]->(oc)
CREATE (ocfc)-[:SPECIALIZES {
  nature: "Specializes by using spectral basis functions in fictitious domain approach",
  constraints: ["Maintains high-order accuracy", "Requires special treatment at embedded boundaries"]
}]->(fdm)

// Connect KitchenSink concepts
MATCH (ks:Implementation {name: "KitchenSinkSolver"})
MATCH (mloc:MathematicalConcept {name: "MultiLevelOrthogonalCollocation"})
MATCH (ocfc:MathematicalConcept {name: "OrthogonalCollocationOnFiniteCells"})
CREATE (ks)-[:IMPLEMENTS {
  completeness: "Full",
  adaptations: ["Julia-specific optimizations", "Type-system implementation"]
}]->(mloc)
CREATE (ks)-[:IMPLEMENTS {
  completeness: "Full", 
  adaptations: ["Adaptive refinement extensions", "Complex geometry handling"]
}]->(ocfc)
