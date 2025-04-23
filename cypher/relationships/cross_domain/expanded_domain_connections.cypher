// Expanded Cross-Domain Relationships

// Connect Numerical Methods to Applications
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (mloc:MathematicalConcept {name: "MultiLevelOrthogonalCollocation"})
MATCH (fdm:MathematicalConcept {name: "FictitiousDomainMethod"})
MATCH (cfd:ApplicationDomain {name: "ComputationalFluidDynamics"})
MATCH (cht:ApplicationDomain {name: "ConvectiveHeatTransfer"})
MATCH (ct:ApplicationDomain {name: "ConductiveHeatTransfer"})

CREATE (oc)-[:APPLIES_TO {
  relevance: "High-accuracy discretization",
  adaptations: ["Handling of complex flow features", "Spectral filtering for stability"]
}]->(cfd)

CREATE (mloc)-[:APPLIES_TO {
  relevance: "Adaptive high-accuracy method",
  adaptations: ["Local refinement for flow features", "Boundary layer resolution"]
}]->(cfd)

CREATE (fdm)-[:APPLIES_TO {
  relevance: "Complex geometry handling",
  adaptations: ["Non-body-fitted meshes", "Immersed boundary formulations"]
}]->(cfd)

CREATE (oc)-[:APPLIES_TO {
  relevance: "High-accuracy temperature gradients",
  adaptations: ["Resolution of thermal boundary layers", "Accurate flux computation"]
}]->(cht)

CREATE (mloc)-[:APPLIES_TO {
  relevance: "Adaptive temperature field resolution",
  adaptations: ["Local refinement near surfaces", "Efficient far-field representation"]
}]->(cht)

CREATE (oc)-[:APPLIES_TO {
  relevance: "Accurate conduction modeling",
  adaptations: ["Interface temperature gradients", "Material discontinuities"]
}]->(ct)

// Connect Heat Transfer Applications to each other
MATCH (ht:ApplicationDomain {name: "HeatTransfer"})
MATCH (cht:ApplicationDomain {name: "ConvectiveHeatTransfer"})
MATCH (ct:ApplicationDomain {name: "ConductiveHeatTransfer"})
MATCH (tp:ApplicationDomain {name: "TunnelPasteurization"})

CREATE (cht)-[:SPECIALIZES {
  nature: "Mode of heat transfer involving fluid motion",
  constraints: ["Requires fluid flow", "Coupled momentum and energy transfer"]
}]->(ht)

CREATE (ct)-[:SPECIALIZES {
  nature: "Mode of heat transfer through materials",
  constraints: ["No bulk motion", "Material property dependence"]
}]->(ht)

CREATE (tp)-[:UTILIZES {
  context: "Thermal processing",
  description: "Primary heat transfer mode through container walls"
}]->(ct)

CREATE (tp)-[:UTILIZES {
  context: "Thermal processing",
  description: "Heat transfer mode between container and surrounding medium"
}]->(cht)

// Connect Control Systems to Numerical Methods
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (co:MathematicalConcept {name: "ConstrainedOptimization"})
MATCH (mpc:ApplicationDomain {name: "ModelPredictiveControl"})

CREATE (oc)-[:ENABLES {
  context: "Prediction model discretization",
  description: "High-accuracy state prediction for control"
}]->(mpc)

CREATE (co)-[:ENABLES {
  context: "Constrained control formulation",
  description: "Core optimization formulation for MPC"
}]->(mpc)

// Connect Fluid-Structure Interaction to Domains
MATCH (cfd:ApplicationDomain {name: "ComputationalFluidDynamics"})
MATCH (fsi:ApplicationDomain {name: "FluidStructureInteraction"})

CREATE (fsi)-[:UTILIZES {
  context: "Fluid modeling component",
  description: "Models fluid behavior in coupled system"
}]->(cfd)

// Connect Cross-Domain Bridges to Domains
MATCH (smfd:CrossDomainBridge {name: "SpectralMethodsToFluidDynamics"})
MATCH (psmc:CrossDomainBridge {name: "PDESolverToMPC"})
MATCH (ats:CrossDomainBridge {name: "AlgorithmToTypeSystem"})
MATCH (mlmts:CrossDomainBridge {name: "MultiLevelMethodToTypeSystem"})

MATCH (sm:MathematicalConcept {name: "SpectralMethod"})
MATCH (cfd:ApplicationDomain {name: "ComputationalFluidDynamics"})
MATCH (pde:MathematicalConcept {name: "PartialDifferentialEquation"})
MATCH (mpc:ApplicationDomain {name: "ModelPredictiveControl"})
MATCH (mlm:MathematicalConcept {name: "MultiLevelMethod"})
MATCH (pt:Implementation {name: "ParametricTypes"})

CREATE (smfd)-[:CONNECTS {
  source_domain: "Numerical Methods",
  target_domain: "Computational Fluid Dynamics",
  description: "Applies spectral accuracy to flow problems"
}]->(sm)

CREATE (smfd)-[:CONNECTS {
  source_domain: "Numerical Methods",
  target_domain: "Computational Fluid Dynamics",
  description: "Enables spectral method application to flows"
}]->(cfd)

CREATE (psmc)-[:CONNECTS {
  source_domain: "PDE Solvers",
  target_domain: "Control Systems",
  description: "Enables PDE-based predictive control"
}]->(pde)

CREATE (psmc)-[:CONNECTS {
  source_domain: "PDE Solvers",
  target_domain: "Control Systems",
  description: "Provides numerical foundation for distributed MPC"
}]->(mpc)

CREATE (mlmts)-[:CONNECTS {
  source_domain: "Multi-Level Methods",
  target_domain: "Type Systems",
  description: "Maps hierarchical structure to types"
}]->(mlm)

CREATE (mlmts)-[:CONNECTS {
  source_domain: "Multi-Level Methods",
  target_domain: "Type Systems",
  description: "Enables implementation through parameterized types"
}]->(pt)
