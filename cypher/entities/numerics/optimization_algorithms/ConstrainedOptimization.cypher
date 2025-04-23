// Constrained Optimization Mathematical Concept
CREATE (co:MathematicalConcept {
  name: "ConstrainedOptimization",
  description: "The mathematical problem of finding extrema of a function subject to constraints on the variables",
  domain: "Numerical Analysis",
  subdomain: "Optimization Algorithms",
  fundamentalPrinciples: [
    "Optimize objective function subject to constraints",
    "Equality and/or inequality constraints",
    "First-order optimality involves Lagrange multipliers",
    "Feasible region defined by constraints"
  ],
  mathematicalProperties: [
    "KKT conditions for local optimality",
    "Constraint qualification conditions",
    "Duality theory for certain problem classes",
    "Convexity implications for global optimality"
  ],
  keyEquations: [
    "Problem formulation: minimize f(x) subject to g(x) ≤ 0, h(x) = 0",
    "Lagrangian: L(x,λ,μ) = f(x) + λᵀg(x) + μᵀh(x)",
    "KKT conditions: ∇f(x*) + λᵀ∇g(x*) + μᵀ∇h(x*) = 0, λ ≥ 0, λᵀg(x*) = 0",
    "Penalty method: minimize f(x) + ρ·penalty(g(x),h(x))"
  ],
  theoreticalFoundation: "Lagrangian mechanics and convex analysis",
  paperSources: ["Nocedal1999", "Bertsekas1999"],
  taxonomyLevel: "Core",
  tier_L1: "Constrained optimization involves finding extrema of an objective function subject to equality or inequality constraints, requiring specialized algorithms that handle feasibility requirements along with optimality conditions.",
  tier_L2_file: "numerics/optimization_algorithms/constrained_optimization_L2.md"
})
