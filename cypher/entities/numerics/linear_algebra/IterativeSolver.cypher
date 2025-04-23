// Iterative Solver Mathematical Concept
CREATE (is:MathematicalConcept {
  name: "IterativeSolver",
  description: "Methods that solve linear systems through successive approximations converging to the solution",
  domain: "Numerical Analysis",
  subdomain: "Linear Algebra",
  fundamentalPrinciples: [
    "Successive approximation of solution",
    "Convergence to exact solution in the limit",
    "Iteration based on residual reduction",
    "Early termination based on convergence criteria"
  ],
  mathematicalProperties: [
    "Convergence rates dependent on algorithm and problem properties",
    "Spectrum-dependent convergence for many methods",
    "Preconditioning techniques for convergence acceleration",
    "Trade-off between accuracy and computational effort"
  ],
  keyEquations: [
    "Linear system: Ax = b",
    "Residual: r = b - Ax",
    "Iteration scheme: x_{k+1} = x_k + correction_k",
    "Convergence criterion: ||r_k|| < ε"
  ],
  theoreticalFoundation: "Linear algebra and approximation theory",
  paperSources: ["Saad2003", "Greenbaum1997"],
  taxonomyLevel: "Core",
  tier_L1: "Iterative solvers progressively refine approximations to the solution of linear systems through repeated steps that reduce the residual, particularly effective for large, sparse systems where direct methods would be prohibitively expensive.",
  tier_L2_file: "numerics/linear_algebra/iterative_solver_L2.md"
})
