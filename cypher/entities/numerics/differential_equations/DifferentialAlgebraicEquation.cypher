// Differential Algebraic Equation Mathematical Concept
CREATE (dae:MathematicalConcept {
  name: "DifferentialAlgebraicEquation",
  description: "A system of equations combining differential and algebraic constraints on the variables",
  domain: "Differential Equations",
  subdomain: "Differential Algebraic Equations",
  fundamentalPrinciples: [
    "Combines differential equations with algebraic constraints",
    "Characterized by differentiation index",
    "Represents constrained dynamical systems",
    "May require special numerical treatment"
  ],
  mathematicalProperties: [
    "Classification by differentiation index",
    "Solution existence dependent on constraint consistency",
    "Potential hidden constraints in higher-index systems",
    "Index reduction approaches for numerical solution"
  ],
  keyEquations: [
    "General form: F(t, y, y') = 0",
    "Semi-explicit form: y' = f(t, y, z), 0 = g(t, y, z)",
    "Index-1 DAE: y' = f(t, y, z), 0 = g(t, y, z) with ∂g/∂z nonsingular",
    "Hessenberg form of index-2: y₁' = f₁(t, y₁, y₂), y₂' = f₂(t, y₁, y₂, y₃), 0 = g(t, y₁)"
  ],
  theoreticalFoundation: "Constrained dynamical systems theory and differential geometry",
  paperSources: ["Hairer1996", "Brenan1995"],
  taxonomyLevel: "Core",
  tier_L1: "Differential algebraic equations combine differential equations with algebraic constraints, representing constrained dynamical systems that often arise in mechanical systems, electrical circuits, and chemical processes.",
  tier_L2_file: "numerics/differential_equations/differential_algebraic_equation_L2.md"
})
