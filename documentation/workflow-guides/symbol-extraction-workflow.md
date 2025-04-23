# Symbol Extraction, Conflict Resolution, and Cross-Domain Mapping

This document outlines procedures for symbol extraction, conflict resolution, and cross-domain mapping as part of the paper analysis workflow. These procedures implement the Symbol-Concept Separation principle, a core architectural feature of the Knowledge Extraction System.

## 1. Symbol Extraction Process

The symbol extraction process is a critical component of the Knowledge Extraction System, following the Symbol-Concept Separation principle that strictly separates symbols (notation) from concepts (meaning).

### 1.1 Initial Symbol Identification

- Scan the entire paper systematically, starting with abstract and introduction
- Pay special attention to definition sections, equation blocks, and nomenclature lists
- Capture each unique symbol along with its first appearance location
- Record the exact visual form using LaTeX representation

### 1.2 Symbol Property Documentation

For each symbol, document:
- **Original Notation**: Exact form as it appears (e.g., α, ∇Φ, C_p)
- **LaTeX Representation**: Precise LaTeX code (e.g., `\alpha`, `\nabla\Phi`, `C_p`)
- **Context**: Specific mathematical or application context
- **Meaning**: Precise definition in the paper's own terms
- **First Appearance**: Section, page, and equation number
- **Role**: Function of the symbol (variable, parameter, operator, etc.)
- **Dimensionality**: Scalar, vector, matrix, tensor, etc.
- **Units**: Physical units if applicable (SI preferred)
- **Constraints**: Any mathematical constraints or bounds
- **Related Symbols**: Other symbols with mathematical relationships

### 1.3 Context Grouping

- Group symbols by their context of use within the paper
- Create context-specific symbol sets for:
  - Core mathematical formulation
  - Numerical discretization
  - Error analysis
  - Implementation considerations
  - Application domains

### 1.4 Meaning Validation

- Verify each symbol's meaning against all its occurrences in the paper
- Check for any inconsistencies in usage
- Identify if meanings evolve or are refined throughout the paper
- Validate that your interpretation matches the author's intent

## 2. Symbol Type-Specific Guidance

### 2.1 Variables and Parameters
- Document the range of values or constraints (e.g., "positive real number", "integer in [1,N]")
- Note whether the symbol represents a known or unknown quantity
- Specify whether the value is constant or varies within the problem domain
- For KitchenSink: Note computational role (e.g., "Discretization parameter", "Convergence indicator")

### 2.2 Operators and Functions
- Document the precise input and output spaces
- Note any special properties (linearity, continuity, etc.)
- Record the explicit definition or formula provided in the paper
- For KitchenSink: Document implementation approach for operator discretization

### 2.3 Indices and Subscripts
- Document the range and meaning of each index
- Note any special indexing conventions
- Record zero-based vs. one-based indexing choices
- For KitchenSink: Map to Julia indexing conventions (one-based)

### 2.4 Sets and Spaces
- Document the elements contained in the set
- Note any topological or algebraic properties
- Record any notation for special subsets
- For KitchenSink: Map to concrete data structures in implementation

### 2.5 Special Symbols
- Document Greek letters with their specific meanings
- Note symbols with special typographical features (hats, bars, tildes)
- Record any symbols defined by the authors specifically for the paper
- For KitchenSink: Document Julia-compatible ASCII representations

## 3. Symbol Registry Creation

After extracting all symbols, create a comprehensive Symbol Registry using the template at:
`/projects/git/knowledge-extraction/2-templates/SymbolRegistryTemplate.md`

The registry will serve as a centralized reference for all mathematical notation in the paper and should be stored at:
`/projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle]_symbols.md`

## 4. Cypher File Generation

For each significant symbol, create a Cypher file using the template at:
`/projects/git/knowledge-extraction/cypher/templates/symbol-node.cypher`

Store these files at:
`/projects/git/knowledge-extraction/cypher/symbols/[Domain]/[SymbolName]_[PaperContext].cypher`

## 5. Symbol Conflict Resolution

When the same symbol is used with different meanings, follow these procedures to identify and resolve conflicts:

### 5.1 Conflict Identification

1. **Same Paper Conflicts**: Note when the same symbol has different meanings within one paper
   - Example: α used for both thermal diffusivity and convergence parameter
   - Document the specific contexts where each meaning applies
   - Note whether the author acknowledges or addresses the potential confusion

2. **Cross-Paper Conflicts**: Document conflicts with previously extracted symbols
   - Compare with symbols in existing registry entries
   - Identify when the same symbol has different meanings across papers
   - Examine domain conventions to determine standard usage

3. **Convention Conflicts**: Identify deviations from standard conventions in the field
   - Compare with standard notation in textbooks and reference works
   - Note intentional departures from conventions (often explicitly stated by authors)
   - Document cases where notation might confuse readers familiar with standard conventions

4. **Implementation Conflicts**: Note when symbols clash with programming language keywords
   - Identify symbols that cannot be directly used in code (e.g., λ, π)
   - Document cases where symbol mappings to code require special handling
   - Note potential confusion between mathematical notation and code representations

### 5.2 Conflict Documentation

For each conflict, document:
- The conflicting symbols and their contexts
- The different meanings assigned to each
- Where each meaning is used in the paper
- Any author comments about notation choices
- Potential for confusion across domains

### 5.3 Resolution Approaches

1. **Context Disambiguation**: Use context to determine the intended meaning
   - Example: "In the heat transfer context, α represents thermal diffusivity, while in the convergence analysis, it represents the convergence parameter."
   - Document clear rules for determining meaning based on context
   - Create explicit Cypher relationships documenting context-dependent meanings

2. **Explicit Qualification**: Add qualifiers when referencing conflicting symbols
   - Example: "α_thermal" vs "α_spectral" for cross-referencing
   - Document naming conventions for qualified references
   - Ensure consistent qualification across all documentation

3. **Domain Boundary**: Keep meanings separate based on domain boundaries
   - Example: "Within fluid dynamics, σ represents stress tensor, while in spectral methods, it represents the decay rate parameter."
   - Document clear domain boundaries for interpretation
   - Create explicit domain-specific Cypher relationships

4. **Canonical Reference**: Designate a preferred form for cross-domain references
   - Example: "When referencing across domains, use α for thermal diffusivity and κ for spectral method convergence parameter."
   - Document the canonical form and rationale
   - Apply consistently in cross-domain documentation

5. **Implementation Mapping**: Create explicit mapping to implementation variables
   - Example: "α maps to alpha_thermal in heat transfer modeling and k_convergence in spectral method implementation."
   - Document variable naming conventions in implementation code
   - Create explicit Cypher relationships to implementation variables

### 5.4 Conflict Resolution in Knowledge Graph

For each conflict, create explicit Cypher relationships using:

```cypher
MATCH (sym1:Symbol {name: "[SYMBOL]", context: "[CONTEXT_1]"})
MATCH (sym2:Symbol {name: "[SYMBOL]", context: "[CONTEXT_2]"})
CREATE (sym1)-[:CONFLICTS_WITH {
  resolutionStrategy: "[RESOLUTION_APPROACH]",
  canonicalChoice: "[PREFERRED_SYMBOL]",
  resolutionNotes: "[RESOLUTION_JUSTIFICATION]"
}]->(sym2)
```

## 6. Cross-Domain Symbol Mapping

For mathematical symbols that have specific interpretations in application domains:

### 6.1 Domain-Specific Interpretation Process

1. **Identify Domain-Specific Interpretations**
   - Identify how mathematical symbols map to engineering concepts
   - Document how their interpretation differs from pure mathematical usage
   - Record any standard units or conventions specific to the domain
   - Note differences in meaning and usage across application domains

2. **Create Domain Mapping Tables**
   - Use structured tables to represent cross-domain mappings:

     | Symbol | Mathematical Context | Engineering Domain | Domain-Specific Meaning | Units | Standard Usage |
     |--------|---------------------|-------------------|------------------------|-------|---------------|
     | [sym]  | [math context]      | [domain]          | [domain meaning]       | [domain units] | [usage notes] |

   - Document multiple domains for each symbol where applicable
   - Include relevant units and dimensional analysis
   - Note standard usage and conventions within each domain

3. **KitchenSink Implementation Mappings**
   - Map mathematical symbols to their Julia implementations:

     | Symbol | Mathematical Meaning | Julia Implementation | Variable Type | Module | Implementation Notes |
     |--------|---------------------|---------------------|---------------|--------|---------------------|
     | [sym]  | [math meaning]      | [julia var]         | [type]        | [module] | [notes] |
   
   - Document symbol type (mathematical type)
   - Record Julia type (e.g., Float64, Array{Float64,1})
   - Note module where implemented
   - Include function signature and type constraints
   - Document default values (if applicable)
   - Reference detailed documentation string

4. **Tunnel Pasteurization-Specific Mappings**
   - Map mathematical symbols to pasteurization parameters:

     | Symbol | Mathematical Meaning | Pasteurization Interpretation | Physical Units | Measurement Method |
     |--------|---------------------|-------------------------------|---------------|-------------------|
     | [sym]  | [math meaning]      | [pasteurization meaning]      | [units]       | [measurement] |
   
   - Document physical interpretation in pasteurization
   - Include industry-specific units
   - Note typical range of values in brewing industry
   - Record measurement or calculation method
   - Document process impact and regulatory considerations

### 6.2 Domain Interpretation Relationships

Create Cypher relationships for domain-specific interpretations:

```cypher
MATCH (sym:Symbol {name: "[SYMBOL]", context: "[MATHEMATICAL_CONTEXT]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "[DOMAIN_SPECIFIC_MEANING]",
  standardUsage: "[STANDARD_USAGE_IN_DOMAIN]",
  units: "[DOMAIN_SPECIFIC_UNITS]"
}]->(domain)
```

### 6.3 Cross-Domain Mapping Documentation

Create cross-domain mapping documentation files for important domain pairs:

1. **Mathematics to Engineering**
   - Document standard mapping between mathematical concepts and engineering applications
   - Include unit conversions and dimensional analysis
   - Note common simplifications and assumptions
   - Reference standard texts and references for conventions

2. **Mathematical Methods to Pasteurization**
   - Document mapping between numerical methods and pasteurization modeling
   - Include physical parameter interpretations
   - Note standard simplifications and modeling approaches
   - Document container-specific concerns

3. **Mathematical Concepts to Julia Implementation**
   - Document mapping between mathematical concepts and SciML implementations
   - Include type system organization
   - Note design patterns and abstraction principles
   - Document multiple dispatch strategies

Store cross-domain mapping documents at:
`/projects/git/extracted-content-markdown/cross-domain/[MathDomain]_to_[EngineeringDomain]_mapping.md`

### 6.4 Validation of Cross-Domain Mappings

Before finalizing cross-domain mappings:
- Verify dimensional consistency across domains
- Validate unit conversions for accuracy
- Confirm that physical meaning aligns with mathematical properties
- Check that the mapping preserves mathematical constraints
- Verify implementation accurately represents mathematical concepts

## 7. Integration with Knowledge Graph

### 7.1 Symbol Node Creation

For each symbol, create a dedicated Symbol node in the knowledge graph:

```cypher
CREATE (sym:Symbol {
  name: "[SYMBOL_NAME]",
  context: "[USAGE_CONTEXT]",
  latex: "[LATEX_REPRESENTATION]",
  meaning: "[PRECISE_MEANING]",
  
  // Optional properties as applicable
  dimensionality: "[DIMENSIONALITY]",
  units: "[PHYSICAL_UNITS]",
  constraints: "[VALUE_CONSTRAINTS]",
  paperSources: ["[PAPER_REF]"],
  mathematicalDomain: "[MATH_DOMAIN]",
  computationalRole: "[COMPUTATIONAL_ROLE]"
})
```

### 7.2 Concept Relationships

Connect symbols to the mathematical concepts they represent:

```cypher
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[CONTEXT]"})
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (sym)-[:REPRESENTS {
  context: "[REPRESENTATION_CONTEXT]"
}]->(concept)
```

### 7.3 Paper Source Connections

Document where each symbol appears:

```cypher
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[CONTEXT]"})
MATCH (paper:Paper {id: "[PAPER_ID]"})
CREATE (sym)-[:APPEARS_IN {
  section: "[SECTION_REFERENCE]",
  firstAppearance: "[PAGE_OR_EQUATION_NUMBER]",
  role: "[SYMBOL_ROLE]"
}]->(paper)
```

### 7.4 Domain Interpretation Connections

Link symbols to their domain-specific interpretations:

```cypher
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[CONTEXT]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "[DOMAIN_SPECIFIC_MEANING]",
  standardUsage: "[STANDARD_USAGE_IN_DOMAIN]",
  units: "[DOMAIN_SPECIFIC_UNITS]"
}]->(domain)
```

## 8. Quality Control and Verification

### 8.1 Completeness Check

Verify that the symbol extraction includes:
- All symbols used in equations and algorithms
- All symbols defined in nomenclature lists or definitions
- All symbols used in figures and tables
- All significant indices and subscripts

### 8.2 Consistency Check

Verify consistency of:
- LaTeX representations
- Symbol meanings across contexts
- Domain interpretations
- Conflict resolutions
- Implementation mappings

### 8.3 Cross-Reference Validation

Ensure that:
- All symbols connect to appropriate concepts
- All concept relationships are bidirectionally traversable
- All symbols have paper source connections
- Domain interpretations have proper units and dimensions
- Symbol conflict resolutions are complete

## 9. Implementation Guide

### 9.1 When to Use This Workflow

Apply this symbol extraction workflow:
- For all academic papers being analyzed
- For documentation containing significant mathematical notation
- When developing cross-domain mappings
- When creating implementation guides for KitchenSink
- When documenting numerical methods for pasteurization modeling

### 9.2 Workflow Integration

This workflow integrates with the overall paper analysis workflow:
1. Initial paper processing and content extraction
2. Symbol extraction following this guide
3. Mathematical concept extraction using the concept-node template
4. Algorithm and method extraction
5. Implementation analysis
6. Cross-domain mapping and application
7. Integration with existing knowledge

### 9.3 Tools and Resources

Use these tools to support symbol extraction:
- LaTeX editors for verifying symbol representation
- Sequential thinking for complex conflict resolution
- Neo4j for visualizing symbol-concept relationships
- Atom of Thoughts for domain mapping analysis

## 10. Example Workflow

Here's a simplified example of the symbol extraction workflow applied to a paper on orthogonal collocation:

1. Identify core symbols in the paper:
   - $x_i$ (collocation points)
   - $\ell_i(x)$ (Lagrange basis functions)
   - $D_{ij}$ (differentiation matrix elements)
   
2. Document each symbol's properties:
   - $x_i$: Collocation points, locations where equations are enforced, $x_i \in [-1,1]$
   - $\ell_i(x)$: Lagrange interpolation polynomials, satisfy $\ell_i(x_j) = \delta_{ij}$
   - $D_{ij}$: Elements of differentiation matrix, computed as $D_{ij} = \ell_j'(x_i)$

3. Identify relationships and connections:
   - $x_i$ represents CollocationPoint concept
   - $\ell_i(x)$ represents LagrangeBasisFunction concept
   - $D_{ij}$ represents DifferentiationMatrix concept

4. Document KitchenSink implementation mappings:
   - $x_i$ maps to `collocation_points::Vector{T}`
   - $\ell_i(x)$ maps to `lagrange_basis(i, points, x)::Function`
   - $D_{ij}$ maps to `differentiation_matrix::Matrix{T}`

5. Create Cypher files for each symbol:
   ```cypher
   CREATE (x_i:Symbol {
     name: "x_i",
     context: "Orthogonal collocation",
     latex: "x_i",
     meaning: "Location of collocation point i",
     dimensionality: "Scalar",
     constraints: "x_i ∈ [-1,1]",
     paperSources: ["OrthogonalCollocationPaper"],
     mathematicalDomain: "Spectral Methods"
   })
   ```

6. Establish symbol-concept relationships:
   ```cypher
   MATCH (x_i:Symbol {name: "x_i", context: "Orthogonal collocation"})
   MATCH (cp:MathematicalConcept {name: "CollocationPoint"})
   CREATE (x_i)-[:REPRESENTS {
     context: "In spectral approximation"
   }]->(cp)
   ```

This workflow ensures that mathematical notation is documented comprehensively while maintaining the Symbol-Concept Separation principle at the core of the Knowledge Extraction System.