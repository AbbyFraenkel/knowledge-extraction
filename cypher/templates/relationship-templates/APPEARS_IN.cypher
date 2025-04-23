// APPEARS_IN Relationship Template
// Use this template to create APPEARS_IN relationships between Symbol nodes and Paper nodes
// Replace all placeholders with appropriate values

// Basic APPEARS_IN Relationship Creation
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[SYMBOL_CONTEXT]"})
MATCH (paper:Paper {id: "[PAPER_ID]"})
CREATE (sym)-[:APPEARS_IN {
  section: "[SECTION_REFERENCE]",  // E.g., "Section 3.2", "Equation 7"
  firstAppearance: "[PAGE_OR_EQUATION_NUMBER]",  // E.g., "p. 5", "Eq. 3.7"
  role: "[SYMBOL_ROLE]",  // E.g., "Parameter", "Variable", "Operator", "Function"
  
  // Optional properties - include all that apply
  definitionText: "[ORIGINAL_DEFINITION]",  // Original text defining the symbol
  usageFrequency: "[USAGE_FREQUENCY]",  // E.g., "High", "Medium", "Low", or numeric count
  isExplicitlyDefined: [BOOLEAN],  // true if explicitly defined, false if implicitly used
  appearances: ["[LOCATION_1]", "[LOCATION_2]"],  // List of key appearances beyond first
  importanceLevel: "[IMPORTANCE]"  // E.g., "Central", "Supporting", "Peripheral"
}]->(paper);

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Central symbol with explicit definition
/*
MATCH (sigma:Symbol {name: "σ", context: "Spectral approximation"})
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sigma)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7",
  role: "Parameter",
  definitionText: "where σ represents the decay rate parameter that controls...",
  usageFrequency: "High",
  isExplicitlyDefined: true,
  appearances: ["Eq. 7", "Eq. 12", "Eq. 15", "Table 2", "Figure 3"],
  importanceLevel: "Central"
}]->(paper)
*/

// Example 2: Supporting symbol with implicit usage
/*
MATCH (delta:Symbol {name: "δ", context: "Discretization"})
MATCH (paper:Paper {id: "Johnson2023"})
CREATE (delta)-[:APPEARS_IN {
  section: "Section 4.1",
  firstAppearance: "p. 8",
  role: "Operator",
  usageFrequency: "Medium",
  isExplicitlyDefined: false,
  importanceLevel: "Supporting"
}]->(paper)
*/
