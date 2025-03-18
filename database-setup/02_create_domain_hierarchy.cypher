// Knowledge Graph Restructuring: Domain Hierarchy Creation
// Created: March 18, 2025
// Purpose: Create the complete domain hierarchy from knowledge-taxonomy.md

// Step 1: Create root domains
CREATE (n:Domain:Entity {name: 'numerics', description: 'Mathematical and numerical methods', path: 'numerics'});
CREATE (n:Domain:Entity {name: 'computer_vision', description: 'Computer vision techniques and algorithms', path: 'computer_vision'});
CREATE (n:Domain:Entity {name: 'applications', description: 'Application domains and use cases', path: 'applications'});
CREATE (n:Domain:Entity {name: 'cross_domain_bridges', description: 'Connections between different domains', path: 'cross_domain_bridges'});

// Step 2: Create numerics subdomains
MATCH (parent:Domain {name: 'numerics'})
CREATE (de:Domain:Entity {name: 'differential_equations', description: 'Study of equations involving derivatives', path: 'numerics/differential_equations'})
CREATE (dm:Domain:Entity {name: 'discretization_methods', description: 'Methods for discretizing continuous problems', path: 'numerics/discretization_methods'})
CREATE (oa:Domain:Entity {name: 'optimization_algorithms', description: 'Algorithms for solving optimization problems', path: 'numerics/optimization_algorithms'})
CREATE (ra:Domain:Entity {name: 'root_finding_algorithms', description: 'Algorithms for finding roots of equations', path: 'numerics/root_finding_algorithms'})
CREATE (la:Domain:Entity {name: 'linear_algebra', description: 'Study of linear equations and transformations', path: 'numerics/linear_algebra'})
CREATE (ca:Domain:Entity {name: 'computational_acceleration', description: 'Techniques for improving computational performance', path: 'numerics/computational_acceleration'})
CREATE (ft:Domain:Entity {name: 'fundamental_theory', description: 'Basic principles of numerical analysis', path: 'numerics/fundamental_theory'})
CREATE (parent)-[:CONTAINS]->(de)
CREATE (parent)-[:CONTAINS]->(dm)
CREATE (parent)-[:CONTAINS]->(oa)
CREATE (parent)-[:CONTAINS]->(ra)
CREATE (parent)-[:CONTAINS]->(la)
CREATE (parent)-[:CONTAINS]->(ca)
CREATE (parent)-[:CONTAINS]->(ft);

// Step 3: Create differential_equations subdomains
MATCH (parent:Domain {name: 'differential_equations'})
CREATE (ode:Domain:Entity {name: 'ordinary_differential_equations', description: 'Equations involving one independent variable', path: 'numerics/differential_equations/ordinary_differential_equations'})
CREATE (pde:Domain:Entity {name: 'partial_differential_equations', description: 'Equations involving multiple independent variables', path: 'numerics/differential_equations/partial_differential_equations'})
CREATE (dae:Domain:Entity {name: 'differential_algebraic_equations', description: 'Mixed systems of differential and algebraic equations', path: 'numerics/differential_equations/differential_algebraic_equations'})
CREATE (sde:Domain:Entity {name: 'stochastic_differential_equations', description: 'Differential equations with random terms', path: 'numerics/differential_equations/stochastic_differential_equations'})
CREATE (parent)-[:CONTAINS]->(ode)
CREATE (parent)-[:CONTAINS]->(pde)
CREATE (parent)-[:CONTAINS]->(dae)
CREATE (parent)-[:CONTAINS]->(sde);

// Step 4: Create discretization_methods subdomains
MATCH (parent:Domain {name: 'discretization_methods'})
CREATE (fdm:Domain:Entity {name: 'finite_difference_methods', description: 'Methods based on difference approximations of derivatives', path: 'numerics/discretization_methods/finite_difference_methods'})
CREATE (fem:Domain:Entity {name: 'finite_element_methods', description: 'Methods based on variational formulations', path: 'numerics/discretization_methods/finite_element_methods'})
CREATE (sm:Domain:Entity {name: 'spectral_methods', description: 'Methods using basis function expansions', path: 'numerics/discretization_methods/spectral_methods'})
CREATE (cm:Domain:Entity {name: 'collocation_methods', description: 'Methods enforcing equations at specific points', path: 'numerics/discretization_methods/collocation_methods'})
CREATE (mm:Domain:Entity {name: 'meshless_methods', description: 'Methods not requiring a mesh', path: 'numerics/discretization_methods/meshless_methods'})
CREATE (parent)-[:CONTAINS]->(fdm)
CREATE (parent)-[:CONTAINS]->(fem)
CREATE (parent)-[:CONTAINS]->(sm)
CREATE (parent)-[:CONTAINS]->(cm)
CREATE (parent)-[:CONTAINS]->(mm);

// Step 5: Create collocation_methods subdomains
MATCH (parent:Domain {name: 'collocation_methods'})
CREATE (oc:Domain:Entity {name: 'orthogonal_collocation', description: 'Collocation using orthogonal polynomials', path: 'numerics/discretization_methods/collocation_methods/orthogonal_collocation'})
CREATE (mlm:Domain:Entity {name: 'multi_level_methods', description: 'Methods using multiple resolution levels', path: 'numerics/discretization_methods/collocation_methods/multi_level_methods'})
CREATE (parent)-[:CONTAINS]->(oc)
CREATE (parent)-[:CONTAINS]->(mlm);

// Step 6: Create computer_vision subdomains
MATCH (parent:Domain {name: 'computer_vision'})
CREATE (ip:Domain:Entity {name: 'image_processing', description: 'Techniques for processing and enhancing images', path: 'computer_vision/image_processing'})
CREATE (fe:Domain:Entity {name: 'feature_extraction', description: 'Methods for extracting meaningful features from images', path: 'computer_vision/feature_extraction'})
CREATE (tr:Domain:Entity {name: '3d_reconstruction', description: 'Techniques for reconstructing 3D structures from images', path: 'computer_vision/3d_reconstruction'})
CREATE (dl:Domain:Entity {name: 'deep_learning_cv', description: 'Deep learning approaches for computer vision', path: 'computer_vision/deep_learning_cv'})
CREATE (piv:Domain:Entity {name: 'physics_informed_vision', description: 'Vision techniques constrained by physical principles', path: 'computer_vision/physics_informed_vision'})
CREATE (ipi:Domain:Entity {name: 'inverse_problem_imaging', description: 'Reconstructing causes from observations', path: 'computer_vision/inverse_problem_imaging'})
CREATE (parent)-[:CONTAINS]->(ip)
CREATE (parent)-[:CONTAINS]->(fe)
CREATE (parent)-[:CONTAINS]->(tr)
CREATE (parent)-[:CONTAINS]->(dl)
CREATE (parent)-[:CONTAINS]->(piv)
CREATE (parent)-[:CONTAINS]->(ipi);

// Step 7: Create applications subdomains
MATCH (parent:Domain {name: 'applications'})
CREATE (cs:Domain:Entity {name: 'control_systems', description: 'Systems for controlling dynamic processes', path: 'applications/control_systems'})
CREATE (fd:Domain:Entity {name: 'fluid_dynamics', description: 'Study of fluid motion', path: 'applications/fluid_dynamics'})
CREATE (pe:Domain:Entity {name: 'parameter_estimation', description: 'Techniques for estimating model parameters', path: 'applications/parameter_estimation'})
CREATE (mm:Domain:Entity {name: 'multiphysics_modeling', description: 'Modeling of coupled physical phenomena', path: 'applications/multiphysics_modeling'})
CREATE (ds:Domain:Entity {name: 'data_science', description: 'Data-driven modeling and analysis', path: 'applications/data_science'})
CREATE (parent)-[:CONTAINS]->(cs)
CREATE (parent)-[:CONTAINS]->(fd)
CREATE (parent)-[:CONTAINS]->(pe)
CREATE (parent)-[:CONTAINS]->(mm)
CREATE (parent)-[:CONTAINS]->(ds);

// Step 8: Create vision-based parameter estimation subdomain
MATCH (parent:Domain {name: 'parameter_estimation'})
CREATE (vbpe:Domain:Entity {name: 'vision_based_parameter_estimation', description: 'Parameter estimation using computer vision', path: 'applications/parameter_estimation/vision_based_parameter_estimation'})
CREATE (parent)-[:CONTAINS]->(vbpe);

// Step 9: Create tunnel pasteurization as application domain
MATCH (parent:Domain {name: 'applications'})
CREATE (tp:Domain:Entity {name: 'tunnel_pasteurization', description: 'Thermal processing of beverages in tunnels', path: 'applications/tunnel_pasteurization'})
CREATE (parent)-[:CONTAINS]->(tp);

// Step 10: Create cross_domain_bridges subdomains
MATCH (parent:Domain {name: 'cross_domain_bridges'})
CREATE (vtn:Domain:Entity {name: 'vision_to_numerics', description: 'Connections between vision and numerical methods', path: 'cross_domain_bridges/vision_to_numerics'})
CREATE (ntc:Domain:Entity {name: 'numerics_to_control', description: 'Connections between numerical methods and control', path: 'cross_domain_bridges/numerics_to_control'})
CREATE (vta:Domain:Entity {name: 'vision_to_applications', description: 'Applications of vision techniques', path: 'cross_domain_bridges/vision_to_applications'})
CREATE (parent)-[:CONTAINS]->(vtn)
CREATE (parent)-[:CONTAINS]->(ntc)
CREATE (parent)-[:CONTAINS]->(vta);

// Log completion
RETURN 'Domain hierarchy created successfully' AS Status;