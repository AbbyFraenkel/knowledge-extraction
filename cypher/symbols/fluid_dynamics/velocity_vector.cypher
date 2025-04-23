// Velocity Vector Symbol Node
CREATE (vel:Symbol {
  name: "v",
  context: "Fluid dynamics",
  latex: "\\vec{v}",
  meaning: "Fluid velocity vector",
  
  // Optional properties
  dimensionality: "Vector",
  units: "m/s",
  constraints: "Physical velocity",
  paperSources: ["Various"],
  mathematicalDomain: "Fluid Mechanics",
  computationalRole: "Primary variable in fluid simulations"
})

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "VelocityField"})
CREATE (vel)-[:REPRESENTS {
  context: "In fluid dynamics"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "ComputationalFluidDynamics"})
CREATE (vel)-[:HAS_INTERPRETATION_IN {
  meaning: "Fluid flow velocity field",
  standardUsage: "Primary variable in Navier-Stokes equations",
  units: "m/s"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (vel:Symbol {name: "v", context: "Fluid dynamics"})
SET vel.implementationNote = "Implemented as velocity_field in FluidSimulation type"
