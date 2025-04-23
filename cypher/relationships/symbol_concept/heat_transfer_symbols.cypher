// Heat Transfer Symbol-Concept Relationships

// Connect thermal diffusivity symbol to concept
MATCH (alpha:Symbol {name: "α", context: "Heat transfer equation"})
MATCH (td:MathematicalConcept {name: "ThermalDiffusivity"})
CREATE (alpha)-[:REPRESENTS {
  context: "In heat conduction problems"
}]->(td)

// Connect temperature symbol to concept
MATCH (temp:Symbol {name: "T", context: "Heat transfer equation"})
MATCH (temp_concept:MathematicalConcept {name: "Temperature"})
CREATE (temp)-[:REPRESENTS {
  context: "In heat transfer problems"
}]->(temp_concept)

// Connect these concepts to heat transfer
MATCH (td:MathematicalConcept {name: "ThermalDiffusivity"})
MATCH (temp_concept:MathematicalConcept {name: "Temperature"})
MATCH (ht:ApplicationDomain {name: "HeatTransfer"})
CREATE (td)-[:PARAMETER_OF {
  role: "Material property",
  description: "Characterizes heat diffusion rate in materials"
}]->(ht)
CREATE (temp_concept)-[:VARIABLE_OF {
  role: "Primary variable",
  description: "The dependent variable in heat transfer problems"
}]->(ht)
