// Knowledge Graph Restructuring: Query Optimization Examples
// Created: March 19, 2025
// Purpose: Implement query optimization patterns from knowledge-taxonomy.md

// Create documentation for progressive loading queries
CREATE (doc:QueryDocumentation:Entity {
    name: 'Progressive Loading Queries',
    description: 'Query patterns for efficient loading of tiered knowledge',
    examples: [
        {
            name: 'Core Concept Only',
            description: 'Retrieve only L1 tier knowledge',
            query: 'MATCH (concept:Entity {name: $name}) RETURN concept.name, concept.tier_L1'
        },
        {
            name: 'Functional Details',
            description: 'Retrieve L2 tier knowledge file path',
            query: 'MATCH (concept:Entity {name: $name}) WHERE concept.tier_L2_file IS NOT NULL RETURN concept.tier_L2_file'
        },
        {
            name: 'Complete Knowledge',
            description: 'Retrieve L3 tier knowledge file path',
            query: 'MATCH (concept:Entity {name: $name}) WHERE concept.tier_L3_file IS NOT NULL RETURN concept.tier_L3_file'
        }
    ]
});

// Create example for entity-relationship balancing
CREATE (erb:Principle:Entity {
    name: 'Entity-Relationship Balancing',
    description: 'Principle for optimal entity granularity in knowledge graph',
    rules: [
        'Create entities at natural conceptual boundaries',
        'Avoid excessive fragmentation that creates too many small entities',
        'Avoid overly large entities that contain too many disparate concepts',
        'Use relationships to express semantic connections, not entity hierarchy',
        'Optimize for query patterns that will be commonly used'
    ],
    examples: [
        {
            name: 'Too Granular',
            anti_pattern: 'Creating separate entities for every equation term',
            correction: 'Keep complete equation in one entity with appropriate properties'
        },
        {
            name: 'Too Coarse',
            anti_pattern: 'Combining multiple distinct algorithms into one entity',
            correction: 'Create separate entities for each algorithm with cross-relationships'
        }
    ]
});

// Example optimized query patterns for common use cases
CREATE (queries:QueryCollection:Entity {
    name: 'Optimized Knowledge Queries',
    queries: [
        {
            name: 'Find Domain Concept',
            description: 'Find a concept within a specific domain',
            query: 'MATCH (d:Domain {name: $domain})-[:CONTAINS*]->(c:MathematicalConcept) WHERE c.name CONTAINS $term RETURN c'
        },
        {
            name: 'Find Related Implementation',
            description: 'Find implementation for a mathematical concept',
            query: 'MATCH (c:MathematicalConcept {name: $concept})<-[:IMPLEMENTS|REALIZES]-(i:Implementation) RETURN i'
        },
        {
            name: 'Find Cross-Domain Applications',
            description: 'Find how a concept is used across domains',
            query: 'MATCH (c:Entity {name: $concept})-[r:TRANSFORMS_TO|MAPS_BETWEEN|TRANSLATES_FROM]->(a:Entity) RETURN a.name, type(r)'
        }
    ]
});

// Create specific example for progressive loading
CREATE (:Example:Entity {
    name: 'Progressive Loading Example',
    description: 'Example of using progressive loading pattern',
    code: `
// Step 1: Load core concept (L1)
MATCH (concept:Entity {name: "Physics-Informed Optical Flow"})
RETURN concept.name, concept.tier_L1;

// Step 2: Load functional details (L2) when needed
MATCH (concept:Entity {name: "Physics-Informed Optical Flow"})
WHERE concept.tier_L2_file IS NOT NULL
RETURN concept.tier_L2_file AS detailedContentFile;

// Step 3: Load implementation details when needed
MATCH (concept:Entity {name: "Physics-Informed Optical Flow"})-[:IMPLEMENTS]->(impl:Implementation)
RETURN impl;
`
});

// Log completion
RETURN 'Query optimization examples created successfully' AS Status;
