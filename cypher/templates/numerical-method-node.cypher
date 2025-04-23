// Numerical Method Node Template
// Use this template to create NumericalMethod nodes in the knowledge graph
// Replace all placeholders with appropriate values

// Basic Numerical Method Node Creation
CREATE (method:NumericalMethod {
  name: "[METHOD_NAME]",  // Name of the numerical method
  description: "[DESCRIPTION]",  // Brief description of the method
  category: "[METHOD_CATEGORY]",  // Category (e.g., "Spectral", "Finite Difference", "Finite Element")
  primaryApproach: "[APPROACH]",  // Primary numerical approach (e.g., "Collocation", "Galerkin", "Finite Volume")
  
  // Optional properties - include all that apply
  mathematicalFormulation: {  // Mathematical formulation details
    discretizationType: "[DISCRETIZATION_TYPE]",  // E.g., "Spatial", "Temporal", "Space-time"
    equationType: "[EQUATION_TYPE]",  // E.g., "Algebraic", "ODE", "PDE", "Integral"
    solutionRepresentation: "[REPRESENTATION]"  // E.g., "Polynomial", "Piecewise linear", "Wavelet"
  },
  convergenceProperties: {  // Convergence characteristics
    orderOfAccuracy: "[ORDER]",  // E.g., "First-order", "Second-order", "Spectral"
    convergenceRate: "[RATE]",  // E.g., "O(h²)", "O(e^-αN)"
    stabilityConditions: ["[CONDITION_1]", "[CONDITION_2]"]  // Stability requirements
  },
  computationalCharacteristics: {  // Computational properties
    computationalComplexity: "[COMPLEXITY]",  // E.g., "O(N log N)", "O(N²)"
    memoryRequirements: "[MEMORY]",  // E.g., "O(N)", "O(N²)"
    parallelizationPotential: "[PARALLEL]"  // E.g., "High", "Medium", "Low"
  },
  strengths: ["[STRENGTH_1]", "[STRENGTH_2]"],  // Key strengths of the method
  limitations: ["[LIMITATION_1]", "[LIMITATION_2]"],  // Key limitations
  applicableProblemTypes: ["[PROBLEM_1]", "[PROBLEM_2]"],  // Types of problems method is suitable for
  historicalContext: "[HISTORY]",  // Historical development context
  paperSources: ["[PAPER_REF]"],  // References to papers
  variants: ["[VARIANT_1]", "[VARIANT_2]"]  // Variants or specializations of the method
})

// Connect to Mathematical Concepts
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (method)-[:IMPLEMENTS {
  completeness: "[COMPLETENESS]",  // How completely the method implements the concept
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]"]  // Adaptations made in implementation
}]->(concept)

// Connect to Parent Methods
MATCH (parent:NumericalMethod {name: "[PARENT_METHOD]"})
CREATE (method)-[:EXTENDS {
  extensions: ["[EXTENSION_1]", "[EXTENSION_2]"],  // Key extensions or modifications
  compatibilityNotes: "[COMPATIBILITY]"  // Notes on compatibility with parent method
}]->(parent)

// Connect to Algorithms
MATCH (algorithm:Algorithm {name: "[ALGORITHM_NAME]"})
CREATE (algorithm)-[:IMPLEMENTS {
  implementationStrategy: "[STRATEGY]",  // Implementation approach
  optimizations: ["[OPTIMIZATION_1]", "[OPTIMIZATION_2]"]  // Implementation-specific optimizations
}]->(method)

// Connect to Application Domains
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (method)-[:APPLIES_TO {
  effectiveness: "[EFFECTIVENESS]",  // Effectiveness in this domain
  adaptations: ["[ADAPTATION_1]", "[ADAPTATION_2]"]  // Domain-specific adaptations
}]->(domain)

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Spectral Collocation Method
/*
CREATE (sc:NumericalMethod {
  name: "SpectralCollocationMethod",
  description: "A high-order method that approximates solutions using global orthogonal polynomials and enforces equations at collocation points",
  category: "Spectral Methods",
  primaryApproach: "Collocation",
  mathematicalFormulation: {
    discretizationType: "Spatial",
    equationType: "PDE",
    solutionRepresentation: "Global orthogonal polynomials"
  },
  convergenceProperties: {
    orderOfAccuracy: "Spectral (exponential for smooth solutions)",
    convergenceRate: "O(e^-αN) for analytic functions",
    stabilityConditions: ["Depends on time integration method", "No spatial CFL condition"]
  },
  computationalCharacteristics: {
    computationalComplexity: "O(N²) for 1D problems, O(N³) for direct solver in 2D",
    memoryRequirements: "O(N²) for collocation matrices",
    parallelizationPotential: "High for matrix assembly, medium for direct solvers"
  },
  strengths: [
    "Highest accuracy per degree of freedom for smooth problems",
    "Exponential convergence for analytic solutions",
    "Minimal numerical dispersion and dissipation",
    "High-order derivative accuracy"
  ],
  limitations: [
    "Limited geometric flexibility",
    "Sensitivity to irregularities in solution",
    "Dense matrices compared to finite difference/element methods",
    "Potential for spurious oscillations near discontinuities (Gibbs phenomenon)"
  ],
  applicableProblemTypes: [
    "Smooth solutions with complex behavior",
    "Problems requiring high accuracy",
    "Wave propagation over long distances/times",
    "Problems on simple geometries"
  ],
  historicalContext: "Developed from spectral methods in the 1970s, building on earlier work in approximation theory",
  paperSources: ["Gottlieb1977", "Canuto1988"],
  variants: ["Chebyshev collocation", "Legendre collocation", "Fourier collocation"]
})
*/

// Example 2: Multi-Level Orthogonal Collocation Method
/*
CREATE (mloc:NumericalMethod {
  name: "MultiLevelOrthogonalCollocation",
  description: "A hierarchical approach to spectral collocation that enables adaptive refinement across multiple resolution levels",
  category: "Spectral Methods",
  primaryApproach: "Multi-Level Collocation",
  mathematicalFormulation: {
    discretizationType: "Spatial with multi-resolution capability",
    equationType: "PDE",
    solutionRepresentation: "Hierarchical orthogonal polynomials across multiple levels"
  },
  convergenceProperties: {
    orderOfAccuracy: "Spectral within each level, adaptive global accuracy",
    convergenceRate: "O(e^-αN) in smooth regions, enhanced for local features",
    stabilityConditions: ["Level-dependent time step restrictions", "Proper inter-level communication"]
  },
  computationalCharacteristics: {
    computationalComplexity: "O(N·L) where L is the number of active levels",
    memoryRequirements: "O(N·L) for sparse multi-level representation",
    parallelizationPotential: "High - levels can be processed in parallel with synchronization points"
  },
  strengths: [
    "Combines spectral accuracy with local refinement capability",
    "Adaptive resolution allocation based on solution features",
    "Efficient representation of multi-scale phenomena",
    "Hierarchical error estimation between levels"
  ],
  limitations: [
    "Increased implementation complexity",
    "Overhead for level management and transitions",
    "More complex parameter tuning than single-level methods",
    "Requires careful handling of inter-level interfaces"
  ],
  applicableProblemTypes: [
    "Problems with localized features or singularities",
    "Multi-scale phenomena",
    "Moving boundaries and interfaces",
    "Solutions requiring adaptive refinement"
  ],
  historicalContext: "Developed as an extension of orthogonal collocation to address limitations with localized features",
  paperSources: ["Smith2023"],
  variants: ["h-adaptive collocation", "p-adaptive collocation", "hp-adaptive collocation"]
})

MATCH (mloc:NumericalMethod {name: "MultiLevelOrthogonalCollocation"})
MATCH (sc:NumericalMethod {name: "SpectralCollocationMethod"})
CREATE (mloc)-[:EXTENDS {
  extensions: [
    "Multi-level hierarchical structure",
    "Adaptive refinement capability",
    "Inter-level error estimation",
    "Local resolution enhancement"
  ],
  compatibilityNotes: "Reduces to standard spectral collocation for single-level case"
}]->(sc)

MATCH (mloc:NumericalMethod {name: "MultiLevelOrthogonalCollocation"})
MATCH (concept:MathematicalConcept {name: "MultiLevelSpectralCollocation"})
CREATE (mloc)-[:IMPLEMENTS {
  completeness: "Complete implementation of the mathematical concept",
  adaptations: [
    "Practical error estimation strategies",
    "Efficient inter-level communication",
    "Optimized level management"
  ]
}]->(concept)

MATCH (mloc:NumericalMethod {name: "MultiLevelOrthogonalCollocation"})
MATCH (domain:ApplicationDomain {name: "HeatTransfer"})
CREATE (mloc)-[:APPLIES_TO {
  effectiveness: "Highly effective for problems with moving interfaces and phase changes",
  adaptations: [
    "Specialized handling of material property jumps",
    "Interface tracking strategies",
    "Adaptive refinement near steep thermal gradients"
  ]
}]->(domain)
*/

// Example 3: Finite Element Method (for comparison)
/*
CREATE (fem:NumericalMethod {
  name: "FiniteElementMethod",
  description: "A numerical method that subdivides the domain into elements and represents the solution with piecewise functions",
  category: "Finite Element Methods",
  primaryApproach: "Galerkin",
  mathematicalFormulation: {
    discretizationType: "Spatial",
    equationType: "PDE in weak form",
    solutionRepresentation: "Piecewise polynomials on elements"
  },
  convergenceProperties: {
    orderOfAccuracy: "Algebraic, dependent on element order",
    convergenceRate: "O(h^p) where p is polynomial degree",
    stabilityConditions: ["Depends on time integration", "LBB condition for mixed problems"]
  },
  computationalCharacteristics: {
    computationalComplexity: "O(N) for assembly, O(N^1.5) for sparse solvers",
    memoryRequirements: "O(N) for sparse matrices",
    parallelizationPotential: "High - element-wise operations are independent"
  },
  strengths: [
    "Geometric flexibility for complex domains",
    "Good handling of boundary conditions",
    "Sparse matrices with efficient solvers",
    "Natural handling of irregular solutions"
  ],
  limitations: [
    "Lower accuracy per DOF compared to spectral methods",
    "Algebraic convergence rate",
    "Mesh generation complexity",
    "Challenges with high-aspect-ratio elements"
  ],
  paperSources: ["Zienkiewicz1967", "Hughes1987"]
})
*/
