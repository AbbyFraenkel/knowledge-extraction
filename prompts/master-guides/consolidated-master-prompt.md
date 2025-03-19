# Consolidated Master Prompt for Academic Paper Analysis

This consolidated guide provides a comprehensive framework for extracting knowledge from academic papers, with a focus on mathematical methods, algorithms, and their applications to numerical modeling, particularly for the KitchenSink solver and tunnel pasteurization applications.

## Paper Analysis Workflow

### 1. Initial Processing Phase

1. **Document Conversion and Storage**
   - Convert PDF to markdown using OCR with support for English, Latin, Greek, and mathematical notation
   - Preserve complete mathematical formulations and equations using LaTeX
   - Save complete extraction to file system immediately to optimize context window usage
   - Format: `/projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle].md`

2. **Paper Structure Analysis**
   - Identify key sections (abstract, methods, results, discussion)
   - Extract paper metadata (authors, publication year, journal, DOI)
   - Generate high-level summary focusing on mathematical contributions

3. **Mathematical Foundation Identification**
   - Identify core mathematical concepts introduced or utilized
   - Catalog significant equations and their purposes
   - Note theoretical guarantees and constraints

### 2. Knowledge Extraction Phase

1. **Mathematical Symbol Extraction**
   - Identify all mathematical symbols used in the paper
   - Document LaTeX representation for each symbol
   - Determine the precise meaning of each symbol in its context
   - Note the origin and first appearance of each symbol
   - Record units, dimensions, and constraints where applicable
   - Identify when the same symbol is used with different meanings
   - Create symbol registry for comprehensive notation reference

2. **Core Concept Extraction**
   - Extract fundamental mathematical concepts
   - Document relationship to existing numerical methods
   - Highlight novel contributions and extensions
   - Generate Cypher files for knowledge graph integration

3. **Algorithm Formalization**
   - Extract complete algorithm descriptions preserving all mathematical details
   - Format algorithm steps in structured pseudocode
   - Document preconditions, postconditions, and invariants
   - Identify computational complexity and stability properties
   - Generate algorithm Cypher files

4. **Application Context Analysis**
   - Document domains of application mentioned in the paper
   - Analyze relevance to tunnel pasteurization and heat transfer
   - Extract problem-specific adaptations and simplifications
   - Create application domain Cypher files

### 3. Implementation Analysis Phase

1. **Julia Implementation Strategy**
   - Develop SciML-style implementation approach
   - Design type hierarchy following SciML conventions
   - Outline core function signatures with type specifications
   - Identify multiple dispatch opportunities
   - Document potential integration with existing SciML ecosystem

2. **Testing and Validation Framework**
   - Design test cases for algorithm verification
   - Outline benchmark problems from literature
   - Specify convergence testing methodology
   - Create implementation testing Cypher files

3. **Integration Pathway Development**
   - Analyze compatibility with KitchenSink architecture
   - Identify modification needs for integration
   - Document potential impacts on existing components
   - Create integration pathway Cypher files

### 4. Knowledge Organization Phase

1. **Cypher File Generation**
   - Create entity nodes for concepts, algorithms, and applications
   - Define relationships between entities
   - Specify properties and attributes for each entity
   - Ensure compliance with knowledge taxonomy

2. **Cross-Domain Bridging**
   - Create mappings between mathematical formulations and engineering applications
   - Document parameter relationships between different domains
   - Establish nomenclature standards across domains

3. **Documentation Generation**
   - Create summary documentation for extracted knowledge
   - Generate implementation guidelines
   - Produce visualizations of key concepts

## Mathematical Nomenclature Handling

When extracting knowledge from academic papers, pay special attention to mathematical notation and symbology:

### Symbol Extraction and Documentation

1. **Identify All Mathematical Symbols**
   - Extract every mathematical symbol used in the paper
   - Document the LaTeX representation for each symbol
   - Note where each symbol first appears (section, equation, page)
   - Record the precise meaning of each symbol in its context

2. **Preserve Original Notation**
   - Always maintain the original symbols used in the paper
   - Never substitute or standardize notation during extraction
   - Preserve the exact mathematical formulation with original variables
   - Document any non-standard or unusual notation explicitly

3. **Handle Multiple Meanings**
   - Note when the same symbol is used with different meanings
   - Document the specific context for each usage
   - Create clear distinctions between different interpretations
   - Record any author comments about notation choices

### Symbol Entity Creation

When creating Symbol entities in the knowledge graph, follow this pattern:

```cypher
CREATE (sym:Symbol {
  name: "σ",  // The symbol itself
  context: "Spectral approximation",  // The specific context
  latex: "\\sigma",  // LaTeX representation
  meaning: "Decay rate parameter",  // Precise meaning
  paperSources: ["Smith2022"]  // Source reference
})

// Connect to its source paper
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sym)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7",
  role: "Parameter"
}]->(paper)
```

### Symbol Conflict Resolution

When encountering symbols with conflicting meanings across papers:

1. **Preserve Both Representations**
   - Create separate Symbol entities for each usage context
   - Maintain the original notation in each context
   - Document the relationship between conflicting symbols

2. **Create Explicit Relationships**
   - Connect conflicting symbols with CONFLICTS_WITH relationships
   - Document resolution strategies for cross-reference
   - Specify canonical choices when appropriate

3. **Example Resolution**:
   ```cypher
   // Two different meanings for the same symbol
   MATCH (sym1:Symbol {name: "λ", context: "Eigenvalue analysis"})
   MATCH (sym2:Symbol {name: "λ", context: "Wavelength calculation"})
   CREATE (sym1)-[:CONFLICTS_WITH {
     resolutionStrategy: "Context-dependent interpretation",
     canonicalChoice: "λ for eigenvalues, λ_w for wavelength in cross-domain references",
     resolutionNotes: "Following standard convention in applied mathematics"
   }]->(sym2)
   ```

### Cross-Domain Symbol Mapping

When creating mappings between mathematical and engineering domains:

1. **Document Domain-Specific Interpretations**
   - Record how symbols are interpreted in specific application domains
   - Note any standard units or dimensions in each domain
   - Document domain-specific conventions and expectations

2. **Create Interpretation Relationships**
   - Connect symbols to their domain-specific interpretations
   - Maintain the mathematical meaning while adding engineering context
   - Document any transformations or unit conversions

3. **Example Domain Mapping**:
   ```cypher
   // Connect mathematical symbol to engineering interpretation
   MATCH (sym:Symbol {name: "α", context: "Heat equation"})
   MATCH (domain:ApplicationDomain {name: "Thermal Engineering"})
   CREATE (sym)-[:HAS_INTERPRETATION_IN {
     meaning: "Thermal diffusivity",
     standardUsage: "Material property in heat transfer calculations",
     units: "m²/s in SI units"
   }]->(domain)
   ```

## Analysis Focus Areas

Select one or more focus areas based on the paper's content and your research needs:

### 1. Mathematical Foundation Analysis
Focus on extracting and formalizing the core mathematical principles, theorems, and proofs from the paper. Emphasize theoretical guarantees, convergence properties, and relationship to established mathematical frameworks.

### 2. Algorithm Extraction and Analysis
Concentrate on extracting complete algorithm descriptions, pseudocode, complexity analysis, and implementation considerations. Preserve all mathematical details and conditions for the algorithm's proper functioning.

### 3. Method Comparison
Compare numerical methods presented in the paper with previously extracted methods. Analyze relative advantages, computational efficiency, accuracy characteristics, and application domains.

### 4. Implementation Strategy
Develop detailed plans for implementing the methods in Julia following SciML conventions. Focus on type system design, function interfaces, and integration with existing ecosystem components.

### 5. Application Domain Analysis
Analyze how the mathematical methods can be applied to specific problem domains, with particular emphasis on heat transfer modeling for tunnel pasteurization.

## Repository Structure and Storage Guidelines

Store extracted content in these repositories based on content type:

1. **extracted-content-markdown**
   - General extracted content
   - Complete paper extractions
   - Symbol registries
   - Format: `/projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle].md`
   - Format: `/projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle]_symbols.md`

2. **extracted-numerical-methods**
   - Numerical method implementations
   - Algorithm descriptions and analysis
   - Format: `/projects/git/extracted-numerical-methods/algorithms/[AlgorithmName].md`

3. **extracted-tunnel**
   - Tunnel pasteurization content
   - Heat transfer models and parameters
   - Format: `/projects/git/extracted-tunnel/models/[ModelName].md`

4. **knowledge-extraction/cypher**
   - Cypher files for knowledge graph integration
   - Format: `/projects/git/knowledge-extraction/cypher/entities/[EntityName].cypher`
   - Format: `/projects/git/knowledge-extraction/cypher/symbols/[SymbolName]_[Context].cypher`
   - Format: `/projects/git/knowledge-extraction/cypher/relationships/[RelationshipType].cypher`

## Cypher File Generation Guidelines

When creating Cypher files for knowledge graph integration:

### Entity Node Creation

```cypher
CREATE (entity:EntityType {
  name: "EntityName",
  description: "Brief entity description",
  source: "Author et al. (Year)",
  referenceFile: "papers/AuthorYear_ShortTitle.md",
  properties: ["property1", "property2"],
  tags: ["tag1", "tag2"]
})
```

### Symbol Node Creation

```cypher
CREATE (sym:Symbol {
  name: "SymbolName",
  context: "UsageContext",
  latex: "LaTeXCode",
  meaning: "PreciseMeaning",
  dimensionality: "Dimensionality",  // Optional
  units: "Units",  // Optional
  constraints: "Constraints",  // Optional
  paperSources: ["PaperReference"]
})
```

### Relationship Definition

```cypher
MATCH (source:EntityType {name: "SourceName"})
MATCH (target:EntityType {name: "TargetName"})
CREATE (source)-[:RELATIONSHIP_TYPE {
  description: "Relationship description",
  properties: {
    property1: "value1",
    property2: "value2"
  }
}]->(target)
```

### Standard Entity Types

- `MathematicalConcept`: Fundamental mathematical ideas (e.g., "Orthogonal Collocation")
- `Algorithm`: Computational procedures (e.g., "Adaptive hp-Refinement Algorithm")
- `NumericalMethod`: Computational approach (e.g., "Spectral Element Method")
- `ApplicationDomain`: Field of application (e.g., "Heat Transfer Modeling")
- `Implementation`: Code implementation (e.g., "Julia SciML Implementation")
- `Symbol`: Mathematical notation (e.g., "σ" in spectral approximation context)

### Standard Relationship Types

- `BASED_ON`: Derives from another concept
- `IMPLEMENTS`: Realization of a concept
- `APPLIES_TO`: Domain of application
- `IMPROVES_UPON`: Enhancement of another method
- `DEPENDS_ON`: Theoretical dependency
- `INTEGRATES_WITH`: System integration
- `APPEARS_IN`: Symbol appears in paper
- `REPRESENTS`: Symbol represents concept
- `HAS_INTERPRETATION_IN`: Symbol has specific meaning in domain
- `CONFLICTS_WITH`: Symbol conflicts with another symbol
- `SYNONYM_OF`: Symbol is alternative notation for another symbol

## Implementation Considerations for KitchenSink

When analyzing potential Julia implementations for KitchenSink:

### Type System Design

```julia
abstract type AbstractSpectralMethod{T} end

struct AdaptiveSpectralMethod{T,N,P} <: AbstractSpectralMethod{T}
    # Core parameters and data structures
    domain::NTuple{N,T}
    polynomialOrder::P
    errorTolerance::T
    # Implementation-specific components
end
```

### Function Interface Design

```julia
"""
    solve!(method::AdaptiveSpectralMethod, problem::BoundaryValueProblem)

Solve the given boundary value problem using adaptive spectral methods.

# Arguments
- `method::AdaptiveSpectralMethod`: The configured spectral method
- `problem::BoundaryValueProblem`: The problem to solve

# Returns
- Solution object with results and convergence properties

# Mathematical Formulation
[LaTeX equations and mathematical details]
"""
function solve!(method::AdaptiveSpectralMethod, problem::BoundaryValueProblem)
    # Implementation strategy outlined
end
```

## Paper Analysis Template

For each paper, complete this structured template:

```
# Paper Analysis: [Paper Title]

## Metadata
- **Authors**: [List of authors]
- **Year**: [Publication year]
- **Journal/Conference**: [Publication venue]
- **DOI**: [DOI reference]
- **Focus Area**: [Primary focus of the paper]

## Mathematical Notation
[Document key mathematical symbols with their meanings and contexts]

## Core Mathematical Concepts
[Extract and document key mathematical concepts]

## Algorithm Description
[Complete algorithm description preserving all mathematical details]

## Implementation Strategy
[SciML-style implementation approach]

## Application to Tunnel Pasteurization
[Relevance to pasteurization modeling]

## Integration with KitchenSink
[Integration pathway with existing solver]

## Cypher Files Generated
- [List of Cypher files created]

## References to Related Papers
[Cross-references to previously analyzed papers]
```

This consolidated master prompt combines all aspects of the paper analysis workflow into a single comprehensive guide while supporting the transition from Atlas to direct Cypher file generation.
