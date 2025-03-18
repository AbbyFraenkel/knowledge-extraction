// Knowledge Graph Restructuring: Database Reset and Constraints
// Created: March 18, 2025
// Purpose: Clean existing database and set up structural constraints

// Step 1: Clear all existing nodes and relationships
MATCH (n)
DETACH DELETE n;

// Step 2: Create constraints for unique entity names by type
// Domain constraints
CREATE CONSTRAINT domain_name_unique IF NOT EXISTS FOR (n:Domain) REQUIRE n.name IS UNIQUE;

// Core entity type constraints
CREATE CONSTRAINT math_concept_name_unique IF NOT EXISTS FOR (n:MathematicalConcept) REQUIRE n.name IS UNIQUE;
CREATE CONSTRAINT math_equation_name_unique IF NOT EXISTS FOR (n:MathematicalEquation) REQUIRE n.name IS UNIQUE;
CREATE CONSTRAINT algorithm_name_unique IF NOT EXISTS FOR (n:Algorithm) REQUIRE n.name IS UNIQUE;
CREATE CONSTRAINT numerical_method_name_unique IF NOT EXISTS FOR (n:NumericalMethod) REQUIRE n.name IS UNIQUE;
CREATE CONSTRAINT implementation_name_unique IF NOT EXISTS FOR (n:Implementation) REQUIRE n.name IS UNIQUE;
CREATE CONSTRAINT visual_technique_name_unique IF NOT EXISTS FOR (n:VisualTechnique) REQUIRE n.name IS UNIQUE;
CREATE CONSTRAINT physical_application_name_unique IF NOT EXISTS FOR (n:PhysicalApplication) REQUIRE n.name IS UNIQUE;
CREATE CONSTRAINT cross_domain_bridge_name_unique IF NOT EXISTS FOR (n:CrossDomainBridge) REQUIRE n.name IS UNIQUE;

// Step 3: Create indexes for faster querying
CREATE INDEX domain_index IF NOT EXISTS FOR (n:Domain) ON (n.name);
CREATE INDEX entity_index IF NOT EXISTS FOR (n:Entity) ON (n.name);

// Step 4: Create compound label for all entities for easier querying
CREATE CONSTRAINT entity_name_unique IF NOT EXISTS FOR (n:Entity) REQUIRE n.name IS UNIQUE;

// Step 5: Log completion
RETURN 'Database reset and constraints created successfully' AS Status;