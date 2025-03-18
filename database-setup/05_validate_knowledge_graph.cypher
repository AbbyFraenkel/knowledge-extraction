// Knowledge Graph Restructuring: Validation
// Created: March 18, 2025
// Purpose: Validate the knowledge graph structure

// Validation 1: Check Domain Hierarchy
MATCH path = (d1:Domain)-[:CONTAINS*]->(d2:Domain)
WITH d2, collect(d1.name) as parents, d2.path as path
RETURN d2.name as Domain, parents as Parents, path as Path
ORDER BY path;

// Validation 2: Check Entity Distribution by Type
MATCH (n)
WHERE n:MathematicalConcept OR n:MathematicalEquation OR n:Algorithm OR
      n:NumericalMethod OR n:Implementation OR n:VisualTechnique OR
      n:PhysicalApplication OR n:CrossDomainBridge
RETURN labels(n) as EntityType, count(*) as Count
ORDER BY Count DESC;

// Validation 3: Check Entity Domain Assignment
MATCH (d:Domain)-[:CONTAINS]->(e:Entity)
WHERE NOT e:Domain
RETURN d.path as Domain, labels(e) as EntityType, e.name as EntityName
ORDER BY d.path;

// Validation 4: Check Relationship Types
MATCH (a)-[r]->(b)
WHERE type(r) <> 'CONTAINS' AND type(r) <> 'DOCUMENTS'
RETURN type(r) as RelationshipType, count(*) as Count
ORDER BY Count DESC;

// Validation 5: Check for Domain Path Correctness
MATCH (e:Entity)
WHERE NOT e:Domain
WITH e.path as entityPath, collect(e) as entities
MATCH (d:Domain)
WHERE entityPath STARTS WITH d.path
WITH entityPath, entities, collect(d) as domains
ORDER BY size(entityPath) DESC
LIMIT 1
UNWIND entities as entity
RETURN
  entity.name as Entity,
  entity.path as EntityPath,
  [d in domains | d.name] as MatchingDomains,
  size(domains) as DomainMatches;

// Validation 6: Check for File References
MATCH (e:Entity)
WHERE NOT e:Domain
RETURN
  e.name as Entity,
  e.path as Path,
  CASE WHEN e.file_references IS NULL THEN 'Missing' ELSE 'Present' END as FileReferences
ORDER BY FileReferences, e.path;