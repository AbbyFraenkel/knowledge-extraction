// Differential Equations Concept Hierarchy Relationships

// Connect core differential equation concepts
MATCH (ode:MathematicalConcept {name: "OrdinaryDifferentialEquation"})
MATCH (pde:MathematicalConcept {name: "PartialDifferentialEquation"})
MATCH (dae:MathematicalConcept {name: "DifferentialAlgebraicEquation"})
MATCH (de:MathematicalConcept {name: "DifferentialEquation"})

CREATE (ode)-[:SPECIALIZES {
  nature: "Restricted to a single independent variable",
  constraints: ["Single independent variable", "Ordinary derivatives only"]
}]->(de)

CREATE (pde)-[:SPECIALIZES {
  nature: "Extended to multiple independent variables",
  constraints: ["Multiple independent variables", "Partial derivatives"]
}]->(de)

CREATE (dae)-[:SPECIALIZES {
  nature: "Combined with algebraic constraints",
  constraints: ["Differential and algebraic components", "Index characterization"]
}]->(de)

// Connect differential equations to numerical methods
MATCH (pde:MathematicalConcept {name: "PartialDifferentialEquation"})
MATCH (fdm:MathematicalConcept {name: "FiniteDifferenceMethod"})
MATCH (fem:MathematicalConcept {name: "FiniteElementMethod"})
MATCH (sm:MathematicalConcept {name: "SpectralMethod"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})

CREATE (fdm)-[:APPLIES_TO {
  context: "Numerical solution",
  description: "Approximates derivatives with difference quotients"
}]->(pde)

CREATE (fem)-[:APPLIES_TO {
  context: "Numerical solution",
  description: "Uses weak formulation with basis functions"
}]->(pde)

CREATE (sm)-[:APPLIES_TO {
  context: "Numerical solution",
  description: "Uses global basis functions with spectral convergence"
}]->(pde)

CREATE (oc)-[:SPECIALIZES {
  nature: "Specific collocation approach using orthogonal polynomials",
  constraints: ["Requires orthogonal polynomial basis", "Uses collocation points"]
}]->(sm)
