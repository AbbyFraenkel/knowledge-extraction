// Knowledge Graph Restructuring: Standard Relationship Types
// Created: March 18, 2025
// Purpose: Define and document standard relationship types

// Create a RelationshipType node type to document relationship metadata
CREATE (doc:RelationshipDocumentation {name: 'Relationship Documentation'});

// Mathematical Relationships
MERGE (math:RelationshipCategory {name: 'mathematical_relationships', description: 'Relationships based on mathematical connections'});
CREATE (math)-[:CONTAINS]->(:RelationshipType {name: 'derives_from', description: 'Indicates that one concept is derived from another', category: 'mathematical', inverse: 'has_derivation'});
CREATE (math)-[:CONTAINS]->(:RelationshipType {name: 'is_equivalent_to', description: 'Indicates mathematical equivalence between concepts', category: 'mathematical', inverse: 'is_equivalent_to'});
CREATE (math)-[:CONTAINS]->(:RelationshipType {name: 'approximates', description: 'Indicates that one concept approximates another', category: 'mathematical', inverse: 'is_approximated_by'});
CREATE (doc)-[:DOCUMENTS]->(math);

// Hierarchical Relationships
MERGE (hier:RelationshipCategory {name: 'hierarchical_relationships', description: 'Relationships based on classification hierarchy'});
CREATE (hier)-[:CONTAINS]->(:RelationshipType {name: 'is_a', description: 'Indicates that an entity is a type of another entity', category: 'hierarchical', inverse: 'has_type'});
CREATE (hier)-[:CONTAINS]->(:RelationshipType {name: 'type_of', description: 'Indicates that an entity is a more specific type', category: 'hierarchical', inverse: 'has_type'});
CREATE (hier)-[:CONTAINS]->(:RelationshipType {name: 'subclass_of', description: 'Indicates a subclass relationship', category: 'hierarchical', inverse: 'has_subclass'});
CREATE (hier)-[:CONTAINS]->(:RelationshipType {name: 'instance_of', description: 'Indicates an instance relationship', category: 'hierarchical', inverse: 'has_instance'});
CREATE (doc)-[:DOCUMENTS]->(hier);

// Implementation Relationships
MERGE (impl:RelationshipCategory {name: 'implementation_relationships', description: 'Relationships related to implementations'});
CREATE (impl)-[:CONTAINS]->(:RelationshipType {name: 'implements', description: 'Indicates that one entity implements another', category: 'implementation', inverse: 'is_implemented_by'});
CREATE (impl)-[:CONTAINS]->(:RelationshipType {name: 'realizes', description: 'Indicates that one entity realizes a concept', category: 'implementation', inverse: 'is_realized_by'});
CREATE (impl)-[:CONTAINS]->(:RelationshipType {name: 'extends', description: 'Indicates that one entity extends another', category: 'implementation', inverse: 'is_extended_by'});
CREATE (impl)-[:CONTAINS]->(:RelationshipType {name: 'optimizes', description: 'Indicates an optimization relationship', category: 'implementation', inverse: 'is_optimized_by'});
CREATE (doc)-[:DOCUMENTS]->(impl);

// Cross-Domain Relationships
MERGE (cross:RelationshipCategory {name: 'cross_domain_relationships', description: 'Relationships connecting different domains'});
CREATE (cross)-[:CONTAINS]->(:RelationshipType {name: 'transforms_to', description: 'Indicates a transformation between domains', category: 'cross-domain', inverse: 'is_transformed_from'});
CREATE (cross)-[:CONTAINS]->(:RelationshipType {name: 'maps_between', description: 'Indicates a mapping between domains', category: 'cross-domain', inverse: 'is_mapped_with'});
CREATE (cross)-[:CONTAINS]->(:RelationshipType {name: 'translates_from', description: 'Indicates a translation from one domain to another', category: 'cross-domain', inverse: 'is_translated_to'});
CREATE (doc)-[:DOCUMENTS]->(cross);

// Comparative Relationships
MERGE (comp:RelationshipCategory {name: 'comparative_relationships', description: 'Relationships comparing different entities'});
CREATE (comp)-[:CONTAINS]->(:RelationshipType {name: 'similar_to', description: 'Indicates similarity between entities', category: 'comparative', inverse: 'similar_to'});
CREATE (comp)-[:CONTAINS]->(:RelationshipType {name: 'different_from', description: 'Indicates differences between entities', category: 'comparative', inverse: 'different_from'});
CREATE (comp)-[:CONTAINS]->(:RelationshipType {name: 'improves_upon', description: 'Indicates an improvement relationship', category: 'comparative', inverse: 'is_improved_by'});
CREATE (comp)-[:CONTAINS]->(:RelationshipType {name: 'alternative_to', description: 'Indicates an alternative relationship', category: 'comparative', inverse: 'alternative_to'});
CREATE (doc)-[:DOCUMENTS]->(comp);

// Domain Structure Relationships
MERGE (struct:RelationshipCategory {name: 'structural_relationships', description: 'Relationships describing structure'});
CREATE (struct)-[:CONTAINS]->(:RelationshipType {name: 'CONTAINS', description: 'Indicates containment within domain hierarchy', category: 'structural', inverse: 'CONTAINED_IN'});
CREATE (doc)-[:DOCUMENTS]->(struct);

// Log completion
RETURN 'Standard relationship types created successfully' AS Status;