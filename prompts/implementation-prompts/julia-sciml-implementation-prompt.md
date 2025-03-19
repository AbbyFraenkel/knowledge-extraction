# Julia SciML Implementation Strategy Prompt

## Purpose

This prompt provides comprehensive guidelines for translating mathematical algorithms from academic papers into efficient, well-designed Julia code following SciML ecosystem standards. It focuses on creating modular, type-stable, and well-tested implementations suitable for integration with KitchenSink.

## Implementation Requirements

1. **SciML Style Conformance**
   - Follow SciML naming conventions and code organization
   - Design for compatibility with the broader SciML ecosystem
   - Implement both in-place and out-of-place operations when appropriate
   - Maintain consistent documentation style

2. **Type System Design**
   - Create clear abstract type hierarchies
   - Use parametric types with appropriate constraints
   - Ensure type stability across computation paths
   - Design interfaces compatible with existing SciML components

3. **Mathematical Documentation**
   - Document all equations with LaTeX in docstrings
   - Include references to original papers
   - Specify parameter meanings and units
   - Document mathematical assumptions and limitations

4. **Testing Framework**
   - Create comprehensive test suite covering edge cases
   - Implement convergence testing with known solutions
   - Test against benchmark problems from literature
   - Verify parameter sensitivity and stability

## Implementation Documentation Structure

For each implementation, create a document with the following structure:

```markdown
# Julia Implementation: [Algorithm Name]

## Algorithm Overview
[Brief description of the algorithm with core mathematical concepts]

## Original Source
- **Paper**: [Paper citation]
- **Authors**: [Authors]
- **Algorithm Section**: [Specific section in paper]

## Type Hierarchy

### Abstract Types
```julia
abstract type AbstractAlgorithmName{T} end
```

[Description of abstract type hierarchy with rationale]

### Concrete Types
```julia
struct AlgorithmName{T,P,A} <: AbstractAlgorithmName{T}
    # Type parameters explained
    parameterA::T
    parameterB::Vector{T}
    settings::P
    adapter::A
end
```

[Explanation of type parameters and fields]

## Function Interfaces

### Core Functions
```julia
"""
    solve!(problem::ProblemType, alg::AlgorithmName; kwargs...)

Solve `problem` using the algorithm.

# Arguments
- `problem::ProblemType`: The problem to solve
- `alg::AlgorithmName`: Algorithm configuration

# Keywords
- `tolerance::Real=1e-6`: Error tolerance
- `maxiters::Int=100`: Maximum iterations

# Returns
- `solution::SolutionType`: The computed solution

# Mathematical Formulation
```math
[LaTeX equations]
```

# References
1. [paper reference with page/equation numbers]
"""
function solve! end
```

[Explanation of function design choices]

### Helper Functions
[Documentation for key helper functions]

## Performance Considerations

### Memory Allocation Strategy
[Discussion of allocation minimization approaches]

### Vectorization Opportunities
[Analysis of vectorization potential]

### Parallelization Strategy
[Approach to parallel computation if applicable]

## SciML Ecosystem Integration

### DifferentialEquations.jl Compatibility
[How implementation interfaces with DE.jl]

### ModelingToolkit.jl Integration
[MTK integration strategy if applicable]

### ComponentArrays.jl Utilization
[How ComponentArrays.jl is leveraged]

## Testing Strategy

### Unit Tests
```julia
@testset "AlgorithmName basics" begin
    # Test code examples
end
```

### Convergence Tests
[Testing approach for numerical convergence]

### Benchmark Problems
[Key benchmark problems with references]

## KitchenSink Integration

### Component Placement
[Where this fits in KitchenSink architecture]

### Interface Requirements
[Required interfaces for integration]

### Configuration Options
[Configurable parameters for KitchenSink]

## Documentation

### Public API Documentation
[What should be publicly documented]

### Example Usage
```julia
# Example usage code
```

## Cypher Integration
[Cypher file generated for knowledge graph integration]
```

## Julia Style Guide Highlights

Key SciML style patterns to incorporate:

### 1. Type System Design
```julia
# Prefer parametric abstract types
abstract type AbstractIterativeAlgorithm{T,NonlinearSolve} end

# Concrete types with meaningful parameters
struct NewtonMethod{T,L,F,J} <: AbstractIterativeAlgorithm{T,true}
    linsolve::L
    f::F
    jacobian::J
    tol::T
end
```

### 2. Function Signatures
```julia
# In-place operations with ! suffix
function solve!(x, alg::NewtonMethod, x0)
    # Implementation
end

# Out-of-place version
function solve(alg::NewtonMethod, x0)
    x = similar(x0)
    solve!(x, alg, x0)
    return x
end

# Multiple dispatch for different types
function solve!(x, alg::NewtonMethod{T,DirectSolve}, x0) where {T}
    # Special implementation for direct solvers
end
```

### 3. Documentation Style
```julia
"""
    adaptive_timestep(integrator, args...; kwargs...)

Calculate an adaptive timestep based on error estimates.

# Arguments
- `integrator`: The time integrator
- `error_estimate`: Computed error estimate

# Keywords
- `safety_factor::Real=0.9`: Safety scaling for step size
- `min_step::Real=eps()`: Minimum allowed step size

# Mathematical Formulation
The adaptive timestep is computed as:
```math
\\Delta t_{n+1} = \\Delta t_n \\left( \\frac{\\text{tol}}{\\text{err}} \\right)^{1/q} \\cdot \\text{safety}
```
where ``q`` is the order of the method.

# References
1. Hairer, E., & Wanner, G. (1996). Solving Ordinary Differential Equations II, p.167-168.
"""
function adaptive_timestep end
```

### 4. Test Structure
```julia
using Test

@testset "AlgorithmName.jl" begin
    @testset "Basic functionality" begin
        # Basic tests
    end
    
    @testset "Convergence" begin
        # Test convergence rates
        for p in 1:5
            # Test different polynomial orders
            @test error ≈ expected_rate atol=1e-2
        end
    end
    
    @testset "Edge cases" begin
        # Test behavior at boundaries
    end
end
```

## Cypher File Generation for Implementations

Create a Cypher file for each implementation with the following template:

```cypher
// Implementation Node Creation
CREATE (impl:Implementation {
  name: "JuliaImplementation_AlgorithmName",
  description: "SciML implementation of Algorithm",
  algorithmSource: "AlgorithmName",
  scimlComponents: ["component1", "component2"],
  language: "Julia",
  ecosystem: "SciML",
  optimizations: ["optimization1", "optimization2"],
  referenceFile: "extracted-numerical-methods/implementations/AlgorithmName_implementation.md",
  testCoverage: "Description of test coverage",
  performanceCharacteristics: "Performance notes"
})

// Implementation Relationship
MATCH (algo:Algorithm {name: "AlgorithmName"})
CREATE (impl)-[:IMPLEMENTS {
  description: "Julia SciML implementation of the algorithm",
  completeness: "Full/Partial",
  adaptations: ["adaptation1", "adaptation2"]
}]->(algo)

// SciML Integration Relationship
MATCH (component:SoftwareComponent {name: "KitchenSink"})
CREATE (impl)-[:INTEGRATES_WITH {
  description: "How implementation integrates with KitchenSink",
  interfaceRequirements: ["requirement1", "requirement2"],
  configurationOptions: ["option1", "option2"]
}]->(component)
```

## Output Files and Storage

For each implementation, create and store the following files:

1. **Implementation Strategy Document**
   - Path: `/projects/git/extracted-numerical-methods/implementations/[AlgorithmName]_implementation.md`
   - Content: Full implementation documentation following the template above

2. **Implementation Cypher File**
   - Path: `/projects/git/knowledge-extraction/cypher/implementations/[AlgorithmName]_implementation.cypher`
   - Content: Cypher commands to integrate into knowledge graph

3. **Example Code File (if complete implementation provided)**
   - Path: `/projects/git/extracted-numerical-methods/code/[AlgorithmName].jl`
   - Content: Complete Julia implementation following SciML standards

4. **Test Code File (if tests provided)**
   - Path: `/projects/git/extracted-numerical-methods/tests/[AlgorithmName]_tests.jl`
   - Content: Test suite for the implementation

## KitchenSink Integration Specifics

For implementations targeting KitchenSink integration, focus on:

1. **Orthogonal Collocation Integration**
   - Analyze compatibility with multi-level orthogonal collocation
   - Design interfaces compatible with existing collocation framework
   - Document potential enhancements to current capabilities

2. **Moving Boundary Handling**
   - Implement techniques for tracking moving interfaces
   - Design for phase change modeling capabilities
   - Ensure compatibility with existing boundary condition frameworks

3. **Parameter Handling**
   - Design for physical parameter specification
   - Implement unit-aware computation where appropriate
   - Create interfaces for parameter estimation

4. **Error Estimation and Adaptivity**
   - Implement robust error estimation techniques
   - Design adaptivity mechanisms consistent with SciML patterns
   - Ensure error control meets application requirements

## Documentation Requirements

All implementations should include:

1. **Mathematical Foundations**
   - LaTeX equations in docstrings
   - References to original papers
   - Explanation of numerical properties

2. **Usage Examples**
   - Basic usage patterns
   - Configuration options
   - Common application scenarios

3. **Performance Characteristics**
   - Scaling behavior with problem size
   - Memory usage patterns
   - Parallelization benefits

4. **Testing Guidelines**
   - Verification approach
   - Benchmark problems
   - Convergence testing methodology

This comprehensive implementation prompt ensures that all Julia implementations follow SciML best practices while maintaining clear connections to the mathematical foundations in the original papers. It supports the transition from Atlas to direct Cypher file generation.
