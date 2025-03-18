# Knowledge Graph Restructuring

## Overview

This directory contains Cypher scripts for restructuring the Atlas knowledge graph according to the knowledge taxonomy defined in `knowledge-taxonomy.md`. The scripts create a clean, standardized structure for organizing knowledge across different domains.

## File Contents

- `00_master_setup.cypher`: Master script documenting the setup process
- `01_reset_database.cypher`: Resets database and creates constraints
- `02_create_domain_hierarchy.cypher`: Creates domain hierarchy structure
- `03_create_relationship_types.cypher`: Defines standard relationship types
- `04_create_example_entities.cypher`: Creates example entities
- `05_validate_knowledge_graph.cypher`: Validates the knowledge graph structure
- `template_L2_knowledge.md`: Template for L2 knowledge tier files
- `file_structure.md`: Documentation for file structure

## Setup Process

1. **Save Current Data**: Ensure you've backed up your current knowledge graph data
2. **Execute Reset Script**: Run `01_reset_database.cypher` to clean the database
3. **Create Structure**: Run scripts 02-04 to create the new structure with examples
4. **Validate Structure**: Run `05_validate_knowledge_graph.cypher` to verify setup
5. **Migrate Content**: Develop and execute content migration scripts (to be created separately)

## Knowledge Tiers

The knowledge graph uses a tiered approach to optimize context window usage:

- **L1 Tier**: Core concepts (100-200 words) stored directly in Atlas
- **L2 Tier**: Functional details (500-1000 words) stored in `.md` files
- **L3 Tier**: Complete knowledge (2000+ words) stored in separate `.md` files

## Domain Structure

The knowledge graph is organized into four main domains:

1. **numerics**: Mathematical and numerical methods
2. **computer_vision**: Computer vision techniques and algorithms
3. **applications**: Application domains including tunnel pasteurization
4. **cross_domain_bridges**: Connections between different domains

Each domain contains subdomains as defined in `knowledge-taxonomy.md`.

## Entity Types

The knowledge graph uses standardized entity types:

- **MathematicalConcept**: Fundamental mathematical ideas
- **MathematicalEquation**: Formal mathematical expressions
- **Algorithm**: Step-by-step computational procedures
- **NumericalMethod**: Specific computational approaches
- **Implementation**: Code realizations
- **VisualTechnique**: Computer vision methods
- **PhysicalApplication**: Domain-specific applications
- **CrossDomainBridge**: Connections between domains

## Relationship Types

Relationships are categorized into five standard types:

1. **Mathematical**: derives_from, is_equivalent_to, approximates
2. **Hierarchical**: is_a, type_of, subclass_of, instance_of
3. **Implementation**: implements, realizes, extends, optimizes
4. **Cross-Domain**: transforms_to, maps_between, translates_from
5. **Comparative**: similar_to, different_from, improves_upon

## Maintenance Guidelines

When adding new knowledge:

1. Identify the appropriate domain and entity type
2. Create L1 knowledge directly in Atlas
3. Create L2 and L3 knowledge in separate files
4. Use standard relationship types for connections
5. Validate additions using the validation scripts

## Future Extensions

- Content migration scripts (to be developed)
- Knowledge enrichment scripts (to be developed)
- Integration with KitchenSink implementation (to be developed)