// Multi-Objective Optimization Mathematical Concept
CREATE (moo:MathematicalConcept {
  name: "MultiObjectiveOptimization",
  description: "Optimization problems involving multiple conflicting objective functions that must be simultaneously optimized, resulting in a set of Pareto-optimal solutions",
  domain: "Numerical Analysis",
  subdomain: "Optimization Algorithms",
  fundamentalPrinciples: [
    "Multiple competing objectives",
    "Pareto optimality concept",
    "No single 'best' solution",
    "Trade-off analysis between objectives"
  ],
  mathematicalProperties: [
    "Pareto front of non-dominated solutions",
    "Dominance relationships between solutions",
    "Scalarization approaches to transform to single-objective",
    "Vector-valued objective functions"
  ],
  keyEquations: [
    "Multi-objective problem: minimize F(x) = [f₁(x), f₂(x), ..., f_m(x)]ᵀ",
    "Pareto dominance: x* dominates x if f_i(x*) ≤ f_i(x) for all i and f_j(x*) < f_j(x) for at least one j",
    "Weighted sum scalarization: f(x) = ∑_i w_i·f_i(x)",
    "Tchebycheff scalarization: f(x) = max_i {w_i|f_i(x) - z_i*|}"
  ],
  theoreticalFoundation: "Vector optimization and decision theory",
  paperSources: ["Ehrgott2005", "Deb2001"],
  taxonomyLevel: "Core",
  tier_L1: "Multi-objective optimization addresses problems with multiple competing objectives, seeking Pareto-optimal solutions where no objective can be improved without degrading another, resulting in a set of trade-off solutions rather than a single optimal point.",
  tier_L2_file: "numerics/optimization_algorithms/multi_objective_optimization_L2.md"
})
