# KitchenSink Code Generation Template

This template provides guidance for generating Julia code from extracted mathematical concepts for the KitchenSink solver. It implements the symbol-concept separation principle by mapping mathematical concepts to code while preserving the original mathematical properties.

## Overview

The code generation process transforms mathematical knowledge into executable Julia code that conforms to the KitchenSink architecture. This template focuses on:

1. **Mathematical fidelity**: Preserving the mathematical properties and relationships
2. **Type system integration**: Properly leveraging Julia's type system
3. **Performance considerations**: Generating efficient, type-stable code
4. **Documentation**: Connecting implementation to mathematical foundation

## Basic Structure

Each generated code file should follow this structure:

```julia
"""
    [TypeName]

[Brief description of the mathematical concept]

# Mathematical Foundation
Based on [concept name] as described in [reference to paper].
[Brief explanation of the mathematical foundation]

# Mathematical Properties
- [Property 1]
- [Property 2]
- ...

# Implementation Details
[Brief explanation of implementation approach]

# References
- Equation (X) in [Author et al. (Year)](doi:XXX/XXXXX)
- Algorithm Y in [Author et al. (Year)](doi:XXX/XXXXX)
- Section Z.Z in [Author et al. (Year)](doi:XXX/XXXXX)
"""
struct [TypeName]{[Type parameters]}
    # Fields representing mathematical entities
    [field1]::[Type1]
    [field2]::[Type2]
    # ...
    
    # Inner constructor with validation
    function [TypeName]{[Type parameters]}([constructor parameters])
        # Validate parameters based on mathematical constraints
        # ...
        new([field values])
    end
end

# Outer constructor with defaults
function [TypeName]([simplified parameters]; [keyword arguments])
    # Transform parameters as needed
    [TypeName]{[parameter types]}([transformed parameters])
end

# Core functionality implementation
function [primary_function]([type_instance]::[TypeName], [additional_parameters])
    # Implementation based on mathematical formulation
    # ...
end
```

## Type Definition Templates

### Mathematical Concept Implementation

```julia
"""
    [ConceptName]{T}

Implementation of the mathematical concept [ConceptName].

# Mathematical Foundation
Based on [detailed description of mathematical foundation].

# Mathematical Properties
- [Property 1]
- [Property 2]
- ...

# References
- [Paper references]
"""
struct [ConceptName]{T} <: [AbstractParentType]{T}
    # Core parameters from mathematical definition
    [parameter1]::T
    [parameter2]::Vector{T}
    # Additional implementation-specific fields
    [cached_values]::Matrix{T}
    
    # Inner constructor with validation
    function [ConceptName]{T}(
        [parameter1]::T,
        [parameter2]::Vector{T};
        [options...]
    ) where {T<:AbstractFloat}
        # Mathematical constraint validation
        @assert [parameter1] > zero(T) "[parameter1] must be positive"
        # ...
        
        # Initialize cached computations
        [cached_values] = [precomputation]
        
        # Create instance
        new([parameter1], [parameter2], [cached_values])
    end
end
```

### Numerical Method Implementation

```julia
"""
    [MethodName]{T,N,B<:AbstractBasis}

Implementation of the numerical method [MethodName].

# Mathematical Foundation
Based on [detailed description of mathematical foundation].

# Convergence Properties
- Order of convergence: [convergence order]
- Stability conditions: [stability conditions]
- Error behavior: [error behavior]

# References
- [Paper references]
"""
struct [MethodName]{T,N,B<:AbstractBasis} <: [AbstractParentMethod]{T,N}
    # Core mathematical components
    basis::B
    order::Int
    # Discretization components
    points::Array{T,N}
    weights::Array{T,N}
    # Performance optimization fields
    [cached_matrices]::NTuple{N,Matrix{T}}
    
    # Inner constructor
    function [MethodName]{T,N,B}(
        basis::B,
        order::Int,
        domain::NTuple{N,Tuple{T,T}};
        [options...]
    ) where {T<:AbstractFloat,N,B<:AbstractBasis}
        # Parameter validation based on mathematical constraints
        @assert order >= 1 "Polynomial order must be at least 1"
        # ...
        
        # Initialize discretization
        points = [compute_points](basis, order, domain)
        weights = [compute_weights](basis, points, domain)
        
        # Precompute matrices for performance
        diff_matrices = ntuple(i -> [compute_diff_matrix](basis, points, i), N)
        
        # Create instance
        new{T,N,B}(basis, order, points, weights, diff_matrices)
    end
end
```

## Function Implementation Templates

### Core Algorithm Implementation

```julia
"""
    [algorithm_name]([method]::[MethodType], [problem]::[ProblemType], [additional_parameters])

Implementation of the [algorithm name] algorithm for solving [problem type].

# Mathematical Algorithm
[Brief description of the mathematical algorithm]

1. [Step 1]
2. [Step 2]
3. ...

# Parameters
- `[method]`: [Description]
- `[problem]`: [Description]
- `[additional_parameters]`: [Description]

# Returns
- `[return_type]`: [Description]

# References
- Algorithm X in [Author et al. (Year)](doi:XXX/XXXXX)
"""
function [algorithm_name](
    [method]::[MethodType],
    [problem]::[ProblemType],
    [additional_parameters]
)
    # Implementation following the mathematical algorithm steps
    # Step 1
    [step1_implementation]
    
    # Step 2
    [step2_implementation]
    
    # ...
    
    return [result]
end
```

### Mathematical Function Evaluation

```julia
"""
    [function_name]([mathematical_object]::[ObjectType], [parameters])

Evaluates the mathematical function [function_name] for the given object and parameters.

# Mathematical Definition
[LaTeX or description of mathematical definition]

# Parameters
- `[mathematical_object]`: [Description]
- `[parameters]`: [Description]

# Returns
- `[return_type]`: [Description]

# Mathematical Properties
- [Property 1]
- [Property 2]
- ...

# References
- Equation (X) in [Author et al. (Year)](doi:XXX/XXXXX)
"""
function [function_name](
    [mathematical_object]::[ObjectType],
    [parameters]
)
    # Implementation based on mathematical definition
    [implementation]
    
    return [result]
end
```

## Symbol-to-Variable Mapping Guidelines

When transforming mathematical symbols to Julia variables:

1. **Preserve Meaning**: Variable names should reflect mathematical meaning
2. **Naming Conventions**:
   - Use full descriptive names for primary variables (e.g., `polynomial_order` instead of `p`)
   - Use single-letter variables only in limited mathematical contexts
   - Follow Julia naming conventions (snake_case for functions and variables)
   - Use camelCase for type parameters
3. **Documentation Connection**:
   - Document the connection between implementation variables and mathematical symbols
   - Use LaTeX in docstrings to show original mathematical notation
4. **Type Selection**:
   - Choose appropriate types based on mathematical properties
   - Use parametric types to maintain flexibility
   - Ensure type stability in all computation paths

### Symbol Mapping Table

Always include a mapping table in the module documentation:

```julia
"""
    ModuleName

Implementation of [mathematical concept] for the KitchenSink solver.

# Symbol Mapping
| Mathematical Symbol | Description | Julia Implementation | Type |
|---------------------|-------------|---------------------|------|
| Φⱼᵏ(x) | Basis function of degree j, k derivatives | `evaluate_basis(basis, j, x, k)` | `Function` |
| ξᵢ | Collocation point | `collocation_points(basis, order)[i]` | `Float64` |
| Dᵏ | k-th differentiation matrix | `diff_matrices[k]` | `Matrix{Float64}` |
| ... | ... | ... | ... |
"""
module ModuleName
# Module implementation
end
```

## Mathematical Property Preservation

Ensure that mathematical properties are preserved in the implementation:

1. **Convergence Properties**:
   - Implement convergence tests that verify mathematical convergence rates
   - Document convergence behavior in docstrings

```julia
"""
    test_convergence(method, exact_solution)

Tests the convergence properties of the method against an exact solution.

# Mathematical Expectation
For smooth solutions, the method should exhibit [convergence rate] convergence.
"""
function test_convergence(method, exact_solution)
    # Implementation that verifies convergence rates
end
```

2. **Conservation Properties**:
   - Implement conservation checks that verify mathematical conservation laws
   - Document conservation behavior in docstrings

```julia
"""
    check_conservation(solution, conservation_law)

Checks if the solution satisfies the given conservation law.

# Mathematical Conservation Law
[Description of the conservation law]
"""
function check_conservation(solution, conservation_law)
    # Implementation that verifies conservation
end
```

3. **Stability Properties**:
   - Implement stability checks that verify mathematical stability conditions
   - Document stability behavior in docstrings

```julia
"""
    check_stability(method, parameters)

Checks if the method satisfies stability conditions for the given parameters.

# Mathematical Stability Condition
[Description of the stability condition]
"""
function check_stability(method, parameters)
    # Implementation that verifies stability
end
```

## Template Customization for KitchenSink-Specific Features

### Multi-Level Methods

```julia
"""
    MultiLevelMethod{T,N,B<:AbstractBasis}

Implementation of a multi-level method based on [mathematical foundation].

# Mathematical Hierarchy
This implements a hierarchical approximation where:
- Level 0: Base approximation with polynomial order p₀
- Level m: Refinement level with polynomial order pₘ
- Refinement strategy: [refinement strategy]

# Mathematical Properties
- [Property 1]
- [Property 2]
- ...

# References
- [Paper references]
"""
struct MultiLevelMethod{T,N,B<:AbstractBasis} <: AbstractAdaptiveMethod{T,N}
    # Core components
    base_level::Level{T,N,B}
    refinement_levels::Vector{Level{T,N,B}}
    # Refinement parameters
    max_levels::Int
    refinement_threshold::T
    
    # Inner constructor
    function MultiLevelMethod{T,N,B}(
        basis::B,
        base_order::Int,
        domain::NTuple{N,Tuple{T,T}};
        max_levels::Int=5,
        refinement_threshold::T=convert(T, 1e-6),
        [additional_parameters]...
    ) where {T<:AbstractFloat,N,B<:AbstractBasis}
        # Create base level
        base_level = Level{T,N,B}(basis, base_order, domain)
        
        # Create instance
        new{T,N,B}(base_level, Level{T,N,B}[], max_levels, refinement_threshold)
    end
end
```

### Orthogonal Collocation on Finite Cells

```julia
"""
    OrthogonalCollocationFC{T,N,B<:AbstractBasis}

Implementation of Orthogonal Collocation on Finite Cells (OCFC).

# Mathematical Foundation
This implements the OCFC method which combines:
1. Spectral accuracy from orthogonal polynomial basis
2. Domain flexibility from fictitious domain approach
3. [Additional mathematical features]

# Mathematical Properties
- [Property 1]
- [Property 2]
- ...

# References
- [Paper references]
"""
struct OrthogonalCollocationFC{T,N,B<:AbstractBasis} <: AbstractCollocationMethod{T,N}
    # Basis components
    basis::B
    order::Int
    # Domain components
    physical_domain::PhysicalDomain{T,N}
    reference_domain::ReferenceDomain{T,N}
    # Discretization components
    collocation_points::Array{T,N}
    weights::Array{T,N}
    # Mapping components
    physical_to_reference::MappingFunction{T,N}
    reference_to_physical::MappingFunction{T,N}
    
    # Inner constructor
    function OrthogonalCollocationFC{T,N,B}(
        basis::B,
        order::Int,
        physical_domain::PhysicalDomain{T,N};
        [additional_parameters]...
    ) where {T<:AbstractFloat,N,B<:AbstractBasis}
        # Create reference domain and mappings
        reference_domain = ReferenceDomain{T,N}()
        physical_to_reference = create_mapping(physical_domain, reference_domain)
        reference_to_physical = create_mapping(reference_domain, physical_domain)
        
        # Create discretization
        collocation_points = compute_collocation_points(basis, order, reference_domain)
        weights = compute_quadrature_weights(basis, collocation_points, reference_domain)
        
        # Create instance
        new{T,N,B}(
            basis, order, 
            physical_domain, reference_domain,
            collocation_points, weights,
            physical_to_reference, reference_to_physical
        )
    end
end
```

## Code Generation Examples

### Example 1: LegendreCollocation Implementation

```julia
"""
    LegendreCollocation{T,N}

Orthogonal collocation method using Legendre polynomials.

# Mathematical Foundation
Based on the spectral element method using Legendre polynomials as described in
Canuto et al. (2006). Uses Gauss-Lobatto-Legendre points for collocation.

# Mathematical Properties
- Spectral (exponential) convergence for smooth solutions
- Exact integration of polynomials up to degree 2n-1
- No boundary aliasing due to inclusion of endpoints

# References
- Equation (2.3.12) in Canuto et al. (2006) for basis functions
- Section 2.3.4 in Canuto et al. (2006) for quadrature properties
"""
struct LegendreCollocation{T,N} <: AbstractCollocationMethod{T,N}
    # Core parameters
    order::Int
    domain::NTuple{N,Tuple{T,T}}
    # Discretization
    points::Array{T,N}
    weights::Array{T,N}
    # Differentiation matrices
    diff_matrices::NTuple{2,Array{T}}
    
    # Inner constructor
    function LegendreCollocation{T,N}(
        order::Int,
        domain::NTuple{N,Tuple{T,T}}
    ) where {T<:AbstractFloat,N}
        # Validate parameters
        @assert order >= 1 "Polynomial order must be at least 1"
        
        # Compute Gauss-Lobatto-Legendre points and weights
        canonical_points = compute_legendre_gauss_lobatto_points(order+1)
        canonical_weights = compute_legendre_gauss_lobatto_weights(canonical_points)
        
        # Map to domain
        points = map_to_domain(canonical_points, domain)
        weights = scale_weights(canonical_weights, domain)
        
        # Compute differentiation matrices
        D1 = compute_legendre_differentiation_matrix(canonical_points, 1)
        D2 = compute_legendre_differentiation_matrix(canonical_points, 2)
        
        # Scale differentiation matrices for domain
        scaled_D1 = scale_differentiation_matrix(D1, domain, 1)
        scaled_D2 = scale_differentiation_matrix(D2, domain, 2)
        
        # Create instance
        new{T,N}(order, domain, points, weights, (scaled_D1, scaled_D2))
    end
end

# Outer constructor
function LegendreCollocation(
    order::Int,
    domain::NTuple{N,Tuple{T,T}}
) where {T<:AbstractFloat,N}
    LegendreCollocation{T,N}(order, domain)
end

# Basis function evaluation
function evaluate_basis(
    collocation::LegendreCollocation{T},
    i::Int,
    x::T,
    derivative::Int=0
) where {T<:AbstractFloat}
    # Map x to canonical domain [-1,1]
    ξ = map_to_canonical(x, collocation.domain[1])
    
    # Evaluate Legendre polynomial or its derivative
    if derivative == 0
        return lagrange_basis(collocation.points, i, ξ)
    else
        # Use the differentiation matrix for derivatives
        # This is a simplification; a more accurate implementation would
        # use analytical derivatives of Legendre polynomials
        points_values = zeros(T, length(collocation.points))
        points_values[i] = one(T)
        
        # Apply differentiation matrix
        if derivative == 1
            derivative_values = collocation.diff_matrices[1] * points_values
            return interpolate(collocation.points, derivative_values, ξ)
        elseif derivative == 2
            derivative_values = collocation.diff_matrices[2] * points_values
            return interpolate(collocation.points, derivative_values, ξ)
        else
            error("Derivatives higher than 2 not implemented")
        end
    end
end

# Solve function
function solve(
    collocation::LegendreCollocation{T,N},
    problem::BoundaryValueProblem{T,N}
) where {T<:AbstractFloat,N}
    # Extract problem components
    differential_operator = problem.differential_operator
    source_term = problem.source_term
    boundary_conditions = problem.boundary_conditions
    
    # Number of collocation points
    n_points = collocation.order + 1
    
    # Setup linear system Ax = b
    A = zeros(T, n_points, n_points)
    b = zeros(T, n_points)
    
    # Apply differential operator at interior points
    for i in 2:(n_points-1)
        # Define row of A by evaluating differential operator
        for j in 1:n_points
            # This is a simplified approach; actual implementation would
            # use the differentiation matrices more directly
            A[i,j] = evaluate_differential_operator(
                differential_operator,
                collocation,
                i, j
            )
        end
        
        # Define b by evaluating source term
        b[i] = source_term(collocation.points[i])
    end
    
    # Apply boundary conditions
    # Left boundary
    A[1,:] .= 0
    for j in 1:n_points
        A[1,j] = evaluate_basis(collocation, j, collocation.domain[1][1])
    end
    b[1] = boundary_conditions.left.value
    
    # Right boundary
    A[n_points,:] .= 0
    for j in 1:n_points
        A[n_points,j] = evaluate_basis(collocation, j, collocation.domain[1][2])
    end
    b[n_points] = boundary_conditions.right.value
    
    # Solve linear system
    coefficients = A \ b
    
    # Return solution function
    solution_function = x -> sum(
        coefficients[j] * evaluate_basis(collocation, j, x) 
        for j in 1:n_points
    )
    
    return CollocationSolution(collocation, coefficients, solution_function)
end
```

### Example 2: AdaptiveMultiLevelCollocation Implementation

```julia
"""
    AdaptiveMultiLevelCollocation{T,N}

Adaptive multi-level collocation method using refinement-by-superposition.

# Mathematical Foundation
Based on the multi-level hp-adaptive spectral element method described in
[Author et al. (Year)]. Uses a hierarchical approach where refinement is achieved
by superimposing higher-resolution elements over coarser ones.

# Mathematical Properties
- Spectral convergence in smooth regions
- Localized refinement capabilities
- Hierarchical error estimation
- Conservation properties preserved across levels

# References
- Equation (7) in [Author et al. (Year)] for multi-level basis definition
- Algorithm 2 in [Author et al. (Year)] for refinement strategy
- Theorem 3.1 in [Author et al. (Year)] for error estimates
"""
struct AdaptiveMultiLevelCollocation{T,N,B<:AbstractBasis} <: AbstractAdaptiveMethod{T,N}
    # Base parameters
    base_level::Level{T,N,B}
    refinement_levels::Vector{Level{T,N,B}}
    # Refinement parameters
    max_levels::Int
    refinement_threshold::T
    
    # Inner constructor
    function AdaptiveMultiLevelCollocation{T,N,B}(
        basis::B,
        base_order::Int,
        domain::NTuple{N,Tuple{T,T}};
        max_levels::Int=5,
        refinement_threshold::T=convert(T, 1e-6)
    ) where {T<:AbstractFloat,N,B<:AbstractBasis}
        # Create base level
        base_level = Level{T,N,B}(basis, base_order, domain)
        
        # Create instance
        new{T,N,B}(base_level, Level{T,N,B}[], max_levels, refinement_threshold)
    end
end

# Outer constructor
function AdaptiveMultiLevelCollocation(
    basis_type::Symbol,
    base_order::Int,
    domain::NTuple{N,Tuple{T,T}};
    max_levels::Int=5,
    refinement_threshold::T=convert(T, 1e-6)
) where {T<:AbstractFloat,N}
    # Create appropriate basis based on type
    if basis_type == :legendre
        basis = LegendreBasis{T}()
    elseif basis_type == :chebyshev
        basis = ChebyshevBasis{T}()
    else
        error("Unsupported basis type: $basis_type")
    end
    
    # Call inner constructor
    AdaptiveMultiLevelCollocation{T,N,typeof(basis)}(
        basis, base_order, domain;
        max_levels=max_levels,
        refinement_threshold=refinement_threshold
    )
end

# Refinement function
function refine!(
    method::AdaptiveMultiLevelCollocation{T,N,B},
    error_estimator::Function;
    max_refinements::Int=10
) where {T<:AbstractFloat,N,B<:AbstractBasis}
    # Get current solution
    solution = solve(method)
    
    # Refinement loop
    refinements = 0
    while refinements < max_refinements
        # Estimate error
        errors = error_estimator(solution)
        
        # Check if error is below threshold
        if maximum(errors) < method.refinement_threshold
            break
        end
        
        # Find elements to refine
        elements_to_refine = findall(errors .> method.refinement_threshold)
        
        # Check if we've reached maximum levels
        if length(method.refinement_levels) >= method.max_levels
            @warn "Reached maximum number of refinement levels"
            break
        end
        
        # Add refinement level
        add_refinement_level!(method, elements_to_refine)
        
        # Update solution
        solution = solve(method)
        
        # Increment counter
        refinements += 1
    end
    
    return solution
end

# Solve function
function solve(method::AdaptiveMultiLevelCollocation{T,N,B}) where {T<:AbstractFloat,N,B<:AbstractBasis}
    # Solve base level
    base_solution = solve_level(method.base_level)
    
    # Solve refinement levels
    refinement_solutions = [
        solve_level(level, previous=(i > 1 ? method.refinement_levels[i-1] : method.base_level))
        for (i, level) in enumerate(method.refinement_levels)
    ]
    
    # Combine solutions
    combined_solution = combine_solutions(base_solution, refinement_solutions)
    
    return combined_solution
end
```

## Usage Instructions

1. Create a code file based on this template that implements the mathematical concept
2. Ensure all mathematical properties are documented with references
3. Implement all necessary methods specified in the abstract interface
4. Include proper docstrings with LaTeX for mathematical formulas
5. Add tests that verify mathematical properties

This template serves as a guide for implementing mathematical concepts in the KitchenSink solver, ensuring consistency, mathematical fidelity, and proper integration with the existing architecture.
