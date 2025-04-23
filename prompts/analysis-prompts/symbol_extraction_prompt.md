# Mathematical Symbol Extraction Prompt

## Purpose

This prompt guides the extraction of mathematical symbols from scientific papers with a focus on complete separation between symbols (notation) and concepts (meaning). The goal is to document all mathematical notation exactly as it appears in the paper, preserving original notation while establishing clear connections to underlying concepts.

## Extraction Process

### Phase 1: Initial Symbol Scanning

Scan the entire paper systematically to identify all mathematical symbols:

1. Start with abstract, introduction, and notation/nomenclature sections
2. Process all equations, labeled and unlabeled
3. Check figure captions, tables, and appendices for additional symbols
4. Pay special attention to definition sections where symbols are formally introduced

For each symbol identified, capture:
- The exact visual form of the symbol (e.g., α, ∇Φ, C_p)
- The location of first appearance (section, page, equation number)
- The context in which it appears (e.g., heat equation, algorithm description)
- Any explicit definition or explanation provided

### Phase 2: Symbol Property Documentation

For each identified symbol, document these properties:

#### Core Properties
- **Original Notation**: Exact form as it appears in the paper
- **LaTeX Representation**: Precise LaTeX code to reproduce the symbol
- **Context**: Specific mathematical or application context where the symbol is used
- **Meaning**: Precise definition using the paper's own terminology
- **First Appearance**: Section, page, or equation number where the symbol first appears
- **Role**: Function of the symbol (variable, parameter, operator, function, etc.)

#### Type-Specific Properties

##### For Variables and Parameters:
- **Dimensionality**: Scalar, vector, matrix, tensor, etc.
- **Units**: Physical units if applicable (SI preferred)
- **Constraints**: Any mathematical constraints or bounds
- **Domain**: The set of possible values
- **Variability**: Constant vs. varying quantity

##### For Operators and Functions:
- **Domain**: Input space or set
- **Range**: Output space or set
- **Properties**: Linearity, continuity, differentiability, etc.
- **Definition**: Explicit defining formula if provided

##### For Indices and Subscripts:
- **Range**: The set of possible values
- **Indexing Convention**: Zero-based, one-based, or other
- **Meaning**: What the index represents or enumerates
- **Dimensionality**: Maximum dimensions or multi-indexing structure

##### For Sets and Spaces:
- **Elements**: What constitutes the set
- **Properties**: Topological or algebraic properties
- **Construction**: How the set is constructed or defined
- **Notation for Subsets**: Special notation for subsets or elements

### Phase 3: Context Grouping

Group symbols by their context within the paper:

- **Core Mathematical Formulation**: Symbols in the main mathematical description
- **Numerical Discretization**: Symbols specific to discretization approach
- **Algorithm Description**: Symbols used in algorithms or procedures
- **Error Analysis**: Symbols related to error estimation and convergence
- **Implementation Considerations**: Symbols related to computational aspects
- **Application Domains**: Symbols with specific domain interpretations

### Phase 4: Symbol Registry Creation

Compile all symbols into a comprehensive Registry following this structure:

```markdown
# Symbol Registry: [Paper Reference]

## Paper Information
- **Title**: [Paper Title]
- **Authors**: [Author Names]
- **Year**: [Publication Year]
- **DOI**: [DOI Reference]

## Core Mathematical Symbols

| Symbol | LaTeX | Context | Meaning | Properties | First Appearance |
|--------|-------|---------|---------|------------|-----------------|
| [Symbol] | `[LaTeX Code]` | [Context] | [Meaning] | [Properties] | [Location] |

## Variables and Parameters

| Symbol | LaTeX | Context | Meaning | Type | Constraints | Units |
|--------|-------|---------|---------|------|------------|-------|
| [Symbol] | `[LaTeX Code]` | [Context] | [Meaning] | [Type] | [Constraints] | [Units] |

## Operators and Functions

| Symbol | LaTeX | Context | Meaning | Input Space | Output Space | Properties |
|--------|-------|---------|---------|------------|-------------|------------|
| [Symbol] | `[LaTeX Code]` | [Context] | [Meaning] | [Domain] | [Range] | [Properties] |

## Indices and Subscripts

| Symbol | LaTeX | Context | Meaning | Range | Indexing Convention |
|--------|-------|---------|---------|-------|---------------------|
| [Symbol] | `[LaTeX Code]` | [Context] | [Meaning] | [Range] | [Convention] |

## Sets and Spaces

| Symbol | LaTeX | Context | Meaning | Elements | Properties |
|--------|-------|---------|---------|----------|------------|
| [Symbol] | `[LaTeX Code]` | [Context] | [Meaning] | [Elements] | [Properties] |

## Symbol Conflicts and Resolutions

| Symbol | Context 1 | Meaning 1 | Context 2 | Meaning 2 | Resolution Strategy |
|--------|-----------|-----------|-----------|-----------|---------------------|
| [Symbol] | [Context 1] | [Meaning 1] | [Context 2] | [Meaning 2] | [Resolution] |
```

### Phase 5: Concept Identification

For each symbol, identify the underlying mathematical concept it represents:

1. Determine the fundamental mathematical concept independent of its notation
2. Check if this concept appears in other papers with different notation
3. Document the relationship between the symbol and the concept
4. Identify any ambiguities or multiple interpretations

### Phase 6: Cross-Domain Mapping

Document how symbols map to different domains:

1. **Engineering Domain Interpretation**: How mathematical symbols relate to physical quantities
2. **KitchenSink Implementation Mapping**: How symbols map to code variables and types
3. **Domain-Specific Units and Conventions**: Special interpretations in application domains

## Important Considerations

### Symbol-Concept Separation

Maintain strict separation between symbols (notation) and concepts (meaning):

1. Document symbols exactly as they appear without standardization
2. Identify underlying concepts independent of their symbolic representation
3. Connect symbols to concepts through explicit relationships
4. Never modify original notation for consistency with other sources

### Context Dependency

Be sensitive to context-dependent meanings:

1. Note if the same symbol has different meanings in different sections
2. Document context boundaries where meaning changes
3. Identify if meaning evolves or is refined throughout the paper
4. Preserve the author's original explanation of context-dependent usage

### Conflict Resolution

When the same symbol has multiple meanings:

1. Document each distinct meaning with its specific context
2. Note any author comments about notation choices
3. Identify potential confusion points for readers
4. Suggest clear resolution strategies for cross-referencing

### LaTeX Representation

Ensure accurate LaTeX for reproduction:

1. Use precise LaTeX commands matching the original appearance
2. Include modifiers, subscripts, superscripts exactly
3. For complex symbols, provide the complete LaTeX expression
4. Test the LaTeX to verify it renders correctly

## Example Extraction

### From Paper Text:

> In this section, we denote the thermal diffusivity as α, which appears in the heat equation:
> 
> ∂T/∂t = α∇²T  (3)
> 
> where T is temperature and t is time. For numerical discretization, we use a mesh with element size h and polynomial order p.

### Extraction Result:

- **Symbol**: α
  - **LaTeX**: `\alpha`
  - **Context**: Heat equation
  - **Meaning**: Thermal diffusivity coefficient
  - **Role**: Physical parameter
  - **First Appearance**: Section 2, Equation (3)
  - **Type**: Scalar
  - **Units**: m²/s
  - **Constraints**: Positive real number
  - **Concept**: ThermalDiffusivity

- **Symbol**: T
  - **LaTeX**: `T`
  - **Context**: Heat equation
  - **Meaning**: Temperature distribution
  - **Role**: Variable (dependent)
  - **First Appearance**: Section 2, Equation (3)
  - **Type**: Scalar field
  - **Units**: K or °C
  - **Concept**: Temperature

- **Symbol**: t
  - **LaTeX**: `t`
  - **Context**: Heat equation
  - **Meaning**: Time
  - **Role**: Variable (independent)
  - **First Appearance**: Section 2, Equation (3)
  - **Type**: Scalar
  - **Units**: s
  - **Concept**: Time

- **Symbol**: ∇²
  - **LaTeX**: `\nabla^2`
  - **Context**: Heat equation
  - **Meaning**: Laplacian operator
  - **Role**: Differential operator
  - **First Appearance**: Section 2, Equation (3)
  - **Input Space**: Scalar functions
  - **Output Space**: Scalar functions
  - **Properties**: Linear
  - **Concept**: LaplacianOperator

- **Symbol**: h
  - **LaTeX**: `h`
  - **Context**: Numerical discretization
  - **Meaning**: Element size
  - **Role**: Discretization parameter
  - **First Appearance**: Section 2, after Equation (3)
  - **Type**: Scalar
  - **Units**: Problem-dependent length unit
  - **Concept**: MeshSize

- **Symbol**: p
  - **LaTeX**: `p`
  - **Context**: Numerical discretization
  - **Meaning**: Polynomial order
  - **Role**: Discretization parameter
  - **First Appearance**: Section 2, after Equation (3)
  - **Type**: Integer
  - **Constraints**: Positive
  - **Concept**: PolynomialOrder

## Deliverables

The symbol extraction process should produce:

1. **Complete Symbol Registry**: Comprehensive catalog of all mathematical symbols in the paper
2. **Symbol-Concept Mappings**: Clear links between symbols and their underlying concepts
3. **Context Documentation**: Explicit documentation of context dependencies
4. **Conflict Resolution**: Strategies for handling conflicting symbol usages
5. **Cross-Domain Mappings**: Connections between mathematical symbols and their domain interpretations
6. **Cypher Files**: Symbol node creation files for the knowledge graph

## Follow-Up Tasks

After symbol extraction, these tasks should be performed:

1. **Create Concept Nodes**: Develop mathematical concept nodes for identified concepts
2. **Establish Relationships**: Create explicit relationships between symbols and concepts
3. **Document Cross-References**: Establish links to same concepts in other papers
4. **Domain Integration**: Connect to domain-specific interpretations
5. **Implementation Mapping**: Link to code implementations in KitchenSink

## Quality Checks

Verify the extraction with these checks:

1. **Completeness**: All mathematical symbols are captured
2. **Accuracy**: Symbols are represented exactly as they appear
3. **Contextual Clarity**: Context dependencies are clearly documented
4. **Concept Independence**: Symbols and concepts are properly separated
5. **LaTeX Correctness**: All LaTeX renders correctly
6. **Conflict Documentation**: All symbol conflicts are identified and resolved
7. **Cross-Domain Clarity**: Domain interpretations are clearly mapped

This structured approach ensures comprehensive extraction of mathematical symbols while maintaining the symbol-concept separation principle at the core of the knowledge extraction system.
