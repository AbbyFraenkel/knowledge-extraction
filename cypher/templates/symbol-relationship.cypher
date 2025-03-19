// Symbol Relationship Template
// Use this template to create relationships between symbol nodes in the knowledge graph
// Replace all placeholders with appropriate values

// ------------------------------
// APPEARS_IN RELATIONSHIP
// ------------------------------
// Connect a symbol to the paper where it appears

MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (paper:Paper {id: "[PAPER_ID]"})
CREATE (sym)-[:APPEARS_IN {
  section: "[SECTION_REFERENCE]",  // E.g., "Section 3.2", "Equation 7"
  firstAppearance: "[PAGE_OR_EQUATION_NUMBER]",  // E.g., "p. 5", "Eq. 3.7"
  role: "[SYMBOL_ROLE]"  // E.g., "Parameter", "Variable", "Operator", "Function"
}]->(paper)

// ------------------------------
// REPRESENTS RELATIONSHIP
// ------------------------------
// Connect a symbol to the mathematical concept it represents

MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (sym)-[:REPRESENTS {
  context: "[REPRESENTATION_CONTEXT]",  // E.g., "In the context of spectral approximation"
  significance: "[SIGNIFICANCE]"  // E.g., "Primary parameter", "Key variable"
}]->(concept)

// ------------------------------
// HAS_INTERPRETATION_IN RELATIONSHIP
// ------------------------------
// Connect a symbol to its domain-specific interpretation

MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "[DOMAIN_SPECIFIC_MEANING]",  // E.g., "Thermal diffusivity in heat transfer"
  standardUsage: "[STANDARD_USAGE_IN_DOMAIN]",  // E.g., "Commonly used for thermal diffusivity"
  units: "[DOMAIN_SPECIFIC_UNITS]"  // E.g., "m²/s in SI units"
}]->(domain)

// ------------------------------
// SYNONYM_OF RELATIONSHIP
// ------------------------------
// Connect symbols that represent the same concept with different notation

MATCH (sym1:Symbol {name: "[SYMBOL_1_NAME]", context: "[CONTEXT_1]"})
MATCH (sym2:Symbol {name: "[SYMBOL_2_NAME]", context: "[CONTEXT_2]"})
CREATE (sym1)-[:SYNONYM_OF {
  equivalenceContext: "[WHEN_EQUIVALENT]",  // E.g., "Equivalent in spectral approximation"
  equivalenceSource: "[SOURCE_OF_EQUIVALENCE]",  // E.g., "Defined in Smith et al. (2022)"
  preferenceOrder: [PREFERENCE_RANKING]  // E.g., 1 for preferred, 2 for secondary
}]->(sym2)

// ------------------------------
// CONFLICTS_WITH RELATIONSHIP
// ------------------------------
// Connect symbols that have the same notation but different meanings

MATCH (sym1:Symbol {name: "[SYMBOL_NAME]", context: "[CONTEXT_1]"})
MATCH (sym2:Symbol {name: "[SYMBOL_NAME]", context: "[CONTEXT_2]"})
CREATE (sym1)-[:CONFLICTS_WITH {
  resolutionStrategy: "[RESOLUTION_APPROACH]",  // E.g., "Context-dependent interpretation"
  canonicalChoice: "[PREFERRED_SYMBOL]",  // E.g., "Use λ for eigenvalues, λ_w for wavelength"
  resolutionNotes: "[RESOLUTION_JUSTIFICATION]"  // E.g., "Based on convention in applied math"
}]->(sym2)

// ------------------------------
// DERIVED_FROM RELATIONSHIP
// ------------------------------
// Connect symbols that are derived from or related to other symbols

MATCH (sym1:Symbol {name: "[DERIVED_SYMBOL_NAME]", context: "[DERIVED_CONTEXT]"})
MATCH (sym2:Symbol {name: "[BASE_SYMBOL_NAME]", context: "[BASE_CONTEXT]"})
CREATE (sym1)-[:DERIVED_FROM {
  derivationMethod: "[HOW_DERIVED]",  // E.g., "Transformation", "Normalization", "Extension"
  equation: "[DERIVATION_EQUATION]",  // E.g., "β = 2*α"
  derivationContext: "[DERIVATION_CONTEXT]"  // E.g., "In the context of convergence analysis"
}]->(sym2)

// ------------------------------
// USED_IN_EQUATION RELATIONSHIP
// ------------------------------
// Connect a symbol to the equations where it appears

MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (eq:Equation {id: "[EQUATION_ID]"})
CREATE (sym)-[:USED_IN_EQUATION {
  role: "[ROLE_IN_EQUATION]",  // E.g., "Parameter", "Variable", "Coefficient"
  significance: "[SIGNIFICANCE]"  // E.g., "Central to equation", "Boundary condition"
}]->(eq)

// ------------------------------
// EXAMPLE USAGE
// ------------------------------

// Example 1: Connecting a symbol to a paper and concept
/*
MATCH (sigma:Symbol {name: "σ", context: "Spectral approximation"})
MATCH (paper:Paper {id: "Smith2022"})
MATCH (concept:MathematicalConcept {name: "Spectral Approximation"})

CREATE (sigma)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7",
  role: "Parameter"
}]->(paper)

CREATE (sigma)-[:REPRESENTS {
  context: "In the context of coefficient decay rates",
  significance: "Primary convergence parameter"
}]->(concept)
*/

// Example 2: Creating a conflict relationship
/*
// First symbol: C as constant
MATCH (c1:Symbol {name: "C", context: "Error analysis"})
// Second symbol: C as function space
MATCH (c2:Symbol {name: "C", context: "Function spaces"})

CREATE (c1)-[:CONFLICTS_WITH {
  resolutionStrategy: "Context-dependent interpretation",
  canonicalChoice: "C for constants, 𝓒 for function spaces in cross-domain references",
  resolutionNotes: "Following standard convention in mathematics"
}]->(c2)
*/

// Example 3: Creating a domain interpretation relationship
/*
MATCH (alpha:Symbol {name: "α", context: "Heat equation"})
MATCH (domain:ApplicationDomain {name: "Thermal Engineering"})

CREATE (alpha)-[:HAS_INTERPRETATION_IN {
  meaning: "Thermal diffusivity",
  standardUsage: "Material property in heat transfer calculations",
  units: "m²/s in SI units"
}]->(domain)
*/
