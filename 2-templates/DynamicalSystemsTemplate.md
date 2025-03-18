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

## Knowledge Graph Representation

Create knowledge graph entities and relationships using Cypher:

```cypher
// Create dynamical system entity
CREATE (system:DynamicalSystem:Entity {
  name: "Lorenz System",
  system_type: "continuous",
  dimension: 3,
  state_variables: ["x", "y", "z"],
  description: "Classic chaotic system exhibiting butterfly-like strange attractor"
})

// Create evolution equations
CREATE (evolution:EvolutionEquations:Entity {
  name: "Lorenz Equations",
  equations: [
    "dx/dt = σ(y-x)",
    "dy/dt = x(ρ-z)-y",
    "dz/dt = xy-βz"
  ],
  parameters: ["σ", "ρ", "β"]
})

// Create parameter regimes
CREATE (chaotic:ParameterRegime:Entity {
  name: "Chaotic Regime",
  parameter_values: {
    "σ": 10.0,
    "ρ": 28.0,
    "β": 8.0/3.0
  },
  behavior: "strange attractor"
})

CREATE (stable:ParameterRegime:Entity {
  name: "Stable Regime",
  parameter_values: {
    "σ": 10.0,
    "ρ": 20.0,
    "β": 8.0/3.0
  },
  behavior: "stable fixed points"
})

// Create invariant structures
CREATE (fixedPoint1:InvariantStructure:Entity {
  name: "Origin Fixed Point",
  type: "fixed_point",
  location: [0, 0, 0],
  stability: "saddle"
})

CREATE (fixedPoint2:InvariantStructure:Entity {
  name: "Non-zero Fixed Points",
  type: "fixed_point",
  location_formula: ["±√(β(ρ-1))", "±√(β(ρ-1))", "ρ-1"],
  stability: "conditionally stable"
})

CREATE (attractor:InvariantStructure:Entity {
  name: "Lorenz Strange Attractor",
  type: "strange_attractor",
  fractal_dimension: "~2.06",
  lyapunov_exponents: [0.91, 0, -14.57]
})

// Create relationships
CREATE (system)-[:GOVERNED_BY]->(evolution)
CREATE (system)-[:HAS_REGIME]->(chaotic)
CREATE (system)-[:HAS_REGIME]->(stable)
CREATE (system)-[:HAS_STRUCTURE]->(fixedPoint1)
CREATE (system)-[:HAS_STRUCTURE]->(fixedPoint2)
CREATE (system)-[:HAS_STRUCTURE]->(attractor)
CREATE (chaotic)-[:EXHIBITS]->(attractor)