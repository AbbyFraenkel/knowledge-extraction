// REPRESENTS Relationship Template
// Use this template to create REPRESENTS relationships between Symbol nodes and MathematicalConcept nodes
// Replace all placeholders with appropriate values

// Basic REPRESENTS Relationship Creation
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[SYMBOL_CONTEXT]"})
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (sym)-[:REPRESENTS {
  context: "[REPRESENTATION_CONTEXT]",  // E.g., "In the context of spectral approximation"
  
  // Optional properties - include all that apply
  qualifiers: ["[QUALIFIER_1]", "[QUALIFIER_2]"],  // Qualifications about the representation
  precision: "[PRECISION_LEVEL]",  // E.g., "Exact", "Approximate", "Analogous"
  notes: "[REPRESENTATION_NOTES]",  // Additional notes about this representation
  sourceSection: "[SOURCE_SECTION]"  // Section in paper where this representation is established
}]->(concept);

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Symbol representing core mathematical concept
/*
MATCH (alpha:Symbol {name: "α", context: "Heat transfer"})
MATCH (thermal:MathematicalConcept {name: "ThermalDiffusivity"})
CREATE (alpha)-[:REPRESENTS {
  context: "In heat conduction equations",
  precision: "Exact",
  notes: "Standard notation in thermal physics",
  sourceSection: "Section 2.1, Eq. 3"
}]->(thermal)
*/

// Example 2: Symbol with qualified representation
/*
MATCH (epsilon:Symbol {name: "ε", context: "Numerical analysis"})
MATCH (error:MathematicalConcept {name: "TruncationError"})
CREATE (epsilon)-[:REPRESENTS {
  context: "In spectral method error analysis",
  qualifiers: ["Asymptotic behavior", "Upper bound"],
  precision: "Approximate",
  notes: "Used in the sense of order of magnitude",
  sourceSection: "Section 4.3, Theorem 2"
}]->(error)
*/
