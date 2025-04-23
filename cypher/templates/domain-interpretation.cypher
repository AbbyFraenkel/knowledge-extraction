// Domain Interpretation Template
// Use this template to create relationships between mathematical symbols and their domain-specific interpretations
// Replace all placeholders with appropriate values
//
// Purpose: Enable cross-domain mapping between pure mathematical concepts and their engineering interpretations

// =========================================================================
// HAS_INTERPRETATION_IN RELATIONSHIP CREATION
// =========================================================================

// Basic Domain Interpretation Relationship
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[MATHEMATICAL_CONTEXT]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  // Basic interpretation properties
  meaning: "[DOMAIN_SPECIFIC_MEANING]",            // Domain-specific meaning of the symbol
  standardUsage: "[STANDARD_USAGE_IN_DOMAIN]",     // Common usage pattern in this domain
  units: "[DOMAIN_SPECIFIC_UNITS]",                // Physical units in this domain (SI preferred)
  
  // Enhanced mapping metadata
  mappingType: "[MAPPING_TYPE]",                   // E.g., "Direct", "Analogous", "Derived"
  mappingDescription: "[DETAILED_DESCRIPTION]",    // Detailed explanation of the mapping
  mappingFormula: "[MATHEMATICAL_RELATIONSHIP]",   // Formula relating to mathematical concept
  
  // Domain-specific properties
  typicalValues: "[TYPICAL_VALUE_RANGE]",          // Typical values in this domain
  industryStandards: "[RELEVANT_STANDARDS]",       // Any industry standards or conventions
  experimentalBasis: "[EXPERIMENTAL_FOUNDATION]",  // Experimental basis for this interpretation
  
  // Cross-reference information
  mappingSource: "[SOURCE_OF_MAPPING]",            // Source establishing this mapping
  mappingNotes: "[ADDITIONAL_NOTES]",              // Additional notes about the mapping
  conversionFactors: ["[CONVERSION_FACTOR_1]"]     // Factors for converting between domains
}]->(domain)

// =========================================================================
// DOMAIN-SPECIFIC IMPLEMENTATION
// =========================================================================

// Connect Symbol to Implementation Variable
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[MATHEMATICAL_CONTEXT]"})
MATCH (impl:Implementation {name: "[IMPLEMENTATION_NAME]"})
CREATE (sym)-[:IMPLEMENTED_AS {
  variableName: "[CODE_VARIABLE_NAME]",             // Name in code implementation
  variableType: "[CODE_TYPE]",                      // Type in implementation language
  moduleLocation: "[MODULE_PATH]",                  // Location in code structure
  implementationNotes: "[IMPLEMENTATION_DETAILS]",  // Notes about implementation choices
  validityConstraints: "[VALIDITY_CONSTRAINTS]"     // Constraints on valid values
}]->(impl)

// =========================================================================
// KITCHENSINK-SPECIFIC DOMAIN MAPPING
// =========================================================================

// For KitchenSink solver symbols
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[MATHEMATICAL_CONTEXT]"})
MATCH (kitchenSink:Implementation {name: "KitchenSink"})
CREATE (sym)-[:IMPLEMENTED_AS {
  variableName: "[JULIA_VARIABLE_NAME]",            // Julia variable name
  variableType: "[JULIA_TYPE]",                     // Julia type (e.g., Float64, Array{Float64,2})
  moduleLocation: "[KITCHENSINK_MODULE]",           // Module in KitchenSink
  numericalConsiderations: "[NUMERICAL_NOTES]",     // Notes on numerical behavior
  boundaryBehavior: "[BOUNDARY_HANDLING]",          // How boundaries are handled
  convergenceProperties: "[CONVERGENCE_NOTES]",     // Notes on convergence properties
  discretizationStrategy: "[DISCRETIZATION_METHOD]" // How the symbol is discretized
}]->(kitchenSink)

// =========================================================================
// PASTEURIZATION-SPECIFIC DOMAIN MAPPING
// =========================================================================

// For pasteurization application symbols
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[MATHEMATICAL_CONTEXT]"})
MATCH (pasteurization:ApplicationDomain {name: "Pasteurization"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "[PASTEURIZATION_MEANING]",              // Meaning in pasteurization context
  units: "[INDUSTRY_UNITS]",                        // Units used in brewing industry
  typicalValues: "[INDUSTRY_VALUE_RANGE]",          // Typical values in pasteurization
  measurementMethod: "[MEASUREMENT_TECHNIQUE]",     // How measured or determined
  processRelevance: "[PROCESS_RELEVANCE]",          // Relevance to pasteurization process
  qualityImpact: "[QUALITY_IMPACT]",                // Impact on product quality
  regulatoryImportance: "[REGULATORY_NOTES]",       // Relevance to industry regulations
  experimentalDetermination: "[EXPERIMENTAL_BASIS]" // How determined experimentally
}]->(pasteurization)

// =========================================================================
// CROSS-DOMAIN MAPPING RELATIONSHIP
// =========================================================================

// Connect equivalent symbols across domains
MATCH 
  (mathSym:Symbol {name: "[MATH_SYMBOL]", context: "[MATH_CONTEXT]"}),
  (engSym:Symbol {name: "[ENG_SYMBOL]", context: "[ENG_CONTEXT]"})
CREATE (mathSym)-[:EQUIVALENT_TO {
  mappingContext: "[MAPPING_CONTEXT]",              // When this equivalence applies
  mappingEquation: "[RELATIONSHIP_EQUATION]",       // Mathematical relationship
  contextualConstraints: "[CONSTRAINTS]",           // When the mapping is valid
  mappingSource: "[EQUIVALENCE_SOURCE]",            // Source of this mapping
  mappingNotes: "[EQUIVALENCE_NOTES]",              // Additional notes on equivalence
  preferredCrossReference: "[PREFERRED_REFERENCE]"  // How to refer to this across domains
}]->(engSym)

// =========================================================================
// EXAMPLE: THERMAL DIFFUSIVITY
// =========================================================================

/*
// Mathematical symbol: α in heat equation
MATCH (alpha:Symbol {name: "α", context: "Heat equation"})
MATCH (thermalDomain:ApplicationDomain {name: "Thermal Engineering"})
CREATE (alpha)-[:HAS_INTERPRETATION_IN {
  // Basic interpretation
  meaning: "Thermal diffusivity",
  standardUsage: "Material property in heat transfer calculations",
  units: "m²/s",
  
  // Enhanced mapping
  mappingType: "Direct",
  mappingDescription: "Direct interpretation as ratio of thermal conductivity to volumetric heat capacity",
  mappingFormula: "α = k/(ρ·cp)",
  
  // Domain properties
  typicalValues: "0.14×10⁻⁶ m²/s (water) to 170×10⁻⁶ m²/s (silver)",
  industryStandards: "ASTM E1461 for measurement standards",
  experimentalBasis: "Determined via transient heat transfer experiments",
  
  // Cross-reference
  mappingSource: "Carslaw and Jaeger (1959), 'Conduction of Heat in Solids'",
  mappingNotes: "Fundamental parameter in transient heat conduction",
  conversionFactors: ["1 m²/s = 10.764 ft²/s"]
}]->(thermalDomain)

// Connect to KitchenSink implementation
MATCH (alpha:Symbol {name: "α", context: "Heat equation"})
MATCH (kitchenSink:Implementation {name: "KitchenSink"})
CREATE (alpha)-[:IMPLEMENTED_AS {
  variableName: "thermal_diffusivity",
  variableType: "Float64",
  moduleLocation: "ThermalModels.jl",
  numericalConsiderations: "Must be positive for stability of heat equation",
  boundaryBehavior: "Affects boundary layer thickness in convection problems",
  convergenceProperties: "Affects time step restrictions in explicit methods (Δt ≤ C·Δx²/α)",
  discretizationStrategy: "Parameter in discrete heat equation operator"
}]->(kitchenSink)

// Connect to pasteurization application
MATCH (alpha:Symbol {name: "α", context: "Heat equation"})
MATCH (pasteurization:ApplicationDomain {name: "Pasteurization"})
CREATE (alpha)-[:HAS_INTERPRETATION_IN {
  meaning: "Thermal diffusivity of beer or container material",
  units: "m²/s",
  typicalValues: "1.4×10⁻⁷ m²/s (beer), 8.4×10⁻⁵ m²/s (stainless steel)",
  measurementMethod: "Calculated from k, ρ, cp measurements or from heating curve analysis",
  processRelevance: "Determines heating and cooling rates in pasteurization tunnel",
  qualityImpact: "Affects temperature uniformity and pasteurization consistency",
  regulatoryImportance: "Indirectly affects PU calculation for food safety compliance",
  experimentalDetermination: "Determined from heating curve analysis of packaged product"
}]->(pasteurization)
*/

// =========================================================================
// EXAMPLE: MOVING BOUNDARY POSITION
// =========================================================================

/*
// Mathematical symbol: s(t) in moving boundary problem
MATCH (s:Symbol {name: "s(t)", context: "Moving boundary"})
MATCH (processDomain:ApplicationDomain {name: "Process Engineering"})
CREATE (s)-[:HAS_INTERPRETATION_IN {
  // Basic interpretation
  meaning: "Position of moving interface or boundary",
  standardUsage: "Key unknown in Stefan problems",
  units: "m",
  
  // Enhanced mapping
  mappingType: "Direct",
  mappingDescription: "Position of phase change interface as a function of time",
  mappingFormula: "Energy balance at interface: k₁∇T₁·n - k₂∇T₂·n = ρLs'(t)",
  
  // Domain properties
  typicalValues: "Millimeters to centimeters in most engineering applications",
  industryStandards: "No specific standard, application-dependent",
  experimentalBasis: "Measured via imaging techniques or temperature sensors",
  
  // Cross-reference
  mappingSource: "Crank (1984), 'Free and Moving Boundary Problems'",
  mappingNotes: "Central unknown in Stefan problem formulation",
  conversionFactors: ["1 m = 39.37 inches"]
}]->(processDomain)

// Connect to KitchenSink implementation
MATCH (s:Symbol {name: "s(t)", context: "Moving boundary"})
MATCH (kitchenSink:Implementation {name: "KitchenSink"})
CREATE (s)-[:IMPLEMENTED_AS {
  variableName: "moving_boundary_position",
  variableType: "Vector{Float64}",
  moduleLocation: "MovingBoundary.jl",
  numericalConsiderations: "Tracked using level set or ALE methods",
  boundaryBehavior: "Requires special treatment at interfaces",
  convergenceProperties: "Requires higher resolution near boundary for accuracy",
  discretizationStrategy: "Tracked explicitly or via implicit level set function"
}]->(kitchenSink)

// Connect to pasteurization application
MATCH (s:Symbol {name: "s(t)", context: "Moving boundary"})
MATCH (pasteurization:ApplicationDomain {name: "Pasteurization"})
CREATE (s)-[:HAS_INTERPRETATION_IN {
  meaning: "Interface between pasteurized and unpasteurized zones in beer",
  units: "m",
  typicalValues: "Varies based on container geometry and process conditions",
  measurementMethod: "Inferred from temperature measurements or PU calculations",
  processRelevance: "Determines progression of pasteurization through the product",
  qualityImpact: "Affects product quality uniformity",
  regulatoryImportance: "Critical for ensuring complete pasteurization",
  experimentalDetermination: "Estimated using PU accumulation patterns"
}]->(pasteurization)
*/

// =========================================================================
// USAGE GUIDELINES
// =========================================================================

// 1. Create domain interpretation relationships for all significant symbols that have 
//    specific meanings in application domains
//
// 2. Be precise about units, typical values, and domain-specific contexts
//
// 3. Use detailed mapping descriptions to explain the relationship between mathematical
//    concept and domain interpretation
//
// 4. Document implementation details for symbols that are directly implemented in code
//
// 5. When a symbol has multiple interpretations across domains, create separate
//    HAS_INTERPRETATION_IN relationships for each domain
//
// 6. When symbols across domains are equivalent, use the EQUIVALENT_TO relationship
//    to connect them directly
