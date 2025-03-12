# Complex Physical System: Lorenz System Example

## Knowledge Extraction: Lorenz System Implementation and Analysis

This example demonstrates the extraction process for a complex dynamical system - the Lorenz system - including its mathematical formulation, phase space analysis, parameter sensitivity, and implementation.

### 1. Mathematical Foundation

#### Governing Equations
The Lorenz system is a set of ordinary differential equations (ODEs) that describe atmospheric convection:

$$\begin{align}
\frac{dx}{dt} &= \sigma(y - x) \\
\frac{dy}{dt} &= x(\rho - z) - y \\
\frac{dz}{dt} &= xy - \beta z
\end{align}$$

where $x$, $y$, and $z$ are state variables representing:
- $x$ is proportional to the convective flow rate
- $y$ is proportional to the temperature difference between ascending and descending currents
- $z$ is proportional to the distortion of vertical temperature profile from linearity

and $\sigma$, $\rho$, and $\beta$ are parameters where:
- $\sigma$ is the Prandtl number
- $\rho$ is the normalized Rayleigh number
- $\beta$ is related to the aspect ratio of convection cells

#### Critical Points
The system has critical points (equilibria) at:
- $(0, 0, 0)$ for all parameter values
- $(\pm\sqrt{\beta(\rho-1)}, \pm\sqrt{\beta(\rho-1)}, \rho-1)$ when $\rho > 1$

#### Bifurcation Properties
- For $\rho < 1$: The origin is a globally stable fixed point
- For $1 < \rho < \rho_H$ (where $\rho_H \approx 24.74$): Two stable fixed points exist
- For $\rho > \rho_H$: The system exhibits chaotic behavior with a strange attractor

### 2. Entity Representation

```json
{
  "dynamical_system": {
    "name": "Lorenz System",
    "type": "nonlinear_continuous_autonomous",
    "dimension": 3,
    "state_variables": ["x", "y", "z"],
    "parameters": [
      {"name": "sigma", "symbol": "σ", "typical_value": 10, "physical_meaning": "Prandtl number"},
      {"name": "rho", "symbol": "ρ", "typical_value": 28, "physical_meaning": "Rayleigh number"},
      {"name": "beta", "symbol": "β", "typical_value": 8/3, "physical_meaning": "related to aspect ratio"}
    ],
    "equations": [
      {"id": "eq1", "variable": "x", "latex": "\\frac{dx}{dt} = \\sigma(y - x)"},
      {"id": "eq2", "variable": "y", "latex": "\\frac{dy}{dt} = x(\\rho - z) - y"},
      {"id": "eq3", "variable": "z", "latex": "\\frac{dz}{dt} = xy - \\beta z"}
    ],
    "critical_points": [
      {"id": "cp1", "point": [0, 0, 0], "stability": "stable if ρ < 1, unstable if ρ > 1"},
      {"id": "cp2", "point": ["±√(β(ρ-1))", "±√(β(ρ-1))", "ρ-1"], "existence": "ρ > 1"}
    ]
  }
}
```

### 3. Implementation Code

```julia
function lorenz_system!(du, u, p, t)
    # Extract parameters
    σ, ρ, β = p

    # Compute derivatives according to the Lorenz system
    du[1] = σ * (u[2] - u[1])
    du[2] = u[1] * (ρ - u[3]) - u[2]
    du[3] = u[1] * u[2] - β * u[3]

    return nothing
end

function simulate_lorenz(initial_state, tspan, parameters; dt=0.01)
    # Create the ODE problem
    prob = ODEProblem(lorenz_system!, initial_state, tspan, parameters)

    # Solve using appropriate algorithm (e.g., Runge-Kutta)
    sol = solve(prob, Tsit5(), dt=dt)

    return sol
end

function analyze_lorenz_system(parameters; initial_state=[1.0, 1.0, 1.0], tspan=(0.0, 100.0))
    # Simulate system
    sol = simulate_lorenz(initial_state, tspan, parameters)

    # Extract results
    t = sol.t
    states = sol.u

    # Compute Lyapunov exponents
    lyapunov_exponents = compute_lyapunov_exponents(lorenz_system!, parameters)

    # Find and analyze critical points
    critical_points = find_critical_points(parameters)
    stability = analyze_stability(critical_points, parameters)

    # Check for chaos (positive maximal Lyapunov exponent)
    is_chaotic = lyapunov_exponents[1] > 0

    return Dict(
        "solution" => sol,
        "lyapunov_exponents" => lyapunov_exponents,
        "critical_points" => critical_points,
        "stability" => stability,
        "is_chaotic" => is_chaotic
    )
end
```

### 4. Phase Space Analysis

The Lorenz system exhibits remarkable dynamics:

#### Lyapunov Exponents
For the classical parameter values ($\sigma=10$, $\rho=28$, $\beta=8/3$), the Lyapunov exponents are:
- $\lambda_1 \approx 0.91$ (positive, indicating chaos)
- $\lambda_2 \approx 0.00$ (zero, associated with the flow direction)
- $\lambda_3 \approx -14.57$ (negative, indicating strong contraction)

The sum of these exponents is negative ($\lambda_1 + \lambda_2 + \lambda_3 < 0$), confirming that the Lorenz system is dissipative, with phase space volumes contracting over time at rate $e^{-14.57t}$.

#### Fractal Dimension
The Kaplan-Yorke (or Lyapunov) dimension of the strange attractor is:

$$D_L = 2 + \frac{\lambda_1 + \lambda_2}{|\lambda_3|} \approx 2.06$$

This non-integer dimension confirms the fractal nature of the attractor.

### 5. Integration with KitchenSink

```julia
function register_lorenz_system()
    # Register the Lorenz system with KitchenSink
    KitchenSink.register_system(
        "LorenzSystem",
        lorenz_system!,
        "Classical Lorenz system with three parameters (σ, ρ, β)"
    )

    # Register analysis functions
    KitchenSink.register_utility(
        "AnalyzeLorenzSystem",
        analyze_lorenz_system,
        "Comprehensive analysis of Lorenz system dynamics"
    )

    # Register specialized plotting functions
    KitchenSink.register_visualization(
        "PlotLorenzAttractor",
        plot_lorenz_attractor,
        "3D visualization of the Lorenz attractor"
    )
end
```

### 6. Knowledge Graph Links

- Links to "Nonlinear Dynamics"
- Links to "Chaotic Systems"
- Links to "Strange Attractors"
- Links to "Bifurcation Theory"
- Links to "Lyapunov Stability Analysis"
- Links to "Phase Space Analysis"
