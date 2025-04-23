// Finite Difference Method Mathematical Concept
CREATE (fdm:MathematicalConcept {
  name: "FiniteDifferenceMethod",
  description: "A numerical method for approximating differential equations by replacing derivatives with difference quotients",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  fundamentalPrinciples: [
    "Approximates derivatives using finite differences",
    "Discretizes domain using grid points",
    "Replaces differential equations with algebraic equations",
    "Accuracy depends on grid resolution and scheme order"
  ],
  mathematicalProperties: [
    "Convergence rate dependent on scheme order",
    "Stability requirements for time-dependent problems",
    "Consistency with original differential equation",
    "Error analysis through Taylor series expansion"
  ],
  keyEquations: [
    "Forward difference: f'(x) ≈ [f(x+h) - f(x)]/h",
    "Central difference: f'(x) ≈ [f(x+h) - f(x-h)]/(2h)",
    "Second derivative: f''(x) ≈ [f(x+h) - 2f(x) + f(x-h)]/h²",
    "Truncation error: O(h^p) for p-th order scheme"
  ],
  theoreticalFoundation: "Taylor series expansion and difference approximations",
  paperSources: ["Smith1985", "LeVeque2007"],
  taxonomyLevel: "Core",
  tier_L1: "Finite difference methods approximate derivatives in differential equations by replacing them with difference quotients defined on a discrete grid, resulting in a system of algebraic equations that can be solved numerically.",
  tier_L2_file: "numerics/discretization_methods/finite_difference_method_L2.md"
})
