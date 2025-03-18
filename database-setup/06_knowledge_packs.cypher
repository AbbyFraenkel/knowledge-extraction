// Knowledge Graph Restructuring: Knowledge Packs
// Created: March 19, 2025
// Purpose: Create knowledge packs for common retrieval patterns

// Knowledge Packs group related entities for efficient retrieval
// This addresses the "Knowledge Packs" concept from knowledge-taxonomy.md

// Create Knowledge Pack entity type
MERGE (packType:EntityType {
    name: 'KnowledgePack',
    description: 'Curated collection of related knowledge entities for common retrieval patterns',
    attributes: ['name', 'description', 'focus_area', 'entities', 'use_cases']
});

// Example 1: Optimal Control Fundamentals Pack
CREATE (pack1:KnowledgePack:Entity {
    name: 'Optimal Control Fundamentals',
    description: 'Core concepts and methods for optimal control theory',
    focus_area: 'Control Systems',
    tier_L1: 'Collection of foundational optimal control concepts, equations, and methods.',
    use_cases: ['Learning optimal control basics', 'Reference for implementation']
});

// Example 2: Spectral Methods Pack
CREATE (pack2:KnowledgePack:Entity {
    name: 'Spectral Methods Fundamentals',
    description: 'Comprehensive collection of spectral method concepts',
    focus_area: 'Numerical Analysis',
    tier_L1: 'Core spectral method concepts, equations, and implementation approaches.',
    use_cases: ['PDE solving reference', 'Spectral method implementation']
});

// Example 3: Vision-to-Physics Bridge Pack
CREATE (pack3:KnowledgePack:Entity {
    name: 'Vision-to-Physics Integration',
    description: 'Complete path from computer vision to physical parameter estimation',
    focus_area: 'Cross-Domain Integration',
    tier_L1: 'Collection of concepts, methods and algorithms connecting computer vision to physical parameter extraction.',
    use_cases: ['Setting up vision-based parameter estimation', 'Flow visualization']
});

// Connect packs to their constituent entities
// Optimal Control Pack
MATCH (pack:KnowledgePack {name: 'Optimal Control Fundamentals'})
MATCH (e1:MathematicalConcept {name: 'Pontryagin Maximum Principle'})
MATCH (e2:MathematicalEquation {name: 'Hamilton-Jacobi-Bellman Equation'})
MATCH (e3:Algorithm {name: 'Direct Collocation'})
CREATE (pack)-[:CONTAINS]->(e1)
CREATE (pack)-[:CONTAINS]->(e2)
CREATE (pack)-[:CONTAINS]->(e3);

// Spectral Methods Pack
MATCH (pack:KnowledgePack {name: 'Spectral Methods Fundamentals'})
MATCH (e1:MathematicalConcept {name: 'Legendre Polynomials'})
MATCH (e2:MathematicalEquation {name: 'Error Bound Equation for Legendre Approximation'})
MATCH (e3:NumericalMethod {name: 'hp-Adaptive Method'})
CREATE (pack)-[:CONTAINS]->(e1)
CREATE (pack)-[:CONTAINS]->(e2)
CREATE (pack)-[:CONTAINS]->(e3);

// Vision-to-Physics Bridge Pack
MATCH (pack:KnowledgePack {name: 'Vision-to-Physics Integration'})
MATCH (e1:CrossDomainBridge {name: 'Vision-Based Pasteurization Parameter Estimation'})
MATCH (e2:VisualTechnique {name: 'Physics-Informed Optical Flow'})
CREATE (pack)-[:CONTAINS]->(e1)
CREATE (pack)-[:CONTAINS]->(e2);

// Define progressing loading strategy for knowledge packs
CREATE (loadStrategy:Strategy:Entity {
    name: 'Progressive Loading Strategy',
    description: 'Strategy for efficiently loading knowledge pack contents',
    steps: [
        'Load pack metadata and tier_L1 content',
        'Load tier_L1 content of key entities on demand',
        'Load tier_L2 content when detailed information is needed',
        'Load tier_L3 content only for deep dives'
    ]
});

// Create relationship between packs and loading strategy
MATCH (pack:KnowledgePack)
MATCH (strategy:Strategy {name: 'Progressive Loading Strategy'})
CREATE (pack)-[:USES_LOADING_STRATEGY]->(strategy);

// Log completion
RETURN 'Knowledge packs created successfully' AS Status;
