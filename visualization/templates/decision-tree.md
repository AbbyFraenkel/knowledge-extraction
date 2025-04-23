# Decision Tree Template

This template provides a standardized way to visualize algorithm decision processes using Mermaid diagrams, particularly useful for displaying adaptive procedures, error handling, and algorithm selection logic.

## Basic Decision Tree Structure

```mermaid
flowchart TD
    %% Decision Tree: [Decision Process Name]
    %% Based on: [Paper Reference]
    
    Start([Start]) --> RootDecision{Root decision?}
    
    %% First level decisions
    RootDecision -->|Condition A| PathA{Sub-decision A?}
    RootDecision -->|Condition B| PathB{Sub-decision B?}
    RootDecision -->|Condition C| PathC{Sub-decision C?}
    
    %% Path A branches
    PathA -->|Option A1| ResultA1[Outcome A1]
    PathA -->|Option A2| ResultA2[Outcome A2]
    
    %% Path B branches
    PathB -->|Option B1| ResultB1[Outcome B1]
    PathB -->|Option B2| SubDecisionB{Further decision?}
    SubDecisionB -->|Yes| ResultB2a[Outcome B2a]
    SubDecisionB -->|No| ResultB2b[Outcome B2b]
    
    %% Path C branches
    PathC -->|Option C1| ResultC1[Outcome C1]
    PathC -->|Option C2| ResultC2[Outcome C2]
    PathC -->|Option C3| ResultC3[Outcome C3]
    
    %% Terminal nodes converge to end
    ResultA1 --> End([End])
    ResultA2 --> End
    ResultB1 --> End
    ResultB2a --> End
    ResultB2b --> End
    ResultC1 --> End
    ResultC2 --> End
    ResultC3 --> End
```

## Node Types and Styles

Use consistent shapes for specific components:

- **Start/End**: Rounded rectangles with double borders (`([Text])`)
- **Decision Nodes**: Diamond (`{Question?}`)
- **Outcomes/Actions**: Rectangle (`[Text]`)
- **Notes/Annotations**: Use dashed arrows (`-.->`) to connect annotations

## Color Scheme

Apply consistent colors to indicate different types of decisions:

```mermaid
flowchart TD
    %% Color scheme demonstration for decision trees
    
    Init[Start]
    PrimaryDecision{Primary Decision}
    SecondaryDecision{Secondary Decision}
    NumericalCheck{Numerical Check}
    ErrorCheck{Error Check}
    ModelSelection{Model Selection}
    Outcome[Outcome/Action]
    
    %% Apply styles
    style Init fill:#f5f5f5,stroke:#333333
    style PrimaryDecision fill:#d4f1f9,stroke:#05a0c8
    style SecondaryDecision fill:#d8e5f9,stroke:#0566c8
    style NumericalCheck fill:#f9f4d4,stroke:#c8b205
    style ErrorCheck fill:#f9d4d4,stroke:#c82b05
    style ModelSelection fill:#f5d4f9,stroke:#c805bd
    style Outcome fill:#ddf9d4,stroke:#3dbd25
```

Use the following style definitions:

```
%% Decision tree styles
style PrimaryDecision fill:#d4f1f9,stroke:#05a0c8
style SecondaryDecision fill:#d8e5f9,stroke:#0566c8
style NumericalCheck fill:#f9f4d4,stroke:#c8b205
style ErrorCheck fill:#f9d4d4,stroke:#c82b05
style ModelSelection fill:#f5d4f9,stroke:#c805bd
style Outcome fill:#ddf9d4,stroke:#3dbd25
```

## Decision Tree Layouts

Depending on the complexity and structure of decisions, consider these layout options:

### Horizontal Layout (for fewer levels with many options)

```mermaid
flowchart LR
    Start([Start]) --> RootDecision{Main decision?}
    
    RootDecision -->|Option 1| Result1[Outcome 1]
    RootDecision -->|Option 2| Result2[Outcome 2]
    RootDecision -->|Option 3| Result3[Outcome 3]
    RootDecision -->|Option 4| Result4[Outcome 4]
    
    Result1 --> End([End])
    Result2 --> End
    Result3 --> End
    Result4 --> End
```

### Binary Tree Layout (for yes/no decisions)

```mermaid
flowchart TD
    Start([Start]) --> Decision1{Condition 1?}
    
    Decision1 -->|Yes| Decision2{Condition 2?}
    Decision1 -->|No| Decision3{Condition 3?}
    
    Decision2 -->|Yes| Outcome1[Outcome 1]
    Decision2 -->|No| Outcome2[Outcome 2]
    
    Decision3 -->|Yes| Outcome3[Outcome 3]
    Decision3 -->|No| Outcome4[Outcome 4]
    
    Outcome1 --> End([End])
    Outcome2 --> End
    Outcome3 --> End
    Outcome4 --> End
```

### Multi-Path Layout (for complex decision trees)

```mermaid
flowchart TD
    Start([Start]) --> RootCheck{First check}
    
    %% Level 1
    RootCheck -->|Condition 1| Path1{Path 1 check}
    RootCheck -->|Condition 2| Path2{Path 2 check}
    RootCheck -->|Condition 3| Path3{Path 3 check}
    RootCheck -->|None match| DefaultPath[Default action]
    
    %% Level 2 - Path 1
    Path1 -->|Sub-condition 1A| Action1A[Action 1A]
    Path1 -->|Sub-condition 1B| Action1B[Action 1B]
    
    %% Level 2 - Path 2
    Path2 -->|Sub-condition 2A| FurtherCheck{Further check}
    Path2 -->|Sub-condition 2B| Action2B[Action 2B]
    
    %% Level 3
    FurtherCheck -->|Pass| Action2A1[Action 2A1]
    FurtherCheck -->|Fail| Action2A2[Action 2A2]
    
    %% Level 2 - Path 3
    Path3 -->|Any condition| Action3[Action 3]
    
    %% Terminal
    Action1A --> End([End])
    Action1B --> End
    Action2A1 --> End
    Action2A2 --> End
    Action2B --> End
    Action3 --> End
    DefaultPath --> End
```

## Example: Error Estimation and Adaptive Refinement Decision Tree

```mermaid
flowchart TD
    %% Decision Tree: Multi-Level Collocation Refinement Strategy
    %% Based on: Smith and Johnson (2023)
    
    Start([Start]) --> ComputeError[Compute error estimate]
    ComputeError --> ErrorCheck{Error > tolerance?}
    
    %% Primary decision branch
    ErrorCheck -->|Yes| RefineCheck{Refinement type?}
    ErrorCheck -->|No| ConvergenceCheck{Near convergence?}
    
    %% Refinement branch
    RefineCheck -->|Localized error| SpatialRefinement{Spatial refinement?}
    RefineCheck -->|Smooth error| OrderRefinement{Order refinement?}
    RefineCheck -->|Mixed error| CombinedRefinement[Combined refinement]
    
    %% Spatial refinement options
    SpatialRefinement -->|Level splitting| AddLevel[Add refinement level]
    SpatialRefinement -->|Subdomain focus| RefineSubdomain[Refine specific subdomain]
    
    %% Order refinement options
    OrderRefinement -->|Increase by 1| IncrementOrder[Increase polynomial order]
    OrderRefinement -->|Optimal order| OptimalOrder[Set optimal polynomial order]
    
    %% Convergence check branch
    ConvergenceCheck -->|Yes| DecrementCheck{Can reduce resolution?}
    ConvergenceCheck -->|No| MaintainResolution[Maintain current resolution]
    
    %% Decrement resolution branch
    DecrementCheck -->|Yes| ReduceResolution[Reduce resolution]
    DecrementCheck -->|No| MaintainResolution
    
    %% Terminal actions
    AddLevel --> NextStep([Continue to next step])
    RefineSubdomain --> NextStep
    CombinedRefinement --> NextStep
    IncrementOrder --> NextStep
    OptimalOrder --> NextStep
    MaintainResolution --> NextStep
    ReduceResolution --> NextStep
    
    %% Apply styles
    style ErrorCheck fill:#f9d4d4,stroke:#c82b05,font-weight:bold
    style RefineCheck fill:#d4f1f9,stroke:#05a0c8
    style ConvergenceCheck fill:#d4f1f9,stroke:#05a0c8
    style SpatialRefinement fill:#d8e5f9,stroke:#0566c8
    style OrderRefinement fill:#d8e5f9,stroke:#0566c8
    style DecrementCheck fill:#d8e5f9,stroke:#0566c8
    
    style AddLevel fill:#ddf9d4,stroke:#3dbd25
    style RefineSubdomain fill:#ddf9d4,stroke:#3dbd25
    style CombinedRefinement fill:#ddf9d4,stroke:#3dbd25
    style IncrementOrder fill:#ddf9d4,stroke:#3dbd25
    style OptimalOrder fill:#ddf9d4,stroke:#3dbd25
    style MaintainResolution fill:#ddf9d4,stroke:#3dbd25
    style ReduceResolution fill:#ddf9d4,stroke:#3dbd25
```

## Guidelines for Effective Decision Tree Visualization

1. **Clear Decision Criteria**: Ensure each decision node has clear, unambiguous criteria
2. **Complete Coverage**: All possible conditions should be covered by branches
3. **Consistent Terminology**: Use consistent wording for similar concepts
4. **Logical Flow**: Arrange the tree to follow the natural flow of decision making
5. **Descriptive Branch Labels**: Label each branch with specific conditions
6. **Manageable Size**: Break very large trees into logical sub-trees if needed
7. **Outcome Clarity**: Make terminal nodes (outcomes) clearly distinguishable
8. **Proper Hierarchy**: More general decisions should precede specific ones

## Usage in Knowledge Extraction

When creating a decision tree from algorithmic descriptions in papers:

1. Identify key decision points in the algorithm
2. Determine the criteria used at each decision point
3. Map out all possible outcomes from each decision
4. Arrange decisions in hierarchical order
5. Use consistent formatting and color coding
6. Include references to corresponding sections in the paper

## Example Usage

```
# Decision Tree: Adaptive Refinement Strategy

## Overview
- **Process**: Error estimation and adaptive refinement strategy
- **Source**: Smith and Johnson (2023)
- **Purpose**: Determine optimal refinement approach based on error characteristics

## Decision Tree Visualization

[Insert Mermaid diagram here]

## Decision Criteria

1. **Error Threshold Check**
   - Compare computed error estimate against tolerance
   - Paper reference: Section 3.2, Equation (15)

2. **Refinement Type Determination**
   - Localized error: Error concentrated in specific regions
   - Smooth error: Error distributed across domain
   - Mixed error: Combination of both patterns
   - Paper reference: Section 3.3

3. **Specific Refinement Strategies**
   - Spatial refinement: Add levels or refine subdomains
   - Order refinement: Increase polynomial degree
   - Paper reference: Algorithms 1 and 2

## Implementation Notes

[Add any implementation-specific details here]
```
