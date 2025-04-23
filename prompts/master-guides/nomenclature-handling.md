# Mathematical Nomenclature Handling

This section provides comprehensive guidance for extracting and managing mathematical notation and symbology when analyzing academic papers, with a focus on preserving original notation while enabling cross-domain mapping.

## Symbol Extraction and Documentation

### 1. Identify All Mathematical Symbols

When analyzing a paper, extract and document every mathematical symbol:

- **Completeness**: Capture all symbols, even those used briefly or in specific sections
- **Contextual Awareness**: Note different meanings when symbols are used in multiple contexts
- **Hierarchy**: Identify relationships between symbols (e.g., when one is derived from another)
- **Special Attention**: Focus on symbols related to orthogonal collocation, moving boundaries, conservation properties, and error analysis

When identifying symbols, look for:

1. **Variables and Parameters**: Letters (Roman and Greek) representing quantities
2. **Operators**: Mathematical operations and transformations
3. **Special Functions**: Named functions with specific notations
4. **Indices and Subscripts**: Notational patterns for indexing
5. **Sets and Spaces**: Mathematical domains and collections
6. **Custom Notation**: Unique symbols or notations introduced by the authors

### 2. Document Symbol Properties

For each symbol, document the following properties:

```
Symbol: The actual symbol as it appears (e.g., σ, ∇, L_p)
LaTeX: The LaTeX representation (e.g., \sigma, \nabla, L_p)
Context: The specific mathematical context (e.g., "Spectral approximation")
Meaning: Precise definition in this context
First Appearance: Where the symbol is first defined (section, equation)
Role: Function of the symbol (e.g., "Parameter", "Variable", "Operator")
Units: Physical units if applicable (e.g., "m²/s", "Dimensionless")
Dimensionality: Whether it's a scalar, vector, matrix, tensor, etc.
Constraints: Any mathematical constraints (e.g., "Positive integer", "Real number in [0,1]")
Related Symbols: Other symbols with mathematical relationships to this one
```

### 3. Preserve Original Notation

The primary principle for nomenclature handling is preservation of original notation:

- **Never Standardize**: Do not change the original symbols used in the paper
- **Exact Reproduction**: Preserve the exact mathematical formulation with original variables
- **Maintain Context**: Keep the context in which symbols are used
- **Document Precisely**: Use LaTeX to ensure accurate reproduction of symbols
- **Respect Author Choices**: Even when notation deviates from common conventions

## Symbol Entity Creation

When creating Symbol entities in the knowledge graph, follow this pattern:

```cypher
CREATE (sym:Symbol {
  name: "σ",  // The symbol itself
  context: "Spectral approximation",  // The specific context
  latex: "\\sigma",  // LaTeX representation
  meaning: "Decay rate parameter",  // Precise meaning
  dimensionality: "Scalar",  // Dimensionality
  constraints: "Positive real number",  // Constraints
  paperSources: ["Smith2022"]  // Source reference
})

// Connect to source paper
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sym)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7",
  role: "Parameter"
}]->(paper)

// Connect to mathematical concept
MATCH (concept:MathematicalConcept {name: "Spectral Approximation"})
CREATE (sym)-[:REPRESENTS {
  context: "In the context of coefficient decay rates"
}]->(concept)
```

## Handling Multiple Meanings

When the same symbol is used with different meanings:

### 1. Create Separate Symbol Entities

```cypher
// First usage context
CREATE (sym1:Symbol {
  name: "C",
  context: "Error analysis",
  latex: "C",
  meaning: "Constant in error bound",
  dimensionality: "Scalar",
  constraints: "Positive real number",
  paperSources: ["Smith2022"]
})

// Second usage context
CREATE (sym2:Symbol {
  name: "C",
  context: "Function spaces",
  latex: "C",
  meaning: "Space of continuous functions",
  paperSources: ["Smith2022"]
})
```

### 2. Document Context Dependencies

- Note each distinct meaning with its specific context
- Explicitly describe how to interpret the symbol in each case
- Highlight sections or equations where meaning changes
- Provide clear disambiguation rules

### 3. Create Explicit Conflict Relationships

```cypher
// Connect conflicting symbol usages
MATCH (sym1:Symbol {name: "λ", context: "Linear algebra"})
MATCH (sym2:Symbol {name: "λ", context: "Wave mechanics"})
CREATE (sym1)-[:CONFLICTS_WITH {
  resolutionStrategy: "Context-dependent interpretation",
  canonicalChoice: "λ for eigenvalues, λ_w for wavelength in cross-domain references",
  resolutionNotes: "Following standard convention in applied mathematics"
}]->(sym2)
```

## Symbol Conflict Resolution

When encountering symbols with conflicting meanings across papers:

### 1. Identify Conflict Types

- **Same Symbol, Different Meanings**: Same notation used for different concepts
- **Different Symbols, Same Meaning**: Different notations for the same concept
- **Conventional Conflict**: Notation deviates from discipline standards
- **Internal Inconsistency**: Notation used inconsistently within one paper

### 2. Resolution Strategies

- **Context-Dependent Interpretation**: Rely on context to determine meaning
- **Explicit Disambiguation**: Use subscripts or modifiers in cross-references
- **Canonical Choice**: Designate preferred notation for cross-domain work
- **Original Preservation**: Maintain original notation with explicit mapping

### 3. Document Resolutions Clearly

```cypher
CREATE (sym1)-[:CONFLICTS_WITH {
  resolutionStrategy: "Context-dependent interpretation with explicit disambiguation",
  canonicalChoice: "When referencing across domains, use α for thermal diffusivity and α_s for stochastic parameter",
  resolutionNotes: "Based on predominant usage in heat transfer literature"
}]->(sym2)
```

## Cross-Domain Symbol Mapping

Create explicit mappings between mathematical notation and engineering concepts:

### 1. Domain-Specific Interpretations

```cypher
// Mathematical symbol
MATCH (sym:Symbol {name: "α", context: "Heat equation"})
// Engineering domain
MATCH (domain:ApplicationDomain {name: "Thermal Engineering"})
// Create interpretation
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "Thermal diffusivity",
  standardUsage: "Material property in heat transfer calculations",
  units: "m²/s in SI units"
}]->(domain)
```

### 2. Standard Engineering Mappings

For common engineering domains, document standard interpretations:

- **Heat Transfer**: α → thermal diffusivity, k → thermal conductivity
- **Fluid Dynamics**: μ → viscosity, ρ → density
- **Structural Mechanics**: σ → stress, ε → strain

### 3. KitchenSink-Specific Mappings

For the orthogonal collocation solver:

- Map mathematical symbols to variable names in Julia implementation
- Connect convergence parameters to algorithm controls
- Link error estimation symbols to implementation diagnostics
- Document mappings between mathematical domains and code modules

### 4. Pasteurization-Specific Mappings

For tunnel pasteurization applications:

- Connect mathematical parameters to physical properties of beer and containers
- Map boundary conditions to physical interfaces in the pasteurization tunnel
- Link error metrics to quality control parameters
- Document relationships between dimensionless groups and process variables

## Comprehensive Symbol Registry

For each analyzed paper, create a comprehensive symbol registry:

### 1. Registry Structure

- **Paper Information**: Title, authors, year, DOI
- **Symbol Table**: Complete list with all properties
- **Context Groupings**: Symbols organized by context
- **Conflict Documentation**: Any notation conflicts and resolutions
- **Cross-Domain Mappings**: Connections to engineering concepts
- **Symbol Relationships**: Hierarchies and dependencies
- **Notation Notes**: General observations about notation style

### 2. File Organization

- Store symbol registries with paper extractions
- Link to Cypher files for knowledge graph integration
- Reference in algorithm and implementation documentation
- Update with cross-paper integration insights

## Example Symbol Extraction

Here's an example of symbol extraction from a paper on spectral methods:

```
Symbol: σ
LaTeX: \sigma
Context: Spectral approximation
Meaning: Decay rate parameter for coefficient series
Units: Dimensionless
Constraints: Positive real number
First appearance: Section 3.2, Equation (7)
Role: Parameter
Related symbols: α (related through equation β = min(σ, α^2/2))

Symbol: α
LaTeX: \alpha
Context: Stochastic parameter
Meaning: Parameter in stochastic differential equation
Units: Problem-dependent
Constraints: Real number
First appearance: Section 4.1, Equation (12)
Role: Parameter
Related symbols: σ (through convergence rate relationship)

Conflict: α is also used in heat transfer literature for thermal diffusivity
Resolution: Use context-dependent interpretation; when referencing across domains, use α for thermal diffusivity and α_s for stochastic parameter

Engineering mapping:
α in heat transfer context represents thermal diffusivity with units m²/s
Standard usage in pasteurization modeling for container walls and liquid product
```

## Implementation in Knowledge Graph

### 1. Entity Creation

The Symbol entity in our knowledge graph has these properties:

```cypher
// Symbol properties
name: String  // The symbol itself
context: String  // Usage context to ensure uniqueness
latex: String  // LaTeX representation
meaning: String  // Precise meaning
 
// Optional properties
alternativeNotations: [String]  // Other common notations
dimensionality: String  // Scalar, vector, tensor, etc.
units: String  // Physical units if applicable
constraints: String  // Value constraints
typicalValues: String  // Normal value ranges
paperSources: [String]  // Where symbol is used
tags: [String]  // Classification tags
```

### 2. Relationship Types

Symbols can have these relationship types:

```cypher
// Symbol appears in a paper
(Symbol)-[:APPEARS_IN]->(Paper)

// Symbol represents a mathematical concept
(Symbol)-[:REPRESENTS]->(MathematicalConcept)

// Symbol has domain-specific interpretation
(Symbol)-[:HAS_INTERPRETATION_IN]->(ApplicationDomain)

// Symbol conflicts with another symbol
(Symbol)-[:CONFLICTS_WITH]->(Symbol)

// Symbol is a synonym of another symbol
(Symbol)-[:SYNONYM_OF]->(Symbol)

// Symbol is derived from another symbol
(Symbol)-[:DERIVED_FROM]->(Symbol)

// Symbol is used in an equation
(Symbol)-[:USED_IN_EQUATION]->(Equation)
```

## Integration with Master Workflow

The nomenclature handling process integrates with the overall paper analysis workflow:

1. **Initial Processing**: Convert paper and identify structure
2. **Symbol Extraction**: Identify and document all mathematical symbols
3. **Core Concept Extraction**: Extract mathematical foundations
4. **Algorithm Extraction**: Document algorithms using extracted symbols
5. **Implementation Analysis**: Map symbols to implementation variables
6. **Knowledge Organization**: Create and integrate all Cypher entities
7. **Documentation Generation**: Create comprehensive documentation

By following this nomenclature handling approach, you'll create a robust foundation for mathematical knowledge extraction that preserves original notation while enabling meaningful cross-domain integration between KitchenSink and pasteurization applications.
