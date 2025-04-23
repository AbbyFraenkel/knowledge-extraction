// Cross-Domain Bridge Template
// Use this template to create cross-domain bridge nodes that connect concepts across different domains
// Replace all placeholders with appropriate values

// Basic Cross-Domain Bridge Creation
CREATE (bridge:CrossDomainBridge {
  name: "[BRIDGE_NAME]",  // Name of the cross-domain connection (e.g., "SpectralMethodsToPasteurization")
  description: "[DESCRIPTION]",  // Brief description of the bridge
  sourceDomain: "[SOURCE_DOMAIN]",  // The source domain (e.g., "Numerical Analysis")
  targetDomain: "[TARGET_DOMAIN]",  // The target domain (e.g., "Food Processing")
  
  // Transformation process details
  transformationProcess: [
    "[PROCESS_STEP_1]",  // E.g., "Mathematical model formulation from physical principles"
    "[PROCESS_STEP_2]",  // E.g., "Spectral discretization of heat transfer equations"
    "[PROCESS_STEP_3]",  // E.g., "Parameter mapping between mathematical and physical domains"
    "[PROCESS_STEP_4]"   // E.g., "Solution interpretation in application context"
  ],
  
  // Optional properties - include all that apply
  mappingProperties: [
    "[PROPERTY_1]",  // E.g., "High accuracy for temperature gradients at container walls"
    "[PROPERTY_2]"   // E.g., "Efficient representation of smooth temperature profiles"
  ],
  challengesAndAdaptations: [
    "[CHALLENGE_1]",  // E.g., "Handling complex container geometries using fictitious domains"
    "[CHALLENGE_2]"   // E.g., "Adaptation for temperature-dependent material properties"
  ],
  exampleApplications: [
    "[APPLICATION_1]",  // E.g., "Bottle pasteurization modeling"
    "[APPLICATION_2]"   // E.g., "Process optimization for energy efficiency"
  ],
  knowledgeFlowDirections: [
    "[FLOW_1]",  // E.g., "Mathematical principles → physical model formulation"
    "[FLOW_2]"   // E.g., "Physical constraints → mathematical problem definition"
  ],
  
  // Tiered knowledge properties
  tier_L1: "[BRIEF_OVERVIEW]",  // 100-200 word summary
  tier_L2_file: "[PATH_TO_L2_FILE]",  // Path to detailed documentation
  taxonomyLevel: "[TAXONOMY_LEVEL]"  // Position in taxonomy (e.g., "Core", "Specialized")
})

// Connect Source Concepts/Methods
MATCH (source:MathematicalConcept {name: "[SOURCE_CONCEPT]"})
CREATE (bridge)-[:CONNECTS_FROM {
  role: "[SOURCE_ROLE]",  // Role in the connection (e.g., "Foundational theory")
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]"],  // Adaptations needed for this connection
  contextualBoundary: "[SOURCE_BOUNDARY]"  // Scope limitation on the source side
}]->(source)

// Connect Target Applications
MATCH (target:ApplicationDomain {name: "[TARGET_APPLICATION]"})
CREATE (bridge)-[:CONNECTS_TO {
  role: "[TARGET_ROLE]",  // Role in the connection (e.g., "Application context")
  requirements: ["[REQUIREMENT_1]", "[REQUIREMENT_2]"],  // Requirements for successful application
  contextualBoundary: "[TARGET_BOUNDARY]"  // Scope limitation on the target side
}]->(target)

// Define Transformation Mappings
CREATE (mapping:ConceptMapping {
  name: "[MAPPING_NAME]",  // Name of specific concept mapping
  description: "[MAPPING_DESCRIPTION]",  // What this mapping represents
  sourceConcept: "[SOURCE_CONCEPT_DETAIL]",  // Specific source concept detail
  targetInterpretation: "[TARGET_INTERPRETATION]",  // How it's interpreted in target domain
  formalMapping: "[FORMAL_MAPPING]",  // Mathematical representation of the mapping
  contextualConstraints: ["[CONSTRAINT_1]", "[CONSTRAINT_2]"]  // When this mapping applies
})

// Connect Mapping to Bridge
MATCH (bridge:CrossDomainBridge {name: "[BRIDGE_NAME]"})
MATCH (mapping:ConceptMapping {name: "[MAPPING_NAME]"})
CREATE (bridge)-[:CONTAINS_MAPPING]->(mapping)

// Create Symbol Mappings (if applicable)
MATCH (sourceSymbol:Symbol {name: "[SOURCE_SYMBOL]", context: "[SOURCE_CONTEXT]"})
MATCH (targetSymbol:Symbol {name: "[TARGET_SYMBOL]", context: "[TARGET_CONTEXT]"})
MATCH (bridge:CrossDomainBridge {name: "[BRIDGE_NAME]"})
CREATE (bridge)-[:MAPS_SYMBOLS {
  relationship: "[RELATIONSHIP_TYPE]",  // E.g., "Equivalent representation"
  contextualNote: "[CONTEXTUAL_NOTE]",  // E.g., "Only valid in steady-state conditions"
  transformationRule: "[TRANSFORMATION_RULE]"  // E.g., "α_thermal in source domain equals k/(ρCp) in target domain"
}]->(sourceSymbol)
CREATE (bridge)-[:MAPS_SYMBOLS {
  relationship: "[RELATIONSHIP_TYPE]",
  contextualNote: "[CONTEXTUAL_NOTE]", 
  transformationRule: "[TRANSFORMATION_RULE]"
}]->(targetSymbol)

// ------------------------------
// EXAMPLE USAGE
// ------------------------------

/*
CREATE (smtp:CrossDomainBridge {
  name: "SpectralMethodsToPasteurization",
  description: "Application of spectral methods to thermal pasteurization modeling, connecting numerical mathematics with food processing applications",
  sourceDomain: "Numerical Analysis",
  targetDomain: "Food Processing",
  transformationProcess: [
    "Mathematical model formulation from physical principles",
    "Spectral discretization of heat transfer equations",
    "Parameter mapping between mathematical and physical domains",
    "Solution interpretation in pasteurization context"
  ],
  mappingProperties: [
    "High accuracy for temperature gradients at container walls",
    "Efficient representation of smooth temperature profiles",
    "Reduced computational cost for accurate PU calculation",
    "Clear error bounds for food safety verification"
  ],
  challengesAndAdaptations: [
    "Handling complex container geometries using fictitious domains",
    "Adaptation for temperature-dependent material properties",
    "Specialized boundary condition handling for spray/air zones",
    "Multi-physics coupling for heat and mass transfer"
  ],
  exampleApplications: [
    "Bottle pasteurization modeling",
    "PU calculation with uncertainty quantification",
    "Cold spot detection algorithms",
    "Process optimization for energy efficiency"
  ],
  tier_L1: "This bridge connects spectral numerical methods to pasteurization processes, enabling high-accuracy modeling of thermal processes in food containers with efficient computational resources and clear error bounds for food safety verification.",
  tier_L2_file: "cross_domain_bridges/numerics_to_applications/spectral_methods_to_pasteurization_L2.md",
  taxonomyLevel: "Specialized"
})

MATCH (smtp:CrossDomainBridge {name: "SpectralMethodsToPasteurization"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (smtp)-[:CONNECTS_FROM {
  role: "Foundational numerical method",
  adaptations: ["Adaptation for temperature-dependent properties", "Boundary condition handling for container surfaces"],
  contextualBoundary: "Applied to heat equation discretization"
}]->(oc)

MATCH (smtp:CrossDomainBridge {name: "SpectralMethodsToPasteurization"})
MATCH (tp:ApplicationDomain {name: "TunnelPasteurization"})
CREATE (smtp)-[:CONNECTS_TO {
  role: "Application target",
  requirements: ["Container geometry definition", "Material property specifications", "Process parameters"],
  contextualBoundary: "Focused on thermal aspects of pasteurization"
}]->(tp)

CREATE (mapping:ConceptMapping {
  name: "ThermalDiffusivityMapping",
  description: "Mapping between mathematical thermal diffusivity and physical material properties",
  sourceConcept: "α in heat equation (∂T/∂t = α∇²T)",
  targetInterpretation: "Material-specific thermal property in pasteurization",
  formalMapping: "α = k/(ρ⋅Cp) where k is thermal conductivity, ρ is density, and Cp is specific heat",
  contextualConstraints: ["Valid for homogeneous materials", "Temperature dependence must be explicitly defined"]
})

MATCH (smtp:CrossDomainBridge {name: "SpectralMethodsToPasteurization"})
MATCH (mapping:ConceptMapping {name: "ThermalDiffusivityMapping"})
CREATE (smtp)-[:CONTAINS_MAPPING]->(mapping)

MATCH (alphaSymbol:Symbol {name: "α", context: "Heat transfer equation"})
MATCH (thermalDiffSymbol:Symbol {name: "α_thermal", context: "Material properties"})
MATCH (smtp:CrossDomainBridge {name: "SpectralMethodsToPasteurization"})
CREATE (smtp)-[:MAPS_SYMBOLS {
  relationship: "Equivalent physical quantity",
  contextualNote: "Mathematical parameter in heat equation",
  transformationRule: "Direct equivalence with units m²/s"
}]->(alphaSymbol)
CREATE (smtp)-[:MAPS_SYMBOLS {
  relationship: "Physical interpretation",
  contextualNote: "Material property in pasteurization context",
  transformationRule: "Computed as k/(ρ⋅Cp) for specific container materials"
}]->(thermalDiffSymbol)
*/
