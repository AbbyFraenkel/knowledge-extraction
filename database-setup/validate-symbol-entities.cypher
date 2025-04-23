// Symbol Entity Validation Script
// This script performs validation of Symbol entities in the knowledge graph
// to ensure they follow schema requirements and maintain data quality

// 1. Validate required properties on all Symbol nodes
MATCH (s:Symbol)
WITH s, 
     s.name IS NOT NULL AS has_name,
     s.context IS NOT NULL AS has_context,
     s.latex IS NOT NULL AS has_latex,
     s.meaning IS NOT NULL AS has_meaning
WHERE NOT (has_name AND has_context AND has_latex AND has_meaning)
RETURN s.name AS Symbol, s.context AS Context,
       [k IN ['name', 'context', 'latex', 'meaning'] 
        WHERE NOT apoc.meta.get(s, k)?] AS MissingProperties,
       "Missing required properties" AS ValidationFailure;

// 2. Check for duplicate Symbol entities (same name and context)
MATCH (s1:Symbol)
MATCH (s2:Symbol)
WHERE s1.name = s2.name AND s1.context = s2.context AND id(s1) < id(s2)
RETURN s1.name AS Symbol, s1.context AS Context,
       "Duplicate Symbol entity found" AS ValidationFailure,
       id(s1) AS ID1, id(s2) AS ID2;

// 3. Validate LaTeX formatting
MATCH (s:Symbol)
WHERE s.latex IS NOT NULL AND 
      NOT (
        s.latex STARTS WITH "\\" OR 
        s.latex CONTAINS "{" OR
        s.latex = s.name
      )
RETURN s.name AS Symbol, s.latex AS LaTeX,
       "LaTeX formatting may be incorrect" AS ValidationFailure;

// 4. Validate relationships to papers
MATCH (s:Symbol)
WHERE s.paperSources IS NOT NULL
UNWIND s.paperSources AS paperRef
OPTIONAL MATCH (p:Paper {id: paperRef})
WITH s, paperRef, p
WHERE p IS NULL
RETURN s.name AS Symbol, paperRef AS MissingPaper,
       "Referenced paper not found in knowledge graph" AS ValidationFailure;

// 5. Check for unconnected Symbol nodes
MATCH (s:Symbol)
WHERE NOT EXISTS { (s)-[]-() }
RETURN s.name AS Symbol, s.context AS Context,
       "Isolated Symbol node with no relationships" AS ValidationFailure;

// 6. Check for implicit conflicts (same symbol, different meaning, no CONFLICTS_WITH relation)
MATCH (s1:Symbol), (s2:Symbol)
WHERE s1.name = s2.name AND s1.context <> s2.context AND id(s1) < id(s2)
AND NOT EXISTS { (s1)-[:CONFLICTS_WITH]->(s2) }
AND NOT EXISTS { (s2)-[:CONFLICTS_WITH]->(s1) }
AND NOT EXISTS { (s1)-[:SYNONYM_OF]->(s2) }
AND NOT EXISTS { (s2)-[:SYNONYM_OF]->(s1) }
RETURN s1.name AS Symbol, s1.context AS Context1, s2.context AS Context2,
       "Potential symbol conflict not documented with CONFLICTS_WITH relation" AS ValidationFailure;

// 7. Validate dimensionality values
MATCH (s:Symbol)
WHERE s.dimensionality IS NOT NULL 
AND NOT s.dimensionality IN ["Scalar", "Vector", "Matrix", "Tensor", "Field", "Operator", "Functional"]
RETURN s.name AS Symbol, s.dimensionality AS Dimensionality,
       "Unexpected dimensionality value" AS ValidationFailure;

// 8. Validate domain-specific properties for orthogonal collocation symbols
MATCH (s:Symbol)
WHERE s.context CONTAINS "collocation" OR s.context CONTAINS "spectral"
AND NOT (
    s.basisFunctionType IS NOT NULL OR
    s.collocationPointType IS NOT NULL OR
    s.convergenceProperty IS NOT NULL
)
RETURN s.name AS Symbol, s.context AS Context,
       "Missing orthogonal collocation specific properties" AS ValidationFailure;

// 9. Validate moving boundary symbols
MATCH (s:Symbol)
WHERE s.context CONTAINS "boundary" AND s.context CONTAINS "moving"
AND NOT (
    s.boundaryType IS NOT NULL OR
    s.transformationType IS NOT NULL
)
RETURN s.name AS Symbol, s.context AS Context,
       "Missing moving boundary specific properties" AS ValidationFailure;

// 10. Check consistent units within physical domains
MATCH (s:Symbol)-[:HAS_INTERPRETATION_IN]->(d:ApplicationDomain)
WHERE d.name = "Thermal Engineering" AND s.units IS NULL
RETURN s.name AS Symbol, d.name AS Domain,
       "Missing units for physical quantity in engineering domain" AS ValidationFailure;

// 11. Validate error analysis symbols
MATCH (s:Symbol)
WHERE s.context CONTAINS "error" OR s.context CONTAINS "convergence"
AND NOT (
    s.errorNorm IS NOT NULL OR
    s.convergenceRate IS NOT NULL OR
    s.errorType IS NOT NULL
)
RETURN s.name AS Symbol, s.context AS Context,
       "Missing error analysis specific properties" AS ValidationFailure;

// 12. Validate implementation mappings
MATCH (s:Symbol)-[r:IMPLEMENTED_AS]->(i:Implementation)
WHERE NOT (
    r.codeVariable IS NOT NULL AND
    r.dataType IS NOT NULL
)
RETURN s.name AS Symbol, i.name AS Implementation,
       "Incomplete implementation mapping" AS ValidationFailure;

// 13. Check physical interpretation consistency
MATCH (s:Symbol)-[r:HAS_PHYSICAL_INTERPRETATION]->(p:PhysicalQuantity)
WHERE NOT (
    r.physicalMeaning IS NOT NULL AND
    r.siUnits IS NOT NULL
)
RETURN s.name AS Symbol, p.name AS PhysicalQuantity,
       "Incomplete physical interpretation" AS ValidationFailure;

// 14. Validate mathematical domain property values
MATCH (s:Symbol)
WHERE s.mathematicalDomain IS NOT NULL 
AND NOT s.mathematicalDomain IN [
    "Orthogonal Collocation", 
    "Spectral Methods", 
    "Finite Difference", 
    "Finite Element", 
    "Moving Boundary Methods",
    "Conservation Laws",
    "Error Analysis"
]
RETURN s.name AS Symbol, s.mathematicalDomain AS Domain,
       "Uncommon or unexpected mathematical domain value" AS ValidationFailure;

// 15. Summary of validation results
MATCH (s:Symbol)
RETURN count(s) AS TotalSymbols,
       sum(CASE WHEN s.latex IS NULL THEN 1 ELSE 0 END) AS MissingLaTeX,
       sum(CASE WHEN s.meaning IS NULL THEN 1 ELSE 0 END) AS MissingMeaning,
       sum(CASE WHEN s.dimensionality IS NULL THEN 1 ELSE 0 END) AS MissingDimensionality,
       sum(CASE WHEN s.paperSources IS NULL THEN 1 ELSE 0 END) AS MissingPaperSources,
       sum(CASE WHEN NOT EXISTS { (s)-[]-() } THEN 1 ELSE 0 END) AS IsolatedSymbols,
       "Validation Summary" AS Report;
