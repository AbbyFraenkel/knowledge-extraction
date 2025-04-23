// Symbol Relationships Template
// Use this template to create relationships between Symbol entities and other entities
// in the knowledge graph. Replace all placeholders with appropriate values.

// -------------------------------------------------------------------------
// 1. RELATIONSHIPS BETWEEN SYMBOLS AND PAPERS
// -------------------------------------------------------------------------

// APPEARS_IN: Symbol appears in a specific paper
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (paper:Paper {id: "[PAPER_ID]"})
CREATE (sym)-[:APPEARS_IN {
  section: "[SECTION_REFERENCE]",  // E.g., "Section 3.2", "Equation 7"
  firstAppearance: "[PAGE_OR_EQUATION_NUMBER]",  // E.g., "p. 5", "Eq. 3.7"
  role: "[SYMBOL_ROLE]",  // E.g., "Parameter", "Variable", "Operator", "Function"
  notationVariant: "[NOTATION_VARIANT]"  // Optional: If notation differs from standard
}]->(paper)

// -------------------------------------------------------------------------
// 2. RELATIONSHIPS BETWEEN SYMBOLS AND MATHEMATICAL CONCEPTS
// -------------------------------------------------------------------------

// REPRESENTS: Symbol represents a mathematical concept
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (sym)-[:REPRESENTS {
  context: "[REPRESENTATION_CONTEXT]",  // E.g., "In the context of spectral approximation"
  isStandardNotation: [BOOLEAN],  // true/false
  alternativeRepresentations: ["[ALT_SYMBOL_1]", "[ALT_SYMBOL_2]"]  // Optional
}]->(concept)

// QUANTIFIES: Symbol quantifies a mathematical property
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (sym)-[:QUANTIFIES {
  aspect: "[ASPECT_QUANTIFIED]",  // E.g., "Convergence rate", "Error bound"
  relationship: "[QUANTIFICATION_RELATIONSHIP]",  // E.g., "Proportional to", "Inverse relationship"
  formula: "[MATHEMATICAL_FORMULA]"  // Optional: Formula showing relationship
}]->(concept)

// -------------------------------------------------------------------------
// 3. RELATIONSHIPS BETWEEN SYMBOLS AND APPLICATION DOMAINS
// -------------------------------------------------------------------------

// HAS_INTERPRETATION_IN: Symbol has specific interpretation in a domain
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "[DOMAIN_SPECIFIC_MEANING]",  // E.g., "Thermal diffusivity in heat transfer"
  standardUsage: "[STANDARD_USAGE_IN_DOMAIN]",  // E.g., "Commonly used for thermal diffusivity"
  units: "[DOMAIN_SPECIFIC_UNITS]",  // E.g., "m²/s in SI units"
  equivalentParameters: ["[RELATED_PARAMETER_1]", "[RELATED_PARAMETER_2]"]  // Optional
}]->(domain)

// PARAMETERIZES: Symbol serves as a parameter in a specific model or application
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (model:ApplicationDomain {name: "[MODEL_NAME]"})
CREATE (sym)-[:PARAMETERIZES {
  role: "[PARAMETER_ROLE]",  // E.g., "Control parameter", "Material property"
  validRange: "[VALID_RANGE]",  // E.g., "(0, 1)", "Positive real numbers"
  typicalValues: "[TYPICAL_VALUES]",  // E.g., "0.01-0.1 for most materials"
  sensitivityLevel: "[SENSITIVITY]"  // E.g., "High", "Low", "Moderate"
}]->(model)

// -------------------------------------------------------------------------
// 4. RELATIONSHIPS BETWEEN SYMBOLS
// -------------------------------------------------------------------------

// CONFLICTS_WITH: Symbol has conflicting meaning with another symbol
MATCH (sym1:Symbol {name: "[SYMBOL1_NAME]", context: "[CONTEXT1]"})
MATCH (sym2:Symbol {name: "[SYMBOL2_NAME]", context: "[CONTEXT2]"})
CREATE (sym1)-[:CONFLICTS_WITH {
  conflictType: "[CONFLICT_TYPE]",  // E.g., "Same symbol different meaning", "Convention conflict"
  resolutionStrategy: "[RESOLUTION_APPROACH]",  // E.g., "Context-dependent interpretation"
  canonicalChoice: "[PREFERRED_SYMBOL]",  // E.g., "Use σ in spectral methods, α in thermal analysis"
  resolutionNotes: "[RESOLUTION_JUSTIFICATION]"  // E.g., "Based on domain convention standards"
}]->(sym2)

// SYNONYM_OF: Symbol is alternative notation for another symbol
MATCH (sym1:Symbol {name: "[SYMBOL1_NAME]", context: "[CONTEXT1]"})
MATCH (sym2:Symbol {name: "[SYMBOL2_NAME]", context: "[CONTEXT2]"})
CREATE (sym1)-[:SYNONYM_OF {
  equivalenceContext: "[WHEN_EQUIVALENT]",  // E.g., "Equivalent in spectral approximation"
  equivalenceSource: "[SOURCE_OF_EQUIVALENCE]",  // E.g., "Defined in Smith et al. (2022)"
  preferredNotation: "[PREFERRED_NOTATION]"  // Optional: Which notation is preferred when
}]->(sym2)

// DERIVED_FROM: Symbol is mathematically derived from another symbol
MATCH (sym1:Symbol {name: "[DERIVED_SYMBOL]", context: "[DERIVED_CONTEXT]"})
MATCH (sym2:Symbol {name: "[SOURCE_SYMBOL]", context: "[SOURCE_CONTEXT]"})
CREATE (sym1)-[:DERIVED_FROM {
  derivationFormula: "[FORMULA]",  // E.g., "β = α²/σ"
  derivationContext: "[CONTEXT]",  // E.g., "In convergence analysis"
  paperSource: "[SOURCE_REFERENCE]",  // E.g., "Smith et al. (2022), Eq. 12"
  derivationType: "[DERIVATION_TYPE]"  // E.g., "Direct calculation", "Definition", "Approximation"
}]->(sym2)

// RELATED_TO: General mathematical relationship between symbols
MATCH (sym1:Symbol {name: "[SYMBOL1_NAME]", context: "[CONTEXT1]"})
MATCH (sym2:Symbol {name: "[SYMBOL2_NAME]", context: "[CONTEXT2]"})
CREATE (sym1)-[:RELATED_TO {
  relationshipType: "[RELATIONSHIP_TYPE]",  // E.g., "Proportional", "Inverse", "Bound"
  formula: "[RELATIONSHIP_FORMULA]",  // E.g., "α ≤ C·β"
  relationshipContext: "[CONTEXT]",  // E.g., "In error analysis"
  source: "[SOURCE_REFERENCE]"  // E.g., "Smith et al. (2022), p. 43"
}]->(sym2)

// -------------------------------------------------------------------------
// 5. RELATIONSHIPS BETWEEN SYMBOLS AND EQUATIONS
// -------------------------------------------------------------------------

// USED_IN: Symbol is used in a specific equation
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (eq:Equation {id: "[EQUATION_ID]"})
CREATE (sym)-[:USED_IN {
  role: "[SYMBOL_ROLE]",  // E.g., "Variable", "Parameter", "Coefficient"
  occurrence: "[OCCURRENCE_COUNT]",  // E.g., "Multiple", "Single"
  interpretation: "[SYMBOL_INTERPRETATION]"  // E.g., "Rate of change", "Boundary value"
}]->(eq)

// DERIVED_IN: Symbol is derived or defined in an equation
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (eq:Equation {id: "[EQUATION_ID]"})
CREATE (sym)-[:DERIVED_IN {
  derivationType: "[DERIVATION_TYPE]",  // E.g., "Definition", "Theorem result", "Approximation"
  importance: "[IMPORTANCE_LEVEL]",  // E.g., "Critical", "Supporting", "Incidental"
  notes: "[ADDITIONAL_NOTES]"  // Optional: Any relevant details about the derivation
}]->(eq)

// -------------------------------------------------------------------------
// 6. RELATIONSHIPS SPECIFIC TO KITCHENSINK AND PASTEURIZATION
// -------------------------------------------------------------------------

// IMPLEMENTED_AS: Symbol has specific implementation in KitchenSink
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (impl:Implementation {name: "[IMPLEMENTATION_NAME]"})
CREATE (sym)-[:IMPLEMENTED_AS {
  codeVariable: "[VARIABLE_NAME]",  // E.g., "decay_rate", "alpha_thermal"
  dataType: "[JULIA_TYPE]",  // E.g., "Float64", "Vector{Float64}", "SparseMatrixCSC"
  defaultValue: "[DEFAULT_VALUE]",  // Optional: Default value in code
  validationRules: "[VALIDATION_RULES]"  // Optional: E.g., "must be positive", "must be in range (0,1)"
}]->(impl)

// HAS_PHYSICAL_INTERPRETATION: Symbol is linked to a physical quantity in pasteurization
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[USAGE_CONTEXT]"})
MATCH (phys:PhysicalQuantity {name: "[QUANTITY_NAME]"})
CREATE (sym)-[:HAS_PHYSICAL_INTERPRETATION {
  physicalMeaning: "[PHYSICAL_MEANING]",  // E.g., "Thermal diffusivity of beer"
  siUnits: "[SI_UNITS]",  // E.g., "m²/s"
  typicalRange: "[TYPICAL_VALUES]",  // E.g., "1.2e-7 to 1.5e-7 m²/s for beer at 20-80°C"
  measurementMethod: "[MEASUREMENT]"  // Optional: How this quantity is typically measured
}]->(phys)

// -------------------------------------------------------------------------
// EXAMPLE USAGE
// -------------------------------------------------------------------------

// Example 1: Creating a relationship between a symbol and paper
/*
MATCH (sigma:Symbol {name: "σ", context: "Spectral approximation"})
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sigma)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7",
  role: "Parameter"
}]->(paper)
*/

// Example 2: Connecting a symbol to a mathematical concept
/*
MATCH (sigma:Symbol {name: "σ", context: "Spectral approximation"})
MATCH (concept:MathematicalConcept {name: "Coefficient Decay Rate"})
CREATE (sigma)-[:REPRESENTS {
  context: "In spectral approximation theory",
  isStandardNotation: true,
  alternativeRepresentations: ["μ", "s"]
}]->(concept)
*/

// Example 3: Documenting a symbol conflict
/*
MATCH (lambda1:Symbol {name: "λ", context: "Linear algebra"})
MATCH (lambda2:Symbol {name: "λ", context: "Wave mechanics"})
CREATE (lambda1)-[:CONFLICTS_WITH {
  conflictType: "Same symbol different meaning",
  resolutionStrategy: "Context-dependent interpretation",
  canonicalChoice: "λ for eigenvalues, λ_w for wavelength in cross-domain references",
  resolutionNotes: "Following standard convention in applied mathematics"
}]->(lambda2)
*/

// Example 4: Creating a KitchenSink implementation relationship
/*
MATCH (alpha:Symbol {name: "α", context: "Heat equation"})
MATCH (impl:Implementation {name: "KitchenSink.ThermalDiffusion"})
CREATE (alpha)-[:IMPLEMENTED_AS {
  codeVariable: "thermal_diffusivity",
  dataType: "Float64",
  defaultValue: "1.0e-7",
  validationRules: "must be positive"
}]->(impl)
*/
