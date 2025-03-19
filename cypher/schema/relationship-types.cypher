// Knowledge Graph Schema: Relationship Type Definitions
// This file defines the core relationship types for the knowledge extraction system

// Mathematical Foundation Relationships

// BASED_ON: Indicates one concept is derived from or based on another
// Properties:
// - description: String - Describes how the source is based on the target
// - significance: String - Importance of this relationship
// - paperReference: String - Source paper documenting the relationship
//
// Example:
// MATCH (a:MathematicalConcept {name: "Orthogonal Collocation"})
// MATCH (b:MathematicalConcept {name: "Spectral Methods"})
// CREATE (a)-[:BASED_ON {
//   description: "Orthogonal collocation is a specialized form of spectral methods using collocation points",
//   significance: "Direct specialization",
//   paperReference: "Finlayson (1972)"
// }]->(b)

// PREREQUISITE_FOR: Indicates one concept is required to understand another
// Properties:
// - description: String - Why this is a prerequisite
// - essentiality: String - How essential this knowledge is
//
// Example:
// MATCH (a:MathematicalConcept {name: "Orthogonal Polynomials"})
// MATCH (b:MathematicalConcept {name: "Spectral Methods"})
// CREATE (a)-[:PREREQUISITE_FOR {
//   description: "Understanding orthogonal polynomials is necessary for comprehending spectral methods",
//   essentiality: "Core prerequisite"
// }]->(b)

// GENERALIZES: Indicates one concept is a generalization of another
// Properties:
// - description: String - How the generalization works
// - contextLimitations: String - Limitations to the generalization
//
// Example:
// MATCH (a:MathematicalConcept {name: "Differential Equations"})
// MATCH (b:MathematicalConcept {name: "Ordinary Differential Equations"})
// CREATE (a)-[:GENERALIZES {
//   description: "Differential equations encompass all equation types involving derivatives",
//   contextLimitations: "Preserves the differential nature but includes PDEs and other types"
// }]->(b)

// Algorithm Relationships

// IMPLEMENTS: Indicates an algorithm implements a mathematical concept or method
// Properties:
// - description: String - How the implementation works
// - completeness: String - How completely the concept is implemented
// - adaptations: [String] - Any adaptations made
//
// Example:
// MATCH (a:Algorithm {name: "Adaptive Spectral Element Algorithm"})
// MATCH (b:NumericalMethod {name: "Spectral Element Method"})
// CREATE (a)-[:IMPLEMENTS {
//   description: "Implementation of spectral element method with adaptive refinement",
//   completeness: "Full implementation with extensions",
//   adaptations: ["Adaptive refinement", "Error estimation"]
// }]->(b)

// IMPROVES_UPON: Indicates an algorithm improves upon another
// Properties:
// - improvements: [String] - Specific improvements made
// - tradeoffs: [String] - Any tradeoffs involved
// - magnitude: String - Significance of improvement
//
// Example:
// MATCH (a:Algorithm {name: "Adaptive Spectral Element Algorithm"})
// MATCH (b:Algorithm {name: "Standard Spectral Element Algorithm"})
// CREATE (a)-[:IMPROVES_UPON {
//   improvements: ["Better convergence in irregular domains", "Automatic refinement"],
//   tradeoffs: ["Higher computational overhead", "More complex implementation"],
//   magnitude: "Significant improvement for complex geometries"
// }]->(b)

// USES: Indicates an algorithm uses another algorithm as a component
// Properties:
// - description: String - How the algorithm is used
// - integration: String - Integration approach
// - modifications: [String] - Any modifications made
//
// Example:
// MATCH (a:Algorithm {name: "Adaptive Spectral Element Algorithm"})
// MATCH (b:Algorithm {name: "Error Estimation Algorithm"})
// CREATE (a)-[:USES {
//   description: "Uses error estimation to guide adaptive refinement",
//   integration: "Called after each solution step",
//   modifications: ["Customized for spectral element context"]
// }]->(b)

// Application Relationships

// APPLIES_TO: Indicates a method or algorithm applies to a domain
// Properties:
// - description: String - How it applies
// - effectiveness: String - How effective it is
// - limitations: [String] - Domain-specific limitations
//
// Example:
// MATCH (a:NumericalMethod {name: "Spectral Element Method"})
// MATCH (b:ApplicationDomain {name: "Heat Transfer Modeling"})
// CREATE (a)-[:APPLIES_TO {
//   description: "Effective for heat transfer problems with complex geometries",
//   effectiveness: "High accuracy with moderate element count",
//   limitations: ["Challenges with phase boundaries", "Computationally intensive"]
// }]->(b)

// SPECIALIZED_FOR: Indicates something is specially adapted for a domain
// Properties:
// - adaptations: [String] - Specific adaptations
// - benefits: [String] - Domain-specific benefits
// - development: String - How the specialization was developed
//
// Example:
// MATCH (a:Algorithm {name: "Phase-Field Spectral Method"})
// MATCH (b:ApplicationDomain {name: "Tunnel Pasteurization"})
// CREATE (a)-[:SPECIALIZED_FOR {
//   adaptations: ["Modified for food product phase changes", "Thermal property handling"],
//   benefits: ["Accurate pasteurization time prediction", "Better safety margin estimation"],
//   development: "Developed through experimental validation with beer containers"
// }]->(b)

// Implementation Relationships

// CODED_IN: Indicates the language an implementation uses
// Properties:
// - version: String - Language version
// - paradigm: String - Programming paradigm used
// - ecosystem: [String] - Related libraries/frameworks
//
// Example:
// MATCH (a:Implementation {name: "KitchenSink_SpectralCollocation"})
// MATCH (b:ProgrammingLanguage {name: "Julia"})
// CREATE (a)-[:CODED_IN {
//   version: "1.8+",
//   paradigm: "Multiple dispatch, parametric types",
//   ecosystem: ["SciML", "DifferentialEquations.jl", "ModelingToolkit.jl"]
// }]->(b)

// INTEGRATES_WITH: Indicates integration with another component or system
// Properties:
// - description: String - Integration approach
// - interfacePoints: [String] - Specific interface points
// - dataFlow: String - How data flows between components
//
// Example:
// MATCH (a:Implementation {name: "AdaptiveRefinement"})
// MATCH (b:KitchenSinkComponent {name: "CoreSolver"})
// CREATE (a)-[:INTEGRATES_WITH {
//   description: "Plugs into CoreSolver as a refinement strategy",
//   interfacePoints: ["PostStepCallback", "ErrorEstimationInterface"],
//   dataFlow: "Receives solution, returns refinement instructions"
// }]->(b)

// Documentation Relationships

// DOCUMENTS: Indicates documentation of a concept, algorithm, etc.
// Properties:
// - documentationType: String - Type of documentation
// - completeness: String - Documentation completeness
// - audience: String - Intended audience
//
// Example:
// MATCH (a:Document {name: "SpectralElementMethod_Guide"})
// MATCH (b:NumericalMethod {name: "Spectral Element Method"})
// CREATE (a)-[:DOCUMENTS {
//   documentationType: "Technical guide",
//   completeness: "Comprehensive",
//   audience: "Computational scientists"
// }]->(b)

// REFERENCES: Indicates a reference to another entity
// Properties:
// - context: String - Context of the reference
// - importance: String - Importance of the reference
// - section: String - Section where the reference appears
//
// Example:
// MATCH (a:Paper {id: "Smith2022"})
// MATCH (b:Paper {id: "Johnson2020"})
// CREATE (a)-[:REFERENCES {
//   context: "Comparison of methods",
//   importance: "Critical evaluation",
//   section: "Related Work"
// }]->(b)

// Testing Relationships

// VALIDATES: Indicates a test case validates an algorithm or implementation
// Properties:
// - validationType: String - Type of validation
// - accuracy: String - Achieved accuracy
// - coverage: [String] - Aspects covered by validation
//
// Example:
// MATCH (a:TestCase {name: "HeatedCylinder"})
// MATCH (b:Algorithm {name: "Adaptive Spectral Element Algorithm"})
// CREATE (a)-[:VALIDATES {
//   validationType: "Convergence test",
//   accuracy: "Exponential convergence demonstrated",
//   coverage: ["Heat equation", "Cylindrical geometry", "Dirichlet boundary conditions"]
// }]->(b)

// Domain-specific Relationships

// MODELS: Indicates an entity models a physical phenomenon
// Properties:
// - accuracy: String - Modeling accuracy
// - assumptions: [String] - Key assumptions
// - validationStatus: String - Validation status
//
// Example:
// MATCH (a:HeatTransferModel {name: "BeerContainerModel"})
// MATCH (b:PhysicalPhenomenon {name: "Pasteurization"})
// CREATE (a)-[:MODELS {
//   accuracy: "±2°C core temperature",
//   assumptions: ["Axisymmetric geometry", "Temperature-dependent properties"],
//   validationStatus: "Validated against experimental data"
// }]->(b)

// SIMULATES: Indicates an implementation simulates a process
// Properties:
// - fidelity: String - Simulation fidelity
// - performance: String - Computational performance
// - limitations: [String] - Simulation limitations
//
// Example:
// MATCH (a:Implementation {name: "TunnelPasteurizationSolver"})
// MATCH (b:IndustrialProcess {name: "BeerPasteurization"})
// CREATE (a)-[:SIMULATES {
//   fidelity: "High fidelity thermal profile",
//   performance: "Real-time simulation capability",
//   limitations: ["Simplified container geometry", "Approximate spray modeling"]
// }]->(b)

// Contextualizing Relationships

// HISTORICAL_CONTEXT: Provides historical context between entities
// Properties:
// - relationship: String - Historical relationship
// - significance: String - Historical significance
// - timeline: String - Relevant timeline
//
// Example:
// MATCH (a:NumericalMethod {name: "Orthogonal Collocation"})
// MATCH (b:NumericalMethod {name: "Finite Element Method"})
// CREATE (a)-[:HISTORICAL_CONTEXT {
//   relationship: "Developed contemporaneously in different fields",
//   significance: "Represents convergence of engineering and mathematics approaches",
//   timeline: "Both emerged in mature form in 1970s"
// }]->(b)

// THEORETICAL_CONNECTION: Indicates a theoretical link between entities
// Properties:
// - nature: String - Nature of the connection
// - strength: String - Strength of connection
// - implications: [String] - Theoretical implications
//
// Example:
// MATCH (a:MathematicalConcept {name: "Orthogonal Polynomials"})
// MATCH (b:MathematicalConcept {name: "Approximation Theory"})
// CREATE (a)-[:THEORETICAL_CONNECTION {
//   nature: "Foundation relationship",
//   strength: "Fundamental",
//   implications: ["Convergence properties", "Error bounds", "Optimality principles"]
// }]->(b)
