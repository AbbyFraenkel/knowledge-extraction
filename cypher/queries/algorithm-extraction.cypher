// Algorithm Extraction Queries
// These queries are designed to extract and analyze algorithm information
// from the knowledge graph in various ways.

// 1. Find all algorithms with their basic properties
MATCH (a:Algorithm)
RETURN a.name, a.description, a.type, a.problemDomain, a.timeComplexity, a.spaceComplexity
ORDER BY a.name;

// 2. Find algorithms based on problem domain
MATCH (a:Algorithm)
WHERE a.problemDomain CONTAINS "[DOMAIN_KEYWORD]"
RETURN a.name, a.description, a.problemDomain, a.timeComplexity;

// 3. Find algorithms by complexity constraints
MATCH (a:Algorithm)
WHERE 
  // Customize these conditions as needed
  (a.timeComplexity CONTAINS "n log n" OR a.timeComplexity CONTAINS "n²") AND
  NOT a.timeComplexity CONTAINS "n³"
RETURN a.name, a.description, a.timeComplexity, a.spaceComplexity
ORDER BY a.name;

// 4. Find algorithms that implement a specific numerical method
MATCH (a:Algorithm)-[:IMPLEMENTS]->(m:NumericalMethod {name: "[METHOD_NAME]"})
RETURN a.name, a.description, a.timeComplexity, m.name;

// 5. Find algorithms based on mathematical foundation
MATCH (a:Algorithm)-[:BASED_ON]->(c:MathematicalConcept {name: "[CONCEPT_NAME]"})
RETURN a.name, a.description, c.name;

// 6. Find algorithms with their application domains
MATCH (a:Algorithm)-[r:APPLIES_TO]->(d:ApplicationDomain)
RETURN a.name, d.name, r.effectiveness, r.limitations;

// 7. Find algorithms that improve upon other algorithms
MATCH (a:Algorithm)-[r:IMPROVES_UPON]->(b:Algorithm)
RETURN a.name AS improved_algorithm, 
       b.name AS original_algorithm, 
       r.improvements, 
       r.tradeoffs;

// 8. Find component relationships between algorithms
MATCH (a:Algorithm)-[r:USES]->(b:Algorithm)
RETURN a.name AS parent_algorithm, 
       b.name AS component_algorithm, 
       r.description, 
       r.integration;

// 9. Find algorithms with their implementations
MATCH (i:Implementation)-[r:IMPLEMENTS]->(a:Algorithm)
RETURN a.name, i.name, i.language, r.completeness;

// 10. Find algorithms from a specific paper
MATCH (a:Algorithm)-[:DESCRIBED_IN]->(p:Paper {id: "[PAPER_ID]"})
RETURN a.name, a.description, p.title, p.authors;

// 11. Find algorithms with their validation test cases
MATCH (t:TestCase)-[r:VALIDATES]->(a:Algorithm)
RETURN a.name, t.name, t.type, r.accuracy;

// 12. Find algorithms by tag
MATCH (a:Algorithm)
WHERE "[TAG_NAME]" IN a.tags
RETURN a.name, a.description, a.tags;

// 13. Find algorithms with specific stability or convergence properties
MATCH (a:Algorithm)
WHERE 
  a.stabilityConditions CONTAINS "[STABILITY_KEYWORD]" OR
  a.convergenceRate CONTAINS "[CONVERGENCE_KEYWORD]"
RETURN a.name, a.description, a.stabilityConditions, a.convergenceRate;

// 14. Find algorithms suitable for parallel computation
MATCH (a:Algorithm)
WHERE a.parallelizability CONTAINS "[PARALLEL_KEYWORD]"
RETURN a.name, a.description, a.parallelizability;

// 15. Find algorithms with their equations
MATCH (a:Algorithm)-[r:USES_EQUATION]->(e:Equation)
RETURN a.name, e.description, e.latex, r.context;

// 16. Find algorithms integrated with KitchenSink
MATCH (a:Algorithm)-[r:INTEGRATES_WITH]->(k:KitchenSinkComponent)
RETURN a.name, k.name, r.description, r.developmentStatus;

// 17. Find algorithms applied to pasteurization models
MATCH (a:Algorithm)-[r:APPLIED_IN]->(h:HeatTransferModel)
WHERE h.name CONTAINS "Pasteurization"
RETURN a.name, h.name, r.description, r.effectiveness;

// 18. Find similar algorithms based on problem domain and type
MATCH (a:Algorithm), (b:Algorithm)
WHERE 
  a.name <> b.name AND
  a.problemDomain = b.problemDomain AND
  a.type = b.type
RETURN a.name, b.name, a.problemDomain, a.type;

// 19. Find algorithms with their complete relationship context
MATCH (a:Algorithm)-[r]->(n)
RETURN a.name, type(r), n.name, labels(n);

// 20. Find adaptive algorithms with their adaptivity mechanisms
MATCH (a:Algorithm)
WHERE 
  a.type CONTAINS "Adaptive" OR
  a.name CONTAINS "Adaptive"
RETURN a.name, a.description, a.adaptivity;
