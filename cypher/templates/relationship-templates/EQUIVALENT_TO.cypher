// EQUIVALENT_TO Relationship Template
// Use this template to create EQUIVALENT_TO relationships between Symbol nodes that represent the same concept
// Replace all placeholders with appropriate values

// Basic EQUIVALENT_TO Relationship Creation
MATCH (sym1:Symbol {name: "[SYMBOL_NAME_1]", context: "[CONTEXT_1]"})
MATCH (sym2:Symbol {name: "[SYMBOL_NAME_2]", context: "[CONTEXT_2]"})
CREATE (sym1)-[:EQUIVALENT_TO {
  equivalenceContext: "[WHEN_EQUIVALENT]",  // E.g., "Equivalent in spectral approximation"
  equivalenceSource: "[SOURCE_OF_EQUIVALENCE]",  // E.g., "Defined in Smith et al. (2022)"
  
  // Optional properties - include all that apply
  equivalenceType: "[EQUIVALENCE_TYPE]",  // E.g., "Mathematical equivalence", "Notational alternative", "Conceptual equivalence"
  conversionFormula: "[CONVERSION_FORMULA]",  // E.g., "α = k/(ρCp)" if applicable
  preferredUsage: "[USAGE_GUIDELINE]",  // E.g., "Prefer α in thermal context, k/(ρCp) in derivations"
  notationHistory: "[HISTORICAL_CONTEXT]",  // Historical development of the notation
  domainPreferences: ["[DOMAIN_1]:[PREFERENCE_1]", "[DOMAIN_2]:[PREFERENCE_2]"],  // Domain-specific preferences
  crossReferenceRule: "[CROSS_REFERENCE_RULE]"  // How to reference between notations
}]->(sym2);

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Alternative notations for the same concept
/*
MATCH (nabla:Symbol {name: "∇", context: "Vector calculus"})
MATCH (del:Symbol {name: "del", context: "Vector calculus"})
CREATE (nabla)-[:EQUIVALENT_TO {
  equivalenceContext: "Equivalent in all vector calculus contexts",
  equivalenceSource: "Standard mathematical notation",
  equivalenceType: "Notational alternative",
  preferredUsage: "∇ in equations, 'del' in text descriptions",
  notationHistory: "∇ introduced by Hamilton in 1853, 'del' is the verbal description",
  domainPreferences: ["Mathematics:∇", "Engineering texts:del", "Physics:∇"],
  crossReferenceRule: "Use ∇ in formal mathematical contexts, 'del' in verbal descriptions"
}]->(del)
*/

// Example 2: Same concept with different representations
/*
MATCH (alpha:Symbol {name: "α", context: "Heat transfer"})
MATCH (kRhoCp:Symbol {name: "k/(ρCp)", context: "Heat transfer"})
CREATE (alpha)-[:EQUIVALENT_TO {
  equivalenceContext: "Equivalent in heat conduction contexts",
  equivalenceSource: "Fundamental definition of thermal diffusivity",
  equivalenceType: "Mathematical equivalence",
  conversionFormula: "α = k/(ρCp)",
  preferredUsage: "α for concise equations, k/(ρCp) when emphasizing component properties",
  domainPreferences: ["Thermal engineering:α", "Materials science:k/(ρCp)"],
  crossReferenceRule: "Reference both forms on first usage, then use context-appropriate form"
}]->(kRhoCp)
*/
