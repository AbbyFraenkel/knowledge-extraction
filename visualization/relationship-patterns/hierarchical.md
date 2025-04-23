# Hierarchical Relationship Visualization Template

This template provides a standardized way to visualize hierarchical relationships between entities in the knowledge graph, focusing on parent-child relationships, inheritance hierarchies, and nested structures.

## Basic Hierarchical Structure

```mermaid
graph TD
    %% Hierarchical Relationship: [Relationship Type]
    %% Based on: [Paper Reference]
    
    %% Root node
    Root[Root Entity] --> Child1[Child Entity 1]
    Root --> Child2[Child Entity 2]
    Root --> Child3[Child Entity 3]
    
    %% Second level
    Child1 --> Grandchild1_1[Grandchild 1.1]
    Child1 --> Grandchild1_2[Grandchild 1.2]
    
    Child2 --> Grandchild2_1[Grandchild 2.1]
    
    Child3 --> Grandchild3_1[Grandchild 3.1]
    Child3 --> Grandchild3_2[Grandchild 3.2]
    Child3 --> Grandchild3_3[Grandchild 3.3]
    
    %% Styling
    classDef root fill:#f5f5f5,stroke:#333,stroke-width:2px
    classDef level1 fill:#d4f1f9,stroke:#05a0c8
    classDef level2 fill:#ddf9d4,stroke:#3dbd25
    
    class Root root
    class Child1,Child2,Child3 level1
    class Grandchild1_1,Grandchild1_2,Grandchild2_1,Grandchild3_1,Grandchild3_2,Grandchild3_3 level2
```

## Layout Options

### Top-Down Hierarchical Layout (Default)

```mermaid
graph TD
    %% Top-down layout
    Root[Root Entity] --> Child1[Child Entity 1]
    Root --> Child2[Child Entity 2]
    
    Child1 --> Grandchild1[Grandchild 1]
    Child2 --> Grandchild2[Grandchild 2]
```

### Bottom-Up Hierarchical Layout

```mermaid
graph BT
    %% Bottom-up layout
    Child1[Child Entity 1] --> Root[Root Entity]
    Child2[Child Entity 2] --> Root
    
    Grandchild1[Grandchild 1] --> Child1
    Grandchild2[Grandchild 2] --> Child2
```

### Left-to-Right Hierarchical Layout

```mermaid
graph LR
    %% Left-to-right layout
    Root[Root Entity] --> Child1[Child Entity 1]
    Root --> Child2[Child Entity 2]
    
    Child1 --> Grandchild1[Grandchild 1]
    Child2 --> Grandchild2[Grandchild 2]
```

### Right-to-Left Hierarchical Layout

```mermaid
graph RL
    %% Right-to-left layout
    Child1[Child Entity 1] --> Root[Root Entity]
    Child2[Child Entity 2] --> Root
    
    Grandchild1[Grandchild 1] --> Child1
    Grandchild2[Grandchild 2] --> Child2
```

## Relationship Types and Styling

Different arrow styles can be used to represent different types of hierarchical relationships:

```mermaid
graph TD
    %% Different relationship types
    
    Root1[Entity A] --> Child1[Entity B]
    Root1 ==> Child2[Entity C]
    Root1 -.-> Child3[Entity D]
    Root1 -.- Child4[Entity E]
    Root1 ===> Child5[Entity F]
    
    %% Legend
    L1[Normal Relationship] --> L2[Related Entity]
    L3[Strong Relationship] ==> L4[Closely Related]
    L5[Weak Relationship] -.-> L6[Loosely Related]
    L7[Bidirectional] -.- L8[Mutual Relationship]
    L9[Critical Path] ===> L10[Key Dependency]
    
    %% Style legend separately
    subgraph Legend
        L1
        L2
        L3
        L4
        L5
        L6
        L7
        L8
        L9
        L10
    end
    
    style Legend fill:#f9f9f9,stroke:#333
```

### Knowledge Graph Relationship Types

For the knowledge extraction system, use consistent styling for different relationship types:

```mermaid
graph TD
    %% Knowledge Graph Relationship Types
    
    %% SPECIALIZES relationship
    Concept1[General Concept] --> |SPECIALIZES| Concept2[Specialized Concept]
    
    %% EXTENDS relationship
    Method1[Base Method] --> |EXTENDS| Method2[Extended Method]
    
    %% IMPLEMENTS relationship
    Concept3[Abstract Concept] ==> |IMPLEMENTS| Algorithm1[Concrete Algorithm]
    
    %% BASED_ON relationship
    Method3[Derived Method] -.-> |BASED_ON| Method4[Foundation Method]
    
    %% IMPROVES_UPON relationship
    Algorithm2[Enhanced Algorithm] ===> |IMPROVES_UPON| Algorithm3[Original Algorithm]
    
    %% Style nodes by type
    classDef concept fill:#d4f1f9,stroke:#05a0c8
    classDef method fill:#ddf9d4,stroke:#3dbd25
    classDef algorithm fill:#f9f4d4,stroke:#c8b205
    
    class Concept1,Concept2,Concept3 concept
    class Method1,Method2,Method3,Method4 method
    class Algorithm1,Algorithm2,Algorithm3 algorithm
```

## Advanced Hierarchical Patterns

### Multi-Level Inheritance

```mermaid
graph TD
    %% Multi-level inheritance hierarchy for numerical methods
    
    NumericalMethod[Numerical Method] --> SpectralMethod[Spectral Method]
    NumericalMethod --> FiniteElement[Finite Element Method]
    NumericalMethod --> FiniteDifference[Finite Difference Method]
    
    SpectralMethod --> FourierMethod[Fourier Method]
    SpectralMethod --> OrthogonalPoly[Orthogonal Polynomial Method]
    
    OrthogonalPoly --> LegendrePoly[Legendre Polynomial]
    OrthogonalPoly --> ChebyshevPoly[Chebyshev Polynomial]
    
    LegendrePoly --> LegendreCollocation[Legendre Collocation]
    LegendrePoly --> LegendreGalerkin[Legendre Galerkin]
    
    LegendreCollocation --> MultiLevelCollocation[Multi-Level Collocation]
    
    %% Styling
    classDef abstract fill:#f5f5f5,stroke:#333,stroke-width:2px
    classDef family fill:#d4f1f9,stroke:#05a0c8
    classDef type fill:#ddf9d4,stroke:#3dbd25
    classDef method fill:#f9f4d4,stroke:#c8b205
    classDef specific fill:#f5d4f9,stroke:#c805bd
    
    class NumericalMethod abstract
    class SpectralMethod,FiniteElement,FiniteDifference family
    class FourierMethod,OrthogonalPoly type
    class LegendrePoly,ChebyshevPoly,LegendreCollocation,LegendreGalerkin method
    class MultiLevelCollocation specific
```

### Large Hierarchy with Collapsible Sections

For large hierarchies, use subgraphs to create collapsible sections:

```mermaid
graph TD
    %% Large hierarchy with collapsible sections
    
    Root[Knowledge Domain] --> Domain1[Domain 1]
    Root --> Domain2[Domain 2]
    Root --> Domain3[Domain 3]
    
    subgraph Domain1Details["Domain 1 Details"]
        Domain1 --> Domain1_1[Subdomain 1.1]
        Domain1 --> Domain1_2[Subdomain 1.2]
        
        Domain1_1 --> Domain1_1_1[Concept 1.1.1]
        Domain1_1 --> Domain1_1_2[Concept 1.1.2]
        
        Domain1_2 --> Domain1_2_1[Concept 1.2.1]
    end
    
    subgraph Domain2Details["Domain 2 Details"]
        Domain2 --> Domain2_1[Subdomain 2.1]
        Domain2 --> Domain2_2[Subdomain 2.2]
        
        Domain2_1 --> Domain2_1_1[Concept 2.1.1]
        Domain2_1 --> Domain2_1_2[Concept 2.1.2]
        
        Domain2_2 --> Domain2_2_1[Concept 2.2.1]
    end
    
    %% Styling
    classDef root fill:#f5f5f5,stroke:#333,stroke-width:2px
    classDef domain fill:#d4f1f9,stroke:#05a0c8
    classDef subdomain fill:#ddf9d4,stroke:#3dbd25
    classDef concept fill:#f9f4d4,stroke:#c8b205
    
    class Root root
    class Domain1,Domain2,Domain3 domain
    class Domain1_1,Domain1_2,Domain2_1,Domain2_2 subdomain
    class Domain1_1_1,Domain1_1_2,Domain1_2_1,Domain2_1_1,Domain2_1_2,Domain2_2_1 concept
    
    style Domain1Details fill:#f9f9f9,stroke:#999,stroke-dasharray: 5 5
    style Domain2Details fill:#f9f9f9,stroke:#999,stroke-dasharray: 5 5
```

## Example: KitchenSink Solver Inheritance Hierarchy

```mermaid
graph TD
    %% KitchenSink Solver Inheritance Hierarchy
    
    AbstractSolver[AbstractSolver] --> AbstractIterativeSolver[AbstractIterativeSolver]
    AbstractSolver --> AbstractDirectSolver[AbstractDirectSolver]
    
    AbstractIterativeSolver --> SpectralIterativeSolver[SpectralIterativeSolver]
    AbstractIterativeSolver --> FiniteElementSolver[FiniteElementSolver]
    
    SpectralIterativeSolver --> OrthogonalCollocationSolver[OrthogonalCollocationSolver]
    
    OrthogonalCollocationSolver --> LegendreCollocationSolver[LegendreCollocationSolver]
    OrthogonalCollocationSolver --> ChebyshevCollocationSolver[ChebyshevCollocationSolver]
    
    LegendreCollocationSolver --> MultiLevelLegendreCollocation[MultiLevelLegendreCollocation]
    
    MultiLevelLegendreCollocation --> AdaptiveMLOC[AdaptiveMLOC]
    MultiLevelLegendreCollocation --> MovingBoundaryMLOC[MovingBoundaryMLOC]
    
    %% Reference to main KitchenSink implementation
    MovingBoundaryMLOC --> KitchenSinkSolver[KitchenSinkSolver]
    
    %% Styling
    classDef abstract fill:#f5f5f5,stroke:#333,stroke-width:2px,stroke-dasharray: 5 5
    classDef solver fill:#d4f1f9,stroke:#05a0c8
    classDef specialized fill:#ddf9d4,stroke:#3dbd25
    classDef implementation fill:#f9f4d4,stroke:#c8b205
    
    class AbstractSolver,AbstractIterativeSolver,AbstractDirectSolver abstract
    class SpectralIterativeSolver,FiniteElementSolver,OrthogonalCollocationSolver solver
    class LegendreCollocationSolver,ChebyshevCollocationSolver,MultiLevelLegendreCollocation specialized
    class AdaptiveMLOC,MovingBoundaryMLOC,KitchenSinkSolver implementation
```

## Example: Pasteurization Modeling Entity Hierarchy

```mermaid
graph TD
    %% Pasteurization Modeling Entity Hierarchy
    
    PasteurizationModel[Pasteurization Model] --> PhysicalModel[Physical Model]
    PasteurizationModel --> NumericalModel[Numerical Model]
    PasteurizationModel --> ValidationModel[Validation Model]
    
    PhysicalModel --> HeatTransferModel[Heat Transfer Model]
    PhysicalModel --> FluidFlowModel[Fluid Flow Model]
    PhysicalModel --> MicrobialModel[Microbial Inactivation Model]
    
    HeatTransferModel --> ContainerHeatTransfer[Container Heat Transfer]
    HeatTransferModel --> ProductHeatTransfer[Product Heat Transfer]
    HeatTransferModel --> PhaseChangeModel[Phase Change Model]
    
    NumericalModel --> DiscretizationScheme[Discretization Scheme]
    NumericalModel --> SolverStrategy[Solver Strategy]
    NumericalModel --> TimeStepping[Time Stepping]
    
    DiscretizationScheme --> MultiLevelCollocation[Multi-Level Collocation]
    SolverStrategy --> MovingBoundaryHandling[Moving Boundary Handling]
    
    %% Styling
    classDef root fill:#f5f5f5,stroke:#333,stroke-width:2px
    classDef primary fill:#d4f1f9,stroke:#05a0c8
    classDef secondary fill:#ddf9d4,stroke:#3dbd25
    classDef tertiary fill:#f9f4d4,stroke:#c8b205
    
    class PasteurizationModel root
    class PhysicalModel,NumericalModel,ValidationModel primary
    class HeatTransferModel,FluidFlowModel,MicrobialModel,DiscretizationScheme,SolverStrategy,TimeStepping secondary
    class ContainerHeatTransfer,ProductHeatTransfer,PhaseChangeModel,MultiLevelCollocation,MovingBoundaryHandling tertiary
```

## Guidelines for Effective Hierarchical Relationship Visualization

1. **Appropriate Depth**: Limit hierarchy depth to 3-5 levels for readability
2. **Balanced Structure**: Aim for a balanced tree where possible
3. **Meaningful Node Names**: Use clear, descriptive entity names
4. **Consistent Relationship Types**: Use consistent arrow styles for the same relationship types
5. **Visual Hierarchy**: Use colors and styles to emphasize hierarchy levels
6. **Focused Scope**: Each diagram should focus on a specific aspect of the knowledge hierarchy
7. **Legends**: Include legends for complex hierarchies with multiple relationship types
8. **Layout Choice**: Select the most appropriate layout direction for your hierarchy
9. **Subgraphs**: Use subgraphs for logical grouping in large hierarchies
10. **Critical Path**: Highlight the most important relationships in the hierarchy

## Usage in Knowledge Extraction

When creating hierarchical relationship visualizations:

1. Identify the entities to be included in the hierarchy
2. Determine the primary relationship type (SPECIALIZES, EXTENDS, etc.)
3. Choose the appropriate hierarchy direction (TD, BT, LR, RL)
4. Design the visual hierarchy with appropriate styling
5. Add meaningful labels to explain relationship types
6. Include references to relevant concepts in the knowledge graph

## Knowledge Graph Integration Tips

- Use the same entity names in visualizations as in the knowledge graph
- Highlight relationships that correspond to Cypher relationship types
- Include entity types that match knowledge graph entity types
- Reference source papers or documents that establish these relationships
- Consider generating these visualizations automatically from the knowledge graph

## Example Usage

```
# Hierarchical Relationship: KitchenSink Solver Type Hierarchy

## Overview
- **Relationship Type**: Inheritance hierarchy (EXTENDS/SPECIALIZES)
- **Purpose**: Visualize the type system of the KitchenSink solver
- **Base Type**: AbstractSolver

## Hierarchical Visualization

[Insert Mermaid diagram here]

## Key Entities

1. **Abstract Base Types**
   - AbstractSolver: Base type for all solvers
   - AbstractIterativeSolver: Base type for iterative solution methods
   - SpectralIterativeSolver: Base type for spectral iterative methods

2. **Specialized Solvers**
   - OrthogonalCollocationSolver: Implementation of orthogonal collocation method
   - LegendreCollocationSolver: Specific implementation using Legendre polynomials
   - MultiLevelLegendreCollocation: Multi-level version with hierarchical basis

3. **Final Implementation**
   - MovingBoundaryMLOC: Adds moving boundary capabilities
   - KitchenSinkSolver: Complete implementation with all features

## Knowledge Graph Integration

This hierarchy directly corresponds to the following Cypher relationships:
- (AbstractSolver)<-[:EXTENDS]-(AbstractIterativeSolver)
- (AbstractIterativeSolver)<-[:EXTENDS]-(SpectralIterativeSolver)
- (SpectralIterativeSolver)<-[:EXTENDS]-(OrthogonalCollocationSolver)
- Etc.

## Implementation Notes

The inheritance hierarchy reflects Julia's type system and multiple dispatch pattern, with abstract types providing interfaces and concrete types implementing specific functionality.
```
