// Stochastic Optimization Mathematical Concept
CREATE (so:MathematicalConcept {
  name: "StochasticOptimization",
  description: "Optimization methods that incorporate randomness, either in the objective function evaluation or the optimization process itself",
  domain: "Numerical Analysis",
  subdomain: "Optimization Algorithms",
  fundamentalPrinciples: [
    "Randomness as core algorithmic component",
    "Probabilistic guarantees of optimality",
    "Exploration through random sampling",
    "Statistical approach to convergence"
  ],
  mathematicalProperties: [
    "Almost-sure convergence to optimal solutions",
    "Trade-off between exploration and exploitation",
    "Robustness to objective function noise",
    "Ability to escape local optima"
  ],
  keyEquations: [
    "Stochastic gradient descent: x_{k+1} = x_k - α_k ∇f_i(x_k) where i is randomly selected",
    "Simulated annealing cooling schedule: T_k = T_0/log(k+1)",
    "Particle swarm update: v_i = w·v_i + c₁r₁(p_i - x_i) + c₂r₂(g - x_i)",
    "Monte Carlo estimation: E[f(x)] ≈ (1/N)·∑_{i=1}^N f(x_i) for x_i ~ p(x)"
  ],
  theoreticalFoundation: "Probability theory and stochastic processes",
  paperSources: ["Spall2003", "Kirkpatrick1983"],
  taxonomyLevel: "Core",
  tier_L1: "Stochastic optimization incorporates randomness into the optimization process, enabling escape from local optima, handling of noisy objective functions, and tackling problems with complex landscapes through probability-based search strategies.",
  tier_L2_file: "numerics/optimization_algorithms/stochastic_optimization_L2.md"
})
