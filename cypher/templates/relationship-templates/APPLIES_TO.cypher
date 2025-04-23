// APPLIES_TO Relationship Template
// Use this template to create APPLIES_TO relationships in the knowledge graph
//
// Purpose: Represents application relationships where a method, algorithm, or concept
// is applied to a specific domain or problem area.
//
// Replace all placeholders with appropriate values

// Basic APPLIES_TO Relationship Creation
MATCH (source:[SOURCE_ENTITY_TYPE] {name: "[SOURCE_ENTITY_NAME]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (source)-[:APPLIES_TO {
  applicabilityScope: "[SCOPE]",  // Range of applicability (e.g., "General", "Limited", "Specific cases")
  domainAdaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]"],  // List of domain-specific modifications
  effectivenessMetrics: {  // How well the method works in this domain
    accuracy: "[ACCURACY]",  // e.g., "High", "Moderate", "Variable"
    efficiency: "[EFFICIENCY]",  // e.g., "Superior to alternatives", "Comparable to existing methods"
    robustness: "[ROBUSTNESS]"  // e.g., "Stable under perturbations", "Sensitive to initial conditions"
  },
  constraints: ["[CONSTRAINT_1]", "[CONSTRAINT_2]"],  // List of domain-specific limitations
  
  // Optional properties - include all that apply
  domainRelevance: "[RELEVANCE]",  // Why this method is relevant to this domain
  applicationHistory: "[HISTORY]",  // History of application to this domain
  comparisonToAlternatives: "[COMPARISON]",  // How it compares to alternative approaches
  caseStudies: ["[CASE_STUDY_1]", "[CASE_STUDY_2]"],  // Examples of application
  paperSources: ["[PAPER_REF]"]  // References to papers describing the application
}]->(domain)

// ------------------------------
// ENTITY TYPE-SPECIFIC PATTERNS
// ------------------------------

// Numerical Method applied to an Application Domain
/*
MATCH (method:NumericalMethod {name: "[METHOD_NAME]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (method)-[:APPLIES_TO {
  applicabilityScope: "General with domain-specific optimizations",
  domainAdaptations: ["Parameter selection guidelines", "Domain-specific error estimators"],
  effectivenessMetrics: {
    accuracy: "High for typical problems in the domain",
    efficiency: "Computationally efficient for large-scale problems",
    robustness: "Stable across parameter ranges of interest"
  },
  constraints: ["Requires high-quality input data", "Limited to certain regime"]
}]->(domain)
*/

// Algorithm applied to a Specific Problem
/*
MATCH (algorithm:Algorithm {name: "[ALGORITHM_NAME]"})
MATCH (problem:ApplicationDomain {name: "[PROBLEM_NAME]"})
CREATE (algorithm)-[:APPLIES_TO {
  applicabilityScope: "Specifically designed for this problem",
  domainAdaptations: ["Domain-specific heuristics", "Specialized data structures"],
  effectivenessMetrics: {
    accuracy: "State-of-the-art performance",
    efficiency: "Optimized for problem characteristics",
    robustness: "Handles all valid inputs"
  },
  constraints: ["Limited to problem instances of certain size"]
}]->(problem)
*/

// Mathematical Concept applied to Engineering Domain
/*
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (concept)-[:APPLIES_TO {
  applicabilityScope: "Theoretical foundation for domain problems",
  domainAdaptations: ["Engineering interpretation of variables", "Physical constraints added"],
  effectivenessMetrics: {
    accuracy: "Provides exact solutions under idealized conditions",
    efficiency: "Enables simplified modeling",
    robustness: "Theoretically sound"
  },
  constraints: ["Approximations needed for real-world complexity", "Requires parameter calibration"]
}]->(domain)
*/

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Spectral Methods applied to Fluid Dynamics
/*
MATCH (spectral:NumericalMethod {name: "SpectralMethod"})
MATCH (fluid:ApplicationDomain {name: "FluidDynamics"})
CREATE (spectral)-[:APPLIES_TO {
  applicabilityScope: "Highly effective for problems with smooth solutions",
  domainAdaptations: [
    "Boundary condition handling for no-slip walls", 
    "Pressure-velocity coupling strategies", 
    "Turbulence modeling adaptations"
  ],
  effectivenessMetrics: {
    accuracy: "Exponential convergence for smooth flows",
    efficiency: "High accuracy per degree of freedom",
    robustness: "Sensitive to boundary layer resolution"
  },
  constraints: [
    "Challenges with geometric complexity", 
    "Aliasing issues with high Reynolds numbers",
    "Requires careful handling of discontinuities"
  ],
  domainRelevance: "Provides high accuracy for aerodynamic and hydrodynamic simulations",
  comparisonToAlternatives: "Superior accuracy to finite differences for same DOF count",
  caseStudies: ["Channel flow", "Vortex dynamics", "Isotropic turbulence"],
  paperSources: ["Canuto1988", "Hussaini1987"]
}]->(fluid)
*/

// Example 2: Orthogonal Collocation applied to Heat Transfer
/*
MATCH (oc:NumericalMethod {name: "OrthogonalCollocation"})
MATCH (heat:ApplicationDomain {name: "HeatTransfer"})
CREATE (oc)-[:APPLIES_TO {
  applicabilityScope: "Effective for both steady and transient heat conduction problems",
  domainAdaptations: [
    "Non-uniform grid points focused near boundaries and interfaces", 
    "Special handling for temperature-dependent properties",
    "Incorporation of phase-change effects"
  ],
  effectivenessMetrics: {
    accuracy: "High accuracy for smooth temperature profiles",
    efficiency: "Requires fewer grid points than finite differences",
    robustness: "Stable for typical heat transfer problems"
  },
  constraints: [
    "Challenges with discontinuous material properties", 
    "Requires special handling for radiation boundary conditions",
    "Complex geometries need domain decomposition"
  ],
  domainRelevance: "Efficiently captures steep temperature gradients with fewer points",
  caseStudies: ["Building thermal performance", "Industrial heat exchangers", "Pasteurization processes"],
  paperSources: ["Finlayson1972", "Villadsen1978"]
}]->(heat)
*/

// Example 3: Multi-Level Methods applied to Pasteurization Modeling
/*
MATCH (mloc:NumericalMethod {name: "MultiLevelOrthogonalCollocation"})
MATCH (pasteurization:ApplicationDomain {name: "TunnelPasteurization"})
CREATE (mloc)-[:APPLIES_TO {
  applicabilityScope: "Ideally suited for tunnel pasteurization simulation",
  domainAdaptations: [
    "Moving boundary techniques for pasteurization front tracking", 
    "Temperature-dependent property handling",
    "Container geometry-specific discretization",
    "Integration with microbial inactivation kinetics"
  ],
  effectivenessMetrics: {
    accuracy: "Captures temperature profiles within 1°C of measured data",
    efficiency: "50-80% reduction in computational points compared to uniform grid methods",
    robustness: "Stable across different container geometries and process conditions"
  },
  constraints: [
    "Requires accurate material property data", 
    "Complex industrial tunnel geometries need simplification",
    "Currently limited to cylindrical and rectangular containers"
  ],
  domainRelevance: "Enables precise optimization of pasteurization processes while ensuring product safety",
  comparisonToAlternatives: "More accurate than finite difference methods with similar computational cost",
  caseStudies: ["Beer bottle pasteurization", "Canned beverage thermal processing", "Process optimization study"],
  paperSources: ["AuthorYear"]
}]->(pasteurization)
*/
