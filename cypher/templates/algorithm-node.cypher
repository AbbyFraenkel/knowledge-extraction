// Algorithm Node Template
// Use this template to create algorithm nodes in the knowledge graph
// Replace all placeholders (indicated with [PLACEHOLDER]) with appropriate values

// Basic Algorithm Node Creation
CREATE (algo:Algorithm {
  name: "[ALGORITHM_NAME]",
  description: "[BRIEF_DESCRIPTION]",
  type: "[ALGORITHM_TYPE]", // e.g., "Iterative", "Direct", "Adaptive"
  problemDomain: "[PROBLEM_DOMAIN]", // e.g., "PDE Solving", "Optimization" 
  
  // Core properties - include all that apply
  timeComplexity: "[TIME_COMPLEXITY]", // e.g., "O(n²)" 
  spaceComplexity: "[SPACE_COMPLEXITY]", // e.g., "O(n)" 
  convergenceRate: "[CONVERGENCE_RATE]", // e.g., "Quadratic", "Exponential"
  stabilityConditions: "[STABILITY_CONDITIONS]",
  
  // Input/output specifications
  inputs: ["[INPUT_1]", "[INPUT_2]", /* additional inputs */],
  outputs: ["[OUTPUT_1]", "[OUTPUT_2]", /* additional outputs */],
  parameters: ["[PARAMETER_1]", "[PARAMETER_2]", /* additional parameters */],
  prerequisites: ["[PREREQUISITE_1]", "[PREREQUISITE_2]", /* additional prerequisites */],
  
  // Source information
  paperSource: "[PAPER_REFERENCE]", // e.g., "Smith et al. (2022)"
  referenceFile: "[FILE_PATH]", // e.g., "extracted-numerical-methods/algorithms/AdaptiveSpectral.md"
  
  // Performance characteristics
  bestCase: "[BEST_CASE]", // e.g., "Linear convergence for smooth functions"
  worstCase: "[WORST_CASE]", // e.g., "May diverge for highly discontinuous inputs"
  adaptivity: "[ADAPTIVITY]", // e.g., "Automatically increases resolution in high-gradient regions"
  parallelizability: "[PARALLELIZABILITY]", // e.g., "Embarrassingly parallel", "Limited parallelism"
  
  // Classification
  tags: ["[TAG_1]", "[TAG_2]", /* additional tags */]
})

// Mathematical Foundation Relationship
// Repeat this pattern for each foundational concept
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (algo)-[:BASED_ON {
  description: "[RELATIONSHIP_DESCRIPTION]",
  significance: "[SIGNIFICANCE]",
  paperReference: "[PAPER_REFERENCE]"
}]->(concept)

// "Improves Upon" Relationship (if applicable)
// Use this when the algorithm improves upon an existing algorithm
MATCH (prevAlgo:Algorithm {name: "[PREVIOUS_ALGORITHM]"})
CREATE (algo)-[:IMPROVES_UPON {
  improvements: ["[IMPROVEMENT_1]", "[IMPROVEMENT_2]", /* additional improvements */],
  tradeoffs: ["[TRADEOFF_1]", "[TRADEOFF_2]", /* additional tradeoffs */],
  magnitude: "[IMPROVEMENT_MAGNITUDE]" // e.g., "Significant", "Incremental"
}]->(prevAlgo)

// Application Domain Relationship
// Repeat this pattern for each application domain
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (algo)-[:APPLIES_TO {
  description: "[APPLICATION_DESCRIPTION]",
  effectiveness: "[EFFECTIVENESS]",
  limitations: ["[LIMITATION_1]", "[LIMITATION_2]", /* additional limitations */]
}]->(domain)

// Component Usage Relationship (if applicable)
// Use this when the algorithm uses other algorithms as components
MATCH (component:Algorithm {name: "[COMPONENT_ALGORITHM]"})
CREATE (algo)-[:USES {
  description: "[USAGE_DESCRIPTION]",
  integration: "[INTEGRATION_APPROACH]",
  modifications: ["[MODIFICATION_1]", "[MODIFICATION_2]", /* additional modifications */]
}]->(component)

// Implementation Relationship (if applicable)
// Use this to connect to existing implementations
MATCH (impl:Implementation {name: "[IMPLEMENTATION_NAME]"})
CREATE (impl)-[:IMPLEMENTS {
  description: "[IMPLEMENTATION_DESCRIPTION]",
  completeness: "[COMPLETENESS]", // e.g., "Full", "Partial"
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]", /* additional adaptations */]
}]->(algo)

// Paper Source Relationship
// Use this to connect to the source paper
MATCH (paper:Paper {id: "[PAPER_ID]"})
CREATE (algo)-[:DESCRIBED_IN {
  section: "[PAPER_SECTION]",
  importance: "[IMPORTANCE]" // e.g., "Core contribution", "Related work"
}]->(paper)

// Test Case Relationship (if applicable)
// Use this to connect to specific test cases
MATCH (test:TestCase {name: "[TEST_NAME]"})
CREATE (test)-[:VALIDATES {
  validationType: "[VALIDATION_TYPE]",
  accuracy: "[ACCURACY]",
  coverage: ["[COVERAGE_1]", "[COVERAGE_2]", /* additional coverage aspects */]
}]->(algo)

// Equation Relationship (if applicable)
// Use this to connect to key equations
MATCH (eq:Equation {id: "[EQUATION_ID]"})
CREATE (algo)-[:USES_EQUATION {
  context: "[USAGE_CONTEXT]",
  role: "[EQUATION_ROLE]" // e.g., "Core formulation", "Error estimation"
}]->(eq)

// KitchenSink Integration Relationship (if applicable)
// Use this for algorithms specifically relevant to KitchenSink
MATCH (component:KitchenSinkComponent {name: "[COMPONENT_NAME]"})
CREATE (algo)-[:INTEGRATES_WITH {
  description: "[INTEGRATION_DESCRIPTION]",
  interfacePoints: ["[INTERFACE_1]", "[INTERFACE_2]", /* additional interfaces */],
  developmentStatus: "[STATUS]" // e.g., "Implemented", "Planned", "Conceptual"
}]->(component)

// Pasteurization Application Relationship (if applicable)
// Use this for algorithms specifically relevant to pasteurization
MATCH (model:HeatTransferModel {name: "[MODEL_NAME]"})
CREATE (algo)-[:APPLIED_IN {
  description: "[APPLICATION_DESCRIPTION]",
  effectiveness: "[EFFECTIVENESS]",
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]", /* additional adaptations */]
}]->(model)
