// Knowledge Graph Restructuring: Deep Domain Structure
// Created: March 19, 2025
// Purpose: Create the deeper domain structure from knowledge-taxonomy.md

// Create deeper subdomain structure for Optimal Control
MATCH (parent:Domain {path: 'applications/control_systems'})
CREATE (oc:Domain:Entity {
    name: 'optimal_control',
    description: 'Theory and methods for optimizing control of dynamic systems',
    path: 'applications/control_systems/optimal_control'
})
CREATE (parent)-[:CONTAINS]->(oc);

MATCH (parent:Domain {path: 'applications/control_systems/optimal_control'})
CREATE (lqr:Domain:Entity {
    name: 'linear_quadratic_regulator',
    description: 'Optimal control for linear systems with quadratic cost',
    path: 'applications/control_systems/optimal_control/linear_quadratic_regulator'
})
CREATE (pmp:Domain:Entity {
    name: 'pontryagin_maximum_principle',
    description: 'Necessary conditions for optimal control',
    path: 'applications/control_systems/optimal_control/pontryagin_maximum_principle'
})
CREATE (dm:Domain:Entity {
    name: 'direct_methods',
    description: 'Discretization-based optimization approaches',
    path: 'applications/control_systems/optimal_control/direct_methods'
})
CREATE (parent)-[:CONTAINS]->(lqr)
CREATE (parent)-[:CONTAINS]->(pmp)
CREATE (parent)-[:CONTAINS]->(dm);

// Create deeper subdomain structure for Model Predictive Control
MATCH (parent:Domain {path: 'applications/control_systems'})
CREATE (mpc:Domain:Entity {
    name: 'model_predictive_control',
    description: 'Receding horizon control based on predictions',
    path: 'applications/control_systems/model_predictive_control'
})
CREATE (parent)-[:CONTAINS]->(mpc);

MATCH (parent:Domain {path: 'applications/control_systems/model_predictive_control'})
CREATE (lmpc:Domain:Entity {
    name: 'linear_mpc',
    description: 'MPC for linear systems',
    path: 'applications/control_systems/model_predictive_control/linear_mpc'
})
CREATE (nmpc:Domain:Entity {
    name: 'nonlinear_mpc',
    description: 'MPC for nonlinear systems',
    path: 'applications/control_systems/model_predictive_control/nonlinear_mpc'
})
CREATE (empc:Domain:Entity {
    name: 'economic_mpc',
    description: 'MPC with economic objectives',
    path: 'applications/control_systems/model_predictive_control/economic_mpc'
})
CREATE (rmpc:Domain:Entity {
    name: 'robust_mpc',
    description: 'MPC with robustness guarantees',
    path: 'applications/control_systems/model_predictive_control/robust_mpc'
})
CREATE (parent)-[:CONTAINS]->(lmpc)
CREATE (parent)-[:CONTAINS]->(nmpc)
CREATE (parent)-[:CONTAINS]->(empc)
CREATE (parent)-[:CONTAINS]->(rmpc);

// Create deeper subdomain structure for Dynamic Optimization
MATCH (parent:Domain {path: 'applications/control_systems'})
CREATE (dynopt:Domain:Entity {
    name: 'dynamic_optimization',
    description: 'Optimization of dynamic system trajectories',
    path: 'applications/control_systems/dynamic_optimization'
})
CREATE (parent)-[:CONTAINS]->(dynopt);

MATCH (parent:Domain {path: 'applications/control_systems/dynamic_optimization'})
CREATE (dt:Domain:Entity {
    name: 'direct_transcription',
    description: 'Simultaneous discretization of states and controls',
    path: 'applications/control_systems/dynamic_optimization/direct_transcription'
})
CREATE (dp:Domain:Entity {
    name: 'dynamic_programming',
    description: 'Recursive optimization approach',
    path: 'applications/control_systems/dynamic_optimization/dynamic_programming'
})
CREATE (df:Domain:Entity {
    name: 'differential_flatness',
    description: 'Parameterization of trajectories using flat outputs',
    path: 'applications/control_systems/dynamic_optimization/differential_flatness'
})
CREATE (parent)-[:CONTAINS]->(dt)
CREATE (parent)-[:CONTAINS]->(dp)
CREATE (parent)-[:CONTAINS]->(df);

// Log completion
RETURN 'Deep domain structure created successfully' AS Status;
