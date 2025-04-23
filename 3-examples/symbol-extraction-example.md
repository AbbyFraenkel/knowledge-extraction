# Symbol Extraction Example: Orthogonal Collocation for Moving Boundaries

This document provides a step-by-step example of extracting mathematical symbols from a paper on orthogonal collocation methods, with special focus on notation relevant to the KitchenSink solver and pasteurization applications.

## Paper Information

```
Title: Multi-Level Orthogonal Collocation for Partial Differential Equations with Moving Boundaries
Authors: Johnson, R.A. and Martinez, S.L.
Year: 2022
Journal: Journal of Computational Physics
DOI: 10.1016/j.jcp.2022.04.127
```

## Step 1: Initial Paper Review and Symbol Identification

After a complete read-through of the paper, I've identified the following key mathematical symbols that appear in the paper. I'll make note of where each symbol is first defined or used:

```markdown
- α (Section 2.1, Equation 3) - Appears to be thermal diffusivity in heat equation
- N (Section 3.2) - Polynomial order or number of discretization points
- ξ (Section 3.3, Equation 7) - Collocation points
- Φ_i(x) (Section 3.3, Equation 8) - Basis functions
- ψ_i(x,t) (Section 3.4, Equation 12) - Time-dependent basis functions
- s(t) (Section 4.1, Equation 15) - Moving boundary position
- η (Section 4.2, Equation 17) - Transformed spatial coordinate
- J (Section 4.2, Equation 19) - Jacobian of the transformation
- ε (Section 5.1, Equation 29) - Error tolerance parameter
- σ (Section 5.3, Equation 34) - Coefficient decay rate
- C (Section 5.3, Equation 36) - Error constant
```

## Step 2: Documenting Symbol Properties

For each identified symbol, I'll document the detailed properties:

### 2.1 Thermal Diffusivity Symbol

```markdown
Symbol: α
LaTeX: \alpha
Context: Heat Transfer
Meaning: Thermal diffusivity coefficient
Units: m²/s
Dimensionality: Scalar
Constraints: Positive real number
First appearance: Section 2.1, Equation 3
Role: Parameter in heat equation
Related symbols: κ (thermal conductivity), ρ (density), c_p (specific heat capacity)
Mathematical domain: Partial Differential Equations
Computational role: Physical parameter
```

### 2.2 Polynomial Order Symbol

```markdown
Symbol: N
LaTeX: N
Context: Discretization
Meaning: Number of collocation points or polynomial order
Units: Dimensionless
Dimensionality: Scalar
Constraints: Positive integer
First appearance: Section 3.2
Role: Discretization parameter
Related symbols: ξ (collocation points), Φ_i(x) (basis functions)
Mathematical domain: Orthogonal Collocation
Computational role: Resolution control
```

### 2.3 Collocation Points Symbol

```markdown
Symbol: ξ
LaTeX: \xi
Context: Orthogonal collocation
Meaning: Spatial locations where equations are discretized
Units: Dimensionless
Dimensionality: Vector
Constraints: ξ_i ∈ [-1,1]
First appearance: Section 3.3, Equation 7
Role: Discretization variable
Related symbols: N (number of points), Φ_i(x) (basis functions evaluated at these points)
Mathematical domain: Orthogonal Collocation
Computational role: Grid definition
Basis function type: Legendre polynomials
Collocation point type: Gauss-Legendre points
```

Continue this process for all identified symbols...

## Step 3: Organizing Symbols by Context

Now I'll group the symbols by their primary contexts:

### Heat Transfer Context
- α: Thermal diffusivity (m²/s)
- κ: Thermal conductivity (W/m·K)
- ρ: Density (kg/m³)
- c_p: Specific heat capacity (J/kg·K)

### Orthogonal Collocation Context
- N: Polynomial order (dimensionless)
- ξ: Collocation points (dimensionless)
- Φ_i(x): Basis functions (dimensionless)
- ψ_i(x,t): Time-dependent basis functions (dimensionless)

### Moving Boundary Context
- s(t): Interface position (m)
- η: Transformed spatial coordinate (dimensionless)
- J: Jacobian of transformation (dimensionless)

### Error Analysis Context
- ε: Error tolerance (dimensionless)
- σ: Coefficient decay rate (dimensionless)
- C: Error constant (dimensionless)

## Step 4: Detecting Symbol Conflicts

I've identified the following potential conflicts:

1. Symbol `α` is used both for thermal diffusivity in heat transfer and occasionally as a convergence parameter in spectral method literature.

2. Symbol `C` appears both as an error constant and as a tensor component in one equation.

3. Symbol `N` is used both for polynomial order and occasionally as a dimensionless group (Nusselt number) in one section discussing heat transfer.

## Step 5: Creating Resolution Strategies

### Resolution for α conflict:
```markdown
Resolution strategy: Context-dependent interpretation with explicit disambiguation
Canonical choice: α for thermal diffusivity, α_c for convergence parameter in cross-domain references
Justification: Following common convention in heat transfer and numerical analysis
```

### Resolution for C conflict:
```markdown
Resolution strategy: Context-dependent interpretation
Canonical choice: C for error constant, C_{ij} (with indices) for tensor components
Justification: Notation in paper is already clear with indices for tensor components
```

### Resolution for N conflict:
```markdown
Resolution strategy: Context-dependent interpretation with explicit disambiguation
Canonical choice: N for polynomial order, Nu for Nusselt number
Justification: Standard conventions in respective fields
```

## Step 6: Mapping to Engineering Domains

### Thermal Diffusivity (α)
```markdown
Mathematical context: Parameter in heat equation
Engineering domain: Thermal Engineering
Domain-specific meaning: Thermal diffusivity of material (e.g., beer, container)
Units: m²/s in SI units
Standard usage: Key material property in heat transfer calculations
Typical values: 1.2×10⁻⁷ to 1.5×10⁻⁷ m²/s for beer at 20-80°C
```

### Moving Boundary Position (s(t))
```markdown
Mathematical context: Function defining boundary location
Engineering domain: Pasteurization Process
Domain-specific meaning: Interface position during phase change
Units: m
Standard usage: Tracks boundary between different material states
Physical interpretation: Could represent phase change front in container or product
```

Continue mapping relevant symbols to engineering domains...

## Step 7: Generating Cypher for Symbol Entities

Here's an example of the Cypher code I would generate for the thermal diffusivity symbol:

```cypher
// Create symbol entity for thermal diffusivity
CREATE (alpha:Symbol {
  name: "α",
  context: "Heat transfer",
  latex: "\\alpha",
  meaning: "Thermal diffusivity coefficient",
  dimensionality: "Scalar",
  units: "m²/s",
  constraints: "Positive real number",
  paperSources: ["Johnson2022"],
  mathematicalDomain: "Partial Differential Equations",
  computationalRole: "Physical parameter"
})

// Connect to paper
MATCH (paper:Paper {id: "Johnson2022"})
CREATE (alpha)-[:APPEARS_IN {
  section: "Section 2.1",
  firstAppearance: "Equation 3",
  role: "Parameter"
}]->(paper)

// Connect to mathematical concept
MATCH (concept:MathematicalConcept {name: "Heat Equation"})
CREATE (alpha)-[:REPRESENTS {
  context: "In the context of heat conduction",
  isStandardNotation: true
}]->(concept)

// Connect to application domain
MATCH (domain:ApplicationDomain {name: "Thermal Engineering"})
CREATE (alpha)-[:HAS_INTERPRETATION_IN {
  meaning: "Thermal diffusivity",
  standardUsage: "Material property in heat transfer calculations",
  units: "m²/s in SI units",
  equivalentParameters: ["κ/(ρ·c_p)"]
}]->(domain)

// Add implementation mapping
MATCH (impl:Implementation {name: "KitchenSink.HeatTransfer"})
CREATE (alpha)-[:IMPLEMENTED_AS {
  codeVariable: "thermal_diffusivity",
  dataType: "Float64",
  defaultValue: "1.0e-7",
  validationRules: "must be positive"
}]->(impl)

// Document conflict with convergence parameter
MATCH (alphaC:Symbol {name: "α", context: "Spectral convergence"})
CREATE (alpha)-[:CONFLICTS_WITH {
  conflictType: "Same symbol different meaning",
  resolutionStrategy: "Context-dependent interpretation with explicit disambiguation",
  canonicalChoice: "α for thermal diffusivity, α_c for convergence parameter in cross-domain references",
  resolutionNotes: "Following common convention in heat transfer and numerical analysis"
}]->(alphaC)
```

Repeat this process for each symbol identified in the paper...

## Step 8: Creating the Symbol Registry

I compile a comprehensive symbol registry for the paper, following the format shown in the example registry. The registry includes:

1. Complete list of symbols with all properties
2. Context-specific symbol groupings
3. Conflict documentation and resolutions
4. Cross-domain mappings
5. Symbol relationships
6. Notes on notation style
7. List of generated Cypher files

## Step 9: Integration with Paper Analysis Workflow

The extracted symbols are now ready to be integrated with the broader paper analysis workflow:

1. Include the symbol registry in the main paper analysis document
2. Reference symbols in algorithm documentation
3. Use consistent notation in implementation notes
4. Apply symbols when describing cross-domain applications to pasteurization

## KitchenSink-Specific Integration

For integration with KitchenSink, I note specific mapping considerations:

1. **Core Numerical Parameters**:
   - N (polynomial order) → `polynomialOrder` parameter in KitchenSink
   - ξ (collocation points) → `collocationNodes` array in discretization module
   - Φ_i(x) (basis functions) → `basisFunctions` implementation in KitchenSink

2. **Domain Transformation Components**:
   - η (transformed coordinate) → `transformedDomain` in KitchenSink
   - J (Jacobian) → `jacobian` field in transformation module
   - s(t) (boundary position) → `interfacePosition` in moving boundary tracker

3. **Error Control Parameters**:
   - ε (error tolerance) → `errorTolerance` in solver configuration
   - σ (decay rate) → `decayRateEstimator` in error analysis module

## Pasteurization Thesis Applications

For the pasteurization thesis, I highlight these symbol applications:

1. **Physical Properties**:
   - α maps to thermal properties of beer and container materials
   - κ, ρ, c_p provide complete thermal characterization

2. **Process Modeling**:
   - s(t) can represent phase change boundaries in beer containers
   - Heat transfer boundary conditions map to tunnel environment

3. **Solution Accuracy**:
   - Error analysis symbols enable validation of pasteurization models
   - Convergence properties ensure accurate temperature predictions

This complete symbol extraction example demonstrates the workflow from initial identification through Cypher generation and integration with both KitchenSink and pasteurization applications.
