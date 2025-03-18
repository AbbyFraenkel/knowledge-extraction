// Knowledge Graph Restructuring: Example Entities
// Created: March 18, 2025
// Purpose: Create example entities with proper structure

// Example 1: MathematicalConcept - Legendre Polynomials
MATCH (domain:Domain {path: 'numerics/discretization_methods/spectral_methods'})
CREATE (concept:MathematicalConcept:Entity {
  name: 'Legendre Polynomials',
  path: 'numerics/discretization_methods/spectral_methods/legendre_polynomials',
  tier1_knowledge: 'Orthogonal polynomials that form a basis for function approximation. The decay rate of coefficients can indicate function smoothness. For analytic functions, coefficients decay exponentially: |a_i| ≈ c⋅10^(-σi) where σ > 0 is the decay rate.',
  file_references: 'FILE:numerical-methods/concepts/legendre_polynomials.md'
})
CREATE (domain)-[:CONTAINS]->(concept);

// Example 2: MathematicalEquation - Error Bound Equation
MATCH (domain:Domain {path: 'numerics/discretization_methods/spectral_methods'})
CREATE (equation:MathematicalEquation:Entity {
  name: 'Error Bound Equation for Legendre Approximation',
  path: 'numerics/discretization_methods/spectral_methods/error_bound_equation',
  tier1_knowledge: 'The error bound for Legendre polynomial approximation is given by: e ≤ (c*10^(-σ(N+1)))/√(1-10^(-2σ)) where σ is the decay rate parameter, N is the polynomial degree, and c is a constant.',
  latex_representation: '\\hat{e} = \\frac{c10^{-\\sigma(N+1)}}{\\sqrt{1-10^{-2\\sigma}}}',
  file_references: 'FILE:numerical-methods/equations/legendre_error_bound.md'
})
CREATE (domain)-[:CONTAINS]->(equation);

// Example 3: Algorithm - Multi-Level OCFC Algorithm
MATCH (domain:Domain {path: 'numerics/discretization_methods/collocation_methods/multi_level_methods'})
CREATE (algorithm:Algorithm:Entity {
  name: 'Multi-Level OCFC with hp-Refinement',
  path: 'numerics/discretization_methods/collocation_methods/multi_level_methods/multi_level_ocfc',
  tier1_knowledge: 'An algorithm for solving differential equations using orthogonal collocation on finite channels with multiple levels of refinement. Uses superposition of solutions at different resolution levels to achieve adaptive accuracy.',
  file_references: 'FILE:numerical-methods/algorithms/multi_level_ocfc.md'
})
CREATE (domain)-[:CONTAINS]->(algorithm);

// Example 4: NumericalMethod - hp-Adaptive Method
MATCH (domain:Domain {path: 'numerics/discretization_methods'})
CREATE (method:NumericalMethod:Entity {
  name: 'hp-Adaptive Method',
  path: 'numerics/discretization_methods/hp_adaptive_method',
  tier1_knowledge: 'A numerical approach that combines both h-methods (mesh refinement) and p-methods (polynomial degree increase) adaptively based on solution characteristics. Provides exponential convergence in smooth regions while effectively handling non-smooth features.',
  file_references: 'FILE:numerical-methods/methods/hp_adaptive_method.md'
})
CREATE (domain)-[:CONTAINS]->(method);

// Example 5: PhysicalApplication - Tunnel Pasteurization Model
MATCH (domain:Domain {path: 'applications/tunnel_pasteurization'})
CREATE (application:PhysicalApplication:Entity {
  name: 'Tunnel Pasteurization Heat Transfer Model',
  path: 'applications/tunnel_pasteurization/heat_transfer_model',
  tier1_knowledge: 'Mathematical model of heat transfer in beer pasteurization process. Involves moving boundary and phase change dynamics. Requires precise temperature and energy transfer calculations with accurate boundary condition handling.',
  file_references: 'FILE:applications/tunnel_pasteurization/heat_transfer_model.md'
})
CREATE (domain)-[:CONTAINS]->(application);

// Example 6: CrossDomainBridge - Vision to Pasteurization Bridge
MATCH (domain:Domain {path: 'cross_domain_bridges/vision_to_applications'})
CREATE (bridge:CrossDomainBridge:Entity {
  name: 'Vision-Based Pasteurization Parameter Estimation',
  path: 'cross_domain_bridges/vision_to_applications/pasteurization_parameter_estimation',
  tier1_knowledge: 'Approach for using computer vision techniques to estimate thermal and fluid dynamic parameters in pasteurization processes. Uses optical flow and feature tracking to extract boundary conditions and material properties for thermal modeling.',
  file_references: 'FILE:cross_domain_bridges/vision_to_applications/pasteurization_parameter_estimation.md'
})
CREATE (domain)-[:CONTAINS]->(bridge);

// Example Relationships
// Type 1: Mathematical relationship
MATCH (a:MathematicalEquation {name: 'Error Bound Equation for Legendre Approximation'})
MATCH (b:MathematicalConcept {name: 'Legendre Polynomials'})
CREATE (a)-[:derives_from]->(b)
CREATE (b)-[:has_derivation]->(a);

// Type 2: Hierarchical relationship
MATCH (a:NumericalMethod {name: 'hp-Adaptive Method'})
MATCH (b:Domain {path: 'numerics/discretization_methods'})
CREATE (a)-[:is_a]->(b);

// Type 3: Implementation relationship
MATCH (a:Algorithm {name: 'Multi-Level OCFC with hp-Refinement'})
MATCH (b:NumericalMethod {name: 'hp-Adaptive Method'})
CREATE (a)-[:implements]->(b)
CREATE (b)-[:is_implemented_by]->(a);

// Type 4: Cross-domain relationship
MATCH (a:CrossDomainBridge {name: 'Vision-Based Pasteurization Parameter Estimation'})
MATCH (b:PhysicalApplication {name: 'Tunnel Pasteurization Heat Transfer Model'})
CREATE (a)-[:transforms_to]->(b)
CREATE (b)-[:is_transformed_from]->(a);

// Log completion
RETURN 'Example entities and relationships created successfully' AS Status;