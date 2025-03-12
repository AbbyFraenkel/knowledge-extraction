# Knowledge Retrieval System

## Overview

This phase establishes systems for efficiently retrieving mathematical knowledge, enabling targeted access to equations, algorithms, and implementation details based on natural language or structured queries.

## Process Steps

### 1. Query Processing
- Parse natural language or structured queries
- Use `search_nodes({query: "concept"})` to find relevant knowledge
- Identify relevant implementation components

### 2. Mathematical Content Retrieval
- Use `open_nodes({names: ["specific concept"]})` to retrieve only necessary nodes
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

### Knowledge Graph Functions
- `search_nodes`: Search for specific nodes in the knowledge graph
- `open_nodes`: Access specific nodes by name

### File System Functions
- `read_file`: Read file contents
- `search_files`: Search for files matching a pattern

## Example Query Processing

```javascript
// Process a query about Legendre coefficient decay rates
const relevantNodes = searchNodes({
  query: "Legendre coefficient decay rate"
})

// Retrieve specific equations related to the concept
const errorBoundEquation = openNodes({
  names: ["Error Bound Equation"]
})

// Generate response with mathematical formulation
const response = {
  concept: relevantNodes[0],
  equations: errorBoundEquation,
  implementation: `To implement coefficient decay rate analysis, use the coefficient_decay_rate() function from HPLegendre.jl`
}
```
