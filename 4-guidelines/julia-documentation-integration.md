# Julia Documentation Integration Guide

## Overview

This guide outlines how to create mathematically rigorous documentation for Julia implementations extracted from academic knowledge. Following SciML style conventions while maintaining mathematical precision ensures that code implementations faithfully represent the underlying mathematical concepts.

## Documentation Tools

### Documenter.jl

The primary tool for Julia documentation is [Documenter.jl](https://juliadocs.github.io/Documenter.jl/stable/), which offers several features particularly valuable for knowledge extraction:

- **LaTeX Support**: Write mathematical equations using standard LaTeX syntax
- **Cross-References**: Link between related concepts, equations, and implementations
- **Code Testing**: Automatically test code examples in documentation
- **Multi-Tiered Structure**: Create hierarchical documentation that matches knowledge tiers (L1, L2, L3)

### DocStringExtensions.jl

Use [DocStringExtensions.jl](https://juliadocs.github.io/DocStringExtensions.jl/stable/) to standardize docstring structure with specific mathematical sections:

```julia
using DocStringExtensions

"""
    coefficient_decay_rate(coeffs, order=1)

Calculate the decay rate parameter σ of Legendre polynomial coefficients.

# Mathematical Formulation

The coefficient decay rate is defined by the relation:

```math
|a_i| \approx c \cdot 10^{-\sigma i}
```

where:
- ``a_i`` are the Legendre coefficients
- ``c`` is a constant
- ``\sigma`` is the decay rate parameter

# Arguments
$(TYPEDARGS)

# Returns
$(TYPEDRETURNS)

# Examples
```julia
coeffs = [1.0, 0.1, 0.01, 0.001]
decay_rate = coefficient_decay_rate(coeffs)
```

# References
Liu et al. (2018), "hp-Legendre Method with Adaptive Refinement".
"""
function coefficient_decay_rate(coeffs, order=1)
    # Implementation
end
```

## Documentation Structure for Mathematical Content

Use the following structure in docstrings for mathematical implementations:

### 1. Function Signature and Brief Description
Clear statement of what the function calculates with appropriate mathematical terminology.

### 2. Mathematical Formulation
Formal mathematical definition including:
- Governing equations in LaTeX
- Variable definitions
- Domain/range specifications
- Constraints or assumptions

### 3. Algorithm Description
Step-by-step explanation of the implementation approach, including:
- Numerical method classification
- Discretization approach (when applicable)
- Iterative procedure (when applicable)
- Termination criteria

### 4. Error Analysis
Information about error characteristics:
- Theoretical error bounds
- Convergence properties
- Stability conditions
- Known limitations

### 5. References
Citations to original publications with specific section/equation references.

## SciML Integration Guidelines

To maintain compatibility with SciML ecosystem while preserving mathematical rigor:

1. **Use Standard Interfaces**
   ```julia
   # For differential equation solvers
   function solve_problem(prob::AbstractDEProblem, alg::AbstractDEAlgorithm, args...)
       # Implementation
   end
   ```

2. **Document Type Hierarchies**
   ```julia
   """
    HPLegendreMethod <: AbstractSpectralMethod

Orthogonal collocation method using Legendre polynomials with hp-refinement.

# Mathematical Foundation
...
   """
   struct HPLegendreMethod <: AbstractSpectralMethod
       # Fields
   end
   ```

3. **Preserve Mathematical Parameter Names**
   ```julia
   """
    solve_stefan_problem(α, ρ, L, k, u_0, u_m; kwargs...)

Solve the one-dimensional Stefan problem with moving boundary.

# Mathematical Formulation

Solves the heat equation with phase change:

```math
\frac{\partial u}{\partial t} = \alpha \frac{\partial^2 u}{\partial x^2}
```

with Stefan condition at the moving boundary:

```math
\rho L \frac{ds}{dt} = -k \frac{\partial u}{\partial x}\big|_{x=s(t)}
```

# Arguments
- `α`: Thermal diffusivity
- `ρ`: Density
- `L`: Latent heat of fusion
- `k`: Thermal conductivity
- `u_0`: Boundary temperature
- `u_m`: Melting/fusion temperature
   """
   ```

## Tiered Documentation

Implement tiered documentation that matches the knowledge extraction tiers:

### L1: Core Documentation
```julia
"""
    physics_informed_optical_flow(frames, Δt)

Compute optical flow with physics constraints for fluid motion estimation.
"""
```

### L2: Expanded Documentation
```julia
"""
    physics_informed_optical_flow(frames, Δt; α=0.1, β=0.05)

Compute optical flow with physics-based constraints for fluid motion estimation.

# Mathematical Formulation

Minimizes the functional:

```math
E(u,v) = \iint (I_x u + I_y v + I_t)^2 + \alpha (\nabla \cdot \vec{u})^2 + \beta |\nabla \vec{u}|^2 \, dx dy
```

where the second term enforces the incompressibility constraint for fluid flow.
"""
```

### L3: Comprehensive Documentation
Create separate documentation pages for detailed mathematical derivations and complete algorithm explanations that go beyond what reasonably fits in docstrings.

## Example Documentation Generator

```julia
# docs/make.jl
using Documenter, DocStringExtensions
using HPLegendre

makeindex = true

mathematics_pages = [
    "Mathematical Foundation" => [
        "Legendre Polynomials" => "math/legendre_polynomials.md",
        "Coefficient Decay Rate" => "math/coefficient_decay_rate.md",
        "Error Analysis" => "math/error_analysis.md",
    ],
    "Algorithms" => [
        "hp-Legendre Method" => "algorithms/hp_legendre.md",
        "Adaptive Refinement" => "algorithms/adaptive_refinement.md",
    ],
    "Cross-Domain Applications" => [
        "Fluid Dynamics" => "applications/fluid_dynamics.md",
        "Computer Vision Integration" => "applications/computer_vision.md", 
    ]
]

mathematics_sections = [
    "Basic Concepts" => "sections/basic_concepts.md",
    "Detailed Derivations" => "sections/derivations.md",
    "Rigorous Proofs" => "sections/proofs.md",
]

mathematics_theory = "math/theory.md"

mathematics_format = Documenter.HTML(
    mathml = true,
    prettyurls = get(ENV, "CI", nothing) == "true",
    canonical = "https://username.github.io/MyPackage.jl/stable/",
    assets = ["assets/custom.css"],
)

makedocs(
    modules = [HPLegendre],
    format = mathematics_format,
    sitename = "HPLegendre.jl",
    authors = "Your Name",
    pages = [
        "Home" => "index.md",
        "Mathematics" => mathematics_pages,
        "Theoretical Background" => mathematics_theory,
        "Section Derivations" => mathematics_sections,
        "API Reference" => "api.md",
    ],
    strict = true,
)

deploydocs(
    repo = "github.com/username/HPLegendre.jl",
    devbranch = "main",
)
```

## Knowledge Graph Integration

Connect Julia documentation with the knowledge graph by including structured metadata:

```julia
"""
    legendre_coefficient_analysis(f, n)

Analyze the decay properties of Legendre coefficients for function `f`.

# Knowledge Graph References
- Entity: "Legendre Polynomial Coefficient Decay Rate"
- Source: "Liu2018", Section 2.3, p.1477
- Related: "Error Bound Equation", "hp-Refinement Algorithm"
"""
```

This structured metadata facilitates automatic extraction and linking of documentation content to the knowledge graph entities.

## Visualizing Mathematical Results

Integrate visualization directly in documentation examples:

```julia
"""
    demonstrate_coefficient_decay(f, n_max)

Demonstrate coefficient decay rate analysis with visualization.

# Examples
```jldoctest
using Plots

# Define test function
f(x) = sin(π*x) * cos(2π*x)

# Analyze coefficient decay
coeffs, decay_rate = demonstrate_coefficient_decay(f, 20)

# Plot should show exponential decay of coefficients
plot(0:20, abs.(coeffs), yscale=:log10, 
     xlabel="Coefficient Index", ylabel="|a_n|", 
     label="Coefficient Magnitude")

# Overlay theoretical decay rate
plot!(0:20, x -> 10^(-decay_rate*x), 
      linestyle=:dash, label="Theoretical Decay Rate: σ = $(round(decay_rate, digits=3))")
```
"""
```

## Best Practices

1. **Maintain Mathematical Consistency**: Use consistent notation between papers, code, and documentation
2. **Reference Equation Numbers**: Cite specific equation numbers from papers in docstrings
3. **Include Edge Cases**: Document special cases and limitations clearly
4. **Cross-Domain References**: Link to related concepts in other domains
5. **Testing Mathematical Properties**: Include doctests that verify mathematical properties

## Example Implementation

```julia
module HPLegendre

using DocStringExtensions

export coefficient_decay_rate, legendre_approximation

"""
    coefficient_decay_rate(coeffs, order=1)

Calculate the decay rate parameter σ of Legendre polynomial coefficients.

# Mathematical Formulation

The coefficient decay rate is defined by the relation:

```math
|a_i| \approx c \cdot 10^{-\sigma i}
```

where:
- ``a_i`` are the Legendre coefficients 
- ``c`` is a constant
- ``\sigma`` is the decay rate parameter

# Algorithm Description

This function implements a linear regression in log scale to determine σ from
the slope of the line fitting log(|a_i|) vs i for coefficients of sufficient
magnitude. This follows the approach in Liu et al. (2018), Section 2.3.

# Error Analysis

The error in σ estimation depends on the number of coefficients and their
magnitude. For well-behaved functions, the error is typically O(1/N) where
N is the number of coefficients used in the regression.

# Arguments
$(TYPEDARGS)

# Returns
$(TYPEDRETURNS)

# Examples
```julia
coeffs = [1.0, 0.1, 0.01, 0.001]
decay_rate = coefficient_decay_rate(coeffs)
```

# References
Liu et al. (2018), "hp-Legendre Method with Adaptive Refinement", Section 2.3, p.1477.

# Knowledge Graph References
- Entity: "Legendre Polynomial Coefficient Decay Rate"
- Source: "Liu2018", Section 2.3, p.1477
- Related: "Error Bound Equation", "hp-Refinement Algorithm"
"""
function coefficient_decay_rate(coeffs, order=1)
    # Implementation
    n = length(coeffs)
    
    # Take absolute values and filter out zeros
    abs_coeffs = abs.(coeffs)
    idx = findall(x -> x > eps(), abs_coeffs)
    
    if length(idx) < 3
        error("Not enough non-zero coefficients to estimate decay rate")
    end
    
    # Convert to log10 scale
    log_coeffs = log10.(abs_coeffs[idx])
    indices = idx .- 1  # 0-based indexing for polynomial degree
    
    # Linear regression to find slope (decay rate)
    X = [ones(length(indices)) indices]
    b = X \ log_coeffs
    
    # Decay rate is the negative of the slope
    decay_rate = -b[2]
    
    return decay_rate
end

end # module
```
