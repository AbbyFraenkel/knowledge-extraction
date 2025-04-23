// Thermal Diffusivity Symbol Node
CREATE (alpha:Symbol {
  name: "α",
  context: "Heat transfer equation",
  latex: "\\alpha",
  meaning: "Thermal diffusivity coefficient",
  
  // Optional properties
  dimensionality: "Scalar",
  units: "m²/s",
  constraints: "Positive real number",
  paperSources: ["Crank1975", "Incropera2006"],
  mathematicalDomain: "Heat Transfer",
  computationalRole: "Physical parameter"
})

// Connect Symbol to Papers
MATCH (paper:Paper {id: "Incropera2006"})
CREATE (alpha)-[:APPEARS_IN {
  section: "Chapter 2",
  firstAppearance: "Equation 2.15",
  role: "Parameter"
}]->(paper)

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "ThermalDiffusivity"})
CREATE (alpha)-[:REPRESENTS {
  context: "In heat conduction problems"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "TunnelPasteurization"})
CREATE (alpha)-[:HAS_INTERPRETATION_IN {
  meaning: "Thermal diffusivity of container material",
  standardUsage: "Key parameter determining heat penetration rate",
  units: "m²/s"
}]->(domain)

// Create Symbol Conflict
MATCH (alpha_spectral:Symbol {name: "α", context: "Spectral approximation"})
CREATE (alpha)-[:CONFLICTS_WITH {
  resolutionStrategy: "Context-dependent interpretation",
  canonicalChoice: "Use α for thermal diffusivity, α_spec for spectral parameter in cross-domain references",
  resolutionNotes: "Standard convention in applied mathematics"
}]->(alpha_spectral)

// KitchenSink-Specific Properties
MATCH (alpha:Symbol {name: "α", context: "Heat transfer equation"})
SET alpha.implementationNote = "Implemented as thermal_diffusivity in MaterialProperties type"
