// Ordinary Differential Equation Mathematical Concept
CREATE (ode:MathematicalConcept {
  name: "OrdinaryDifferentialEquation",
  description: "An equation involving derivatives of a function with respect to a single independent variable",
  domain: "Differential Equations",
  subdomain: "Ordinary Differential Equations",
  fundamentalPrinciples: [
    "Involves derivatives with respect to a single variable",
    "Describes rate of change relationships",
    "Characterized by order and degree",
    "May be linear or nonlinear"
  ],
  mathematicalProperties: [
    "Uniqueness of solutions under appropriate conditions",
    "Solution structure depending on order and linearity",
    "Stability properties around equilibrium points",
    "Sensitivity to initial conditions"
  ],
  keyEquations: [
    "First-order ODE: dy/dx = f(x,y)",
    "Second-order ODE: d²y/dx² = f(x,y,dy/dx)",
    "System of ODEs: dx/dt = f(t,x) where x is a vector",
    "Linear ODE: dy/dx + p(x)y = q(x)"
  ],
  theoreticalFoundation: "Calculus and analysis of continuous functions",
  paperSources: ["Coddington1955", "Ince1956"],
  taxonomyLevel: "Core",
  tier_L1: "Ordinary differential equations describe relationships involving derivatives of a function with respect to a single independent variable, representing rate of change relationships in many physical and mathematical systems.",
  tier_L2_file: "numerics/differential_equations/ordinary_differential_equation_L2.md"
})
