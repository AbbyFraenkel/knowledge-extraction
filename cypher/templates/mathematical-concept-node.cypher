// Mathematical Concept Node Template
// Use this template to create MathematicalConcept nodes in the knowledge graph
// Replace all placeholders with appropriate values
//
// Special focus: Optimized for the Knowledge Extraction System with emphasis on
// Symbol-Concept Separation and tiered knowledge organization

// Basic Mathematical Concept Node Creation
CREATE (concept:MathematicalConcept {
  name: "[CONCEPT_NAME]",  // Name of the mathematical concept
  description: "[DESCRIPTION]",  // Brief description of the concept (L1 tier, 100-200 words)
  domain: "[MATHEMATICAL_DOMAIN]",  // Primary mathematical domain (e.g., "Numerical Analysis", "Linear Algebra")
  subdomain: "[SUBDOMAIN]",  // Specific subdomain (e.g., "Spectral Methods", "Finite Elements")
  
  // Optional properties - include all that apply
  fundamentalPrinciples: ["[PRINCIPLE_1]", "[PRINCIPLE_2]"],  // Core principles underlying the concept
  mathematicalProperties: ["[PROPERTY_1]", "[PROPERTY_2]"],  // Key mathematical properties
  keyEquations: ["[EQUATION_1]", "[EQUATION_2]"],  // Important equations related to the concept
  theoreticalFoundation: "[FOUNDATION]",  // Theoretical basis
  historicalContext: "[HISTORY]",  // Historical development context
  alternateForms: ["[FORM_1]", "[FORM_2]"],  // Alternative formulations
  paperSources: ["[PAPER_REF]"],  // References to papers
  taxonomyLevel: "[LEVEL]",  // Position in concept hierarchy (e.g., "Fundamental", "Derived", "Application-specific")
  formalDefinition: "[DEFINITION]",  // Formal mathematical definition
  
  // Tiered knowledge organization properties
  tierL1: "[CORE_KNOWLEDGE]",  // Essential definition (100-200 words)
  tierL2File: "[DETAILED_KNOWLEDGE_FILE]",  // File reference for L2 tier (500-1000 words)
  tierL3File: "[COMPLETE_KNOWLEDGE_FILE]"  // File reference for L3 tier (2000+ words)
})

// Connect to Parent Concepts
MATCH (parent:MathematicalConcept {name: "[PARENT_CONCEPT]"})
CREATE (concept)-[:SPECIALIZES {
  nature: "[SPECIALIZATION_NATURE]",  // How this concept specializes the parent
  constraints: ["[CONSTRAINT_1]", "[CONSTRAINT_2]"]  // Additional constraints imposed by specialization
}]->(parent)

// Connect to Related Concepts
MATCH (related:MathematicalConcept {name: "[RELATED_CONCEPT]"})
CREATE (concept)-[:RELATES_TO {
  relationship: "[RELATIONSHIP_NATURE]",  // Nature of the relationship
  mathematicalBasis: "[BASIS]"  // Mathematical basis for the relationship
}]->(related)

// Connect from Numerical Methods
MATCH (method:NumericalMethod {name: "[METHOD_NAME]"})
CREATE (method)-[:IMPLEMENTS {
  completeness: "[COMPLETENESS]",  // How completely the method implements the concept
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]"]  // Adaptations made in implementation
}]->(concept)

// Connect to Application Domains
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (concept)-[:APPLIES_TO {
  relevance: "[RELEVANCE]",  // Relevance to this domain
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]"]  // Domain-specific adaptations
}]->(domain)

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Orthogonal Collocation Concept (Relevant to KitchenSink)
/*
CREATE (oc:MathematicalConcept {
  name: "OrthogonalCollocation",
  description: "A spectral method that approximates solutions using orthogonal polynomials and enforces equations at collocation points",
  domain: "NumericalAnalysis",
  subdomain: "SpectralMethods",
  fundamentalPrinciples: [
    "Orthogonal polynomial expansion",
    "Collocation (point-wise equation satisfaction)",
    "Spectral convergence for smooth functions"
  ],
  mathematicalProperties: [
    "Exponential convergence for analytic functions",
    "Exact derivative representation at collocation points",
    "High accuracy per degree of freedom"
  ],
  keyEquations: [
    "u(x) ≈ ∑ᵢ uᵢ ℓᵢ(x) where ℓᵢ(x) are Lagrange interpolation polynomials",
    "ℓᵢ(xⱼ) = δᵢⱼ (Kronecker delta property)"
  ],
  theoreticalFoundation: "Approximation theory for orthogonal polynomials",
  historicalContext: "Developed in the 1970s, building on earlier spectral methods",
  paperSources: ["Villadsen1978", "Finlayson1972"],
  
  // Tiered knowledge organization
  tierL1: "Orthogonal collocation is a spectral method that approximates solutions to differential equations using orthogonal polynomials as basis functions and enforces the equations at specific collocation points. It achieves exponential convergence for smooth problems and is particularly effective for high-precision solutions with relatively few degrees of freedom.",
  tierL2File: "/projects/git/extracted-content-markdown/numerical-methods/orthogonal-collocation/orthogonal_collocation_L2.md",
  tierL3File: "/projects/git/extracted-content-markdown/numerical-methods/orthogonal-collocation/orthogonal_collocation_L3.md"
})

// Connect to parent concept
MATCH (mwr:MathematicalConcept {name: "MethodOfWeightedResiduals"})
CREATE (oc)-[:SPECIALIZES {
  nature: "Specific choice of basis and test functions",
  constraints: ["Requires evaluation points at collocation points", "Typically uses orthogonal polynomial basis"]
}]->(mwr)

// Connect to related concept
MATCH (sm:MathematicalConcept {name: "SpectralMethods"})
CREATE (oc)-[:RELATES_TO {
  relationship: "Specific type of spectral method",
  mathematicalBasis: "Both use global basis functions with spectral convergence properties"
}]->(sm)

// Connect from numerical method
MATCH (goc:NumericalMethod {name: "GaussianOrthogonalCollocation"})
CREATE (goc)-[:IMPLEMENTS {
  completeness: "Complete implementation",
  adaptations: ["Uses Gaussian quadrature points as collocation points"]
}]->(oc)

// Connect to application domain
MATCH (cfd:ApplicationDomain {name: "ComputationalFluidDynamics"})
CREATE (oc)-[:APPLIES_TO {
  relevance: "High-accuracy solution of Navier-Stokes equations",
  adaptations: ["Domain decomposition for complex geometries", "Stabilization techniques for convection-dominated flows"]
}]->(cfd)
*/

// Example 2: Multi-Level Spectral Collocation Concept (Relevant to KitchenSink)
/*
CREATE (mlsc:MathematicalConcept {
  name: "MultiLevelSpectralCollocation",
  description: "A hierarchical approach to spectral collocation that enables adaptive refinement across multiple resolution levels",
  domain: "NumericalAnalysis",
  subdomain: "SpectralMethods",
  fundamentalPrinciples: [
    "Hierarchical basis functions",
    "Spectral approximation theory",
    "Multi-resolution analysis",
    "Adaptive refinement"
  ],
  mathematicalProperties: [
    "Spectral convergence for smooth regions",
    "Local refinement capability",
    "Hierarchical error estimation",
    "Conservation properties preserved across levels"
  ],
  keyEquations: [
    "Multi-level basis: φᵢⱼᵐ(x) = ℓⱼ(2ᵐx - i) for x ∈ [i/2ᵐ, (i+1)/2ᵐ], 0 elsewhere",
    "Level m approximation: uᵐ(x) = ∑ᵢ∑ⱼ cᵢⱼᵐ φᵢⱼᵐ(x)",
    "Error estimate: εᵐ = ||uᵐ⁺¹ - uᵐ||"
  ],
  theoreticalFoundation: "Combination of spectral collocation and multi-resolution analysis",
  paperSources: ["Smith2023"],
  
  // Tiered knowledge organization
  tierL1: "Multi-level spectral collocation is a hierarchical approach that combines the spectral accuracy of orthogonal collocation with the adaptivity of multi-resolution analysis. It enables local refinement by overlaying higher-resolution elements over base approximations, maintaining spectral convergence in smooth regions while efficiently handling localized features.",
  tierL2File: "/projects/git/extracted-content-markdown/numerical-methods/multi-level-methods/multi_level_spectral_collocation_L2.md",
  tierL3File: "/projects/git/extracted-content-markdown/numerical-methods/multi-level-methods/multi_level_spectral_collocation_L3.md"
})

MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (mlsc)-[:SPECIALIZES {
  nature: "Extends to hierarchical multi-level structure",
  constraints: ["Requires proper inter-level communication", "Needs error estimation between levels"]
}]->(oc)

MATCH (mra:MathematicalConcept {name: "MultiResolutionAnalysis"})
CREATE (mlsc)-[:RELATES_TO {
  relationship: "Applies similar hierarchical decomposition principles",
  mathematicalBasis: "Both use hierarchical basis functions with different resolutions"
}]->(mra)

MATCH (ksmlo:NumericalMethod {name: "KitchenSinkMultiLevelOrthogonalCollocation"})
CREATE (ksmlo)-[:IMPLEMENTS {
  completeness: "Complete implementation with hp-adaptivity",
  adaptations: ["Refinement by superposition", "Automatic error estimation", "Type-based implementation"]
}]->(mlsc)

MATCH (pde:ApplicationDomain {name: "MovingBoundaryProblems"})
CREATE (mlsc)-[:APPLIES_TO {
  relevance: "Efficient handling of moving interfaces",
  adaptations: ["Dynamic refinement near interfaces", "Conservation properties across domain transformations"]
}]->(pde)
*/

// Example 3: Moving Boundary Transformation Concept (Relevant to KitchenSink and Pasteurization)
/*
CREATE (mbt:MathematicalConcept {
  name: "MovingBoundaryTransformation",
  description: "A mathematical technique that transforms problems with moving boundaries to equivalent problems on fixed domains",
  domain: "PartialDifferentialEquations",
  subdomain: "BoundaryTransformMethods",
  fundamentalPrinciples: [
    "Coordinate transformation",
    "Fixed computational domain",
    "Transformed governing equations",
    "Boundary evolution equations"
  ],
  mathematicalProperties: [
    "Preserves solution properties",
    "Introduces additional terms in governing equations",
    "Maps physical space to computational space"
  ],
  keyEquations: [
    "Coordinate transformation: x = η·s(t) for domain [0, s(t)] → [0, 1]",
    "Transformed derivative: ∂u/∂x = (1/s(t))·∂u/∂η",
    "Transformed time derivative: ∂u/∂t = ∂u/∂t|η - (η/s)·(ds/dt)·∂u/∂η"
  ],
  paperSources: ["Stefan1891", "ModernReference2015"],
  
  // Tiered knowledge organization
  tierL1: "Moving boundary transformation is a mathematical technique that maps problems with time-dependent domains to equivalent problems on fixed domains through coordinate transformations. This enables the application of standard numerical methods by transforming the governing equations to account for the domain movement, at the cost of introducing additional nonlinear terms.",
  tierL2File: "/projects/git/extracted-content-markdown/numerical-methods/boundary-transform/moving_boundary_transformation_L2.md",
  tierL3File: "/projects/git/extracted-content-markdown/numerical-methods/boundary-transform/moving_boundary_transformation_L3.md"
})

MATCH (pde:MathematicalConcept {name: "PartialDifferentialEquations"})
CREATE (mbt)-[:SPECIALIZES {
  nature: "Specialized technique for PDEs with moving domains",
  constraints: ["Requires explicit boundary position function", "Additional terms increase complexity"]
}]->(pde)

MATCH (ct:MathematicalConcept {name: "CoordinateTransformation"})
CREATE (mbt)-[:RELATES_TO {
  relationship: "Applies transformation techniques to moving domains",
  mathematicalBasis: "Both involve mapping between coordinate systems"
}]->(ct)

MATCH (mloc:NumericalMethod {name: "MultiLevelOrthogonalCollocationForMovingBoundaries"})
CREATE (mloc)-[:IMPLEMENTS {
  completeness: "Implementation with adaptive refinement",
  adaptations: ["Spectral discretization of transformed equations", "Multi-level refinement near moving boundary"]
}]->(mbt)

MATCH (past:ApplicationDomain {name: "TunnelPasteurization"})
CREATE (mbt)-[:APPLIES_TO {
  relevance: "Modeling pasteurization front movement in containers",
  adaptations: ["Temperature-dependent phase transition", "Container-specific geometry handling"]
}]->(past)
*/

// ------------------------------
// ADDITIONAL GUIDANCE
// ------------------------------

// Concept Node Best Practices:
// 1. Focus exclusively on the mathematical meaning, independent of notation
// 2. Maintain strict separation from Symbol nodes - concepts should never include specific symbols
// 3. Use the REPRESENTS relationship from symbols to concepts, never embed symbols in concepts
// 4. Leverage the tiered knowledge organization (L1, L2, L3) for efficient context window usage
// 5. Include comprehensive metadata for robust knowledge graph querying
// 6. Create explicit relationships to establish concept hierarchies and connections
// 7. Document practical application contexts through APPLIES_TO relationships
// 8. Cross-reference implementation strategies through IMPLEMENTS relationships

// Tips for KitchenSink Integration:
// 1. Ensure concepts relevant to KitchenSink (orthogonal collocation, multi-level methods, etc.) are well-documented
// 2. Establish clear relationships between mathematical concepts and implementation strategies
// 3. Document type system connections through appropriate relationships
// 4. Capture mathematical properties that influence implementation choices
// 5. Reference paper sources that inform KitchenSink implementation

// Implementation Note:
// This template complements the symbol-node.cypher template, which focuses on mathematical notation.
// Together, they implement the Symbol-Concept Separation principle, allowing the same concept to have
// multiple symbolic representations while maintaining clear relationships between them.