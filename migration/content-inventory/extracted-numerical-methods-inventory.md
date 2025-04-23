# Content Inventory: extracted-numerical-methods

This inventory documents the content in the `extracted-numerical-methods` repository, with special focus on KitchenSink-related material. It catalogs the location, format, and status of all content files to facilitate migration to the symbol-concept independence architecture.

## Repository Overview

The `extracted-numerical-methods` repository contains implementations and documentation for numerical methods, with particular emphasis on:
- Adaptive mesh refinement implementations
- Multi-level orthogonal collocation methods
- KitchenSink solver integration
- Example applications and test cases

## Content Categories

### 1. KitchenSink-Related Content

#### Core Numerical Methods

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/algorithms/orthogonal-collocation.md` | Algorithm | Partial | Needs migration | High |
| `/algorithms/multi-level-adaptivity.md` | Algorithm | Partial | Needs migration | High |
| `/algorithms/refinement-by-superposition.md` | Algorithm | Partial | Needs migration | High |
| `/algorithms/fictitious-domain.md` | Algorithm | Partial | Needs migration | High |

#### Implementation Documentation

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/implementations/orthogonal-collocation-implementation.md` | Implementation | No | Needs migration | High |
| `/implementations/multi-level-implementation.md` | Implementation | No | Needs migration | High |
| `/implementations/basis-functions-implementation.md` | Implementation | No | Needs migration | High |
| `/implementations/error-estimation-implementation.md` | Implementation | No | Needs migration | High |

#### Type System Documentation

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/type-system/abstract-collocation.md` | Type Design | Partial | Needs migration | High |
| `/type-system/multi-level-types.md` | Type Design | No | Needs migration | High |
| `/type-system/basis-function-types.md` | Type Design | No | Needs migration | High |

#### Mathematical Foundations

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/mathematical-foundations/spectral-approximation.md` | Mathematical | Partial | Needs migration | High |
| `/mathematical-foundations/collocation-points.md` | Mathematical | No | Needs migration | High |
| `/mathematical-foundations/multi-level-theory.md` | Mathematical | No | Needs migration | High |
| `/mathematical-foundations/error-estimation.md` | Mathematical | No | Needs migration | High |

### 2. Other Numerical Methods

#### Differential Equation Solvers

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/methods/ode-methods.md` | Method | No | Needs migration | Medium |
| `/methods/pde-methods.md` | Method | No | Needs migration | Medium |
| `/methods/dae-methods.md` | Method | No | Needs migration | Medium |

#### Discretization Techniques

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/discretization/finite-difference.md` | Method | No | Needs migration | Medium |
| `/discretization/finite-element.md` | Method | No | Needs migration | Medium |
| `/discretization/spectral-methods.md` | Method | Partial | Needs migration | Medium |

#### Linear Algebra Components

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/linear-algebra/direct-solvers.md` | Method | No | Needs migration | Medium |
| `/linear-algebra/iterative-solvers.md` | Method | No | Needs migration | Medium |
| `/linear-algebra/preconditioners.md` | Method | No | Needs migration | Medium |

### 3. Testing and Validation

#### Test Cases

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/tests/convergence-tests.md` | Test | No | Needs migration | Medium |
| `/tests/conservation-tests.md` | Test | No | Needs migration | Medium |
| `/tests/boundary-condition-tests.md` | Test | No | Needs migration | Medium |

#### Validation Examples

| File Path | Content Type | Symbol-Concept Separation | Status | Priority |
|-----------|--------------|---------------------------|--------|----------|
| `/validation/heat-equation.md` | Validation | No | Needs migration | Medium |
| `/validation/wave-equation.md` | Validation | No | Needs migration | Medium |
| `/validation/moving-boundary.md` | Validation | No | Needs migration | High |

## Migration Priorities

Based on the KitchenSink publication focus, the migration priorities are:

### Highest Priority (Week 3)
1. Core orthogonal collocation methods
2. Multi-level adaptivity algorithms
3. Type system documentation
4. Mathematical foundations of spectral methods

### Medium Priority (Week 5)
1. Implementation documentation
2. Error estimation techniques
3. Validation examples for moving boundaries
4. Testing frameworks

### Lower Priority (Week 7)
1. Other numerical methods
2. General discretization techniques
3. Linear algebra components
4. Remaining validation examples

## Symbol Usage Analysis

Initial analysis of mathematical symbol usage across the repository reveals:

### Common Symbol Patterns

| Symbol | Usage Context | Variation | Conflicts | Migration Needs |
|--------|---------------|-----------|-----------|----------------|
| Φₙ(x) | Basis functions | Sometimes Ψₙ(x) | Multiple meanings | Symbol-concept separation |
| ξᵢ | Collocation points | Sometimes xᵢ | None | Standardize but preserve context |
| α | Error parameters | Multiple uses | Same symbol, different contexts | Create distinct concept nodes |
| L | Differential operators | Multiple forms | Multiple meanings | Need clear context boundaries |
| h | Step size/mesh size | Consistent | None | Link to implementation variable |

### Documentation Quality

Overall, the mathematical documentation in this repository has these characteristics:
- Good formal equations but mixed notation
- Symbols often not explicitly defined before use
- Implementation variables sometimes mixed with mathematical notation
- Cross-references between related concepts are sparse
- Multiple file formats and documentation styles

## Migration Approach

For the `extracted-numerical-methods` repository, we'll use this approach:

1. **Symbol Registry Creation**
   - Create symbol registry for each major method
   - Document LaTeX for all mathematical symbols
   - Create concept nodes for key mathematical ideas
   - Establish REPRESENTS relationships between symbols and concepts

2. **Content Restructuring**
   - Organize content into L1/L2/L3 tiers
   - Separate algorithm descriptions from implementation details
   - Create explicit cross-references between related concepts
   - Maintain implementation pathways to Julia code

3. **KitchenSink Integration Enhancement**
   - Enhance KitchenSink integration documentation
   - Clarify mathematical foundation of multi-level approach
   - Document type hierarchy with mathematical connections
   - Create comprehensive symbol-to-implementation mappings

## Next Steps

1. Complete detailed inventory of specific files
2. Analyze mathematical notation in-depth across files
3. Create initial symbol registry for key KitchenSink algorithms
4. Begin migration of highest priority files
