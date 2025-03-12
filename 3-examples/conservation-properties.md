# Conservation Properties Verification Example

## Knowledge Extraction: Conservation Properties for OCFC with Domain Transformation

This example demonstrates extracting knowledge about conservation properties verification for Orthogonal Collocation on Finite Channels (OCFC) with domain transformation.

### 1. Mathematical Foundation

#### Conservation Law
Consider a conservation law of the form:

$$\frac{\partial u}{\partial t} + \frac{\partial f(u)}{\partial x} = 0$$

With initial condition $u(x, 0) = u_0(x)$ and appropriate boundary conditions.

#### Domain Transformation
For problems with moving boundaries, we apply a domain transformation:

$$\xi = \frac{x - a(t)}{b(t) - a(t)}$$

Which maps the physical domain $[a(t), b(t)]$ to the computational domain $[0, 1]$. This transforms the conservation law to:

$$\frac{\partial u}{\partial t} - \frac{\xi \dot{a} + (1-\xi)\dot{b}}{b-a}\frac{\partial u}{\partial \xi} + \frac{1}{b-a}\frac{\partial f(u)}{\partial \xi} = 0$$

#### Discrete Conservation Property
For a numerical scheme to be conservative, it must satisfy:

$$\frac{d}{dt}\int_{a(t)}^{b(t)} u(x,t) dx = f(u(a(t),t)) - f(u(b(t),t))$$

Which represents the conservation of the quantity $u$ over the domain.

### 2. Implementation Strategy

```json
{
  "verification_method": {
    "name": "Conservation Property Verification for OCFC with Domain Transformation",
    "purpose": "Verify that the OCFC method preserves conservation laws under domain transformation",
    "steps": [
      {
        "step_id": 1,
        "description": "Compute total conserved quantity at each time step",
        "formula": "Q(t) = \\int_{a(t)}^{b(t)} u(x,t) dx"
      },
      {
        "step_id": 2,
        "description": "Compute rate of change of conserved quantity",
        "formula": "\\frac{dQ}{dt} = \\frac{d}{dt}\\int_{a(t)}^{b(t)} u(x,t) dx"
      },
      {
        "step_id": 3,
        "description": "Compute flux at boundaries",
        "formula": "F(t) = f(u(a(t),t)) - f(u(b(t),t))"
      },
      {
        "step_id": 4,
        "description": "Verify conservation property",
        "formula": "\\left| \\frac{dQ}{dt} - F(t) \\right| < \\epsilon"
      }
    ]
  }
}
```

### 3. Implementation Code

```julia
function verify_conservation_property(solution, flux_function, domain_bounds; tolerance=1e-10)
    # Extract solution information
    u = solution.values     # Solution values at collocation points
    times = solution.times  # Time points

    # Initialize arrays to store conserved quantity and its rate of change
    Q = zeros(length(times))
    dQdt = zeros(length(times))
    F = zeros(length(times))

    # Step 1 & 2: Compute conserved quantity and its rate of change
    for (i, t) in enumerate(times)
        a_t, b_t = domain_bounds(t)
        a_dot, b_dot = domain_bounds_derivative(t)

        # Transform integration to computational domain
        Q[i] = quadrature_transform(u, t, a_t, b_t)

        # Compute dQ/dt using the transformed equation
        dQdt[i] = compute_dQdt(u, flux_function, t, a_t, b_t, a_dot, b_dot)

        # Step 3: Compute flux at boundaries
        u_left = evaluate_solution_at_boundary(u, t, "left")
        u_right = evaluate_solution_at_boundary(u, t, "right")
        F[i] = flux_function(u_left) - flux_function(u_right)
    end

    # Step 4: Verify conservation property
    conservation_error = abs.(dQdt - F)
    conserved = all(conservation_error .< tolerance)

    return Dict(
        "conserved" => conserved,
        "error" => conservation_error,
        "Q" => Q,
        "dQdt" => dQdt,
        "F" => F
    )
end

function quadrature_transform(u, t, a, b)
    # Perform numerical integration over transformed domain
    # using appropriate quadrature rule (e.g., Gaussian quadrature)
    nodes, weights = gauss_legendre_quadrature(quadrature_order)

    # Scale nodes from [-1,1] to [0,1]
    xi_nodes = 0.5 .* (nodes .+ 1.0)

    # Map to physical domain
    x_nodes = a .+ (b - a) .* xi_nodes

    # Evaluate solution at quadrature nodes
    u_values = [evaluate_solution(u, t, x) for x in x_nodes]

    # Compute integral
    integral = (b - a) * 0.5 * sum(weights .* u_values)

    return integral
end
```

### 4. Theoretical Analysis

The conservation error in the OCFC method with domain transformation is governed by:

$$\text{Error}_{\text{conservation}} = \mathcal{O}(h^{p+1})$$

Where:
- $h$ is the channel width
- $p$ is the polynomial order used in each channel

For problems with non-smooth solutions, additional techniques such as flux limiting may be required to maintain conservation properties.

### 5. Integration with KitchenSink

```julia
# Registration with KitchenSink
function register_conservation_verification()
    KitchenSink.register_utility(
        "VerifyConservation",
        verify_conservation_property,
        "Verifies conservation properties for OCFC solutions with domain transformation"
    )

    KitchenSink.register_test(
        "ConservationTest",
        conservation_test_suite,
        "Test suite for verifying conservation properties"
    )
end

# Test function that demonstrates conservation verification
function conservation_test_suite()
    # Define test problem (linear advection equation)
    flux_function(u) = u  # f(u) = u for linear advection

    # Define domain bounds as function of time
    domain_bounds(t) = (0.0 + 0.1*sin(t), 1.0 + 0.1*sin(t))

    # Solve using OCFC with domain transformation
    solution = solve_ocfc_transformed(flux_function, domain_bounds)

    # Verify conservation
    result = verify_conservation_property(solution, flux_function, domain_bounds)

    return result["conserved"]
end
```

### 6. Knowledge Graph Links

- Links to "Conservation Laws"
- Links to "Moving Boundary Problems"
- Links to "Numerical Integration Methods"
- Links to "Error Analysis"
- Links to "Domain Transformation Techniques"
