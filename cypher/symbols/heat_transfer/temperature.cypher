// Temperature Symbol Node
CREATE (temp:Symbol {
  name: "T",
  context: "Heat transfer equation",
  latex: "T",
  meaning: "Temperature field",
  
  // Optional properties
  dimensionality: "Scalar field",
  units: "K or °C",
  constraints: "Physical temperature range",
  paperSources: ["Crank1975", "Incropera2006"],
  mathematicalDomain: "Heat Transfer",
  computationalRole: "Primary variable"
})

// Connect Symbol to Papers
MATCH (paper:Paper {id: "Incropera2006"})
CREATE (temp)-[:APPEARS_IN {
  section: "Chapter 2",
  firstAppearance: "Equation 2.1",
  role: "Variable"
}]->(paper)

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "Temperature"})
CREATE (temp)-[:REPRESENTS {
  context: "In heat conduction problems"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "TunnelPasteurization"})
CREATE (temp)-[:HAS_INTERPRETATION_IN {
  meaning: "Product and container temperature distribution",
  standardUsage: "Primary quantity of interest for pasteurization process",
  units: "°C typically in food applications"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (temp:Symbol {name: "T", context: "Heat transfer equation"})
SET temp.implementationNote = "Implemented as temperature field in HeatTransferProblem type"
