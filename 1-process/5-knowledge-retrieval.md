# Knowledge Retrieval System

## Overview

This phase establishes systems for efficiently retrieving mathematical knowledge, enabling targeted access to equations, algorithms, and implementation details based on natural language or structured queries.

## Process Steps

### 1. Query Processing
- Parse natural language or structured queries
- Use Cypher to search for relevant knowledge:
  ```cypher
  MATCH (n:Entity)
  WHERE n.name CONTAINS "concept" OR n.description CONTAINS "concept"
  RETURN n
  ```
- Identify relevant implementation components

### 2. Mathematical Content Retrieval
- Use Cypher to retrieve specific nodes:
  ```cypher
  MATCH (n:Entity)
  WHERE n.name IN ["specific concept1", "specific concept2"]
  RETURN n
  ```
- Access specific equations, algorithms, or methods by reference ID
- Use the equation and algorithm databases for direct lookup

### 3. Response Generation
- Synthesize information from knowledge graph
- Include precise mathematical formulations
- Format response according to query requirements

## Context Window Optimization

To maximize context window efficiency:

### 1. Mathematical Chunking
- Group related mathematical concepts together
- Store complete equation sets in dedicated files
- Link concepts to equation references without duplicating content

### 2. Tiered Loading
- Start with executive summary
- Use `search_nodes({query: "concept"})` to find relevant nodes
- Use `open_nodes({names: ["specific concept"]})` to load only necessary data
- Reference implementation code without full inclusion

### 3. Reference Pointers
- Use standardized reference format: `[CONCEPT:REFERENCE]`
- Example: `[Legendre Coefficient Decay:Liu2018:p1477]`
- Enables retrieving specific source material when needed

### 4. Progressive Disclosure
- Begin with high-level concepts
- Expand mathematical details on request
- Load implementation specifics when needed

## Available Tools

### Knowledge Graph Cypher Operations
- `MATCH`: Find nodes and patterns in the knowledge graph
- `WHERE`: Filter query results based on conditions
- `RETURN`: Specify data to be returned from queries
- `ORDER BY`: Sort the results of a query
- `LIMIT`: Restrict the number of results returned
- `SKIP`: Skip a number of results before returning the rest
- `WITH`: Chain together different parts of a query
- `OPTIONAL MATCH`: Match patterns if they exist, return null otherwise

### File System Functions
- `read_file`: Read file contents
- `search_files`: Search for files matching a pattern

## Example Query Processing

```cypher
// Process a query about Legendre coefficient decay rates
MATCH (concept:Entity)
WHERE concept.name CONTAINS "Legendre" AND concept.name CONTAINS "decay rate"
RETURN concept;

// Retrieve specific equations related to the concept
MATCH (equation:MathematicalEquation)
WHERE equation.name = "Error Bound Equation"
RETURN equation;

// Generate extended query to find related concepts
MATCH (concept:Entity)-[:RELATED_TO|DEPENDS_ON|DERIVES_FROM]->(related:Entity)
WHERE concept.name CONTAINS "Legendre coefficient"
RETURN concept, related;
```
