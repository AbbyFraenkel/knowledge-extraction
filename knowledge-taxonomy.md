# Knowledge Extraction Taxonomy

## Overview

This document defines the comprehensive taxonomy structure for organizing extracted knowledge across numerics, applications, computer vision, and their interconnections. This structure supports efficient chunking and retrieval while enabling clear cross-domain references.

## Domain Structure

```
knowledge_graph/
├── numerics/
│   ├── differential_equations/
│   │   ├── ordinary_differential_equations/
│   │   │   ├── initial_value_problems
│   │   │   ├── boundary_value_problems
│   │   │   └── delay_differential_equations
│   │   ├── partial_differential_equations/
│   │   │   ├── elliptic_equations
│   │   │   ├── parabolic_equations
│   │   │   ├── hyperbolic_equations
│   │   │   └── conservation_laws
│   │   ├── differential_algebraic_equations/
│   │   │   ├── index_reduction
│   │   │   └── boundary_value_DAEs
│   │   └── stochastic_differential_equations
│   ├── discretization_methods/
│   │   ├── finite_difference_methods
│   │   ├── finite_element_methods
│   │   ├── spectral_methods/
│   │   │   ├── global_spectral_methods
│   │   │   ├── spectral_element_methods
│   │   │   └── fourier_spectral_methods
│   │   ├── collocation_methods/
│   │   │   ├── orthogonal_collocation/
│   │   │   │   ├── gauss_collocation
│   │   │   │   ├── gauss_lobatto_collocation
│   │   │   │   └── gauss_radau_collocation
│   │   │   ├── multi_level_methods/
│   │   │   │   ├── hierarchical_basis_functions
│   │   │   │   ├── refinement_by_superposition
│   │   │   │   └── adaptive_multi_level_methods
│   │   │   └── fictitious_domain_methods/
│   │   │       ├── embedded_boundary_methods
│   │   │       └── immersed_boundary_methods
│   │   └── meshless_methods
│   ├── optimization_algorithms/
│   │   ├── unconstrained_optimization
│   │   ├── constrained_optimization
│   │   ├── global_optimization
│   │   ├── stochastic_optimization
│   │   └── multi_objective_optimization
│   ├── root_finding_algorithms/
│   │   ├── bisection_methods
│   │   ├── newton_methods
│   │   └── quasi_newton_methods
│   ├── linear_algebra/
│   │   ├── direct_solvers
│   │   ├── iterative_solvers
│   │   └── eigenvalue_problems
│   ├── computational_acceleration/
│   │   ├── gpu_computing/
│   │   │   ├── cuda_programming
│   │   │   └── kernel_optimization
│   │   ├── parallel_computing/
│   │   │   ├── shared_memory
│   │   │   └── distributed_memory
│   │   └── algorithm_vectorization
│   └── fundamental_theory/
│       ├── numerical_stability
│       ├── convergence_analysis
│       ├── error_estimation
│       └── uncertainty_quantification
├── scientific_computing_implementation/
│   ├── implementation_methodologies/
│   │   ├── design_patterns/
│   │   │   ├── factory_pattern
│   │   │   ├── strategy_pattern
│   │   │   ├── composite_pattern
│   │   │   └── visitor_pattern
│   │   ├── type_systems/
│   │   │   ├── abstract_type_hierarchies
│   │   │   ├── parametric_types
│   │   │   ├── multiple_dispatch
│   │   │   └── type_stability
│   │   ├── code_organization/
│   │   │   ├── modular_design
│   │   │   ├── component_interfaces
│   │   │   └── algorithm_encapsulation
│   │   └── performance_optimization/
│   │       ├── memory_management
│   │       ├── cache_optimization
│   │       ├── allocations_reduction
│   │       └── compiler_directives
│   ├── language_specific_implementations/
│   │   ├── julia_implementation/
│   │   │   ├── sciml_style
│   │   │   ├── metaprogramming
│   │   │   ├── generic_programming
│   │   │   └── package_development
│   │   ├── python_implementation/
│   │   │   ├── numpy_scipy_ecosystem
│   │   │   └── jit_compilation
│   │   └── cpp_implementation/
│   │       ├── template_metaprogramming
│   │       └── expression_templates
│   ├── numerical_libraries/
│   │   ├── linear_algebra_libraries
│   │   ├── ode_solvers
│   │   ├── pde_frameworks
│   │   └── optimization_packages
│   └── algorithm_implementation/
│       ├── data_structures/
│       │   ├── sparse_matrices
│       │   ├── adaptive_meshes
│       │   └── hierarchical_structures
│       ├── algorithm_translation/
│       │   ├── mathematical_to_computational
│       │   ├── abstract_to_concrete
│       │   └── symbolic_to_numeric
│       ├── testing_methodologies/
│       │   ├── convergence_testing
│       │   ├── method_of_manufactured_solutions
│       │   └── regression_testing
│       └── documentation_methodologies/
│           ├── literate_programming
│           ├── mathematical_documentation
│           └── reproducible_examples
├── computer_vision/
│   ├── image_processing/
│   │   ├── filtering_techniques
│   │   ├── edge_detection
│   │   ├── segmentation
│   │   └── registration
│   ├── feature_extraction/
│   │   ├── keypoint_detection
│   │   ├── descriptor_generation
│   │   ├── tracking_algorithms
│   │   └── optical_flow
│   ├── 3d_reconstruction/
│   │   ├── structure_from_motion
│   │   ├── stereo_vision
│   │   ├── volumetric_reconstruction
│   │   └── point_cloud_processing
│   ├── deep_learning_cv/
│   │   ├── convolutional_networks
│   │   ├── semantic_segmentation
│   │   ├── instance_segmentation
│   │   └── generative_models
│   ├── physics_informed_vision/
│   │   ├── physics_constrained_tracking
│   │   ├── material_property_estimation
│   │   ├── deformation_analysis
│   │   └── flow_visualization
│   └── inverse_problem_imaging/
│       ├── tomographic_reconstruction
│       ├── computational_imaging
│       ├── ill_posed_problems
│       └── regularization_techniques
├── applications/
│   ├── control_systems/
│   │   ├── optimal_control/
│   │   │   ├── linear_quadratic_regulator
│   │   │   ├── pontryagin_maximum_principle
│   │   │   └── direct_methods
│   │   ├── model_predictive_control/
│   │   │   ├── linear_mpc
│   │   │   ├── nonlinear_mpc
│   │   │   ├── economic_mpc
│   │   │   └── robust_mpc
│   │   └── dynamic_optimization/
│   │       ├── direct_transcription
│   │       ├── dynamic_programming
│   │       └── differential_flatness
│   ├── fluid_dynamics/
│   │   ├── cfd_fundamentals/
│   │   │   ├── navier_stokes_equations
│   │   │   └── turbulence_models
│   │   ├── aerodynamics/
│   │   │   ├── lift_drag_optimization
│   │   │   └── flow_control
│   │   └── multiphase_flows
│   ├── heat_transfer/
│   │   ├── conduction/
│   │   │   ├── steady_state_conduction
│   │   │   ├── transient_conduction
│   │   │   └── anisotropic_conduction
│   │   ├── convection/
│   │   │   ├── natural_convection
│   │   │   ├── forced_convection
│   │   │   └── mixed_convection
│   │   ├── radiation/
│   │   │   ├── surface_radiation
│   │   │   └── participating_media
│   │   ├── phase_change/
│   │   │   ├── melting_solidification
│   │   │   ├── evaporation_condensation
│   │   │   └── moving_boundary_problems
│   │   └── thermal_processing/
│   │       ├── pasteurization/
│   │       │   ├── tunnel_pasteurization
│   │       │   ├── container_modeling
│   │       │   └── process_optimization
│   │       ├── sterilization
│   │       └── heat_treatment
│   ├── parameter_estimation/
│   │   ├── pde_parameter_identification
│   │   ├── vision_based_parameter_estimation/
│   │   │   ├── boundary_condition_extraction
│   │   │   ├── material_property_identification
│   │   │   ├── flow_field_reconstruction
│   │   │   └── deformation_parameter_inference
│   │   ├── kalman_filtering
│   │   ├── bayesian_methods
│   │   └── inverse_problems_with_imaging
│   ├── multiphysics_modeling/
│   │   ├── fluid_structure_interaction
│   │   ├── thermal_mechanical_coupling
│   │   ├── electromagnetics_integration
│   │   └── multiphase_multifield_problems
│   └── data_science/
│       ├── surrogate_modeling/
│       │   ├── gaussian_processes
│       │   └── neural_networks
│       ├── system_identification/
│       │   ├── linear_models
│       │   └── nonlinear_models
│       └── ml_for_pde_solving/
│           ├── physics_informed_neural_networks
│           └── operator_learning
└── cross_domain_bridges/
    ├── vision_to_numerics/
    │   ├── optical_flow_to_flow_field
    │   ├── 3d_reconstruction_to_boundary_conditions
    │   └── segmentation_to_domain_decomposition
    ├── numerics_to_control/
    │   ├── pde_solver_to_mpc
    │   ├── optimization_to_control_formulation
    │   └── uncertainty_to_robust_control
    ├── vision_to_applications/
    │   ├── vision_to_parameter_estimation
    │   ├── vision_to_validation
    │   └── vision_to_real_time_control
    ├── numerics_to_implementation/
    │   ├── mathematical_formulation_to_code
    │   ├── algorithm_to_type_system
    │   ├── mathematical_properties_to_tests
    │   └── notation_to_naming_conventions
    ├── kitchensink_specific_bridges/
    │   ├── spectral_methods_to_multi_level_adaptivity
    │   ├── orthogonal_collocation_to_fictitious_domain
    │   ├── multi_level_approach_to_type_system
    │   ├── mathematical_theory_to_implementation
    │   └── numerical_methods_to_applications
    └── heat_transfer_bridges/
        ├── numerical_methods_to_thermal_modeling
        ├── pde_solvers_to_pasteurization
        ├── parameter_estimation_to_thermal_properties
        └── optimization_to_process_control
```

## Knowledge Tiers for Efficient Context Window Usage

Each entity in the knowledge graph should be organized into three tiers to optimize context window utilization:

### L1: Core Concepts (100-200 words)
- Essential definition and purpose
- Key mathematical properties
- Primary applications
- Related concept references

### L2: Functional Details (500-1000 words)
- Complete mathematical formulation
- Algorithm pseudocode
- Implementation considerations
- Error analysis
- Usage examples

### L3: Complete Knowledge (2000+ words)
- Derivations and proofs
- Convergence analysis
- Implementation code
- Benchmark results
- Extensions and variations

## Cross-Domain Knowledge Bridges

Cross-domain bridges connect concepts across different domains while minimizing context window usage:

```json
{
  "bridge_id": "orthogonal_collocation_to_fictitious_domain_bridge",
  "connects": ["numerics/discretization_methods/collocation_methods/orthogonal_collocation", "numerics/discretization_methods/collocation_methods/fictitious_domain_methods"],
  "knowledge_flow": [
    {
      "from": "orthogonal_polynomial_basis",
      "to": "embedded_boundary_representation",
      "transformation": "Extension of basis functions to handle non-conforming boundaries"
    }
  ],
  "reference_implementations": [
    "kitchensink/ocfc_implementation.jl"
  ]
}
```

## Entity Types and Relation Types

### Enhanced Entity Types
- `MathematicalConcept`: Fundamental mathematical ideas
- `MathematicalEquation`: Formal mathematical expressions
- `Algorithm`: Step-by-step computational procedures
- `NumericalMethod`: Specific computational approaches
- `Implementation`: Code realizations
- `DesignPattern`: Software design patterns
- `TypeSystem`: Type hierarchy and organization
- `VisualTechnique`: Computer vision methods
- `PhysicalApplication`: Domain-specific applications
- `CrossDomainBridge`: Connections between domains
- `Symbol`: Mathematical notation

### Enhanced Relation Types
- Mathematical: `derives_from`, `is_equivalent_to`, `approximates`
- Hierarchical: `is_a`, `type_of`, `subclass_of`, `instance_of`
- Implementation: `implements`, `realizes`, `extends`, `optimizes`
- Symbol-Related: `represents`, `appears_in`, `conflicts_with`, `has_interpretation_in`
- Cross-Domain: `transforms_to`, `maps_between`, `translates_from`
- Comparative: `similar_to`, `different_from`, `improves_upon`

## Usage Guidelines

### Creating Entities with Tiered Knowledge
```cypher
// Create a mathematical concept with tiered knowledge
CREATE (ocfc:NumericalMethod {
  name: "OrthogonalCollocationOnFiniteCells",
  tier_L1: "A computational method combining orthogonal collocation with fictitious domain approaches to handle complex geometries while maintaining spectral accuracy.",
  tier_L2_file: "numerics/discretization_methods/ocfc_L2.md",
  tier_L3_file: "numerics/discretization_methods/ocfc_L3.md"
})
```

### Establishing Implementation Relationships
```cypher
// Create relationships between mathematical method and implementation
MATCH (method:NumericalMethod {name: "MultiLevelOrthogonalCollocation"})
MATCH (impl:Implementation {name: "KitchenSinkMultiLevelCollocation"})
CREATE (impl)-[:implements {
  language: "Julia",
  style: "SciML",
  fidelity: "Complete"
}]->(method);

MATCH (method:NumericalMethod {name: "MultiLevelOrthogonalCollocation"})
MATCH (designPattern:DesignPattern {name: "CompositePattern"})
CREATE (method)-[:uses_pattern {
  application: "Hierarchical basis representation",
  benefits: "Recursive composition of refinement levels"
}]->(designPattern);
```

### Symbol-Concept Independence
```cypher
// Create a symbol separate from concept
CREATE (sym:Symbol {
  name: "α",
  latex: "\\alpha",
  context: "Numerical methods",
  paperSource: "Smith2022"
})

// Create concept separate from symbol
CREATE (concept:MathematicalConcept {
  name: "ThermalDiffusivity",
  description: "Property determining heat diffusion rate through material"
})

// Connect symbol to concept via relationship
CREATE (sym)-[:REPRESENTS {
  context: "Heat equation"
}]->(concept)
```

### Query Optimization
```cypher
// Find implementations of a mathematical concept
MATCH (concept:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (method:NumericalMethod)-[:is_a]->(concept)
MATCH (implementation:Implementation)-[:implements]->(method)
RETURN implementation.name, implementation.language

// Find all symbols representing the same concept
MATCH (concept:MathematicalConcept {name: "ThermalDiffusivity"})
MATCH (symbol:Symbol)-[:REPRESENTS]->(concept)
RETURN symbol.name, symbol.context, symbol.latex
```

## Implementation Notes

1. **Symbol-Concept Independence**: Always maintain complete separation between symbols (notation) and concepts (meaning)
2. **Progressive Loading**: Implement tiered loading to start with L1 knowledge and progressively load deeper tiers
3. **Cross-Domain Bridges**: Explicitly model transformations between domains to facilitate interdisciplinary work
4. **Implementation-Theory Connection**: Create explicit relationships between mathematical concepts and their implementations
5. **KitchenSink Focus Areas**: Prioritize orthogonal collocation, multi-level methods, and fictitious domain approaches