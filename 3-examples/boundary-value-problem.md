# Boundary Value Problem with Multiple Methods Example

## Knowledge Extraction: Stefan Problem with Moving Boundary

This example demonstrates the knowledge extraction process for a Stefan problem (moving boundary PDE) from the movingBoundaryPDECartesian.md file, including analytical and numerical solutions with error analysis.

### 1. Mathematical Foundation

#### Problem Definition
The Stefan problem models a phase change process with a moving boundary:

$$\frac{\partial u}{\partial t} = \alpha \frac{\partial^2 u}{\partial x^2}, \quad 0 < x < s(t), \quad t > 0$$

with boundary and initial conditions:
- $u(0,t) = u_0$
- $u(s(t),t) = u_m$
- $s(0) = 0$

and the Stefan condition at the moving boundary:
- $\rho L \frac{ds}{dt} = -k \frac{\partial u}{\partial x}|_{x=s(t)}$

where:
- $u(x,t)$ is the temperature
- $s(t)$ is the position of the moving boundary
- $\alpha$ is the thermal diffusivity
- $\rho$ is the density
- $L$ is the latent heat of fusion
- $k$ is the thermal conductivity
- $u_0$ is the boundary temperature
- $u_m$ is the melting/fusion temperature

#### Analytical Solution
For certain cases, an analytical solution exists in the form:

$$s(t) = 2\lambda\sqrt{\alpha t}$$

where $\lambda$ is determined by solving the transcendental equation:

$$\frac{u_0 - u_m}{u_m} = \frac{e^{-\lambda^2}}{\lambda\sqrt{\pi} \text{erf}(\lambda)} - 1$$

And the temperature distribution is:

$$u(x,t) = u_0 + (u_m - u_0)\frac{\text{erf}(x/2\sqrt{\alpha t})}{\text{erf}(\lambda)}$$

### 2. Entity Representation

```json
{
  "boundary_value_problem": {
    "name": "Stefan Problem",
    "type": "moving_boundary_pde",
    "domain": "heat_transfer",
    "governing_equation": {
      "id": "pde1",
      "type": "parabolic",
      "latex": "\\frac{\\partial u}{\\partial t} = \\alpha \\frac{\\partial^2 u}{\\partial x^2}, \\quad 0 < x < s(t), \\quad t > 0"
    },
    "boundary_conditions": [
      {"id": "bc1", "location": "left", "latex": "u(0,t) = u_0"},
      {"id": "bc2", "location": "right", "latex": "u(s(t),t) = u_m"}
    ],
    "initial_condition": {"id": "ic1", "latex": "s(0) = 0"},
    "moving_boundary_condition": {
      "id": "stefan",
      "latex": "\\rho L \\frac{ds}{dt} = -k \\frac{\\partial u}{\\partial x}\\big|_{x=s(t)}"
    },
    "analytical_solution": [
      {"id": "sol1", "variable": "s", "latex": "s(t) = 2\\lambda\\sqrt{\\alpha t}"},
      {"id": "sol2", "variable": "u", "latex": "u(x,t) = u_0 + (u_m - u_0)\\frac{\\text{erf}(x/2\\sqrt{\\alpha t})}{\\text{erf}(\\lambda)}"}
    ]
  }
}
```

### 3. Numerical Methods

#### Method 1: Fixed Grid with Enthalpy Formulation

This approach reformulates the problem using an enthalpy function $H(u)$ to avoid explicitly tracking the moving boundary:

$$\frac{\partial H}{\partial t} = \alpha \frac{\partial^2 u}{\partial x^2}$$

where $H(u)$ is defined as:
$$H(u) = \begin{cases}
c_s u, & u < u_m \\
c_s u_m + \rho L (u - u_m)/u_m, & u_m \leq u \leq u_m \\
c_s u_m + \rho L + c_l (u - u_m), & u > u_m
\end{cases}$$

```julia
function solve_stefan_enthalpy(x_grid, t_final, dt, params)
    # Extract parameters
    α, ρ, L, k, u_0, u_m = params.α, params.ρ, params.L, params.k, params.u_0, params.u_m
    c_s, c_l = params.c_s, params.c_l

    # Initialize solution arrays
    nx = length(x_grid)
    nt = round(Int, t_final/dt)
    u = zeros(nx, nt+1)
    H = zeros(nx, nt+1)
    s_position = zeros(nt+1)

    # Initial conditions
    u[:,1] .= u_m
    u[1,1] = u_0
    H[:,1] = enthalpy.(u[:,1], u_m, c_s, c_l, ρ, L)

    # Time stepping
    for n in 1:nt
        # Solve for enthalpy using finite differences
        for i in 2:nx-1
            H[i,n+1] = H[i,n] + α*dt/(x_grid[2]-x_grid[1])^2 *
                       (u[i+1,n] - 2*u[i,n] + u[i-1,n])
        end

        # Boundary conditions
        H[1,n+1] = enthalpy(u_0, u_m, c_s, c_l, ρ, L)
        H[nx,n+1] = H[nx-1,n+1]

        # Recover temperature from enthalpy
        for i in 1:nx
            u[i,n+1] = temperature_from_enthalpy(H[i,n+1], u_m, c_s, c_l, ρ, L)
        end

        # Locate phase change interface (where u ≈ u_m)
        for i in 1:nx-1
            if u[i,n+1] < u_m && u[i+1,n+1] >= u_m
                s_position[n+1] = interpolate_position(x_grid[i], x_grid[i+1],
                                                      u[i,n+1], u[i+1,n+1], u_m)
                break
            end
        end
    end

    return u, H, s_position
end

function enthalpy(u, u_m, c_s, c_l, ρ, L)
    if u < u_m
        return c_s * u
    elseif u > u_m
        return c_s * u_m + ρ * L + c_l * (u - u_m)
    else
        return c_s * u_m + ρ * L * (u - u_m) / u_m
    end
end
```

#### Method 2: Moving Mesh Method

This approach explicitly tracks the moving boundary by using a coordinate transformation:

$$\xi = \frac{x}{s(t)}$$

transforming the original PDE into:

$$\frac{\partial u}{\partial t} - \frac{\xi}{s}\frac{ds}{dt}\frac{\partial u}{\partial \xi} = \frac{\alpha}{s^2}\frac{\partial^2 u}{\partial \xi^2}$$

### 4. Error Analysis

The numerical solution error for the Stefan problem depends on:

1. **Spatial discretization error**: $O(\Delta x^2)$ for second-order finite differences
2. **Temporal discretization error**: $O(\Delta t)$ for explicit Euler, $O(\Delta t^2)$ for Crank-Nicolson
3. **Interface location error**: Depends on the interface tracking method

For the enthalpy method, an additional source of error comes from the regularization of the enthalpy function around $u_m$.

For the analytical solution with typical values ($u_0 = 1$, $u_m = 0$, $\alpha = 1$), the interface position $s(t)$ grows as approximately $1.33\sqrt{t}$.

### 5. Integration with KitchenSink

```julia
function register_stefan_problem()
    # Register with KitchenSink
    KitchenSink.register_problem(
        "StefanProblem",
        generate_stefan_problem,
        "One-dimensional Stefan problem with phase change and moving boundary"
    )

    # Register solution methods
    KitchenSink.register_solver(
        "StefanEnthalpyMethod",
        solve_stefan_enthalpy,
        "Enthalpy formulation for solving the Stefan problem"
    )

    KitchenSink.register_solver(
        "StefanMovingMeshMethod",
        solve_stefan_moving_mesh,
        "Moving mesh method for solving the Stefan problem"
    )

    # Register analytical solution
    KitchenSink.register_utility(
        "StefanAnalyticalSolution",
        stefan_analytical_solution,
        "Analytical solution for the one-dimensional Stefan problem"
    )
end

# Analytical solution calculator
function stefan_analytical_solution(x, t, params)
    # Extract parameters
    α, u_0, u_m = params.α, params.u_0, params.u_m

    # Compute λ by solving the transcendental equation
    λ = find_lambda(u_0, u_m)

    # Compute the temperature distribution
    u = u_0 + (u_m - u_0) * erf(x / (2 * sqrt(α * t))) / erf(λ)

    # Compute interface position
    s = 2 * λ * sqrt(α * t)

    return Dict("temperature" => u, "interface_position" => s)
end
```

### 6. Knowledge Graph Links

- Links to "Phase Change Problems"
- Links to "Moving Boundary Problems"
- Links to "Enthalpy Methods"
- Links to "Coordinate Transformation Methods"
- Links to "Heat Transfer Equations"
- Links to "Error Analysis for Moving Boundary Problems"
