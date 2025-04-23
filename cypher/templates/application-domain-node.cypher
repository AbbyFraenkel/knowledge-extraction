// Application Domain Node Template
// Use this template to create ApplicationDomain nodes in the knowledge graph
// Replace all placeholders with appropriate values

// Basic Application Domain Node Creation
CREATE (domain:ApplicationDomain {
  name: "[DOMAIN_NAME]",  // Name of the application domain
  description: "[DESCRIPTION]",  // Brief description of the domain
  category: "[CATEGORY]",  // Broader category (e.g., "Engineering", "Physics", "Chemistry", "Biology")
  subfield: "[SUBFIELD]",  // Specific subfield
  
  // Optional properties - include all that apply
  keyPhenomena: ["[PHENOMENON_1]", "[PHENOMENON_2]"],  // Key physical phenomena in this domain
  governingEquations: ["[EQUATION_1]", "[EQUATION_2]"],  // Primary equations governing the domain
  characteristicParameters: ["[PARAMETER_1]", "[PARAMETER_2]"],  // Important parameters in this domain
  typicalConditions: {  // Typical conditions in this domain
    spatialScales: ["[SCALE_1]", "[SCALE_2]"],  // Relevant spatial scales
    timeScales: ["[TIMESCALE_1]", "[TIMESCALE_2]"],  // Relevant time scales
    environmentalFactors: ["[FACTOR_1]", "[FACTOR_2]"]  // Environmental considerations
  },
  industrialRelevance: ["[INDUSTRY_1]", "[INDUSTRY_2]"],  // Industrial applications
  researchChallenges: ["[CHALLENGE_1]", "[CHALLENGE_2]"],  // Current research challenges
  standardizationBodies: ["[BODY_1]", "[BODY_2]"],  // Relevant standardization organizations
  references: ["[REFERENCE_1]", "[REFERENCE_2]"]  // Key reference materials
})

// Connect to Parent Domains
MATCH (parent:ApplicationDomain {name: "[PARENT_DOMAIN]"})
CREATE (domain)-[:SUBDOMAIN_OF {
  relationship: "[RELATIONSHIP]",  // Nature of the relationship to parent domain
  specialization: "[SPECIALIZATION]"  // How this domain specializes the parent
}]->(parent)

// Connect to Mathematical Concepts
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (concept)-[:APPLIES_TO {
  relevance: "[RELEVANCE]",  // Relevance to this domain
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]"]  // Domain-specific adaptations
}]->(domain)

// Connect to Numerical Methods
MATCH (method:NumericalMethod {name: "[METHOD_NAME]"})
CREATE (method)-[:APPLIES_TO {
  effectiveness: "[EFFECTIVENESS]",  // Effectiveness in this domain
  domainChallenges: ["[CHALLENGE_1]", "[CHALLENGE_2]"],  // Domain-specific challenges for this method
  typicalSettings: ["[SETTING_1]", "[SETTING_2]"]  // Typical parameter settings for this domain
}]->(domain)

// Connect to Related Domains
MATCH (related:ApplicationDomain {name: "[RELATED_DOMAIN]"})
CREATE (domain)-[:RELATES_TO {
  relationship: "[RELATIONSHIP]",  // Nature of the relationship
  commonChallenges: ["[CHALLENGE_1]", "[CHALLENGE_2]"],  // Shared challenges
  interfaceAreas: ["[AREA_1]", "[AREA_2]"]  // Areas of interface between domains
}]->(related)

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Heat Transfer Domain
/*
CREATE (heat:ApplicationDomain {
  name: "HeatTransfer",
  description: "The study of thermal energy transfer between systems due to temperature differences",
  category: "Engineering",
  subfield: "Thermal Sciences",
  keyPhenomena: [
    "Conduction (molecular heat transfer)",
    "Convection (heat transfer with fluid flow)",
    "Radiation (electromagnetic heat transfer)",
    "Phase change (melting/solidification)"
  ],
  governingEquations: [
    "Heat equation: ρCp(∂T/∂t) = ∇·(k∇T) + q",
    "Fourier's law: q = -k∇T",
    "Newton's law of cooling: q = h(Ts-T∞)",
    "Stefan-Boltzmann law: q = εσ(T⁴-T∞⁴)"
  ],
  characteristicParameters: [
    "Thermal conductivity (k)",
    "Specific heat capacity (Cp)",
    "Thermal diffusivity (α)",
    "Heat transfer coefficient (h)",
    "Emissivity (ε)"
  ],
  typicalConditions: {
    spatialScales: ["Microscale (μm)", "Component scale (cm-m)", "Industrial scale (m-km)"],
    timeScales: ["Transient (s-min)", "Pseudo-steady (min-hours)", "Steady-state"],
    environmentalFactors: ["Ambient temperature", "Humidity", "Air flow conditions"]
  },
  industrialRelevance: [
    "HVAC systems",
    "Electronic cooling",
    "Food processing",
    "Energy generation and conversion",
    "Materials processing"
  ],
  researchChallenges: [
    "Multi-phase heat transfer",
    "Micro/nanoscale effects",
    "Complex geometries and materials",
    "Coupled heat and mass transfer",
    "High-temperature applications"
  ],
  standardizationBodies: ["ASME", "ASHRAE", "ISO"],
  references: ["Incropera's Fundamentals of Heat and Mass Transfer", "Cengel's Heat Transfer: A Practical Approach"]
})
*/

// Example 2: Tunnel Pasteurization Domain
/*
CREATE (pasteurization:ApplicationDomain {
  name: "TunnelPasteurization",
  description: "Thermal processing of packaged beverages using controlled temperature zones to ensure product safety and shelf stability",
  category: "Food Engineering",
  subfield: "Thermal Food Processing",
  keyPhenomena: [
    "Transient heat conduction",
    "Convective heat transfer",
    "Phase change (condensation)",
    "Microbial inactivation kinetics",
    "Container heat distribution"
  ],
  governingEquations: [
    "Heat equation with variable properties",
    "First-order microbial inactivation: dN/dt = -kN",
    "Pasteurization Unit (PU) calculation: PU = ∫10^((T-60)/z)dt",
    "Container heat dynamics: mcP(dT/dt) = hA(Tambient-T)"
  ],
  characteristicParameters: [
    "Thermal diffusivity of beverage and container materials",
    "Decimal reduction time (D-value)",
    "z-value (temperature sensitivity)",
    "Heat transfer coefficient in different zones",
    "Process lethality (PU)"
  ],
  typicalConditions: {
    spatialScales: ["Package scale (mm-cm)", "Container scale (cm)", "Tunnel scale (m)"],
    timeScales: ["Microbial inactivation (s-min)", "Container heating/cooling (min)", "Full process (30-60 min)"],
    environmentalFactors: ["Spray water temperature", "Steam temperature", "Air pressure", "Water flow rate"]
  },
  industrialRelevance: [
    "Beer production",
    "Soft drinks processing",
    "Bottled juices",
    "Canned beverages",
    "Packaged dairy products"
  ],
  researchChallenges: [
    "Process optimization for energy efficiency",
    "Minimizing thermal impact on product quality",
    "Package-dependent heat transfer dynamics",
    "Variable product properties during process",
    "Ensuring uniform treatment of all container regions"
  ],
  standardizationBodies: ["FDA", "USDA", "Brewing Industry Standards"],
  references: ["Fundamentals of Food Process Engineering", "Brewing Science and Practice"]
})

MATCH (pasteurization:ApplicationDomain {name: "TunnelPasteurization"})
MATCH (heat:ApplicationDomain {name: "HeatTransfer"})
CREATE (pasteurization)-[:SUBDOMAIN_OF {
  relationship: "Specialized application of heat transfer principles",
  specialization: "Focus on packaged beverages with specific safety requirements"
}]->(heat)

MATCH (pasteurization:ApplicationDomain {name: "TunnelPasteurization"})
MATCH (micro:ApplicationDomain {name: "MicrobialKinetics"})
CREATE (pasteurization)-[:RELATES_TO {
  relationship: "Critical process requirement",
  commonChallenges: ["Temperature-dependent inactivation rates", "Species-specific resistance"],
  interfaceAreas: ["Process validation", "Safety factor determination", "Process design"]
}]->(micro)
*/

// Example 3: Computational Fluid Dynamics Domain (for comparison)
/*
CREATE (cfd:ApplicationDomain {
  name: "ComputationalFluidDynamics",
  description: "Numerical simulation of fluid flow, heat transfer, and associated phenomena using computational methods",
  category: "Engineering",
  subfield: "Numerical Simulation",
  keyPhenomena: [
    "Fluid flow (laminar and turbulent)",
    "Heat transfer in fluids",
    "Species transport and mixing",
    "Free surface flows",
    "Multiphase flows"
  ],
  governingEquations: [
    "Navier-Stokes equations",
    "Continuity equation",
    "Energy conservation equation",
    "Species transport equations",
    "Turbulence models (k-ε, k-ω, etc.)"
  ],
  characteristicParameters: [
    "Reynolds number",
    "Mach number",
    "Prandtl number",
    "Nusselt number",
    "Courant number (for simulation)"
  ],
  typicalConditions: {
    spatialScales: ["Micro-flows (μm)", "Component scale (mm-m)", "Environmental scale (m-km)"],
    timeScales: ["Fast transients (ms-s)", "Steady-state", "Long-term dynamics (hours-days)"],
    environmentalFactors: ["Boundary conditions", "Initial conditions", "External forces"]
  },
  researchChallenges: [
    "High-fidelity turbulence modeling",
    "Multiscale phenomena",
    "Fluid-structure interaction",
    "Moving and deforming boundaries",
    "Uncertainty quantification"
  ],
  references: ["Versteeg & Malalasekera: An Introduction to CFD", "Patankar: Numerical Heat Transfer and Fluid Flow"]
})

MATCH (cfd:ApplicationDomain {name: "ComputationalFluidDynamics"})
MATCH (mloc:NumericalMethod {name: "MultiLevelOrthogonalCollocation"})
CREATE (mloc)-[:APPLIES_TO {
  effectiveness: "Highly effective for fluid flows with sharp gradients and interfaces",
  domainChallenges: [
    "Capturing boundary layers accurately", 
    "Handling moving fluid interfaces",
    "Stability issues with convection-dominated flows"
  ],
  typicalSettings: [
    "Higher resolution levels near walls and interfaces",
    "Combined with suitable stabilization for convection",
    "Often used with domain decomposition for complex geometries"
  ]
}]->(cfd)
*/
