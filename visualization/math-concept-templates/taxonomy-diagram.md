# Taxonomy Diagram Template

This template provides a standardized way to visualize hierarchical relationships between mathematical concepts, numerical methods, and algorithms. Taxonomy diagrams are essential for understanding the classification, derivation, and organization of related mathematical ideas.

## Basic Taxonomy Structure

```mermaid
graph TD
    %% Taxonomy: [Taxonomy Name]
    %% Based on: [Paper Reference]
    
    %% Root node
    Root[Root Concept] --> Child1[Child Concept 1]
    Root --> Child2[Child Concept 2]
    Root --> Child3[Child Concept 3]
    
    %% First level children
    Child1 --> Child1_1[Subtype 1.1]
    Child1 --> Child1_2[Subtype 1.2]
    
    Child2 --> Child2_1[Subtype 2.1]
    Child2 --> Child2_2[Subtype 2.2]
    Child2 --> Child2_3[Subtype 2.3]
    
    Child3 --> Child3_1[Subtype 3.1]
    Child3 --> Child3_2[Subtype 3.2]
    
    %% Second level
    Child1_1 --> Child1_1_1[Method 1.1.1]
    Child1_1 --> Child1_1_2[Method 1.1.2]
    
    Child2_2 --> Child2_2_1[Method 2.2.1]
    Child2_2 --> Child2_2_2[Method 2.2.2]
    
    %% Styling
    classDef root fill:#f9f9f9,stroke:#333,stroke-width:2px
    classDef level1 fill:#d4f1f9,stroke:#05a0c8
    classDef level2 fill:#ddf9d4,stroke:#3dbd25
    classDef level3 fill:#f9f4d4,stroke:#c8b205
    
    class Root root
    class Child1,Child2,Child3 level1
    class Child1_1,Child1_2,Child2_1,Child2_2,Child2_3,Child3_1,Child3_2 level2
    class Child1_1_1,Child1_1_2,Child2_2_1,Child2_2_2 level3
```

## Taxonomy Types and Layouts

### Hierarchical Classification

For representing inheritance and specialization relationships:

```mermaid
graph TD
    %% Hierarchical Classification of Numerical Methods
    
    NumericalMethods[Numerical Methods] --> DirectMethods[Direct Methods]
    NumericalMethods --> IterativeMethods[Iterative Methods]
    NumericalMethods --> SpectralMethods[Spectral Methods]
    
    DirectMethods --> LUDecomposition[LU Decomposition]
    DirectMethods --> QRDecomposition[QR Decomposition]
    DirectMethods --> CholeskyDecomposition[Cholesky Decomposition]
    
    IterativeMethods --> StationaryMethods[Stationary Methods]
    IterativeMethods --> KrylovMethods[Krylov Subspace Methods]
    IterativeMethods --> MultigridMethods[Multigrid Methods]
    
    SpectralMethods --> FourierMethods[Fourier Methods]
    SpectralMethods --> OrthogonalPolynomials[Orthogonal Polynomial Methods]
    
    OrthogonalPolynomials --> LegendrePolynomials[Legendre Polynomials]
    OrthogonalPolynomials --> ChebyshevPolynomials[Chebyshev Polynomials]
    
    %% Styling
    classDef root fill:#f9f9f9,stroke:#333,stroke-width:2px
    classDef level1 fill:#d4f1f9,stroke:#05a0c8
    classDef level2 fill:#ddf9d4,stroke:#3dbd25
    classDef level3 fill:#f9f4d4,stroke:#c8b205
    
    class NumericalMethods root
    class DirectMethods,IterativeMethods,SpectralMethods level1
    class LUDecomposition,QRDecomposition,CholeskyDecomposition,StationaryMethods,KrylovMethods,MultigridMethods,FourierMethods,OrthogonalPolynomials level2
    class LegendrePolynomials,ChebyshevPolynomials level3
```

### Feature-Based Classification

For organizing methods by their key characteristics:

```mermaid
graph TD
    %% Feature-Based Classification
    
    PDEMethods[PDE Solution Methods] --> SpatialFeature[Spatial Discretization]
    PDEMethods --> TimeFeature[Time Integration]
    PDEMethods --> ErrorFeature[Error Characteristics]
    
    SpatialFeature --> FiniteDifference[Finite Difference]
    SpatialFeature --> FiniteElement[Finite Element]
    SpatialFeature --> FiniteVolume[Finite Volume]
    SpatialFeature --> SpectralMethods[Spectral Methods]
    
    TimeFeature --> Explicit[Explicit Methods]
    TimeFeature --> Implicit[Implicit Methods]
    TimeFeature --> SemiImplicit[Semi-Implicit Methods]
    
    ErrorFeature --> AlgebraicConvergence[Algebraic Convergence]
    ErrorFeature --> SpectralConvergence[Spectral Convergence]
    ErrorFeature --> AdaptiveError[Adaptive Error Control]
    
    %% Second level details
    FiniteDifference --> CentralDifference[Central Difference]
    FiniteDifference --> UpwindSchemes[Upwind Schemes]
    
    FiniteElement --> ContinuousGalerkin[Continuous Galerkin]
    FiniteElement --> DiscontinuousGalerkin[Discontinuous Galerkin]
    
    SpectralMethods --> CollocationMethods[Collocation Methods]
    SpectralMethods --> SpectralGalerkin[Spectral Galerkin]
    
    %% Styling
    classDef root fill:#f9f9f9,stroke:#333,stroke-width:2px
    classDef feature fill:#f5d4f9,stroke:#c805bd
    classDef method fill:#d4f1f9,stroke:#05a0c8
    classDef submethod fill:#ddf9d4,stroke:#3dbd25
    
    class PDEMethods root
    class SpatialFeature,TimeFeature,ErrorFeature feature
    class FiniteDifference,FiniteElement,FiniteVolume,SpectralMethods,Explicit,Implicit,SemiImplicit,AlgebraicConvergence,SpectralConvergence,AdaptiveError method
    class CentralDifference,UpwindSchemes,ContinuousGalerkin,DiscontinuousGalerkin,CollocationMethods,SpectralGalerkin submethod
```

### Historical Development

For showing the evolution and development of methods over time:

```mermaid
graph TD
    %% Historical Development of Spectral Methods
    
    ClassicalFourier["Classical Fourier Analysis (1800s)"] --> ModernFourier["Modern Fourier Methods (1950s)"]
    
    ModernFourier --> SpectralGalerkin["Spectral Galerkin (1960s)"]
    ModernFourier --> PseudoSpectral["Pseudospectral Methods (1970s)"]
    
    SpectralGalerkin --> SLSEM["Spectral/hp Element Methods (1980s)"]
    PseudoSpectral --> SpectralCollocation["Spectral Collocation (1970s)"]
    
    SpectralCollocation --> MultiDomain["Multi-Domain Spectral Methods (1980s)"]
    SpectralCollocation --> AdaptiveSpectral["Adaptive Spectral Methods (1990s)"]
    
    MultiDomain --> PatankMethod["Patankar-Spalding Method (1980s)"]
    
    AdaptiveSpectral --> WaveletBased["Wavelet-Based Adaptivity (1990s)"]
    AdaptiveSpectral --> MultilevelSpectral["Multi-Level Spectral Methods (2000s)"]
    
    MultilevelSpectral --> MLOC["Multi-Level Orthogonal Collocation (2020s)"]
    
    %% Styling with timeline colors
    classDef era1800s fill:#f9d4d4,stroke:#c82b05
    classDef era1950s fill:#f9e4d4,stroke:#c86b05
    classDef era1960s fill:#f9f4d4,stroke:#c8b205
    classDef era1970s fill:#e4f9d4,stroke:#6bc805
    classDef era1980s fill:#d4f9e4,stroke:#05c86b
    classDef era1990s fill:#d4f1f9,stroke:#05a0c8
    classDef era2000s fill:#d4d9f9,stroke:#0542c8
    classDef era2020s fill:#e4d4f9,stroke:#6b05c8
    
    class ClassicalFourier era1800s
    class ModernFourier era1950s
    class SpectralGalerkin era1960s
    class PseudoSpectral,SpectralCollocation era1970s
    class SLSEM,MultiDomain,PatankMethod era1980s
    class AdaptiveSpectral,WaveletBased era1990s
    class MultilevelSpectral era2000s
    class MLOC era2020s
```

## Cross-Method Comparison Layout

For comparing different methods and their relationships:

```mermaid
graph TB
    %% Cross-Method Comparison
    
    root[PDE Solution Methods] --> fd[Finite Difference]
    root --> fe[Finite Element]
    root --> sv[Spectral/hp Element]
    root --> sc[Spectral Collocation]
    
    %% Properties as second level nodes
    fd --> fdProps[Properties]
    fe --> feProps[Properties]
    sv --> svProps[Properties]
    sc --> scProps[Properties]
    
    %% Property details
    fdProps --> fdAcc[Accuracy: O(h²) to O(h⁴)]
    fdProps --> fdFlex[Flexibility: Medium]
    fdProps --> fdImpl[Implementation: Simple]
    
    feProps --> feAcc[Accuracy: O(h^p)]
    feProps --> feFlex[Flexibility: High]
    feProps --> feImpl[Implementation: Complex]
    
    svProps --> svAcc[Accuracy: Spectral within element]
    svProps --> svFlex[Flexibility: High]
    svProps --> svImpl[Implementation: Very Complex]
    
    scProps --> scAcc[Accuracy: Spectral O(e^-N)]
    scProps --> scFlex[Flexibility: Low]
    scProps --> scImpl[Implementation: Medium]
    
    %% Cross-connections showing relationships
    fd -.-> fe
    fe -.-> sv
    sv -.-> sc
    
    %% Styling
    classDef method fill:#d4f1f9,stroke:#05a0c8
    classDef props fill:#f5f5f5,stroke:#333
    classDef details fill:#ddf9d4,stroke:#3dbd25
    
    class root root
    class fd,fe,sv,sc method
    class fdProps,feProps,svProps,scProps props
    class fdAcc,fdFlex,fdImpl,feAcc,feFlex,feImpl,svAcc,svFlex,svImpl,scAcc,scFlex,scImpl details
```

## Example: Multi-Level Orthogonal Collocation Taxonomy

```mermaid
graph TD
    %% Taxonomy: Multi-Level Orthogonal Collocation Methods
    %% Based on: Smith and Johnson (2023)
    
    %% Root node
    SpectralMethods[Spectral Methods] --> GlobalSM[Global Spectral Methods]
    SpectralMethods --> LocalSM[Domain Decomposition Methods]
    SpectralMethods --> MultiResolutionSM[Multi-Resolution Methods]
    
    %% Global methods branch
    GlobalSM --> FourierSM[Fourier Spectral Methods]
    GlobalSM --> PolynomialSM[Polynomial Spectral Methods]
    
    PolynomialSM --> LegendreM[Legendre Methods]
    PolynomialSM --> ChebyshevM[Chebyshev Methods]
    
    LegendreM --> LegGalerkin[Legendre Galerkin]
    LegendreM --> LegCollocation[Legendre Collocation]
    
    %% Domain decomposition branch
    LocalSM --> SpecElement[Spectral Element Method]
    LocalSM --> MultiDomain[Multi-Domain Spectral]
    
    %% Multi-resolution branch
    MultiResolutionSM --> MultigridSpectral[Multigrid Spectral]
    MultiResolutionSM --> WaveletSpectral[Wavelet-Based Spectral]
    MultiResolutionSM --> MultiLevelSpectral[Multi-Level Spectral]
    
    MultiLevelSpectral --> MLOC[Multi-Level Orthogonal Collocation]
    MultiLevelSpectral --> AdaptiveMLOC[Adaptive MLOC]
    
    AdaptiveMLOC --> MovingBoundaryMLOC[Moving Boundary MLOC]
    
    %% Implementation in KitchenSink
    MovingBoundaryMLOC --> KitchenSink[KitchenSink Implementation]
    
    %% Styling
    classDef root fill:#f9f9f9,stroke:#333,stroke-width:2px
    classDef level1 fill:#d4f1f9,stroke:#05a0c8
    classDef level2 fill:#ddf9d4,stroke:#3dbd25
    classDef level3 fill:#f9f4d4,stroke:#c8b205
    classDef level4 fill:#f5d4f9,stroke:#c805bd
    classDef implementation fill:#d4d9f9,stroke:#0542c8,stroke-dasharray:5,5
    
    class SpectralMethods root
    class GlobalSM,LocalSM,MultiResolutionSM level1
    class FourierSM,PolynomialSM,SpecElement,MultiDomain,MultigridSpectral,WaveletSpectral,MultiLevelSpectral level2
    class LegendreM,ChebyshevM,MLOC,AdaptiveMLOC level3
    class LegGalerkin,LegCollocation,MovingBoundaryMLOC level4
    class KitchenSink implementation
    
    %% Add notes
    KitchenSink -.- KSNote[Implements adaptive refinement<br>across multiple resolution levels]
    class KSNote fill:white,stroke:#333,stroke-dasharray:1,1
```

## Guidelines for Effective Taxonomy Visualization

1. **Clear Hierarchy**: Ensure the hierarchical structure is immediately apparent
2. **Appropriate Depth**: Limit the depth to 3-4 levels for readability
3. **Consistent Naming**: Use consistent naming conventions across the taxonomy
4. **Color Coding**: Use colors to distinguish different levels or categories
5. **Relationship Indications**: Use different line styles for different relationship types
6. **Balanced Structure**: Aim for a balanced tree structure where possible
7. **Annotations**: Add notes to explain key concepts or relationships
8. **References**: Include citations to relevant papers for terminology or classifications
9. **Cross-Links**: Show cross-category relationships where appropriate
10. **Focus Area**: Highlight the specific methods of interest in the taxonomy

## Usage in Knowledge Extraction

When creating taxonomy diagrams for mathematical concepts from papers:

1. Identify the hierarchical classification structure
2. Determine the appropriate taxonomy type (hierarchical, feature-based, historical)
3. Position the method of interest in the larger context
4. Use consistent terminology with the original paper
5. Add citations for specific classification decisions
6. Highlight relationships to other methods
7. Include notes explaining key differentiating features

## Example Usage

```
# Taxonomy: Multi-Level Orthogonal Collocation Methods

## Overview
- **Classification**: Hierarchical taxonomy of spectral methods
- **Source**: Smith and Johnson (2023), Section 1.2
- **Purpose**: Position Multi-Level Orthogonal Collocation within the broader context of numerical methods

## Taxonomy Diagram

[Insert Mermaid diagram here]

## Classification Details

1. **Spectral Methods**
   - Methods using global or high-order local basis functions
   - Characterized by high accuracy for smooth solutions
   - Paper reference: Section 1.1

2. **Multi-Resolution Methods**
   - Employ basis functions at different resolution levels
   - Allow adaptive refinement based on solution features
   - Paper reference: Section 1.3

3. **Multi-Level Orthogonal Collocation**
   - Combines orthogonal polynomial basis with multi-level structure
   - Features hierarchical error estimation between levels
   - Paper reference: Section 2.1-2.3

4. **Moving Boundary MLOC**
   - Extends MLOC with coordinate transformation for moving boundaries
   - Preserves spectral accuracy while handling dynamic domains
   - Paper reference: Section 4.1-4.3

## Relationship to Other Methods

- **Compared to Spectral Element Methods**: Both use high-order polynomials, but MLOC uses hierarchical levels instead of element decomposition (Section 5.1)
- **Compared to Multigrid Methods**: Similar hierarchical structure, but MLOC uses spectral basis functions instead of standard finite elements (Section 5.2)
- **Compared to Wavelet Methods**: Both offer multi-resolution capabilities, but MLOC provides stronger connection to classical spectral methods (Section 5.3)

## Notes on KitchenSink Implementation

The KitchenSink solver implements the Moving Boundary MLOC method with the following enhancements:
- Adaptive level management based on error estimates
- Flexible basis function selection (Legendre, Chebyshev)
- Optimized implementation for Julia and SciML ecosystem
```
