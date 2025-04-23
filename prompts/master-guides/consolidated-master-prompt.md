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

This section provides essential guidance for handling mathematical notation and symbology, with special emphasis on preserving original notation while enabling cross-domain mapping between pure mathematics and applications in KitchenSink and pasteurization modeling.

### Core Principles for Notation Handling

1. **Absolute Notation Preservation**
   - **Preserve Exactly**: Always maintain the original mathematical notation exactly as it appears in the paper
   - **Never Standardize**: Do not modify symbols for consistency with other papers or standard conventions
   - **Capture Context**: Record the precise contextual meaning for each symbol
   - **Document Precisely**: Use LaTeX, Unicode, and visual representations to ensure accurate reproduction

2. **Context-Specific Understanding**
   - **Contextual Boundaries**: Document where each symbol's meaning applies (global, section-specific, equation-specific)
   - **Meaning Evolution**: Track if a symbol's meaning evolves or is refined throughout the paper
   - **Domain Context**: Note whether the symbol is used in pure mathematics, numerical analysis, or application contexts
   - **Author Intent**: Capture the author's intended meaning, not just the symbol itself

3. **Meaning-Focused Integration**
   - **Connect by Meaning**: Integrate symbols across papers based on their meaning, not their notation
   - **Preserve Differences**: Maintain different notational choices for the same concept across papers
   - **Track Lineage**: Document how symbol usage relates to established conventions and prior work
   - **Cross-Reference Carefully**: When referring between papers, explicitly note notational differences

4. **Complete Documentation**
   - **Full Properties**: Document all properties (dimensionality, units, constraints, etc.)
   - **Related Equations**: Record key equations where the symbol appears
   - **Usage Pattern**: Note how extensively the symbol is used (central vs. peripheral)
   - **Visual Context**: When possible, include visual excerpts showing the symbol in context

### Symbol Extraction Process

Follow this detailed process for extracting and documenting mathematical symbols:

1. **Initial Symbol Identification**
   - Scan the entire paper systematically, starting with abstract and introduction
   - Pay special attention to definition sections, equation blocks, and nomenclature lists
   - Capture each unique symbol along with its first appearance location
   - Record the exact visual form using screenshots if complex notation is used

2. **Symbol Property Documentation**
   - For each symbol, document:
     - **Original Notation**: Exact form as it appears (e.g., α, ∇Φ, C_p)
     - **LaTeX Representation**: Precise LaTeX code (e.g., `\alpha`, `\nabla\Phi`, `C_p`)
     - **Unicode Representation**: Unicode code points when applicable
     - **Context**: Specific mathematical or application context
     - **Meaning**: Precise definition in the paper's own terms
     - **First Appearance**: Section, page, and equation number
     - **Role**: Function of the symbol (variable, parameter, operator, etc.)
     - **Dimensionality**: Scalar, vector, matrix, tensor, etc.
     - **Units**: Physical units if applicable (SI preferred)
     - **Constraints**: Any mathematical constraints or bounds
     - **Related Symbols**: Other symbols with mathematical relationships

3. **Context Grouping**
   - Group symbols by their context of use within the paper
   - Create context-specific symbol sets for:
     - Core mathematical formulation
     - Numerical discretization
     - Error analysis
     - Implementation considerations
     - Application domains

4. **Meaning Validation**
   - Verify each symbol's meaning against all its occurrences in the paper
   - Check for any inconsistencies in usage
   - Identify if meanings evolve or are refined throughout the paper
   - Validate that your interpretation matches the author's intent

### Symbol Type-Specific Guidance

#### 1. Variables and Parameters
- Document the range of values or constraints (e.g., "positive real number", "integer in [1,N]")
- Note whether the symbol represents a known or unknown quantity
- Specify whether the value is constant or varies within the problem domain
- For KitchenSink: Note computational role (e.g., "Discretization parameter", "Convergence indicator")

#### 2. Operators and Functions
- Document the precise input and output spaces
- Note any special properties (linearity, continuity, etc.)
- Record the explicit definition or formula provided in the paper
- For KitchenSink: Document implementation approach for operator discretization

#### 3. Indices and Subscripts
- Document the range and meaning of each index
- Note any special indexing conventions
- Record zero-based vs. one-based indexing choices
- For KitchenSink: Map to Julia indexing conventions (one-based)

#### 4. Sets and Spaces
- Document the elements contained in the set
- Note any topological or algebraic properties
- Record any notation for special subsets
- For KitchenSink: Map to concrete data structures in implementation

#### 5. Special Symbols
- Document Greek letters with their specific meanings
- Note symbols with special typographical features (hats, bars, tildes)
- Record any symbols defined by the authors specifically for the paper
- For KitchenSink: Document Julia-compatible ASCII representations

### Symbol Conflict Handling

When the same symbol is used with different meanings, follow these procedures:

1. **Conflict Identification**
   - **Same Paper Conflicts**: Note when the same symbol has different meanings within one paper
   - **Cross-Paper Conflicts**: Document conflicts with previously extracted symbols
   - **Convention Conflicts**: Identify deviations from standard conventions in the field
   - **Implementation Conflicts**: Note when symbols clash with programming language keywords

2. **Conflict Documentation**
   - For each conflict, document:
     - The conflicting symbols and their contexts
     - The different meanings assigned to each
     - Where each meaning is used in the paper
     - Any author comments about notation choices
     - Potential for confusion across domains

3. **Resolution Approaches**
   - **Context Disambiguation**: Use context to determine the intended meaning
   - **Explicit Qualification**: Add qualifiers when referencing conflicting symbols (e.g., "α_thermal" vs "α_spectral")
   - **Domain Boundary**: Keep meanings separate based on domain boundaries
   - **Canonical Reference**: Designate a preferred form for cross-domain references
   - **Implementation Mapping**: Create explicit mapping to implementation variables

4. **Resolution Documentation**
   - Create explicit Cypher relationships documenting conflicts
   - Document resolution strategies in the Symbol Registry
   - Include clear examples of proper cross-referencing
   - Update all related documentation with conflict notes

### Cross-Domain Symbol Mapping

For mapping between mathematical formulations and engineering applications:

1. **Domain-Specific Interpretations**
   - Document how pure mathematical symbols map to physical quantities
   - Record standard units and dimensions in engineering contexts
   - Note any domain-specific conventions or expectations
   - Create explicit Cypher relationships for domain interpretations

2. **KitchenSink-Specific Mappings**
   - Map mathematical symbols to Julia variable names
   - Document type relationships (e.g., symbol → Float64, symbol → AbstractArray)
   - Specify how symbols relate to KitchenSink's architecture components
   - Create direct links to implementation code when available

3. **Pasteurization-Specific Mappings**
   - Map mathematical parameters to physical beer and container properties
   - Document relationships to pasteurization process variables
   - Specify units relevant to brewing industry standards
   - Link to experimental validation data when available

4. **Cross-Domain Translation**
   - Create explicit mapping tables between domains
   - Document any conversion factors or transformations
   - Specify mapping limitations or approximations
   - Provide clear examples of translation between domains

### Symbol Entity Creation in Knowledge Graph

When creating Symbol entities, follow this pattern:

```cypher
// Basic Symbol creation
CREATE (sym:Symbol {
  name: "α",  // Symbol exactly as it appears
  originalNotation: "α",  // Original form
  latexRepresentation: "\\alpha",  // LaTeX code
  unicodeRepresentation: "U+03B1",  // Unicode (if applicable)
  meaning: "Thermal diffusivity",  // Precise meaning
  context: "Heat transfer equation",  // Specific context
  scope: "Global",  // Scope of applicability
  
  // Optional properties - include all that apply
  dimensionality: "Scalar",  // Scalar, vector, matrix, etc.
  units: "m²/s",  // Physical units
  constraints: "Positive real number",  // Constraints
  firstAppearance: "Section 3.2, Equation 7",  // First appearance
  paperSources: ["Smith2022"],  // Source references
  symbolType: "Parameter",  // Parameter, variable, operator, etc.
  
  // Domain-specific properties (when applicable)
  kitchenSinkImplementation: "alpha",  // Implementation variable name
  engineeringInterpretation: "Thermal diffusivity of container wall",  // Engineering meaning
  experimentalDetermination: "Measured using transient heat transfer tests"  // How determined
})

// Connect to paper
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sym)-[:APPEARS_IN {
  section: "Section 3.2",
  firstAppearance: "Equation 7",
  role: "Parameter",
  originalContext: "... where α represents the thermal diffusivity ..."
}]->(paper)

// Connect to concept
MATCH (concept:MathematicalConcept {name: "HeatTransfer"})
CREATE (sym)-[:REPRESENTS {
  context: "Heat conduction in solids"
}]->(concept)

// Domain-specific interpretation
MATCH (domain:ApplicationDomain {name: "ThermalEngineering"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "Thermal diffusivity",
  standardUsage: "Material property in heat transfer calculations",
  units: "m²/s in SI units"
}]->(domain)
```

### Complete Nomenclature Example: Orthogonal Collocation

Here's a comprehensive example for orthogonal collocation methods:

**Paper Context**: "Spectral Orthogonal Collocation Methods for PDEs with Moving Boundaries"

```
Symbol: Lᵏₙ(x)
LaTeX: L^k_n(x)
Context: Polynomial basis
Meaning: Normalized Legendre polynomial of degree n with k derivatives
Role: Basis function
Properties: Orthogonal polynomial satisfying specific differential equation
First appearance: Section 2.1, Equation (3)
Usage: Used in spectral approximation of solution

Symbol: ξⱼ
LaTeX: \xi_j
Context: Collocation points
Meaning: j-th Gauss-Legendre quadrature point
Role: Discretization point
Properties: Roots of Legendre polynomial Lₙ(x)
First appearance: Section 2.2, Equation (7)
Usage: Points where differential equation is enforced exactly

Symbol: s(t)
LaTeX: s(t)
Context: Moving boundary
Meaning: Position of moving boundary at time t
Role: Unknown function
Properties: Continuous function of time
First appearance: Section 3.1, Equation (12)
Usage: Primary unknown in Stefan problem

Symbol: α
LaTeX: \alpha
Context: Thermal properties
Meaning: Thermal diffusivity of material
Role: Physical parameter
Properties: Positive real constant
Units: m²/s
First appearance: Section 4.1, Equation (18)
Usage: Appears in heat equation

Symbol: ε
LaTeX: \varepsilon
Context: Error analysis
Meaning: Truncation error
Role: Error estimate
Properties: Function of discretization parameter
First appearance: Section 5.2, Equation (25)
Usage: Used in convergence analysis
```

**Domain mapping for pasteurization application**:
- α in heat transfer → Thermal diffusivity of beer or container
- s(t) in moving boundary → Interface between pasteurized/unpasteurized zones
- ε in error analysis → Temperature prediction uncertainty

**KitchenSink implementation mapping**:
- Lᵏₙ(x) → OrthogonalPolynomial{LegendreType}
- ξⱼ → collocation_points
- s(t) → moving_boundary_position
- α → thermal_diffusivity
- ε → truncation_error

This example demonstrates complete preservation of original notation while enabling cross-domain mapping and implementation integration.

### Symbol Registry Creation

After extracting all symbols, create a comprehensive Symbol Registry using the template at:
`/projects/git/knowledge-extraction/2-templates/SymbolRegistryTemplate.md`

The registry will serve as a centralized reference for all mathematical notation in the paper and should be stored at:
`/projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle]_symbols.md`

### Integration with Knowledge Graph

For each significant symbol, create a Cypher file using the template at:
`/projects/git/knowledge-extraction/cypher/templates/symbol-node.cypher`

Store these files at:
`/projects/git/knowledge-extraction/cypher/symbols/[SymbolName]_[PaperContext].cypher`

Run validation queries to ensure proper integration with the knowledge graph.

For complete details on symbol extraction workflow, examples, and validation, see:
- Symbol Extraction Workflow: `/projects/git/knowledge-extraction/documentation/workflow-guides/symbol-extraction-workflow.md`
- Symbol Registry Example: `/projects/git/knowledge-extraction/3-examples/symbol-registry-example.md`
- Symbol Entity Validation: `/projects/git/knowledge-extraction/database-setup/validate-symbol-entities.cypher`

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
