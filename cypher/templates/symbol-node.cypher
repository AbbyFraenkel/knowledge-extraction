// Symbol Node Template
// Use this template to create symbol nodes in the knowledge graph
// Replace all placeholders with appropriate values

// Basic Symbol Node Creation
CREATE (sym:Symbol {
  name: "[SYMBOL_NAME]",  // The symbol name (e.g., "alpha", "sigma", "nabla")
  context: "[USAGE_CONTEXT]",  // The specific context in which this symbol is used
  latex: "[LATEX_REPRESENTATION]",  // LaTeX code for the symbol (e.g., "\\alpha", "\\sigma", "\\nabla")
  meaning: "[PRECISE_MEANING]",  // Exact meaning in this context
  
  // Optional properties - include all that apply
  alternativeNotations: ["[NOTATION_1]", "[NOTATION_2]"],  // Alternative symbols for the same concept
  dimensionality: "[DIMENSIONALITY]",  // E.g., "Scalar", "Vector", "Tensor", "Matrix"
  units: "[PHYSICAL_UNITS]",  // E.g., "m²/s", "kg/m³", "Dimensionless"
  constraints: "[VALUE_CONSTRAINTS]",  // E.g., "Positive real number", "Integer in [1,N]"
  paperSources: ["[PAPER_REF]"]  // References to papers using this symbol
})

// Connect Symbol to Paper
MATCH (paper:Paper {id: "[PAPER_ID]"})
CREATE (sym)-[:APPEARS_IN {
  section: "[SECTION_REFERENCE]",  // E.g., "Section 3.2", "Equation 7"
  firstAppearance: "[PAGE_OR_EQUATION_NUMBER]",  // E.g., "p. 5", "Eq. 3.7"
  role: "[SYMBOL_ROLE]"  // E.g., "Parameter", "Variable", "Operator", "Function"
}]->(paper)

// Connect to Mathematical Concept (if applicable)
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (sym)-[:REPRESENTS {
  context: "[REPRESENTATION_CONTEXT]"  // E.g., "In the context of spectral approximation"
}]->(concept)

// Connect to Domain-Specific Interpretation (if applicable)
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "[DOMAIN_SPECIFIC_MEANING]",  // E.g., "Thermal diffusivity in heat transfer"
  standardUsage: "[STANDARD_USAGE_IN_DOMAIN]",  // E.g., "Commonly used for thermal diffusivity"
  units: "[DOMAIN_SPECIFIC_UNITS]"  // E.g., "m²/s in SI units"
}]->(domain)

// Create Synonym Relationship (if applicable)
MATCH (otherSym:Symbol {name: "[OTHER_SYMBOL]", context: "[OTHER_CONTEXT]"})
CREATE (sym)-[:SYNONYM_OF {
  equivalenceContext: "[WHEN_EQUIVALENT]",  // E.g., "Equivalent in spectral approximation"
  equivalenceSource: "[SOURCE_OF_EQUIVALENCE]"  // E.g., "Defined in Smith et al. (2022)"
}]->(otherSym)

// Create Conflict Relationship (if applicable)
MATCH (conflictSym:Symbol {name: "[CONFLICT_SYMBOL]", context: "[CONFLICT_CONTEXT]"})
CREATE (sym)-[:CONFLICTS_WITH {
  resolutionStrategy: "[RESOLUTION_APPROACH]",  // E.g., "Context-dependent interpretation"
  canonicalChoice: "[PREFERRED_SYMBOL]",  // E.g., "Use σ in spectral methods, α in thermal analysis"
  resolutionNotes: "[RESOLUTION_JUSTIFICATION]"  // E.g., "Based on domain convention standards"
}]->(conflictSym)

// ------------------------------
// EXAMPLE USAGE
// ------------------------------

// Example 1: Creating a basic symbol entity for decay rate parameter
/*
CREATE (sigma:Symbol {
  name: "σ",
  context: "Spectral approximation",
  latex: "\\sigma",
  meaning: "Decay rate parameter",
  dimensionality: "Scalar",
  constraints: "Positive real number",
  paperSources: ["Smith2022"]
})

MATCH (paper:Paper {id: "Smith2022"})
CREATE (sigma)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7",
  role: "Parameter"
}]->(paper)
*/

// Example 2: Creating a vector symbol with domain interpretation
/*
CREATE (velocityVector:Symbol {
  name: "v",
  context: "Fluid dynamics",
  latex: "\\vec{v}",
  meaning: "Velocity vector",
  dimensionality: "Vector",
  units: "m/s",
  paperSources: ["Johnson2023"]
})

MATCH (paper:Paper {id: "Johnson2023"})
CREATE (velocityVector)-[:APPEARS_IN {
  section: "Section 2.1",
  firstAppearance: "Equation 3",
  role: "Variable"
}]->(paper)

MATCH (domain:ApplicationDomain {name: "Fluid Mechanics"})
CREATE (velocityVector)-[:HAS_INTERPRETATION_IN {
  meaning: "Fluid flow velocity",
  standardUsage: "Primary variable in Navier-Stokes equations",
  units: "m/s in SI units"
}]->(domain)
*/

// Example 3: Handling symbol conflict
/*
// First symbol: λ as eigenvalue
CREATE (lambda1:Symbol {
  name: "λ",
  context: "Linear algebra",
  latex: "\\lambda",
  meaning: "Eigenvalue",
  dimensionality: "Scalar",
  paperSources: ["Smith2022"]
})

// Second symbol: λ as wavelength
CREATE (lambda2:Symbol {
  name: "λ",
  context: "Wave mechanics",
  latex: "\\lambda",
  meaning: "Wavelength",
  dimensionality: "Scalar",
  units: "m",
  paperSources: ["Johnson2023"]
})

// Create conflict relationship
CREATE (lambda1)-[:CONFLICTS_WITH {
  resolutionStrategy: "Context-dependent interpretation",
  canonicalChoice: "λ for eigenvalues, λ_w for wavelength in cross-domain references",
  resolutionNotes: "Following standard convention in applied mathematics"
}]->(lambda2)
*/
