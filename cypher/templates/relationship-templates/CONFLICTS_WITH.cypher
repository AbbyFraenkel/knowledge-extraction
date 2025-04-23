// CONFLICTS_WITH Relationship Template
// Use this template to create CONFLICTS_WITH relationships between Symbol nodes that have conflicting meanings
// Replace all placeholders with appropriate values

// Basic CONFLICTS_WITH Relationship Creation
MATCH (sym1:Symbol {name: "[SYMBOL_NAME_1]", context: "[CONTEXT_1]"})
MATCH (sym2:Symbol {name: "[SYMBOL_NAME_2]", context: "[CONTEXT_2]"})
CREATE (sym1)-[:CONFLICTS_WITH {
  resolutionStrategy: "[RESOLUTION_APPROACH]",  // E.g., "Context-dependent interpretation", "Explicit qualification"
  canonicalChoice: "[PREFERRED_SYMBOL]",  // E.g., "Use σ in spectral methods, α in thermal analysis"
  resolutionNotes: "[RESOLUTION_JUSTIFICATION]",  // E.g., "Based on domain convention standards"
  
  // Optional properties - include all that apply
  conflictType: "[CONFLICT_TYPE]",  // E.g., "Same-paper conflict", "Cross-paper conflict", "Convention conflict"
  confusionRisk: "[RISK_LEVEL]",  // E.g., "High", "Medium", "Low"
  disambiguationTechnique: "[TECHNIQUE]",  // E.g., "Add subscripts", "Use different fonts", "Add explicit qualifiers"
  resolutionExamples: ["[EXAMPLE_1]", "[EXAMPLE_2]"],  // Examples of proper cross-referencing
  implementationMapping: "[IMPLEMENTATION_NOTE]"  // How this is handled in code implementation
}]->(sym2);

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Same-symbol with different meanings in different domains
/*
MATCH (lambda1:Symbol {name: "λ", context: "Linear algebra"})
MATCH (lambda2:Symbol {name: "λ", context: "Wave mechanics"})
CREATE (lambda1)-[:CONFLICTS_WITH {
  resolutionStrategy: "Context-dependent interpretation with explicit qualification",
  canonicalChoice: "λ for eigenvalues, λ_w for wavelength in cross-domain references",
  resolutionNotes: "Following standard convention in applied mathematics",
  conflictType: "Cross-domain conflict",
  confusionRisk: "Medium",
  disambiguationTechnique: "Add subscripts when both meanings appear in one context",
  resolutionExamples: [
    "The eigenvalues λ must be positive to ensure...",
    "The wavelength λ_w determines the spatial frequency..."
  ],
  implementationMapping: "eigen_vals for eigenvalues, wavelength for wavelengths in code"
}]->(lambda2)
*/

// Example 2: Same-symbol multiple meanings within one paper
/*
MATCH (h1:Symbol {name: "h", context: "Mesh parameter"})
MATCH (h2:Symbol {name: "h", context: "Heat transfer coefficient"})
CREATE (h1)-[:CONFLICTS_WITH {
  resolutionStrategy: "Explicit qualification in all references",
  canonicalChoice: "h_mesh for mesh size and h_conv for heat transfer coefficient",
  resolutionNotes: "Both symbols appear in coupled thermal analysis sections",
  conflictType: "Same-paper conflict",
  confusionRisk: "High",
  disambiguationTechnique: "Always use qualified form (subscripts) in all equations and text",
  resolutionExamples: [
    "As the mesh size h_mesh decreases, the solution accuracy increases...",
    "The convective heat transfer coefficient h_conv determines the rate of..."
  ],
  implementationMapping: "mesh_size and heat_transfer_coef in implementation"
}]->(h2)
*/
