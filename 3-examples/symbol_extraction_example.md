# Symbol Extraction Example: "Spectral Methods for Uncertainty Quantification"

This example demonstrates the complete symbol extraction process for a mathematical paper using the nomenclature handling workflow.

## 1. Paper Information

- **Title**: Spectral Methods for Uncertainty Quantification
- **Authors**: Smith, J. and Johnson, A.
- **Year**: 2022
- **Focus**: Numerical methods for uncertainty quantification

## 2. Sample Paper Content

The paper introduces a new spectral method for uncertainty quantification. Here's a sample excerpt:

> We introduce a spectral approximation using Legendre polynomials, where the decay rate of coefficients σ determines the convergence properties. For a function f ∈ C^k, the error ε is bounded by:
>
> ε ≤ C n^(-k) ‖f^(k)‖
>
> where n is the polynomial degree, C is a constant independent of n, and ‖f^(k)‖ is the norm of the k-th derivative.
>
> When applied to stochastic differential equations with parameter α, the approximation yields a solution u(x,t) that converges with rate β depending on both σ and α. The relationship is given by:
>
> β = min(σ, α^2/2)
>
> For practical applications, we introduce a computable error estimator η to guide adaptive refinement:
>
> η = ∑_{i=N-p}^N |a_i| · L_i(x)
>
> where a_i are the spectral coefficients, L_i are the Legendre polynomials, and p is a small integer (typically p=3).

## 3. Symbol Extraction Process

### 3.1 Symbol Identification

First, we identify all mathematical symbols in the excerpt:

1. σ (sigma) - decay rate of coefficients
2. f - function being approximated
3. C^k - space of k-times differentiable functions
4. ε (epsilon) - error bound
5. C - constant in error bound
6. n - polynomial degree
7. k - smoothness parameter / derivative order
8. ‖f^(k)‖ - norm of k-th derivative
9. α (alpha) - parameter in stochastic differential equations
10. u(x,t) - solution function
11. β (beta) - convergence rate
12. η (eta) - error estimator
13. ∑ (sum) - summation operator
14. i - index variable
15. N - maximum polynomial degree
16. p - small integer parameter
17. |a_i| - absolute value of spectral coefficients
18. L_i(x) - Legendre polynomials
19. x - spatial variable
20. t - temporal variable

### 3.2 Symbol Documentation

For each symbol, we document the LaTeX representation, context, meaning, and first appearance:

| Symbol | LaTeX | Context | Meaning | Units | First Appearance |
|--------|-------|---------|---------|-------|------------------|
| σ | `\sigma` | Spectral approximation | Decay rate of coefficients | Dimensionless | Paragraph 1 |
| f | `f` | Function analysis | Function being approximated | Problem-dependent | Paragraph 1 |
| C^k | `C^k` | Function spaces | Space of k-times differentiable functions | N/A | Paragraph 1 |
| ε | `\varepsilon` | Error analysis | Error bound | Same as function | Equation 1 |
| C | `C` | Error analysis | Constant independent of n | Dimensionless | Equation 1 |
| n | `n` | Spectral approximation | Polynomial degree | Dimensionless (integer) | Equation 1 |
| k | `k` | Function smoothness | Derivative order / smoothness parameter | Dimensionless (integer) | Paragraph 1, Equation 1 |
| ‖f^(k)‖ | `\|f^{(k)}\|` | Function norms | Norm of k-th derivative | Problem-dependent | Equation 1 |
| α | `\alpha` | Stochastic modeling | Parameter in stochastic differential equations | Problem-dependent | Paragraph 2 |
| u(x,t) | `u(x,t)` | Solution functions | Solution to stochastic differential equation | Problem-dependent | Paragraph 2 |
| β | `\beta` | Convergence analysis | Convergence rate | Dimensionless | Paragraph 2 |
| η | `\eta` | Error estimation | Computable error estimator | Same as function | Paragraph 3 |
| ∑ | `\sum_{i=N-p}^N` | Operators | Summation operator | N/A | Equation 3 |
| i | `i` | Indexing | Index variable | Dimensionless (integer) | Equation 3 |
| N | `N` | Spectral approximation | Maximum polynomial degree | Dimensionless (integer) | Equation 3 |
| p | `p` | Error estimation | Small integer parameter (typically 3) | Dimensionless (integer) | Equation 3 |
| \|a_i\| | `\|a_i\|` | Spectral approximation | Absolute value of spectral coefficients | Problem-dependent | Equation 3 |
| L_i(x) | `L_i(x)` | Spectral approximation | Legendre polynomials | Dimensionless | Equation 3 |
| x | `x` | Variables | Spatial variable | Problem-dependent | Paragraph 2 |
| t | `t` | Variables | Temporal variable | Time | Paragraph 2 |

### 3.3 Context-Specific Symbol Sets

#### Spectral Approximation
- **σ**: Decay rate of coefficients (dimensionless)
- **n**: Polynomial degree (positive integer)
- **N**: Maximum polynomial degree (positive integer)
- **a_i**: Spectral coefficients (problem-dependent)
- **L_i(x)**: Legendre polynomials (dimensionless)

#### Error Analysis
- **ε**: Error bound (same units as function)
- **C**: Constant in error bound (dimensionless)
- **k**: Smoothness parameter (positive integer)
- **‖f^(k)‖**: Norm of k-th derivative (problem-dependent)
- **η**: Error estimator (same units as function)
- **p**: Small integer parameter (typically 3)

#### Stochastic Modeling
- **α**: Parameter in stochastic differential equations (problem-dependent)
- **u(x,t)**: Solution function (problem-dependent)
- **β**: Convergence rate (dimensionless)

#### Variables
- **x**: Spatial variable (problem-dependent)
- **t**: Temporal variable (time)
- **i**: Index variable (dimensionless integer)

### 3.4 Symbol Cypher File Creation

For each symbol, we create a Cypher file. Example for σ (sigma):

```cypher
// Create symbol node for decay rate parameter
CREATE (sym:Symbol {
  name: "σ",
  context: "Spectral approximation",
  latex: "\\sigma",
  meaning: "Decay rate of coefficients",
  dimensionality: "Scalar",
  constraints: "Positive real number",
  paperSources: ["Smith2022"]
})

// Connect to paper
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sym)-[:APPEARS_IN {
  section: "Introduction",
  firstAppearance: "Paragraph 1",
  role: "Parameter"
}]->(paper)

// Connect to mathematical concept
MATCH (concept:MathematicalConcept {name: "Spectral Approximation"})
CREATE (sym)-[:REPRESENTS {
  context: "In the context of coefficient decay rates"
}]->(concept)
```

Example for α (alpha):

```cypher
// Create symbol node for stochastic parameter
CREATE (sym:Symbol {
  name: "α",
  context: "Stochastic modeling",
  latex: "\\alpha",
  meaning: "Parameter in stochastic differential equations",
  dimensionality: "Scalar",
  paperSources: ["Smith2022"]
})

// Connect to paper
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sym)-[:APPEARS_IN {
  section: "Stochastic Applications",
  firstAppearance: "Paragraph 2",
  role: "Parameter"
}]->(paper)

// Connect to mathematical concept
MATCH (concept:MathematicalConcept {name: "Stochastic Differential Equations"})
CREATE (sym)-[:REPRESENTS {
  context: "In the context of parametrized SDEs"
}]->(concept)
```

### 3.5 Symbol Conflict Check

In this example, we identified a potential conflict:

- Symbol: C
- Context 1: Error analysis (constant in error bound)
- Context 2: Function spaces (C^k notation for differentiability)

### 3.6 Conflict Resolution

```cypher
// Create both symbol representations
CREATE (sym1:Symbol {
  name: "C",
  context: "Error analysis",
  latex: "C",
  meaning: "Constant independent of n in error bound",
  dimensionality: "Scalar",
  constraints: "Positive real number",
  paperSources: ["Smith2022"]
})

CREATE (sym2:Symbol {
  name: "C",
  context: "Function spaces",
  latex: "C",
  meaning: "Denotes space of continuous functions",
  paperSources: ["Smith2022"]
})

// Connect to paper
MATCH (paper:Paper {id: "Smith2022"})
CREATE (sym1)-[:APPEARS_IN {
  section: "Error Analysis",
  firstAppearance: "Equation 1",
  role: "Constant"
}]->(paper)

CREATE (sym2)-[:APPEARS_IN {
  section: "Introduction",
  firstAppearance: "Paragraph 1",
  role: "Function space notation"
}]->(paper)

// Create conflict relationship
CREATE (sym1)-[:CONFLICTS_WITH {
  resolutionStrategy: "Context-dependent interpretation",
  canonicalChoice: "C for constants, 𝓒 for function spaces in cross-domain references",
  resolutionNotes: "Standard mathematical convention distinguishes these in typesetting"
}]->(sym2)
```

### 3.7 Cross-Domain Mapping

For the decay rate parameter σ, we create a domain mapping to engineering uncertainty quantification:

```cypher
// Connect to domain-specific interpretation
MATCH (sym:Symbol {name: "σ", context: "Spectral approximation"})
MATCH (domain:ApplicationDomain {name: "Uncertainty Quantification in Engineering"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "Smoothness indicator for stochastic processes",
  standardUsage: "Used in variance reduction techniques",
  units: "Dimensionless"
}]->(domain)
```

For the stochastic parameter α, we create a domain mapping to thermal engineering:

```cypher
// Connect to domain-specific interpretation
MATCH (sym:Symbol {name: "α", context: "Stochastic modeling"})
MATCH (domain:ApplicationDomain {name: "Thermal Engineering"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "Thermal diffusivity parameter",
  standardUsage: "Key parameter in heat transfer models",
  units: "m²/s"
}]->(domain)
```

## 4. Symbol Registry Creation

Based on the extracted symbols, we create a symbol registry document:

```markdown
# Symbol Registry: Spectral Methods for Uncertainty Quantification

## Paper Information
- **Title**: Spectral Methods for Uncertainty Quantification
- **Authors**: Smith, J. and Johnson, A.
- **Year**: 2022
- **DOI**: [DOI reference]
- **Extraction Date**: March 19, 2025

## Symbol Definitions
[Table with all symbols as shown in section 3.2]

## Context-Specific Symbol Sets
[Groupings as shown in section 3.3]

## Symbol Conflicts and Resolutions
| Symbol | Conflict Type | Contexts | Resolution Strategy | Canonical Choice |
|--------|--------------|----------|---------------------|------------------|
| C | Notation Overloading | Error analysis (constant) vs. Function spaces (continuous) | Context-dependent interpretation | C for constants, 𝓒 for function spaces in cross-domain references |

## Cross-Domain Mappings
| Symbol | Math Context | Engineering Domain | Domain-Specific Meaning | Units | Standard Usage |
|--------|-------------|-------------------|------------------------|-------|---------------|
| σ | Spectral approximation | Uncertainty Quantification | Smoothness indicator for stochastic processes | Dimensionless | Used in variance reduction techniques |
| α | Stochastic modeling | Thermal Engineering | Thermal diffusivity parameter | m²/s | Key parameter in heat transfer models |

## Symbol Relationships
### Synonyms
- No direct synonyms identified in this paper

### Hierarchical Relationships
- L_i(x) → Legendre polynomials (specific instance of orthogonal polynomials)

## Notes on Notation
- The paper follows standard notation for spectral methods
- Legendre polynomials are denoted with L_i(x) rather than the alternative P_i(x) notation
- Greek letters are consistently used for parameters and rates (σ, α, β, ε, η)
```

## 5. Complete Workflow Example

The complete symbol extraction workflow for this paper would proceed as follows:

1. **Process Paper with OCR**:
   ```
   Please process this paper using OCR with support for English, Latin, Greek, and mathematical notation.
   ```

2. **Extract Mathematical Symbols**:
   ```
   Please identify all mathematical symbols used in the paper with their contexts and meanings.
   ```

3. **Create Symbol Registry**:
   ```
   Please create a symbol registry document following the SymbolRegistryTemplate.md format.
   ```

4. **Generate Symbol Cypher Files**:
   ```
   Please create Cypher files for each significant symbol using the symbol-node.cypher template.
   ```

5. **Check for Symbol Conflicts**:
   ```
   Please check if any of these symbols conflict with established notation in our knowledge base.
   ```

6. **Resolve Symbol Conflicts**:
   ```
   Please create explicit conflict resolution relationships for the identified symbol conflicts.
   ```

7. **Create Cross-Domain Mappings**:
   ```
   Please identify domain-specific interpretations for key mathematical symbols and create appropriate relationships.
   ```

8. **Save All Generated Files**:
   - Symbol Registry: `/projects/git/extracted-content-markdown/papers/Smith2022_SpectralUQ_symbols.md`
   - Symbol Cypher Files: `/projects/git/knowledge-extraction/cypher/symbols/[SymbolName]_[Context].cypher`
   - Cross-Domain Mapping: `/projects/git/extracted-content-markdown/cross-domain/SpectralMethods_to_UncertaintyQuantification.md`

This example demonstrates the complete process of extracting, documenting, and managing mathematical symbols from a paper, including conflict resolution and cross-domain mapping.
