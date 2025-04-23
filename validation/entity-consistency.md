# Entity Consistency Checks

This document provides rules and procedures for ensuring entity consistency across the knowledge graph, with special focus on mathematical symbols, notation preservation, and cross-domain relationships.

## Consistency Objectives

1. **Symbol Integrity**: Ensure mathematical symbols maintain their precise meaning and notation
2. **Contextual Uniqueness**: Verify symbols are uniquely identified in their proper context
3. **Relationship Coherence**: Validate that relationships between entities are logical and consistent
4. **Cross-Domain Consistency**: Ensure consistent mapping between domains
5. **Implementation Alignment**: Verify alignment between mathematical concepts and implementation

## Entity Consistency Rules

### 1. Symbol Entity Consistency

#### 1.1 Symbol Identification Rule

Each symbol must be uniquely identified by a combination of:
- Symbol name (as it appears in original notation)
- Context (specific mathematical or application context)

```cypher
// Check for duplicate symbols within the same context
MATCH (s1:Symbol)
MATCH (s2:Symbol)
WHERE s1 <> s2 AND s1.name = s2.name AND s1.context = s2.context
RETURN s1.name as Symbol, s1.context as Context, count(*) as DuplicateCount
```

#### 1.2 Notation Preservation Rule

Original mathematical notation must be preserved exactly:
- `name` property must match the symbol as it appears in the paper
- `originalNotation` must be identical to `name`
- `latexRepresentation` must correctly represent the symbol in LaTeX

```cypher
// Check for inconsistent notation preservation
MATCH (s:Symbol)
WHERE s.name <> s.originalNotation
RETURN s.name as Symbol, s.originalNotation as Original, 
       'Inconsistent original notation' as Issue
```

#### 1.3 Symbol Context Rule

Every symbol must have a well-defined context:
- Context must be specific (e.g., "Heat equation" not just "Mathematics")
- Context must be consistent with the symbol's usage
- If a symbol is used in multiple contexts, create separate Symbol entities

```cypher
// Check for overly generic contexts
MATCH (s:Symbol)
WHERE s.context IN ['Mathematics', 'Engineering', 'Physics', 'Chemistry']
RETURN s.name as Symbol, s.context as GenericContext,
       'Context too generic' as Issue
```

#### 1.4 Symbol Completeness Rule

Every Symbol entity must have all required properties:
- `name`: The symbol itself
- `originalNotation`: Original form of the symbol
- `latexRepresentation`: LaTeX code for the symbol
- `context`: Specific mathematical or application context
- `meaning`: Precise definition in this context

```cypher
// Check for incomplete Symbol entities
MATCH (s:Symbol)
WHERE NOT (exists(s.name) AND exists(s.originalNotation) AND 
           exists(s.latexRepresentation) AND exists(s.context) AND 
           exists(s.meaning))
RETURN s.name as Symbol, 
       [p IN ['name', 'originalNotation', 'latexRepresentation', 'context', 'meaning'] 
        WHERE NOT exists(s[p])] as MissingProperties
```

### 2. Relationship Consistency

#### 2.1 Paper Source Rule

Every Symbol entity must be connected to at least one Paper:
- Each Symbol must have an APPEARS_IN relationship to a Paper
- The relationship must include section and first appearance information

```cypher
// Check for Symbols not connected to any Paper
MATCH (s:Symbol)
WHERE NOT (s)-[:APPEARS_IN]->(:Paper)
RETURN s.name as Symbol, s.context as Context, 
       'Not connected to any Paper' as Issue
```

#### 2.2 Concept Relationship Rule

Symbols representing mathematical concepts should have REPRESENTS relationships:
- Connect symbols to their corresponding MathematicalConcept entities
- Include context-specific information in the relationship

```cypher
// Check for mathematical symbols without concept connections
MATCH (s:Symbol)
WHERE s.context IN ['Spectral method', 'Orthogonal collocation', 'Heat equation'] 
AND NOT (s)-[:REPRESENTS]->(:MathematicalConcept)
RETURN s.name as Symbol, s.context as Context, 
       'Missing concept relationship' as Issue
```

#### 2.3 Domain Interpretation Rule

Symbols used in application domains should have domain interpretations:
- Connect symbols to relevant ApplicationDomain entities via HAS_INTERPRETATION_IN
- Include domain-specific meaning, units, and usage information

```cypher
// Check for engineering symbols without domain interpretations
MATCH (s:Symbol)
WHERE s.context IN ['Heat transfer', 'Fluid dynamics', 'Pasteurization'] 
AND NOT (s)-[:HAS_INTERPRETATION_IN]->(:ApplicationDomain)
RETURN s.name as Symbol, s.context as Context, 
       'Missing domain interpretation' as Issue
```

#### 2.4 Implementation Mapping Rule

Symbols implemented in code should have implementation mappings:
- Connect symbols to Implementation entities via IMPLEMENTED_AS relationships
- Include variable name, type, and location information

```cypher
// Check for KitchenSink symbols without implementation mappings
MATCH (s:Symbol)
WHERE exists(s.kitchenSinkImplementation) 
AND NOT (s)-[:IMPLEMENTED_AS]->(:Implementation {name: 'KitchenSink'})
RETURN s.name as Symbol, s.kitchenSinkImplementation as ImplementationVar, 
       'Missing implementation relationship' as Issue
```

### 3. Cross-Domain Consistency

#### 3.1 Domain Mapping Consistency Rule

Domain mappings must be consistent across entities:
- Same mathematical concept should map consistently to same engineering concept
- Units and meaning should be consistent for the same physical quantity
- Cross-domain formulas should be mathematically correct

```cypher
// Check for inconsistent domain mappings
MATCH (s1:Symbol)-[r1:HAS_INTERPRETATION_IN]->(d:ApplicationDomain)
MATCH (s2:Symbol)-[r2:HAS_INTERPRETATION_IN]->(d)
WHERE s1 <> s2 AND r1.meaning = r2.meaning AND s1.meaning <> s2.meaning
RETURN s1.name as Symbol1, s2.name as Symbol2, 
       r1.meaning as DomainMeaning, d.name as Domain,
       'Inconsistent domain mapping' as Issue
```

#### 3.2 Unit Consistency Rule

Units must be consistent for the same physical quantity:
- Same quantity should have same units or explicit conversion factors
- Unit format should be standardized (e.g., "m²/s" not "m^2/s")
- SI units should be used as the primary reference

```cypher
// Check for unit inconsistencies
MATCH (s:Symbol)-[r:HAS_INTERPRETATION_IN]->(d:ApplicationDomain)
WHERE exists(r.units) AND r.units <> ''
WITH d.name as Domain, r.meaning as Meaning, collect(distinct r.units) as UnitsList
WHERE size(UnitsList) > 1
RETURN Domain, Meaning, UnitsList, 'Inconsistent units' as Issue
```

#### 3.3 Symbol Equivalence Rule

Equivalent symbols across domains should be explicitly connected:
- Use EQUIVALENT_TO relationships between symbols with same meaning
- Document mapping equations and context in the relationship
- Designate preferred form for cross-domain references

```cypher
// Check for potentially equivalent symbols without explicit connections
MATCH (s1:Symbol)-[r1:HAS_INTERPRETATION_IN]->(d:ApplicationDomain)
MATCH (s2:Symbol)-[r2:HAS_INTERPRETATION_IN]->(d)
WHERE s1 <> s2 AND r1.meaning = r2.meaning 
AND NOT (s1)-[:EQUIVALENT_TO]-(s2)
RETURN s1.name as Symbol1, s2.name as Symbol2, 
       r1.meaning as SharedMeaning, d.name as Domain,
       'Missing equivalence relationship' as Issue
```

### 4. Implementation Consistency

#### 4.1 Code Variable Naming Rule

Implementation variable names must follow consistent patterns:
- Variables for the same concept should follow the same naming pattern
- Names should reflect mathematical meaning while being code-compatible
- Naming consistency should be maintained across modules

```cypher
// Check for inconsistent variable naming patterns
MATCH (s1:Symbol)-[r1:IMPLEMENTED_AS]->(i:Implementation)
MATCH (s2:Symbol)-[r2:IMPLEMENTED_AS]->(i)
WHERE s1.meaning CONTAINS s2.meaning AND 
      NOT (r1.variableName CONTAINS r2.variableName) AND 
      s1 <> s2
RETURN s1.name as Symbol1, r1.variableName as Var1,
       s2.name as Symbol2, r2.variableName as Var2,
       'Inconsistent variable naming pattern' as Issue
```

#### 4.2 Type Consistency Rule

Implementation types must be appropriate for the mathematical concept:
- Scalar parameters should use scalar types (e.g., Float64)
- Vector quantities should use vector types (e.g., Vector{Float64})
- Domain concepts should be represented by appropriate data structures

```cypher
// Check for type inconsistencies
MATCH (s:Symbol)-[r:IMPLEMENTED_AS]->(i:Implementation)
WHERE 
  (s.dimensionality = 'Scalar' AND NOT r.variableType IN ['Float64', 'Int64', 'Integer', 'Double']) OR
  (s.dimensionality = 'Vector' AND NOT r.variableType CONTAINS 'Vector') OR
  (s.dimensionality = 'Matrix' AND NOT r.variableType CONTAINS 'Matrix')
RETURN s.name as Symbol, s.dimensionality as Dimensionality, 
       r.variableType as ImplementationType,
       'Type inconsistency' as Issue
```

#### 4.3 Documentation Consistency Rule

Code documentation must be consistent with mathematical notation:
- DocStrings should reference the original mathematical symbols
- Mathematical formulations should be included in LaTeX format
- Cross-references to papers should be consistent

```cypher
// This check would be implemented as code review guidelines
// or automated docstring parsing analysis
```

## Entity Integrity Checks

### 1. Knowledge Graph Integrity

#### 1.1 Check Entity Uniqueness

```cypher
// Check for duplicate entities
MATCH (n)
WITH labels(n) as EntityType, n.name as Name, count(*) as Count
WHERE Count > 1 AND Name IS NOT NULL
RETURN EntityType, Name, Count ORDER BY Count DESC
```

#### 1.2 Check for Orphaned Entities

```cypher
// Check for symbols without relationships
MATCH (s:Symbol)
WHERE NOT (s)--()
RETURN s.name as Symbol, s.context as Context, 
       'Orphaned symbol' as Issue
```

#### 1.3 Check for Relationship Integrity

```cypher
// Check for relationships with missing endpoints
MATCH ()-[r]-()
WHERE startNode(r) IS NULL OR endNode(r) IS NULL
RETURN type(r) as RelationshipType, 
       'Dangling relationship' as Issue
```

### 2. Property Integrity

#### 2.1 Check for Required Properties

```cypher
// Check entities for required properties by type
MATCH (n)
WITH labels(n) as EntityType, n
CALL apoc.when(
  'Symbol' IN EntityType,
  "RETURN CASE WHEN NOT (exists(n.name) AND exists(n.context) AND exists(n.meaning)) THEN 'Missing required properties' ELSE null END as issue",
  "RETURN null as issue",
  {n: n}
) YIELD value
WHERE value.issue IS NOT NULL
RETURN n.name as Entity, EntityType, value.issue as Issue
```

#### 2.2 Check for Empty Properties

```cypher
// Check for empty string properties
MATCH (n)
UNWIND keys(n) as PropKey
WITH n, PropKey, n[PropKey] as PropValue
WHERE PropValue = '' AND PropKey <> 'notes'
RETURN labels(n) as EntityType, n.name as Entity, 
       PropKey as EmptyProperty
```

#### 2.3 Check for Property Type Consistency

```cypher
// Check for property type consistency
MATCH (n:Symbol)
WHERE (exists(n.name) AND NOT apoc.meta.type(n.name) = 'String') OR
      (exists(n.context) AND NOT apoc.meta.type(n.context) = 'String') OR
      (exists(n.latexRepresentation) AND NOT apoc.meta.type(n.latexRepresentation) = 'String')
RETURN n.name as Symbol, 
       [p IN ['name', 'context', 'latexRepresentation'] 
       WHERE exists(n[p]) AND NOT apoc.meta.type(n[p]) = 'String'] as IncorrectTypeProps
```

### 3. Context-Specific Integrity

#### 3.1 Check KitchenSink-Specific Properties

```cypher
// Check for KitchenSink-specific property consistency
MATCH (s:Symbol)
WHERE s.context IN ['Orthogonal collocation', 'Spectral method']
AND NOT exists(s.kitchenSinkImplementation)
RETURN s.name as Symbol, s.context as Context, 
       'Missing KitchenSink implementation details' as Issue
```

#### 3.2 Check Pasteurization-Specific Properties

```cypher
// Check for Pasteurization-specific property consistency
MATCH (s:Symbol)-[:HAS_INTERPRETATION_IN]->(:ApplicationDomain {name: 'Pasteurization'})
WHERE NOT exists(s.engineeringInterpretation)
RETURN s.name as Symbol, s.context as Context, 
       'Missing pasteurization interpretation details' as Issue
```

## Consistency Resolution Procedures

When inconsistencies are detected, follow these resolution procedures:

### 1. Symbol Naming Conflicts

If the same symbol has different meanings in different contexts:

1. **Keep both symbols** with their specific contexts
2. **Create a CONFLICTS_WITH relationship** between them
3. **Document a resolution strategy** on the relationship
4. **Update all references** to use context-specific identifiers

Example:
```cypher
// Create conflict relationship for symbol "h" with different meanings
MATCH (h1:Symbol {name: "h", context: "Mesh discretization"})
MATCH (h2:Symbol {name: "h", context: "Heat transfer"})
CREATE (h1)-[:CONFLICTS_WITH {
  conflictType: "Same symbol, different meanings",
  resolutionStrategy: "Use h_mesh for discretization and h_conv for heat transfer in cross-domain contexts",
  resolutionNotes: "Following standard convention in computational heat transfer"
}]->(h2)
```

### 2. Domain Mapping Inconsistencies

If the same concept has inconsistent domain mappings:

1. **Identify the canonical mapping** based on standards and conventions
2. **Update all non-canonical mappings** to align with the canonical form
3. **Document mapping relationships** with explicit conversion formulas
4. **Create EQUIVALENT_TO relationships** for equivalent forms

Example:
```cypher
// Update inconsistent domain mapping
MATCH (s:Symbol)-[r:HAS_INTERPRETATION_IN]->(:ApplicationDomain {name: "Thermal Engineering"})
WHERE r.meaning = "Thermal diffusivity" AND r.units <> "m²/s"
SET r.units = "m²/s",
    r.conversionFactors = ["1 m²/s = 10.76 ft²/s", "1 m²/s = 3600 m²/h"]
```

### 3. Implementation Inconsistencies

If code implementations are inconsistent with mathematical concepts:

1. **Update variable names** to align with mathematical meaning
2. **Correct type inconsistencies** with appropriate Julia types
3. **Enhance code documentation** with mathematical references
4. **Create or update IMPLEMENTED_AS relationships** to reflect changes

Example:
```cypher
// Update inconsistent implementation
MATCH (s:Symbol {name: "α", context: "Heat equation"})-[r:IMPLEMENTED_AS]->(:Implementation {name: "KitchenSink"})
WHERE r.variableName <> "thermal_diffusivity"
SET r.variableName = "thermal_diffusivity",
    r.variableType = "Float64",
    r.moduleLocation = "ThermalModels.jl"
```

### 4. Missing Relationship Resolution

If required relationships are missing:

1. **Identify the required relationship type** based on entity context
2. **Create the appropriate relationship** with all required properties
3. **Verify consistency** with other similar relationships
4. **Update any dependent relationships** to maintain graph integrity

Example:
```cypher
// Add missing paper relationship
MATCH (s:Symbol {name: "α", context: "Heat equation"})
MATCH (p:Paper {id: "Smith2022"})
WHERE NOT (s)-[:APPEARS_IN]->(p)
CREATE (s)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7",
  role: "Parameter"
}]->(p)
```

## Integration with Workflow

### Pre-Import Consistency Checks

Run these checks before importing new entities:

1. Check for duplicate symbols with same context
2. Verify notation preservation
3. Validate all required properties and relationships
4. Ensure proper domain mappings

### Post-Import Verification

After importing new entities:

1. Run comprehensive consistency queries
2. Verify alignment with existing entities
3. Check for new relationship patterns
4. Validate overall graph integrity

### Continuous Monitoring

Set up regular consistency monitoring:

1. Schedule automated consistency checks
2. Track consistency metrics over time
3. Alert on new inconsistencies
4. Document patterns and resolutions

## Consistency Check Automation

Automate consistency checks using these approaches:

### 1. Neo4j Procedure Implementation

Create custom procedures for complex integrity checks:

```java
// Example Neo4j procedure for symbol consistency check
@Procedure(name = "symbolConsistency.check", mode = Mode.READ)
public Stream<SymbolInconsistency> checkSymbolConsistency() {
    // Implementation that executes various consistency checks
    // and returns inconsistencies
}
```

### 2. Script-Based Automation

Use scripts to run checks on a schedule:

```bash
#!/bin/bash
# consistency_check.sh
# Runs entity consistency checks

NEO4J_HOME="/path/to/neo4j"
LOG_DIR="/path/to/logs"

# Run checks and log results
echo "Running entity consistency checks at $(date)" >> $LOG_DIR/consistency.log

# Symbol uniqueness check
cypher-shell -u neo4j -p password \
  "MATCH (s1:Symbol) MATCH (s2:Symbol) WHERE s1 <> s2 AND s1.name = s2.name AND s1.context = s2.context RETURN count(*) as DuplicateSymbols" \
  >> $LOG_DIR/consistency.log

# Additional checks...

# Send notification if issues found
if grep -q "DuplicateSymbols: [^0]" $LOG_DIR/consistency.log; then
  mail -s "Knowledge Graph Consistency Issues Detected" admin@example.com < $LOG_DIR/consistency.log
fi
```

### 3. Continuous Integration Integration

Integrate with CI/CD pipelines for pre-commit checks:

```yaml
# Example GitHub Actions workflow
name: Knowledge Graph Consistency Check

on:
  pull_request:
    paths:
      - 'cypher/**'

jobs:
  consistency-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Set up Neo4j
        run: |
          docker run -d --name neo4j -p 7474:7474 -p 7687:7687 \
            -e NEO4J_AUTH=neo4j/password neo4j:4.4
      
      - name: Import test data
        run: ./scripts/import_test_data.sh
      
      - name: Run consistency checks
        run: ./scripts/consistency_check.sh
        
      - name: Check results
        run: |
          if grep -q "Inconsistency found" consistency_results.log; then
            echo "Consistency issues detected, see log for details"
            exit 1
          fi
```

## Conclusion

Maintaining entity consistency across the knowledge graph is essential for:

1. **Knowledge Integrity**: Ensuring mathematical concepts are accurately represented
2. **Cross-Domain Mapping**: Enabling reliable translation between domains
3. **Implementation Alignment**: Supporting accurate code implementation
4. **Query Reliability**: Enabling consistent and reliable query results

By following these consistency rules and regularly running integrity checks, you'll maintain a high-quality knowledge graph that preserves mathematical notation while enabling effective cross-domain mapping and implementation integration.
