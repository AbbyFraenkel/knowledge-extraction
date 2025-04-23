# Cypher File Validation Guide

This document provides guidance for validating Cypher files used in the knowledge extraction system. It includes validation criteria, common errors to check for, and example validation queries.

## Validation Objectives

1. **Syntax Validation**: Ensure Cypher syntax is correct and well-formed
2. **Schema Compliance**: Verify files adhere to the knowledge graph schema
3. **Relationship Consistency**: Check that relationships connect valid entity types
4. **Property Completeness**: Confirm all required properties are present
5. **Cross-Reference Integrity**: Validate references to other entities
6. **Nomenclature Preservation**: Ensure mathematical notation is preserved correctly

## Validation Procedure

### 1. File Structure Validation

Verify each Cypher file has appropriate structure:

- **Header Comment**: Descriptive comment explaining the purpose
- **Entity Creation**: CREATE statements for nodes
- **Relationship Creation**: MATCH and CREATE statements for relationships
- **Property Setting**: SET statements for additional properties
- **Example Usage**: Commented example (if applicable)

Example validation check:
```bash
# Check for required sections in Cypher files
grep -l "^// " *.cypher | xargs grep -l "CREATE (" | xargs grep -l "MATCH"
```

### 2. Syntax Validation

Check Cypher syntax using Neo4j's syntax validation tools:

```bash
# Using Neo4j's cypher-shell (if available)
cat file.cypher | cypher-shell -u neo4j -p password --format plain

# Alternative: Use a linting tool
npx cypher-lint file.cypher
```

Common syntax errors to check:
- Missing closing parentheses or brackets
- Unclosed quotes in strings
- Missing commas between properties
- Invalid property names or values
- Incorrect relationship direction

### 3. Schema Compliance Validation

#### 3.1 Node Label Validation

Ensure all node labels match defined schema:

```cypher
// Get all node labels used in Cypher files
MATCH (n) 
RETURN distinct labels(n) as Labels

// Compare with allowed labels
MATCH (n) 
WHERE NOT any(label IN labels(n) WHERE label IN ['Symbol', 'Paper', 'MathematicalConcept', 'Algorithm', 'NumericalMethod', 'ApplicationDomain', 'Implementation'])
RETURN n
```

#### 3.2 Relationship Type Validation

Ensure all relationship types match defined schema:

```cypher
// Get all relationship types used in Cypher files
MATCH ()-[r]->() 
RETURN distinct type(r) as RelationshipTypes

// Compare with allowed relationship types
MATCH ()-[r]->() 
WHERE NOT type(r) IN ['APPEARS_IN', 'REPRESENTS', 'HAS_INTERPRETATION_IN', 'CONFLICTS_WITH', 'SYNONYM_OF', 'EQUIVALENT_TO', 'DERIVED_FROM', 'IMPLEMENTED_AS', 'APPLIES_TO', 'BASED_ON', 'IMPROVES_UPON', 'DEPENDS_ON', 'INTEGRATES_WITH']
RETURN r
```

### 4. Property Completeness Validation

#### 4.1 Required Property Validation

Check for missing required properties:

```cypher
// Check Symbol nodes for required properties
MATCH (s:Symbol)
WHERE NOT (exists(s.name) AND exists(s.context) AND exists(s.meaning))
RETURN s.name as Symbol, 'Missing properties' as Issue

// Check Paper nodes for required properties
MATCH (p:Paper)
WHERE NOT (exists(p.id) AND exists(p.title) AND exists(p.year))
RETURN p.id as Paper, 'Missing properties' as Issue

// Check all relationships for required properties
MATCH ()-[r:HAS_INTERPRETATION_IN]->()
WHERE NOT (exists(r.meaning) AND exists(r.units))
RETURN type(r) as Relationship, 'Missing properties' as Issue
```

#### 4.2 Property Type Validation

Check for incorrect property types:

```cypher
// Check numeric properties
MATCH (s:Symbol)
WHERE exists(s.year) AND NOT apoc.meta.type(s.year) IN ['Long', 'Integer']
RETURN s.name as Symbol, 'Incorrect year type' as Issue

// Check string arrays
MATCH (s:Symbol)
WHERE exists(s.alternativeNotations) AND NOT apoc.meta.type(s.alternativeNotations) = 'StringArray'
RETURN s.name as Symbol, 'Incorrect alternativeNotations type' as Issue
```

### 5. Relationship Consistency Validation

Check for valid relationship patterns:

```cypher
// Check that APPEARS_IN relationships only connect Symbols to Papers
MATCH (a)-[r:APPEARS_IN]->(b)
WHERE NOT (a:Symbol AND b:Paper)
RETURN a, r, b, 'Invalid APPEARS_IN relationship' as Issue

// Check that REPRESENTS relationships only connect Symbols to MathematicalConcepts
MATCH (a)-[r:REPRESENTS]->(b)
WHERE NOT (a:Symbol AND b:MathematicalConcept)
RETURN a, r, b, 'Invalid REPRESENTS relationship' as Issue

// Check that HAS_INTERPRETATION_IN relationships only connect Symbols to ApplicationDomains
MATCH (a)-[r:HAS_INTERPRETATION_IN]->(b)
WHERE NOT (a:Symbol AND b:ApplicationDomain)
RETURN a, r, b, 'Invalid HAS_INTERPRETATION_IN relationship' as Issue
```

### 6. Cross-Reference Integrity Validation

Check that referenced entities exist:

```cypher
// Find all referenced paper IDs in Symbol nodes
MATCH (s:Symbol)
WHERE exists(s.paperSources)
UNWIND s.paperSources as paperRef
WITH paperRef
MATCH (p:Paper {id: paperRef})
RETURN count(*) as FoundPapers

// Compare with total references
MATCH (s:Symbol)
WHERE exists(s.paperSources)
UNWIND s.paperSources as paperRef
RETURN count(distinct paperRef) as TotalReferences
```

### 7. Nomenclature Preservation Validation

Check for notation preservation:

```cypher
// Check for Symbol nodes with both name and latexRepresentation
MATCH (s:Symbol)
WHERE NOT (exists(s.name) AND exists(s.latexRepresentation))
RETURN s.name as Symbol, 'Missing notation properties' as Issue

// Check for empty latex representations
MATCH (s:Symbol)
WHERE exists(s.latexRepresentation) AND s.latexRepresentation = ''
RETURN s.name as Symbol, 'Empty LaTeX representation' as Issue

// Check that originalNotation is preserved exactly
MATCH (s:Symbol)
WHERE NOT exists(s.originalNotation) OR s.originalNotation <> s.name
RETURN s.name as Symbol, 'Original notation not preserved' as Issue
```

## Common Cypher File Errors

### 1. Entity Creation Errors

- Creating duplicate entities without first checking existence
- Missing required properties in CREATE statements
- Incorrect label capitalization (should be CamelCase)
- Property values with incorrect types

Example fix:
```cypher
// Bad: Creating without checking existence
CREATE (sym:Symbol {name: "α", context: "Heat Transfer"})

// Good: Check for existence first
MERGE (sym:Symbol {name: "α", context: "Heat Transfer"})
ON CREATE SET sym.meaning = "Thermal diffusivity"

// Alternative: Check before creating
MATCH (sym:Symbol {name: "α", context: "Heat Transfer"})
WHERE sym IS NULL
CREATE (sym:Symbol {name: "α", context: "Heat Transfer", meaning: "Thermal diffusivity"})
```

### 2. Relationship Errors

- Incorrect relationship direction (-> vs <-)
- Missing properties on relationships
- Creating relationships without ensuring endpoints exist
- Relationship types that don't match schema

Example fix:
```cypher
// Bad: Creating relationships without ensuring endpoints
MATCH (sym:Symbol {name: "α"})
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sym)-[:APPEARS_IN]->(paper)

// Good: Check that both endpoints exist
MATCH (sym:Symbol {name: "α"})
MATCH (paper:Paper {id: "Smith2022"})
WHERE sym IS NOT NULL AND paper IS NOT NULL
CREATE (sym)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7"
}]->(paper)
```

### 3. Property Value Errors

- String property values missing quotes
- Array values improperly formatted
- Unicode characters not properly escaped
- Missing escape characters in strings

Example fix:
```cypher
// Bad: Improper string handling
CREATE (sym:Symbol {name: α, latex: "\alpha"})

// Good: Proper string handling
CREATE (sym:Symbol {name: "α", latexRepresentation: "\\alpha"})
```

### 4. Schema Compliance Errors

- Using non-existent labels
- Using non-existent relationship types
- Missing required properties
- Using properties with incorrect types

Example fix:
```cypher
// Bad: Non-existent label and missing properties
CREATE (s:SymbolEntity {name: "α"})

// Good: Correct label and all required properties
CREATE (s:Symbol {
  name: "α",
  context: "Heat Transfer",
  meaning: "Thermal diffusivity",
  latexRepresentation: "\\alpha"
})
```

## Automated Validation Scripts

### Basic Syntax Validation Script

```bash
#!/bin/bash
# validate_cypher_syntax.sh
# Validates Cypher file syntax

CYPHER_DIR="/projects/git/knowledge-extraction/cypher"

for file in $(find $CYPHER_DIR -name "*.cypher"); do
  echo "Validating $file..."
  
  # Check for basic syntax issues
  if grep -q "[^\\]\"" $file; then
    echo "ERROR: Possible unescaped quotes in $file"
  fi
  
  if grep -q "{[^}]*$" $file; then
    echo "ERROR: Possible unclosed braces in $file"
  fi
  
  # Check for required sections
  if ! grep -q "^// " $file; then
    echo "WARNING: Missing header comment in $file"
  fi
  
  if ! grep -q "CREATE" $file; then
    echo "WARNING: No CREATE statement in $file"
  fi
  
  echo "Done."
  echo
done
```

### Schema Compliance Script

```bash
#!/bin/bash
# validate_cypher_schema.sh
# Validates Cypher files against schema

CYPHER_DIR="/projects/git/knowledge-extraction/cypher"
SCHEMA_FILE="/projects/git/knowledge-extraction/cypher/schema/entity-types.cypher"

# Extract allowed entity types from schema
ALLOWED_ENTITIES=$(grep "CREATE CONSTRAINT" $SCHEMA_FILE | grep -o ":[a-zA-Z]\+" | tr -d ":")
echo "Allowed entity types: $ALLOWED_ENTITIES"

# Check entity types in all Cypher files
for file in $(find $CYPHER_DIR -name "*.cypher"); do
  echo "Checking entity types in $file..."
  
  # Extract entity types from file
  ENTITIES=$(grep -o ":[a-zA-Z]\+" $file | sort | uniq | tr -d ":")
  
  # Check each entity against allowed list
  for entity in $ENTITIES; do
    if ! echo $ALLOWED_ENTITIES | grep -q $entity; then
      echo "ERROR: Invalid entity type '$entity' in $file"
    fi
  done
  
  echo "Done."
  echo
done
```

## Validation Examples for Specific Entity Types

### Symbol Entity Validation

```cypher
// Validate Symbol entities
MATCH (s:Symbol)
WITH s
WHERE NOT (
  exists(s.name) AND 
  exists(s.context) AND 
  exists(s.meaning) AND 
  exists(s.latexRepresentation) AND
  exists(s.originalNotation)
)
RETURN s.name as SymbolName, s.context as Context, 
  collect(CASE WHEN NOT exists(s.name) THEN 'name' 
               WHEN NOT exists(s.context) THEN 'context'
               WHEN NOT exists(s.meaning) THEN 'meaning'
               WHEN NOT exists(s.latexRepresentation) THEN 'latexRepresentation'
               WHEN NOT exists(s.originalNotation) THEN 'originalNotation'
          END) as MissingProperties
```

### Domain Interpretation Validation

```cypher
// Validate HAS_INTERPRETATION_IN relationships
MATCH (s:Symbol)-[r:HAS_INTERPRETATION_IN]->(d:ApplicationDomain)
WITH r
WHERE NOT (
  exists(r.meaning) AND 
  exists(r.units) AND 
  exists(r.mappingType)
)
RETURN startNode(r).name as Symbol, endNode(r).name as Domain,
  collect(CASE WHEN NOT exists(r.meaning) THEN 'meaning' 
               WHEN NOT exists(r.units) THEN 'units'
               WHEN NOT exists(r.mappingType) THEN 'mappingType'
          END) as MissingProperties
```

### Implementation Mapping Validation

```cypher
// Validate IMPLEMENTED_AS relationships
MATCH (s:Symbol)-[r:IMPLEMENTED_AS]->(i:Implementation)
WITH r
WHERE NOT (
  exists(r.variableName) AND 
  exists(r.variableType) AND 
  exists(r.moduleLocation)
)
RETURN startNode(r).name as Symbol, endNode(r).name as Implementation,
  collect(CASE WHEN NOT exists(r.variableName) THEN 'variableName' 
               WHEN NOT exists(r.variableType) THEN 'variableType'
               WHEN NOT exists(r.moduleLocation) THEN 'moduleLocation'
          END) as MissingProperties
```

## Integration with Knowledge Extraction Workflow

Incorporate validation into your workflow:

1. **Pre-Commit Validation**: Validate Cypher files before committing changes
2. **Continuous Integration**: Run validation scripts as part of CI pipeline
3. **Pre-Import Validation**: Validate before importing to Neo4j database
4. **Post-Import Verification**: Run graph queries to verify data integrity

Sample integration with workflow:

```bash
#!/bin/bash
# validate_and_import.sh
# Validates and imports Cypher files to Neo4j

CYPHER_DIR="/projects/git/knowledge-extraction/cypher"
NEO4J_IMPORT="$NEO4J_HOME/bin/neo4j-admin import"

# 1. Run syntax validation
./validate_cypher_syntax.sh

# 2. Run schema validation
./validate_cypher_schema.sh

# 3. If validation passes, import to Neo4j
if [ $? -eq 0 ]; then
  echo "Validation passed, importing to Neo4j..."
  
  # Import entities first
  for file in $(find $CYPHER_DIR/entities -name "*.cypher"); do
    cat $file | cypher-shell -u neo4j -p password
  done
  
  # Then import relationships
  for file in $(find $CYPHER_DIR/relationships -name "*.cypher"); do
    cat $file | cypher-shell -u neo4j -p password
  done
  
  echo "Import complete."
else
  echo "Validation failed. Please fix errors before importing."
  exit 1
fi
```

## Conclusion

Regular validation of Cypher files ensures:

1. **Data Quality**: Properly structured entities and relationships
2. **Consistency**: Adherence to schema and naming conventions
3. **Integrity**: Valid cross-references and property values
4. **Usability**: Ability to effectively query the knowledge graph

By following these validation guidelines, you'll maintain a high-quality knowledge graph that accurately preserves mathematical notation while enabling cross-domain mapping between mathematical concepts and engineering applications.
