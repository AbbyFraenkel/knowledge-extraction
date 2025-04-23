# Symbol Extraction Example

This document demonstrates the complete process of extracting mathematical symbols from a scientific paper, following the symbol-concept separation principle. It shows both the extraction methodology and the resulting artifacts.

## Example Paper

**Title**: "Multi-Level Orthogonal Collocation for Adaptive Solutions of PDEs with Moving Boundaries"  
**Authors**: Smith, J. and Johnson, M.  
**Year**: 2023  
**Focus**: Advanced spectral methods for moving boundary problems  

## 1. Initial Symbol Identification

### Document Scanning Process

First, the paper is systematically scanned to identify all mathematical symbols, beginning with the abstract and introduction:

```
Paper Section: Abstract
- Identified symbol: OCFC (acronym)
  Context: Method name
  Meaning: "Orthogonal Collocation on Finite Cells"
  
Paper Section: Introduction
- Identified symbol: u(x,t)
  Context: PDE variable
  Meaning: Unknown solution function
  
- Identified symbol: Ω(t)
  Context: Problem domain
  Meaning: Time-dependent physical domain
  LaTeX: \Omega(t)
  
- Identified symbol: ∂Ω(t)
  Context: Domain boundary
  Meaning: Boundary of the physical domain
  LaTeX: \partial\Omega(t)
```

Continuing with the mathematical formulation section:

```
Paper Section: Mathematical Formulation (Section 2.1)
- Identified symbol: L
  Context: Differential operator
  Meaning: Linear differential operator in space
  LaTeX: \mathcal{L}
  
- Identified symbol: s(t)
  Context: Moving boundary
  Meaning: Position of the moving boundary at time t
  LaTeX: s(t)
  
- Identified symbol: α
  Context: Physical parameter
  Meaning: Thermal diffusivity coefficient
  LaTeX: \alpha
  
Paper Section: Spectral Discretization (Section 2.2)
- Identified symbol: Lₙ(x)
  Context: Basis function
  Meaning: Legendre polynomial of degree n
  LaTeX: L_n(x)
  
- Identified symbol: ξⱼ
  Context: Collocation points
  Meaning: Gauss-Legendre quadrature points
  LaTeX: \xi_j
```

## 2. Symbol Property Documentation

### Detailed Symbol Properties

Each identified symbol is documented with comprehensive properties:

#### For variable u(x,t):
```
Original Notation: u(x,t)
LaTeX Representation: u(x,t)
Context: PDE variable in heat equation
Meaning: Temperature distribution function
Dimensionality: Scalar field
Units: Degrees Celsius (°C)
Constraints: Continuous, differentiable
First Appearance: Section 1, Equation (1)
Role: Unknown function (primary variable)
Related Symbols: ∂u/∂t, ∂²u/∂x²
```

#### For parameter α:
```
Original Notation: α
LaTeX Representation: \alpha
Context: Heat transfer equation
Meaning: Thermal diffusivity coefficient
Dimensionality: Scalar
Units: m²/s
Constraints: Positive real number
First Appearance: Section 2.1, Equation (3)
Role: Physical parameter
Standard Value Range: 10⁻⁷ to 10⁻⁴ m²/s for common materials
Related Symbols: k (thermal conductivity), ρ (density), Cₚ (specific heat)
```

#### For operator L:
```
Original Notation: L
LaTeX Representation: \mathcal{L}
Context: Differential operator
Meaning: Second-order spatial differential operator
Dimensionality: Operator (maps functions to functions)
First Appearance: Section 2.1, Equation (2)
Role: Operator
Properties: Linear, self-adjoint
Definition: L[u] = ∂²u/∂x² for heat equation
Related Symbols: ∇² (Laplacian)
```

## 3. Context Grouping

Symbols are grouped by their context within the paper:

### Core PDE Formulation
- u(x,t): Temperature distribution
- ∂u/∂t: Time derivative of temperature
- L: Differential operator
- α: Thermal diffusivity

### Domain Description
- Ω(t): Physical domain
- ∂Ω(t): Domain boundary
- s(t): Moving boundary position

### Spectral Discretization
- Lₙ(x): Legendre polynomial basis
- ξⱼ: Collocation points
- Nₑ: Number of elements
- p: Polynomial order

### Error Analysis
- ε: Error estimate
- h: Element size
- p: Polynomial degree
- r: Convergence rate

## 4. Symbol Registry Creation

The comprehensive Symbol Registry is created:

```markdown
# Symbol Registry: Smith2023_MultiLevelOC

## Paper Information
- Title: Multi-Level Orthogonal Collocation for Adaptive Solutions of PDEs with Moving Boundaries
- Authors: Smith, J. and Johnson, M.
- Year: 2023
- DOI: 10.xxxx/xxxxx

## Symbol Registry

### Core Mathematical Symbols

| Symbol | LaTeX | Context | Meaning | Properties | First Appearance |
|--------|-------|---------|---------|------------|-----------------|
| u(x,t) | `u(x,t)` | PDE variable | Temperature distribution | Scalar field, °C | Eq. (1) |
| α | `\alpha` | Heat equation | Thermal diffusivity | Scalar, m²/s, positive | Eq. (3) |
| L | `\mathcal{L}` | Differential operator | Second-order spatial operator | Linear, self-adjoint | Eq. (2) |
| Ω(t) | `\Omega(t)` | Problem domain | Time-dependent physical domain | Open subset of ℝ | Fig. 1 |
| s(t) | `s(t)` | Moving boundary | Boundary position at time t | Scalar function | Eq. (4) |

... [additional tables for other symbol categories] ...
```

## 5. Cypher File Generation

For each significant symbol, a Cypher file is created:

### Example: Cypher File for α (Thermal Diffusivity)

```cypher
// Symbol Node for Thermal Diffusivity
CREATE (alpha:Symbol {
  name: "α",
  context: "Heat transfer equation",
  latex: "\\alpha",
  meaning: "Thermal diffusivity coefficient",
  
  // Optional properties
  dimensionality: "Scalar",
  units: "m²/s",
  constraints: "Positive real number",
  paperSources: ["Smith2023"],
  mathematicalDomain: "Partial Differential Equations",
  computationalRole: "Physical parameter"
})

// Connect Symbol to Paper
MATCH (paper:Paper {id: "Smith2023"})
CREATE (alpha)-[:APPEARS_IN {
  section: "Section 2.1",
  firstAppearance: "Equation 3",
  role: "Parameter"
}]->(paper)

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "ThermalDiffusivity"})
CREATE (alpha)-[:REPRESENTS {
  context: "In heat transfer modeling"
}]->(concept)

// Connect to Domain-Specific Interpretation
MATCH (domain:ApplicationDomain {name: "ThermalEngineering"})
CREATE (alpha)-[:HAS_INTERPRETATION_IN {
  meaning: "Rate at which heat diffuses through a material",
  standardUsage: "Fundamental parameter in heat conduction equations",
  units: "m²/s in SI units"
}]->(domain)

// KitchenSink-Specific Properties
MATCH (alpha:Symbol {name: "α", context: "Heat transfer equation"})
SET alpha.implementationNote = "Implemented as thermal_diffusivity in MaterialProperties struct"
```

### Example: Cypher File for Legendre Polynomial Basis

```cypher
// Symbol Node for Legendre Polynomial
CREATE (legendre:Symbol {
  name: "Lₙ(x)",
  context: "Spectral discretization",
  latex: "L_n(x)",
  meaning: "Legendre polynomial of degree n",
  
  // Optional properties
  dimensionality: "Scalar function",
  constraints: "Defined on [-1,1]",
  paperSources: ["Smith2023"],
  mathematicalDomain: "Orthogonal Collocation",
  computationalRole: "Basis function"
})

// Connect Symbol to Paper
MATCH (paper:Paper {id: "Smith2023"})
CREATE (legendre)-[:APPEARS_IN {
  section: "Section 2.2",
  firstAppearance: "Equation 7",
  role: "Basis function"
}]->(paper)

// Connect to Mathematical Concept
MATCH (concept:MathematicalConcept {name: "LegendrePolynomial"})
CREATE (legendre)-[:REPRESENTS {
  context: "In spectral approximation"
}]->(concept)

// KitchenSink-Specific Properties
MATCH (legendre:Symbol {name: "Lₙ(x)", context: "Spectral discretization"})
SET legendre.basisFunctionType = "Legendre"
SET legendre.collocationPointType = "Gauss-Legendre"
SET legendre.convergenceProperty = "Spectral"
SET legendre.implementationNote = "Implemented using OrthogonalPolynomial{LegendreType} in KitchenSink"
```

## 6. Symbol Conflict Detection

During the extraction, a symbol conflict is identified:

```
Conflict detected:
- Symbol: α
- Context 1: Heat transfer equation (Section 2.1)
  Meaning 1: Thermal diffusivity coefficient
- Context 2: Error analysis (Section 5.2)
  Meaning 2: Exponential convergence rate parameter
```

## 7. Conflict Resolution

The conflict is resolved through explicit qualification:

```cypher
// Create the first Symbol Node (Thermal Diffusivity)
CREATE (alpha1:Symbol {
  name: "α",
  context: "Heat transfer equation",
  latex: "\\alpha",
  meaning: "Thermal diffusivity coefficient"
})

// Create the second Symbol Node (Convergence Rate)
CREATE (alpha2:Symbol {
  name: "α",
  context: "Error analysis",
  latex: "\\alpha",
  meaning: "Exponential convergence rate parameter"
})

// Create Conflict Relationship
CREATE (alpha1)-[:CONFLICTS_WITH {
  resolutionStrategy: "Context-dependent interpretation",
  canonicalChoice: "Use α for thermal diffusivity, α_c for convergence rate in cross-domain references",
  resolutionNotes: "When discussing both concepts, use explicit qualification"
}]->(alpha2)
```

## 8. Domain-Specific Interpretation

For the thermal diffusivity parameter, domain-specific interpretations are documented:

### Engineering Domain Interpretation

```
Symbol: α
Mathematics Context: Heat equation parameter
Engineering Interpretation: Thermal diffusivity of container wall in pasteurization process
Units: m²/s
Standard Usage: Determines heat penetration rate through container walls
Typical Values: 1.4×10⁻⁷ m²/s for glass, 8.4×10⁻⁵ m²/s for aluminum
```

### KitchenSink Implementation Mapping

```
Symbol: α
Mathematical Meaning: Thermal diffusivity coefficient
Julia Implementation: thermal_diffusivity
Variable Type: Float64
Module: ThermalProperties
Implementation Notes: Stored in material property dictionary, can be temperature-dependent
```

## 9. Cross-Domain Mapping

A cross-domain mapping document is created to connect the mathematical symbols to their engineering interpretations:

```markdown
# Cross-Domain Mapping: Heat Equation to Thermal Engineering

## Mathematics to Engineering Mapping

| Symbol | Mathematical Context | Engineering Domain | Engineering Meaning | Units | Standard Usage |
|--------|---------------------|-------------------|---------------------|-------|---------------|
| α | Heat equation parameter | Thermal Engineering | Thermal diffusivity of material | m²/s | Fundamental heat transfer parameter |
| u(x,t) | PDE solution variable | Thermal Engineering | Temperature distribution | °C | Primary quantity of interest |
| ∂Ω(t) | Domain boundary | Thermal Engineering | Container wall interface | N/A | Boundary for heat transfer problem |

## KitchenSink Implementation Mapping

| Symbol | Mathematical Meaning | Julia Implementation | Variable Type | Module | Implementation Notes |
|--------|---------------------|---------------------|---------------|--------|---------------------|
| α | Thermal diffusivity | thermal_diffusivity | Float64 | ThermalProperties | Can be temperature-dependent |
| u(x,t) | Temperature distribution | temperature_field | Array{Float64} | ThermalModel | Primary solution variable |
| Lₙ(x) | Legendre polynomial | legendre_basis | OrthogonalPolynomial{LegendreType} | BasisFunctions | Used for spectral approximation |
```

## 10. Complete Repository Structure

The example generates these files:

1. Symbol Registry:
   - `/projects/git/extracted-content-markdown/papers/Smith2023_MultiLevelOC_symbols.md`

2. Cypher Files:
   - `/projects/git/knowledge-extraction/cypher/symbols/alpha_HeatTransfer.cypher`
   - `/projects/git/knowledge-extraction/cypher/symbols/Ln_SpectralDiscretization.cypher`
   - `/projects/git/knowledge-extraction/cypher/symbols/u_PDEVariable.cypher`
   - `/projects/git/knowledge-extraction/cypher/symbols/Omega_ProblemDomain.cypher`
   - `/projects/git/knowledge-extraction/cypher/symbols/s_MovingBoundary.cypher`

3. Cross-Domain Mapping:
   - `/projects/git/extracted-content-markdown/cross-domain/HeatEquation_to_ThermalEngineering_mapping.md`

4. Concept Nodes:
   - `/projects/git/knowledge-extraction/cypher/entities/ThermalDiffusivity.cypher`
   - `/projects/git/knowledge-extraction/cypher/entities/LegendrePolynomial.cypher`
   - `/projects/git/knowledge-extraction/cypher/entities/MovingBoundary.cypher`

## Summary

This example demonstrates the complete process of symbol extraction from a scientific paper following the symbol-concept separation principle. It shows:

1. How symbols are identified and documented with their precise meanings and contexts
2. How the Symbol Registry template is used to create a comprehensive notation reference
3. How Cypher files are generated for each significant symbol
4. How symbol conflicts are detected and resolved
5. How domain-specific interpretations are documented
6. How cross-domain mappings connect mathematics to engineering applications and code implementations

This approach ensures perfect preservation of mathematical notation while enabling meaningful connections between symbols, concepts, and their implementations.
