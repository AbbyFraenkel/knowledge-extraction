# Legendre Polynomial Coefficient Decay Rate

## Comprehensive Theory

### Definition and Foundations

The Legendre polynomial coefficient decay rate is a fundamental concept in approximation theory that characterizes the asymptotic behavior of expansion coefficients when representing a function using Legendre polynomials. For a sufficiently smooth function f(x) defined on the interval [-1,1], the Legendre series expansion takes the form:

```math
f(x) = \sum_{i=0}^{\infty} a_i P_i(x)
```

where P_i(x) denotes the i-th Legendre polynomial and a_i represents the corresponding coefficient. These coefficients are determined by the orthogonality properties of Legendre polynomials:

```math
a_i = \frac{2i+1}{2} \int_{-1}^{1} f(x) P_i(x) dx
```

The decay rate parameter σ characterizes how quickly these coefficients decrease as the polynomial degree increases. For analytic functions, this decay is typically exponential:

```math
|a_i| \approx c \cdot 10^{-\sigma i}
```

or alternatively expressed using natural logarithms:

```math
|a_i| \approx c \cdot e^{-\sigma' i}
```

where σ' = σ·ln(10).

### Theoretical Foundation

The mathematical basis for coefficient decay rates stems from complex analysis. For functions that are analytic not just on the interval [-1,1] but in a larger region of the complex plane, the decay rate corresponds to the size of the region of analyticity. Specifically, if f(z) is analytic inside an ellipse with foci at ±1, the Legendre coefficients decay exponentially at a rate determined by the ellipse's dimensions.

For a function analytic inside the Bernstein ellipse E_ρ (an ellipse with foci at ±1 and semi-major and semi-minor axes summing to ρ), the coefficients decay as:

```math
|a_i| \leq C\rho^{-i}
```

for some constant C. The decay rate σ is related to ρ through:

```math
\sigma = \log_{10}(\rho)
```

### Connection to Function Regularity

The coefficient decay rate provides precise information about function smoothness:

1. **C∞ Functions**: Functions with continuous derivatives of all orders but not analytic may have coefficients that decay faster than any polynomial but slower than exponential
2. **Analytic Functions**: Exhibit exponential decay of coefficients, with σ > 0
3. **Entire Functions**: Functions analytic in the entire complex plane may show even faster decay rates, potentially super-exponential
4. **Functions with Singularities**: The closer a singularity is to the interval [-1,1], the slower the decay rate

### Relation to Error Bounds

The decay rate is directly connected to the approximation error when truncating the Legendre series. For a function with decay rate σ, the error when approximating with an N-term Legendre expansion is bounded by:

```math
\|f - P_N f\|_{\infty} \leq \frac{c \cdot 10^{-\sigma(N+1)}}{1 - 10^{-\sigma}}
```

This error bound provides the theoretical foundation for adaptive spectral methods, as it allows a priori estimation of the approximation error.

## Advanced Properties

### Asymptotic Error Analysis

For functions with coefficient decay rate σ, the approximation error when using an N-term Legendre expansion exhibits the following asymptotic behavior:

```math
e_N \sim c \cdot 10^{-\sigma N} \quad \text{as} \quad N \rightarrow \infty
```

This asymptotic relationship can be used to develop error estimators for spectral methods. By computing successive approximations and analyzing their differences, the decay rate can be estimated "on the fly" during computation.

### Effect of Singularities

Singularities in the function or its derivatives significantly impact the coefficient decay rate. For a function with a singularity of type (z-z₀)^α at complex point z₀, the decay rate is influenced by the distance from z₀ to the interval [-1,1] and the nature of the singularity (characterized by α).

For algebraic singularities on the interval [-1,1], the coefficients decay only algebraically:

```math
|a_i| \sim c \cdot i^{-\alpha-1}
```

where α > -1 is related to the type of singularity.

### Multi-Dimensional Extensions

In multiple dimensions using tensor-product bases, the decay rate concept extends to:

```math
|a_{i_1,i_2,...,i_d}| \approx c \cdot 10^{-\sigma_1 i_1 - \sigma_2 i_2 - ... - \sigma_d i_d}
```

where each dimension may have a different decay rate based on the function's smoothness properties in that dimension.

## Computational Methods

### Estimation Techniques

#### Linear Regression Method

The most straightforward approach to estimate the decay rate is through linear regression on the logarithm of the absolute coefficient values:

```julia
function estimate_decay_rate_linear_regression(coeffs::Vector{Float64})
    # Ignore first few coefficients which may not follow the asymptotic pattern
    start_idx = max(2, ceil(Int, 0.1 * length(coeffs)))
    n = length(coeffs)
    indices = start_idx:n

    # Take absolute values and avoid log(0)
    log_coeffs = log10.(max.(abs.(coeffs[indices]), 1e-16))

    # Linear regression to find slope (decay rate)
    x = collect(indices)
    A = [ones(length(indices)) x]
    params = A \ log_coeffs

    # The decay rate is the negative of the slope
    decay_rate = -params[2]
    confidence = cor(x, log_coeffs)^2  # R² value

    return decay_rate, confidence
end
```

#### Successive Approximation Method

An alternative approach compares successive partial sums to estimate both the decay rate and the approximation error:

```julia
function estimate_decay_successive_approximations(f::Function, N::Int)
    # Compute Legendre approximations of increasing order
    errors = zeros(N-1)
    for n in 2:N
        p_n = legendre_approximation(f, n)
        p_n_minus_1 = legendre_approximation(f, n-1)
        errors[n-1] = norm(p_n - p_n_minus_1, Inf)
    end

    # Estimate decay rate from successive errors
    log_errors = log10.(max.(errors, 1e-16))
    rates = -diff(log_errors)

    # Average the rates, possibly with more weight to later values
    weights = LinRange(0.5, 1.0, length(rates))
    avg_rate = sum(rates .* weights) / sum(weights)

    return avg_rate
end
```

### Adaptive Algorithms

The decay rate can be used to implement adaptive algorithms that automatically select the appropriate polynomial degree:

```julia
function adaptive_legendre_approximation(f::Function, tol::Float64)
    n = 4  # Start with a low degree approximation
    p_n = legendre_approximation(f, n)

    while true
        n_new = n + 4  # Increment by a few degrees
        p_n_new = legendre_approximation(f, n_new)

        # Estimate decay rate from difference
        diff_norm = norm(p_n_new - p_n, Inf)
        if diff_norm < tol
            return p_n_new, n_new
        end

        # Estimate required degree based on decay rate and tolerance
        coeffs = legendre_coefficients(f, n_new)
        decay_rate, _ = estimate_decay_rate_linear_regression(coeffs)

        # Predict required degree based on decay rate and tolerance
        if decay_rate > 0
            required_degree = ceil(log10(tol) / -decay_rate)
            n = min(2*n, max(n_new, required_degree))
        else
            n = 2*n  # Fallback if decay rate estimation fails
        end

        p_n = legendre_approximation(f, n)

        if n > 1000  # Safety check to prevent infinite loop
            @warn "Maximum polynomial degree exceeded"
            return p_n, n
        end
    end
end
```

## Applications in Numerical Methods

### hp-Adaptive Finite Element Methods

In hp-adaptive FEM, the decay rate guides the decision between h-refinement (subdividing elements) and p-refinement (increasing polynomial degree):

- High decay rate (σ > 1) → Smooth solution → Prefer p-refinement
- Low decay rate (σ < 0.5) → Non-smooth solution → Prefer h-refinement
- Moderate decay rate → Combined hp-refinement

### Spectral Element Methods

In spectral element methods, the decay rate helps determine the optimal polynomial degree for each element, allowing for efficient element-by-element adaptivity.

### Reduced Order Modeling

The decay rate concept extends to model reduction techniques, where it indicates how many modes are needed to accurately represent the system's behavior.

## Error Analysis and Convergence Theory

### A Priori Error Estimates

For a function with coefficient decay rate σ, the error of an N-term approximation satisfies:

```math
\|f - P_N f\|_{\infty} \leq \frac{c \cdot 10^{-\sigma (N+1)}}{1 - 10^{-\sigma}}
```

This provides a theoretical upper bound on the approximation error.

### A Posteriori Error Estimates

Using computed coefficients, an a posteriori error estimate can be derived:

```math
\|f - P_N f\|_{\infty} \approx \frac{|a_{N+1}|}{1 - 10^{-\hat{\sigma}}}
```

where $\hat{\sigma}$ is the estimated decay rate.

### Convergence Rate in Practice

The theoretical exponential convergence is achievable in practice when:
1. The function is sufficiently smooth
2. Accurate quadrature is used to compute the coefficients
3. Numerical precision is sufficient to resolve small coefficients

## Implementation in Different Programming Languages

### Julia Implementation

```julia
module LegendreAnalysis
    using LinearAlgebra
    using SpecialPolynomials
    using QuadGK

    """
        legendre_coefficients(f, N)

    Compute the first N+1 Legendre coefficients of function f on [-1,1]
    """
    function legendre_coefficients(f::Function, N::Int)
        coeffs = zeros(N+1)
        for n in 0:N
            P_n = x -> Legendre(n)(x)
            integrand = x -> f(x) * P_n(x)
            coeff, _ = quadgk(integrand, -1, 1)
            coeffs[n+1] = (2n+1)/2 * coeff
        end
        return coeffs
    end

    """
        estimate_decay_rate(coeffs)

    Estimate the decay rate of Legendre coefficients using linear regression
    """
    function estimate_decay_rate(coeffs::Vector{Float64})
        # Skip first coefficient (often behaves differently)
        start_idx = 2
        n = length(coeffs)
        indices = start_idx:n

        # Take absolute values and avoid log(0)
        log_coeffs = log10.(max.(abs.(coeffs[indices]), 1e-16))

        # Linear regression to find slope (decay rate)
        x = collect(indices)
        A = [ones(length(indices)) x]
        params = A \ log_coeffs

        # The decay rate is the negative of the slope
        decay_rate = -params[2]
        confidence = cor(x, log_coeffs)^2  # R² value

        return decay_rate, confidence
    end

    """
        predict_error(coeffs, decay_rate)

    Predict the approximation error based on coefficient decay rate
    """
    function predict_error(coeffs::Vector{Float64}, decay_rate::Float64, N_additional::Int=10)
        N = length(coeffs)
        c = abs(coeffs[end]) * 10^(decay_rate * (N-1))  # Estimate constant c

        # Predict error for truncation after N terms
        error_estimate = c * 10^(-decay_rate * N) / (1 - 10^(-decay_rate))

        # Predict required terms for given tolerance
        required_terms(tol) = ceil(log10(tol * (1 - 10^(-decay_rate)) / c) / -decay_rate)

        return error_estimate, required_terms
    end
end
```

### Python Implementation

```python
import numpy as np
from scipy.special import legendre
from scipy.integrate import quad
from scipy.stats import linregress

def legendre_coefficients(f, N):
    """Compute Legendre coefficients for function f up to degree N"""
    coeffs = np.zeros(N+1)
    for n in range(N+1):
        P_n = legendre(n)
        integrand = lambda x: f(x) * P_n(x)
        coeff, _ = quad(integrand, -1, 1)
        coeffs[n] = (2*n+1)/2 * coeff
    return coeffs

def estimate_decay_rate(coeffs):
    """Estimate coefficient decay rate using linear regression"""
    # Skip first coefficient
    start_idx = 1
    n = len(coeffs)
    indices = np.arange(start_idx, n)

    # Take absolute values and avoid log(0)
    log_coeffs = np.log10(np.maximum(np.abs(coeffs[start_idx:]), 1e-16))

    # Linear regression
    slope, intercept, r_value, _, _ = linregress(indices, log_coeffs)

    # Decay rate is negative of slope
    decay_rate = -slope
    confidence = r_value**2

    return decay_rate, confidence
```

## Advanced Topics

### Decay Rates for Different Polynomial Bases

The concept of coefficient decay extends to other polynomial bases, with some important distinctions:

- **Chebyshev Polynomials**: Similar decay properties to Legendre, often preferred for numerical computation
- **Fourier Series**: For periodic functions, related decay rates but with different implications
- **Hermite Polynomials**: Used for unbounded domains, with decay rates related to function growth at infinity
- **Jacobi Polynomials**: Generalization that includes Legendre (α=β=0) and Chebyshev (α=β=-1/2)

### Multidimensional and Tensor Product Spaces

In higher dimensions, tensor product bases lead to multidimensional decay rates, where anisotropic behavior may be observed depending on directional smoothness properties.

### Connection to Sobolev Spaces

The decay rate of Legendre coefficients is closely connected to the regularity of functions in Sobolev spaces, with faster decay corresponding to higher regularity.

## References

1. Trefethen, L.N. (2013). Approximation Theory and Approximation Practice. SIAM.
2. Boyd, J.P. (2001). Chebyshev and Fourier Spectral Methods. Dover Publications, Inc.
3. Canuto, C., Hussaini, M.Y., Quarteroni, A., Zang, T.A. (2006). Spectral Methods: Fundamentals in Single Domains. Springer.
4. Hesthaven, J.S., Gottlieb, S., Gottlieb, D. (2007). Spectral Methods for Time-Dependent Problems. Cambridge University Press.
5. Shen, J., Tang, T., Wang, L.L. (2011). Spectral Methods: Algorithms, Analysis and Applications. Springer.
6. Demkowicz, L. (2006). Computing with hp-Adaptive Finite Elements: Volume 1: One and Two Dimensional Elliptic and Maxwell Problems. Chapman and Hall/CRC.
7. Schwab, C. (1998). p- and hp- Finite Element Methods: Theory and Applications in Solid and Fluid Mechanics. Oxford University Press.
8. Babuška, I., Suri, M. (1994). The p and h-p versions of the finite element method, basic principles and properties. SIAM Review, 36(4), 578-632.
