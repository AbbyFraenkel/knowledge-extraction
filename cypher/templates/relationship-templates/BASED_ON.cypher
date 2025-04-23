// BASED_ON Relationship Template
// Use this template to create BASED_ON relationships in the knowledge graph
//
// Purpose: Represents derivation relationships between concepts, methods, or algorithms
// where one entity is derived from or founded upon another.
//
// Replace all placeholders with appropriate values

// Basic BASED_ON Relationship Creation
MATCH (derived:[DERIVED_ENTITY_TYPE] {name: "[DERIVED_ENTITY_NAME]"})
MATCH (base:[BASE_ENTITY_TYPE] {name: "[BASE_ENTITY_NAME]"})
CREATE (derived)-[:BASED_ON {
  derivationMethod: "[DERIVATION_METHOD]",  // How the concept is derived (e.g., "Extension", "Specialization", "Reformulation")
  keyModifications: ["[MODIFICATION_1]", "[MODIFICATION_2]"],  // List of key modifications or additions
  referenceSection: "[REFERENCE_SECTION]",  // Section/page in paper where derivation is described
  extentOfDerivation: "[EXTENT]",  // "Complete", "Partial", "Inspiration"
  
  // Optional properties - include all that apply
  derivationConstraints: "[CONSTRAINTS]",  // Any constraints on the derivation
  derivationJustification: "[JUSTIFICATION]",  // Academic justification for the derivation
  historicalContext: "[HISTORICAL_CONTEXT]",  // Historical context of the derivation
  paperSources: ["[PAPER_REF]"]  // References to papers describing the derivation
}]->(base)

// ------------------------------
// ENTITY TYPE-SPECIFIC PATTERNS
// ------------------------------

// Method derived from another Method
/*
MATCH (newMethod:NumericalMethod {name: "[NEW_METHOD]"})
MATCH (originalMethod:NumericalMethod {name: "[ORIGINAL_METHOD]"})
CREATE (newMethod)-[:BASED_ON {
  derivationMethod: "Extension",
  keyModifications: ["Improved stability", "Higher-order accuracy"],
  referenceSection: "Section 4.2",
  extentOfDerivation: "Partial",
  derivationConstraints: "Maintains core algorithm structure"
}]->(originalMethod)
*/

// Algorithm derived from Mathematical Concept
/*
MATCH (algorithm:Algorithm {name: "[ALGORITHM_NAME]"})
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (algorithm)-[:BASED_ON {
  derivationMethod: "Computational realization",
  keyModifications: ["Discretization approach", "Convergence guarantees"],
  referenceSection: "Section 3.1",
  extentOfDerivation: "Complete"
}]->(concept)
*/

// Implementation derived from Algorithm
/*
MATCH (implementation:Implementation {name: "[IMPLEMENTATION_NAME]"})
MATCH (algorithm:Algorithm {name: "[ALGORITHM_NAME]"})
CREATE (implementation)-[:BASED_ON {
  derivationMethod: "Code implementation",
  keyModifications: ["Optimized for sparse matrices", "Parallel execution support"],
  referenceSection: "Section 5.3",
  extentOfDerivation: "Complete",
  derivationConstraints: "Maintains algorithm guarantees"
}]->(algorithm)
*/

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Spectral Element Method based on Finite Element Method
/*
MATCH (sem:NumericalMethod {name: "SpectralElementMethod"})
MATCH (fem:NumericalMethod {name: "FiniteElementMethod"})
CREATE (sem)-[:BASED_ON {
  derivationMethod: "Hybridization",
  keyModifications: ["Uses high-order polynomials within elements", "Spectral convergence properties"],
  referenceSection: "Section 2.3",
  extentOfDerivation: "Partial",
  derivationJustification: "Combines local flexibility of FEM with high accuracy of spectral methods",
  paperSources: ["Patera1984", "Maday1989"]
}]->(fem)
*/

// Example 2: Multi-Level Orthogonal Collocation based on Orthogonal Collocation
/*
MATCH (mloc:NumericalMethod {name: "MultiLevelOrthogonalCollocation"})
MATCH (oc:NumericalMethod {name: "OrthogonalCollocation"})
CREATE (mloc)-[:BASED_ON {
  derivationMethod: "Extension",
  keyModifications: ["Multiple resolution levels", "Adaptive refinement strategy", "Error estimation between levels"],
  referenceSection: "Section 3.2",
  extentOfDerivation: "Complete",
  derivationConstraints: "Preserves spectral convergence of base method",
  paperSources: ["AuthorYear"]
}]->(oc)
*/

// Example 3: KitchenSink Implementation based on Theory
/*
MATCH (implementation:Implementation {name: "KitchenSinkSolver"})
MATCH (theory:MathematicalConcept {name: "MultiLevelCollocationTheory"})
CREATE (implementation)-[:BASED_ON {
  derivationMethod: "Software implementation",
  keyModifications: ["Julia type system utilization", "SciML ecosystem integration", "Adaptive error control"],
  referenceSection: "Section 4.5",
  extentOfDerivation: "Complete",
  derivationConstraints: "Maintains theoretical guarantees while optimizing performance",
  paperSources: ["AuthorYear"]
}]->(theory)
*/
