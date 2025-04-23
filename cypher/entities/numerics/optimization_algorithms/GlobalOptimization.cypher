// Global Optimization Mathematical Concept
CREATE (go:MathematicalConcept {
  name: "GlobalOptimization",
  description: "The mathematical problem of finding the absolute best solution among multiple local optima across the entire feasible domain",
  domain: "Numerical Analysis",
  subdomain: "Optimization Algorithms",
  fundamentalPrinciples: [
    "Finding global minima or maxima",
    "Exploration of entire feasible space",
    "Strategies to escape local optima",
    "Balance between exploration and exploitation"
  ],
  mathematicalProperties: [
    "Guarantee of global optimality (for certain methods)",
    "Computational complexity typically much higher than local methods",
    "Trade-off between confidence in global solution and computational cost",
    "Sensitivity to problem structure and dimension"
  ],
  keyEquations: [
    "Objective function: minimize f(x) where x ∈ D, seeking x* such that f(x*) ≤ f(x) for all x ∈ D",
    "Branch and bound: LB(D_i) ≤ min_{x∈D_i} f(x) ≤ UB(D_i)",
    "Simulated annealing acceptance probability: p = exp(-(f(x_new) - f(x))/T)",
    "Genetic algorithm fitness function: F(x) inversely related to f(x)"
  ],
  theoreticalFoundation: "Global analysis and stochastic processes",
  paperSources: ["Horst1996", "Holland1992"],
  taxonomyLevel: "Core",
  tier_L1: "Global optimization aims to find the absolute best solution across the entire feasible domain, employing strategies to escape local optima through deterministic guarantees, stochastic processes, or heuristic approaches.",
  tier_L2_file: "numerics/optimization_algorithms/global_optimization_L2.md"
})
