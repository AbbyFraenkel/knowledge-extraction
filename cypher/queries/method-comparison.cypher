// Method Comparison Queries
// These queries are designed to compare numerical methods and their properties
// from the knowledge graph in various ways.

// 1. Find direct method comparisons
MATCH (m1:NumericalMethod)-[r:COMPARED_TO]->(m2:NumericalMethod)
RETURN m1.name, m2.name, r.context, r.accuracyComparison, r.performanceComparison;

// 2. Find methods with the same mathematical foundation
MATCH (m1:NumericalMethod)-[:BASED_ON]->(c:MathematicalConcept)<-[:BASED_ON]-(m2:NumericalMethod)
WHERE m1.name < m2.name  // To avoid duplicates
RETURN m1.name, m2.name, c.name;

// 3. Compare methods by application domain effectiveness
MATCH (m1:NumericalMethod)-[r1:APPLIES_TO]->(d:ApplicationDomain)<-[r2:APPLIES_TO]-(m2:NumericalMethod)
WHERE m1.name < m2.name  // To avoid duplicates
RETURN d.name AS application_domain, 
       m1.name AS method1, 
       r1.effectiveness AS method1_effectiveness,
       m2.name AS method2,
       r2.effectiveness AS method2_effectiveness;

// 4. Find methods that implement similar algorithms
MATCH (a1:Algorithm)-[:IMPLEMENTS]->(m1:NumericalMethod)
MATCH (a2:Algorithm)-[:IMPLEMENTS]->(m2:NumericalMethod)
WHERE 
  m1.name <> m2.name AND
  a1.type = a2.type
RETURN m1.name, m2.name, a1.type, a1.name, a2.name;

// 5. Compare methods by their category and properties
MATCH (m1:NumericalMethod), (m2:NumericalMethod)
WHERE 
  m1.name < m2.name AND  // To avoid duplicates
  m1.category = m2.category
RETURN m1.name, m2.name, m1.category,
       m1.accuracy, m2.accuracy,
       m1.limitations, m2.limitations;

// 6. Find hybrid methods and their components
MATCH (h:NumericalMethod)-[r1:COMBINES]->(m1:NumericalMethod)
MATCH (h)-[r2:COMBINES]->(m2:NumericalMethod)
WHERE m1.name < m2.name  // To avoid duplicates
RETURN h.name AS hybrid_method, 
       h.hybridStrategy,
       m1.name AS component1, 
       r1.componentRole AS role1,
       m2.name AS component2,
       r2.componentRole AS role2;

// 7. Compare methods by their implementation complexity
MATCH (i1:Implementation)-[:IMPLEMENTS]->(m1:NumericalMethod)
MATCH (i2:Implementation)-[:IMPLEMENTS]->(m2:NumericalMethod)
WHERE m1.name <> m2.name
RETURN m1.name, m2.name, 
       i1.name, i2.name,
       i1.implementationComplexity, i2.implementationComplexity;

// 8. Find methods with opposite strengths and weaknesses
MATCH (m1:NumericalMethod)-[r1:APPLIES_TO]->(d:ApplicationDomain)<-[r2:APPLIES_TO]-(m2:NumericalMethod)
WHERE 
  m1.name <> m2.name AND
  ANY(lim1 IN r1.limitations WHERE NOT lim1 IN r2.limitations) AND
  ANY(lim2 IN r2.limitations WHERE NOT lim2 IN r1.limitations)
RETURN m1.name, m2.name, d.name, 
       r1.limitations AS m1_limitations, 
       r2.limitations AS m2_limitations;

// 9. Compare methods by their KitchenSink integration approach
MATCH (i1:Implementation)-[:IMPLEMENTS]->(m1:NumericalMethod)
MATCH (i2:Implementation)-[:IMPLEMENTS]->(m2:NumericalMethod)
MATCH (i1)-[r1:INTEGRATES_WITH]->(k:KitchenSinkComponent)<-[r2:INTEGRATES_WITH]-(i2)
WHERE m1.name <> m2.name
RETURN m1.name, m2.name, k.name,
       r1.interfacePoints AS m1_interfaces,
       r2.interfacePoints AS m2_interfaces;

// 10. Compare methods by their performance on test cases
MATCH (t:TestCase)-[r1:VALIDATES]->(a1:Algorithm)-[:IMPLEMENTS]->(m1:NumericalMethod)
MATCH (t)-[r2:VALIDATES]->(a2:Algorithm)-[:IMPLEMENTS]->(m2:NumericalMethod)
WHERE m1.name <> m2.name
RETURN t.name AS test_case, 
       m1.name AS method1, 
       m2.name AS method2,
       r1.accuracy AS m1_accuracy,
       r2.accuracy AS m2_accuracy;

// 11. Find methods recommended for specific application domains
MATCH (m1:NumericalMethod)-[r:COMPARED_TO]->(m2:NumericalMethod)
WHERE r.recommendationContext = "[CONTEXT]" AND r.recommendedChoice IS NOT NULL
RETURN r.recommendationContext, r.recommendedChoice, r.recommendationJustification;

// 12. Compare methods by their historical development
MATCH (m1:NumericalMethod)-[r:HISTORICAL_CONTEXT]->(m2:NumericalMethod)
RETURN m1.name, m2.name, r.relationship, r.timeline;

// 13. Find methods with theoretical connections
MATCH (c1:MathematicalConcept)<-[:BASED_ON]-(m1:NumericalMethod)
MATCH (c2:MathematicalConcept)<-[:BASED_ON]-(m2:NumericalMethod)
MATCH (c1)-[r:THEORETICAL_CONNECTION]->(c2)
WHERE m1.name <> m2.name
RETURN m1.name, m2.name, 
       c1.name, c2.name,
       r.nature, r.strength;

// 14. Compare methods by convergence properties from their algorithms
MATCH (a1:Algorithm)-[:IMPLEMENTS]->(m1:NumericalMethod)
MATCH (a2:Algorithm)-[:IMPLEMENTS]->(m2:NumericalMethod)
WHERE m1.name <> m2.name
RETURN m1.name, m2.name, 
       a1.convergenceRate, a2.convergenceRate;

// 15. Find methods suitable for specific physical phenomena
MATCH (m1:NumericalMethod)-[r1:APPLIES_TO]->(d:ApplicationDomain)
WHERE d.name CONTAINS "[DOMAIN_KEYWORD]"
RETURN m1.name, d.name, r1.effectiveness
ORDER BY r1.effectiveness DESC;

// 16. Compare methods by their pasteurization modeling suitability
MATCH (m1:NumericalMethod)-[r:COMPARED_TO]->(m2:NumericalMethod)
RETURN m1.name, m2.name, r.pasteurizationRelevance;

// 17. Find methods by heat transfer application effectiveness
MATCH (m:NumericalMethod)-[r:APPLIES_TO]->(d:ApplicationDomain)
WHERE d.name CONTAINS "Heat Transfer"
RETURN m.name, r.effectiveness
ORDER BY r.effectiveness DESC;

// 18. Compare methods based on their algorithms' time complexity
MATCH (a1:Algorithm)-[:IMPLEMENTS]->(m1:NumericalMethod)
MATCH (a2:Algorithm)-[:IMPLEMENTS]->(m2:NumericalMethod)
WHERE m1.name <> m2.name
RETURN m1.name, m2.name, 
       a1.timeComplexity, a2.timeComplexity;

// 19. Find methods with complementary properties for hybridization
MATCH (m1:NumericalMethod), (m2:NumericalMethod)
WHERE 
  m1.name < m2.name AND
  m1.category <> m2.category AND
  NOT (m1)-[:COMPARED_TO]->(m2) AND
  NOT (m2)-[:COMPARED_TO]->(m1)
RETURN m1.name, m2.name, m1.category, m2.category;

// 20. Compare methods by their ability to handle moving boundaries
MATCH (m:NumericalMethod)-[r:APPLIES_TO]->(d:ApplicationDomain)
WHERE d.name CONTAINS "Moving Boundary" OR d.name CONTAINS "Phase Change"
RETURN m.name, d.name, r.effectiveness, r.limitations
ORDER BY r.effectiveness DESC;
