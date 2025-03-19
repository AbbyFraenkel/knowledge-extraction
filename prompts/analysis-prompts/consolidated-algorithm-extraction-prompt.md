# Consolidated Algorithm Extraction and Analysis Prompt

## Purpose

This prompt provides comprehensive guidelines for extracting, analyzing, and documenting algorithms from academic papers. It preserves complete mathematical details while preparing the groundwork for Julia implementation following SciML conventions.

## Extraction Requirements

1. **Algorithm Identification and Classification**
   - Identify each distinct algorithm in the paper
   - Classify by type (numerical, optimization, machine learning, etc.)
   - Document the problem class it addresses
   - Note any specific requirements or constraints

2. **Complete Mathematical Preservation**
   - Extract the full algorithm description with all mathematical notation
   - Preserve all equations using LaTeX
   - Maintain the original variable names and notation when possible
   - Document all edge cases and special conditions

3. **Pseudocode Formulation**
   - Convert the algorithm to structured pseudocode
   - Include initialization steps, main loop, and termination conditions
   - Document all mathematical operations in detail
   - Note any implicit operations that might be overlooked in implementation

4. **Computational Properties Analysis**
   - Analyze time complexity with detailed justification
   - Document space complexity and memory requirements
   - Identify potential numerical stability issues
   - Analyze convergence properties and rates
   - Document accuracy and precision characteristics

## Algorithm Documentation Structure

For each algorithm, create a document with the following sections:

```markdown
# Algorithm: [Algorithm Name]

## Classification
- **Type**: [Algorithm type]
- **Problem Domain**: [Domain of application]
- **Key Mathematical Foundation**: [Core mathematical concept]

## Purpose and Context
[Brief description of the algorithm's purpose and how it fits into the broader field]

## Mathematical Preliminaries
[Essential mathematical concepts and notation required to understand the algorithm]

## Inputs and Prerequisites
- **Required Inputs**: [List of inputs with types and descriptions]
- **Optional Parameters**: [List of optional parameters with defaults and effects]
- **Preconditions**: [Required conditions before algorithm execution]

## Complete Algorithm Description

### Initialization
[Detailed initialization steps with mathematics]

### Main Procedure
[Core algorithm steps with complete mathematics]

### Termination
[Termination conditions and final processing]

## Mathematical Properties

### Convergence Properties
[Detailed convergence analysis with proofs or references]

### Stability Analysis
[Numerical stability considerations]

### Error Bounds
[Mathematical error bounds and their derivations]

## Computational Complexity

### Time Complexity
[Detailed time complexity analysis with justification]

### Space Complexity
[Memory usage analysis]

### Parallelization Potential
[Analysis of potential for parallel execution]

## Implementation Considerations

### Critical Components
[Components requiring special attention in implementation]

### Potential Optimizations
[Algorithm-specific optimization opportunities]

### Numerical Considerations
[Special numerical considerations like precision requirements]

## Test Cases and Validation

### Analytical Test Cases
[Problems with known analytical solutions for validation]

### Benchmark Problems
[Standard benchmark problems from literature]

### Validation Strategy
[Approach to validate a correct implementation]

## References to Source Paper
[Detailed references to sections/equations in the original paper]

## Cypher Integration
[Cypher file generated for knowledge graph integration]
```

## Julia Implementation Guidelines

When analyzing implementation potential for KitchenSink:

1. **Type System Design**
   - Propose abstract type hierarchy following SciML patterns
   - Define concrete parametric types with appropriate constraints
   - Outline struct fields with types and default values
   - Consider immutability vs. mutability tradeoffs

2. **Function Interface Design**
   - Define core function signatures
   - Identify multiple dispatch opportunities
   - Plan for both in-place (mutating) and out-of-place operations
   - Document memory allocation considerations

3. **Algorithm Translation Strategy**
   - Identify sections requiring special numerical attention
   - Plan vectorization opportunities
   - Note areas where Julia's multiple dispatch provides advantages
   - Consider specialized implementations for different input types

4. **SciML Integration Planning**
   - Analyze compatibility with DifferentialEquations.jl
   - Identify SciMLBase.jl interface requirements
   - Plan for ModelingToolkit.jl integration
   - Consider ComponentArrays.jl utilization

## Cypher File Generation for Algorithms

Create a Cypher file for each algorithm with the following template:

```cypher
// Algorithm Node Creation
CREATE (algo:Algorithm {
  name: "AlgorithmName",
  description: "Brief algorithm description",
  paperSource: "Author et al. (Year)",
  type: "AlgorithmType",
  problemDomain: "DomainName",
  timeComplexity: "O(n)",
  spaceComplexity: "O(n)",
  convergenceRate: "Rate description",
  referenceFile: "extracted-numerical-methods/algorithms/AlgorithmName.md",
  parameters: ["param1", "param2"],
  prerequisites: ["prereq1", "prereq2"]
})

// Mathematical Foundation Relationship
MATCH (concept:MathematicalConcept {name: "ConceptName"})
CREATE (algo)-[:BASED_ON {
  description: "How algorithm uses this concept",
  section: "Paper section reference"
}]->(concept)

// Application Domain Relationship
MATCH (domain:ApplicationDomain {name: "DomainName"})
CREATE (algo)-[:APPLIES_TO {
  description: "How algorithm applies to this domain",
  effectiveness: "Effectiveness description",
  limitations: "Domain-specific limitations"
}]->(domain)

// Improvement Relationship (if applicable)
MATCH (otherAlgo:Algorithm {name: "PreviousAlgorithmName"})
CREATE (algo)-[:IMPROVES_UPON {
  description: "How this improves the previous algorithm",
  improvements: ["improvement1", "improvement2"],
  tradeoffs: ["tradeoff1", "tradeoff2"]
}]->(otherAlgo)
```

## Output Files and Storage

For each algorithm, create and store the following files:

1. **Complete Algorithm Description**
   - Path: `/projects/git/extracted-numerical-methods/algorithms/[AlgorithmName].md`
   - Content: Full algorithm documentation following the template above

2. **Algorithm Cypher File**
   - Path: `/projects/git/knowledge-extraction/cypher/algorithms/[AlgorithmName].cypher`
   - Content: Cypher commands to integrate into knowledge graph

3. **Implementation Strategy (if focusing on implementation)**
   - Path: `/projects/git/extracted-numerical-methods/implementations/[AlgorithmName]_implementation.md`
   - Content: Detailed Julia implementation strategy

4. **Application Integration (if relevant to pasteurization)**
   - Path: `/projects/git/extracted-tunnel/algorithms/[AlgorithmName]_application.md`
   - Content: Adaptation for pasteurization modeling

## KitchenSink Integration Analysis

If the algorithm has potential for KitchenSink integration:

1. **Component Analysis**
   - Analyze how the algorithm fits into KitchenSink architecture
   - Identify required interfaces and dependencies
   - Document potential impacts on existing components

2. **Implementation Pathway**
   - Outline step-by-step integration approach
   - Identify modification needs for existing components
   - Propose testing strategy for integrated system

3. **Performance Considerations**
   - Analyze computational efficiency in KitchenSink context
   - Identify potential bottlenecks
   - Propose benchmarking strategy

This consolidated prompt ensures complete preservation of all mathematical details while providing clear guidelines for algorithm documentation, analysis, and implementation planning. It supports the transition from Atlas to direct Cypher file generation.
