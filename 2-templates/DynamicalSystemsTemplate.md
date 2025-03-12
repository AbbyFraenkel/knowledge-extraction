# Dynamical Systems Extraction Template

## Instructions
Use this template for extracting continuous, discrete or hybrid dynamical systems. Pay special attention to invariant structures, bifurcation points, and parameter regimes that lead to qualitatively different behaviors.

## Template
{
  "dynamical_system": {
    "system_type": "continuous|discrete|hybrid",
    "state_space": {
      "dimension": "n",
      "variables": ["x_1", "x_2", "...", "x_n"],
      "domain": "Ω ⊂ ℝⁿ"
    },
    "evolution": {
      "equations": [
        "dx₁/dt = f₁(x₁,...,xₙ,t)",
        "dx₂/dt = f₂(x₁,...,xₙ,t)",
        "..."
      ],
      "parameter_space": ["p₁", "p₂", "...", "pₘ"],
      "parameter_regimes": [
        {"regime": "stable", "conditions": "p₁ < critical_value"},
        {"regime": "chaotic", "conditions": "p₁ > critical_value"}
      ]
    },
    "invariant_structures": [
      {"type": "fixed_point", "location": "x* = ...", "stability": "stable|unstable|saddle"},
      {"type": "limit_cycle", "description": "..."},
      {"type": "strange_attractor", "dimension": "fractal", "lyapunov_exponents": ["+", "-", "-"]}
    ]
  },
  "analysis_methods": [
    {"method": "linear_stability", "applicable_to": "fixed_points"},
    {"method": "bifurcation_analysis", "parameter": "p₁", "bifurcation_points": ["p₁ = value"]}
  ]
}

# Example based on the Lorenz system in the codebase
function lorenz_system_template(u, p, t)
    # Match system parameters to mathematical formulation
    σ, ρ, β = p

    # Match evolution equations exactly
    [
        σ * (u[2] - u[1]),         # dx/dt = σ(y-x)
        u[1] * (ρ - u[3]) - u[2],  # dy/dt = x(ρ-z)-y
        u[1] * u[2] - β * u[3]     # dz/dt = xy-βz
    ]
end

# Extraction should document parameter regimes:
# - Chaotic attractor emerges when ρ > 24.74, σ=10, β=8/3
# - Fixed points at (0,0,0) and (±√(β(ρ-1)), ±√(β(ρ-1)), ρ-1)