// Method Relationship Template
// Use this template to create relationships between numerical methods
// Replace all placeholders (indicated with [PLACEHOLDER]) with appropriate values

// Method Comparison Relationship
// Use this to create a comprehensive comparison between two methods

// First, ensure both methods exist
MATCH (method1:NumericalMethod {name: "[METHOD_1_NAME]"})
MATCH (method2:NumericalMethod {name: "[METHOD_2_NAME]"})

// Create the comparison relationship
CREATE (method1)-[:COMPARED_TO {
  // Core comparison properties
  context: "[COMPARISON_CONTEXT]", // e.g., "Heat transfer applications", "General PDE solving"
  paperSource: "[COMPARISON_SOURCE]", // e.g., "Smith et al. (2022)"
  
  // Advantages/disadvantages
  method1Advantages: ["[ADVANTAGE_1]", "[ADVANTAGE_2]", /* additional advantages */],
  method1Disadvantages: ["[DISADVANTAGE_1]", "[DISADVANTAGE_2]", /* additional disadvantages */],
  method2Advantages: ["[ADVANTAGE_1]", "[ADVANTAGE_2]", /* additional advantages */],
  method2Disadvantages: ["[DISADVANTAGE_1]", "[DISADVANTAGE_2]", /* additional disadvantages */],
  
  // Performance comparison
  accuracyComparison: "[ACCURACY_COMPARISON]", // e.g., "Method1 more accurate for smooth problems"
  performanceComparison: "[PERFORMANCE_COMPARISON]", // e.g., "Method2 faster for large-scale problems"
  stabilityComparison: "[STABILITY_COMPARISON]", // e.g., "Method1 more stable for stiff problems"
  
  // Implementation comparison
  implementationComplexity: "[IMPLEMENTATION_COMPARISON]", // e.g., "Method2 significantly more complex"
  memoryRequirements: "[MEMORY_COMPARISON]", // e.g., "Method1 requires less memory"
  parallelizability: "[PARALLEL_COMPARISON]", // e.g., "Method2 better suited for GPU acceleration"
  
  // Application-specific comparison
  heatTransferSuitability: "[HEAT_TRANSFER_COMPARISON]", // e.g., "Method1 preferred for phase change"
  pasteurizationRelevance: "[PASTEURIZATION_COMPARISON]", // e.g., "Method2 better for container modeling"
  
  // Integration potential
  kitchenSinkIntegration: "[KITCHENSINK_INTEGRATION]", // e.g., "Both methods compatible with architecture"
  hybridPotential: "[HYBRID_POTENTIAL]", // e.g., "Methods could be combined for optimal results"
  
  // Recommendation summary
  recommendationContext: "[RECOMMENDATION_CONTEXT]", // e.g., "For pasteurization simulation"
  recommendedChoice: "[RECOMMENDED_CHOICE]", // e.g., "Method1", "Method2", "Hybrid approach", "Context-dependent"
  recommendationJustification: "[JUSTIFICATION]"
}]->(method2)

// Mathematical Foundation Comparison
// Use this to compare the mathematical foundations

// Create mathematical foundation comparison
MATCH (concept1:MathematicalConcept {name: "[CONCEPT_1_NAME]"})
MATCH (concept2:MathematicalConcept {name: "[CONCEPT_2_NAME]"})
MATCH (method1:NumericalMethod {name: "[METHOD_1_NAME]"})
MATCH (method2:NumericalMethod {name: "[METHOD_2_NAME]"})

// Link methods to their mathematical foundations
CREATE (method1)-[:BASED_ON {
  description: "[FOUNDATION_DESCRIPTION]",
  significance: "[SIGNIFICANCE]"
}]->(concept1)

CREATE (method2)-[:BASED_ON {
  description: "[FOUNDATION_DESCRIPTION]",
  significance: "[SIGNIFICANCE]"
}]->(concept2)

// Create relationship between foundations if relevant
CREATE (concept1)-[:THEORETICAL_CONNECTION {
  nature: "[CONNECTION_NATURE]", // e.g., "Complementary approaches", "Special case relationship"
  strength: "[CONNECTION_STRENGTH]", // e.g., "Strong", "Weak", "Fundamental"
  implications: ["[IMPLICATION_1]", "[IMPLICATION_2]", /* additional implications */]
}]->(concept2)

// Algorithm Implementation Comparison
// Use this to compare algorithm implementations of the methods

// First, get the algorithms implementing each method
MATCH (method1:NumericalMethod {name: "[METHOD_1_NAME]"})
MATCH (method2:NumericalMethod {name: "[METHOD_2_NAME]"})
MATCH (algo1:Algorithm)-[:IMPLEMENTS]->(method1)
MATCH (algo2:Algorithm)-[:IMPLEMENTS]->(method2)

// Create algorithm comparison relationship
CREATE (algo1)-[:COMPARED_TO {
  comparisonContext: "[ALGORITHM_COMPARISON_CONTEXT]",
  timeComplexityComparison: "[TIME_COMPLEXITY_COMPARISON]",
  spaceComplexityComparison: "[SPACE_COMPLEXITY_COMPARISON]",
  convergenceComparison: "[CONVERGENCE_COMPARISON]",
  robustnessComparison: "[ROBUSTNESS_COMPARISON]",
  applicabilityComparison: "[APPLICABILITY_COMPARISON]"
}]->(algo2)

// Application Domain Comparison
// Use this to compare how methods apply to specific domains

// First, get the application domain
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
MATCH (method1:NumericalMethod {name: "[METHOD_1_NAME]"})
MATCH (method2:NumericalMethod {name: "[METHOD_2_NAME]"})

// Create application relationships with comparison properties
CREATE (method1)-[:APPLIES_TO {
  description: "[APPLICATION_DESCRIPTION]",
  effectiveness: "[EFFECTIVENESS]",
  limitations: ["[LIMITATION_1]", "[LIMITATION_2]", /* additional limitations */],
  comparisonId: "[COMPARISON_ID]" // Use same ID for both to link the comparisons
}]->(domain)

CREATE (method2)-[:APPLIES_TO {
  description: "[APPLICATION_DESCRIPTION]",
  effectiveness: "[EFFECTIVENESS]",
  limitations: ["[LIMITATION_1]", "[LIMITATION_2]", /* additional limitations */],
  comparisonId: "[COMPARISON_ID]" // Use same ID for both to link the comparisons
}]->(domain)

// Implementation Comparison for KitchenSink
// Use this to compare implementation approaches in KitchenSink

// First, get the KitchenSink component
MATCH (component:KitchenSinkComponent {name: "[COMPONENT_NAME]"})
MATCH (impl1:Implementation {name: "[IMPLEMENTATION_1_NAME]"})
MATCH (impl2:Implementation {name: "[IMPLEMENTATION_2_NAME]"})

// Create implementation comparison relationships
CREATE (impl1)-[:INTEGRATES_WITH {
  description: "[INTEGRATION_DESCRIPTION]",
  interfacePoints: ["[INTERFACE_1]", "[INTERFACE_2]", /* additional interfaces */],
  performanceProfile: "[PERFORMANCE_PROFILE]",
  comparisonId: "[COMPARISON_ID]" // Use same ID for both to link the comparisons
}]->(component)

CREATE (impl2)-[:INTEGRATES_WITH {
  description: "[INTEGRATION_DESCRIPTION]",
  interfacePoints: ["[INTERFACE_1]", "[INTERFACE_2]", /* additional interfaces */],
  performanceProfile: "[PERFORMANCE_PROFILE]",
  comparisonId: "[COMPARISON_ID]" // Use same ID for both to link the comparisons
}]->(component)

// Hybrid Method Creation (if applicable)
// Use this to document a hybrid method combining elements of both methods

// Create the hybrid method node
CREATE (hybrid:NumericalMethod {
  name: "[HYBRID_METHOD_NAME]",
  description: "[HYBRID_DESCRIPTION]",
  category: "Hybrid Method",
  components: ["[METHOD_1_NAME]", "[METHOD_2_NAME]"],
  hybridStrategy: "[HYBRIDIZATION_STRATEGY]", // e.g., "Domain decomposition", "Sequential application"
  advantageOverComponents: ["[ADVANTAGE_1]", "[ADVANTAGE_2]", /* additional advantages */],
  implementationComplexity: "[COMPLEXITY_LEVEL]", // e.g., "High", "Moderate", "Low"
  developmentStatus: "[STATUS]", // e.g., "Conceptual", "In development", "Implemented"
  referenceFile: "[FILE_PATH]", // Path to hybrid method documentation
  tags: ["hybrid", "[TAG_1]", "[TAG_2]", /* additional tags */]
})

// Connect hybrid to component methods
MATCH (hybrid:NumericalMethod {name: "[HYBRID_METHOD_NAME]"})
MATCH (method1:NumericalMethod {name: "[METHOD_1_NAME]"})
MATCH (method2:NumericalMethod {name: "[METHOD_2_NAME]"})

CREATE (hybrid)-[:COMBINES {
  description: "[COMBINATION_DESCRIPTION]",
  componentRole: "[METHOD_1_ROLE]" // e.g., "Used for smooth regions"
}]->(method1)

CREATE (hybrid)-[:COMBINES {
  description: "[COMBINATION_DESCRIPTION]",
  componentRole: "[METHOD_2_ROLE]" // e.g., "Used for interfaces"
}]->(method2)
