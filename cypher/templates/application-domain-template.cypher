// Application Domain Template
// Use this template to create application domain nodes in the knowledge graph
// Replace all placeholders with appropriate values

// Basic Application Domain Node Creation
CREATE (domain:ApplicationDomain {
  name: "[DOMAIN_NAME]",  // The domain name (e.g., "Heat Transfer", "Fluid Mechanics")
  description: "[DESCRIPTION]",  // Brief description of the application domain
  fieldOfStudy: "[FIELD]",  // Broader field (e.g., "Engineering", "Physics", "Applied Mathematics")
  discipline: "[DISCIPLINE]",  // Specific discipline (e.g., "Mechanical Engineering", "Thermal Sciences")
  
  // Optional properties - include all that apply
  governingEquations: ["[EQUATION_1]", "[EQUATION_2]"],  // Key governing equations
  physicalPrinciples: ["[PRINCIPLE_1]", "[PRINCIPLE_2]"],  // Core physical principles
  phenomenaModeled: ["[PHENOMENON_1]", "[PHENOMENON_2]"],  // Key phenomena modeled
  primaryVariables: ["[VARIABLE_1]", "[VARIABLE_2]"],  // Main variables of interest
  keyParameters: ["[PARAMETER_1]", "[PARAMETER_2]"],  // Important parameters in the domain
  commonApproximations: ["[APPROXIMATION_1]", "[APPROXIMATION_2]"],  // Typical simplifications
  industrialApplications: ["[APPLICATION_1]", "[APPLICATION_2]"],  // Real-world applications
  keyReferences: ["[REFERENCE_1]", "[REFERENCE_2]"],  // Important literature
  
  // Tiered knowledge properties
  tier_L1: "[BRIEF_OVERVIEW]",  // 100-200 word summary
  tier_L2_file: "[PATH_TO_L2_FILE]",  // Path to detailed documentation
  taxonomyLevel: "[TAXONOMY_LEVEL]"  // Position in taxonomy (e.g., "Core", "Specialized")
})

// Connect to Parent Domain (if applicable)
MATCH (parent:ApplicationDomain {name: "[PARENT_DOMAIN]"})
CREATE (domain)-[:SPECIALIZES {
  nature: "[SPECIALIZATION_NATURE]",  // How this domain specializes the parent
  contextualBoundary: "[BOUNDARY_DESCRIPTION]"  // Where this subdomain begins/ends
}]->(parent)

// Connect to Mathematical Methods
MATCH (method:NumericalMethod {name: "[METHOD_NAME]"})
CREATE (domain)-[:APPLIES {
  context: "[APPLICATION_CONTEXT]",  // How the method is applied
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]"],  // Domain-specific adaptations
  effectivenessCriteria: ["[CRITERION_1]", "[CRITERION_2]"]  // What makes the method effective
}]->(method)

// Connect to Mathematical Concepts
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (domain)-[:UTILIZES {
  context: "[UTILIZATION_CONTEXT]",  // How the concept is used
  interpretation: "[DOMAIN_INTERPRETATION]",  // Domain-specific interpretation
  specialization: "[HOW_SPECIALIZED]"  // How the concept is specialized
}]->(concept)

// Connect to Implementation Approaches
MATCH (implementation:Implementation {name: "[IMPLEMENTATION_NAME]"})
CREATE (implementation)-[:TARGETS {
  appropriateness: "[APPROPRIATENESS]",  // Why this implementation fits the domain
  optimizations: ["[OPTIMIZATION_1]", "[OPTIMIZATION_2]"],  // Domain-specific optimizations
  validationApproaches: ["[VALIDATION_1]", "[VALIDATION_2]"]  // How to validate in this domain
}]->(domain)

// -------------------------------
// EXAMPLE USAGE
// -------------------------------

/*
CREATE (ht:ApplicationDomain {
  name: "HeatTransfer",
  description: "Study of thermal energy transfer between physical systems due to temperature differences",
  fieldOfStudy: "Engineering",
  discipline: "Thermal Sciences",
  governingEquations: [
    "Heat equation: ∂T/∂t = α∇²T",
    "Fourier's law: q = -k∇T",
    "Convection: q = h(T - T∞)",
    "Radiation: q = εσ(T⁴ - T∞⁴)"
  ],
  physicalPrinciples: [
    "Conservation of energy",
    "Second law of thermodynamics",
    "Thermal equilibrium",
    "Heat transfer mechanisms (conduction, convection, radiation)"
  ],
  phenomenaModeled: [
    "Temperature distribution in solids",
    "Thermal boundary layers",
    "Phase change processes",
    "Thermal radiation exchange"
  ],
  primaryVariables: ["Temperature", "Heat flux", "Thermal conductivity", "Heat transfer coefficient"],
  keyParameters: ["Thermal diffusivity", "Biot number", "Nusselt number", "Thermal conductivity"],
  commonApproximations: [
    "Steady-state assumption",
    "One-dimensional simplification",
    "Constant material properties",
    "Lumped capacitance model"
  ],
  industrialApplications: [
    "Thermal processing of materials",
    "Heat exchanger design",
    "Electronic cooling",
    "Building thermal management"
  ],
  tier_L1: "Heat transfer is the study of thermal energy movement between systems due to temperature differences, governed by the principles of conduction, convection, and radiation. It is fundamental to numerous engineering applications including thermal processing, HVAC systems, electronic cooling, and energy systems.",
  tier_L2_file: "applications/heat_transfer/heat_transfer_fundamentals_L2.md",
  taxonomyLevel: "Core"
})

MATCH (ht:ApplicationDomain {name: "HeatTransfer"})
MATCH (tp:ApplicationDomain {name: "ThermalProcessing"})
CREATE (tp)-[:SPECIALIZES {
  nature: "Focuses specifically on industrial processing using thermal energy",
  context