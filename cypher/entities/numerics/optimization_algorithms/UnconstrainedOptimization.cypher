// Unconstrained Optimization Mathematical Concept
CREATE (uo:MathematicalConcept {
  name: "UnconstrainedOptimization",
  description: "The mathematical problem of finding minima or maxima of a function without constraints on the variables",
  domain: "Numerical Analysis",
  subdomain: "Optimization Algorithms",
  fundamentalPrinciples: [
    "Find extrema of objective function",
    "No constraints on variables",
    "First-order optimality conditions involve gradients",
    "Second-order conditions involve Hessians"
  ],
  mathematicalProperties: [
    "Necessary conditions: ∇f(x*) = 0 for local minimum x*",
    "Sufficient conditions: ∇²f(x*) positive definite",
    "Convergence rates depend on algorithm and function properties",
    "Sensitivity to initial conditions for non-convex problems"
  ],
  keyEquations: [
    "Objective function: minimize f(x) where x ∈ ℝⁿ",
    "Gradient descent: x_{k+1} = x_k - α_k ∇f(x_k)",
    "Newton's method: x_{k+1} = x_k - [∇²f(x_k)]^(-1) ∇f(x_k)",
    "Quasi-Newton update: B_{k+1} = B_k + update_formula"
  ],
  theoreticalFoundation: "Calculus of variations and functional analysis",
  paperSources: ["Nocedal1999", "Fletcher1987"],
  taxonomyLevel: "Core",
  tier_L1: "Unconstrained optimization focuses on finding minima or maxima of a function without restrictions on the variables, using algorithms that exploit gradient and curvature information to iteratively improve solutions.",
  tier_L2_file: "numerics/optimization_algorithms/unconstrained_optimization_L2.md"
})
