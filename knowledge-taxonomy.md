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
│   │   ├── spectral_methods
│   │   ├── collocation_methods/
│   │   │   ├── orthogonal_collocation
│   │   │   └── multi_level_methods
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
    └── vision_to_applications/
        ├── vision_to_parameter_estimation
        ├── vision_to_validation
        └── vision_to_real_time_control
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
  "bridge_id": "optical_flow_to_cfd_bridge",
  "connects": ["computer_vision/feature_extraction/optical_flow", "applications/fluid_dynamics/cfd_fundamentals"],
  "knowledge_flow": [
    {
      "from": "optical_flow_velocity_field",
      "to": "cfd_boundary_conditions",
      "transformation": "Physics-informed filtering and coordinate transformation"
    }
  ],
  "reference_implementations": [
    "3-examples/vision-based-parameter-estimation.md"
  ]
}
```

## Entity Types and Relation Types

### Core Entity Types
- `MathematicalConcept`: Fundamental mathematical ideas
- `MathematicalEquation`: Formal mathematical expressions
- `Algorithm`: Step-by-step computational procedures
- `NumericalMethod`: Specific computational approaches
- `Implementation`: Code realizations
- `VisualTechnique`: Computer vision methods
- `PhysicalApplication`: Domain-specific applications
- `CrossDomainBridge`: Connections between domains

### Relation Types
- Mathematical: `derives_from`, `is_equivalent_to`, `approximates`
- Hierarchical: `is_a`, `type_of`, `subclass_of`, `instance_of`
- Implementation: `implements`, `realizes`, `extends`, `optimizes`
- Cross-Domain: `transforms_to`, `maps_between`, `translates_from`
- Comparative: `similar_to`, `different_from`, `improves_upon`

## Usage Guidelines

### Creating Entities with Tiered Knowledge
```cypher
// Create a mathematical concept with tiered knowledge
CREATE (piof:CrossDomainBridge {
  name: "Physics-Informed Optical Flow",
  tier_L1: "Computer vision technique that incorporates physical constraints (mass conservation, momentum) into optical flow estimation to improve fluid flow measurement accuracy and physical consistency.",
  tier_L2_file: "physics_informed_optical_flow_L2.md",
  tier_L3_file: "physics_informed_optical_flow_L3.md"
})
```

### Establishing Cross-Domain Relationships
```cypher
// Create relationships between computer vision and fluid dynamics
MATCH (piof:Entity {name: "Physics-Informed Optical Flow"})
MATCH (flow:Entity {name: "Free Surface Flow Estimation"})
CREATE (piof)-[:enables_measurement_of]->(flow);

MATCH (ofce:Entity {name: "Optical Flow Constraint Equation"})
MATCH (nsmc:Entity {name: "Navier-Stokes Mass Conservation"})
CREATE (ofce)-[:mathematically_analogous_to]->(nsmc);
```

### Query Optimization
```cypher
// Start with core concept (L1)
MATCH (concept:Entity {name: "Physics-Informed Optical Flow"})
RETURN concept;

// Load functional details (L2) when needed
MATCH (concept:Entity {name: "Physics-Informed Optical Flow"})
WHERE concept.tier_L2_file IS NOT NULL
RETURN concept.tier_L2_file AS detailedContentFile;
```

## Implementation Notes

1. **File References**: Use file references for L2 and L3 knowledge to avoid loading large content into context window
2. **Progressive Loading**: Implement tiered loading to start with L1 knowledge and progressively load deeper tiers
3. **Entity-Relationship Balancing**: Create entities at proper granularity - neither too fine (fragmentation) nor too coarse
4. **Cross-Domain Bridges**: Explicitly model transformations between domains to facilitate interdisciplinary work
5. **Knowledge Packs**: Group related entities into "knowledge packs" for common retrieval patterns