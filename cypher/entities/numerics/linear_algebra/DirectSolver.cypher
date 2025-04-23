// Direct Solver Mathematical Concept
CREATE (ds:MathematicalConcept {
  name: "DirectSolver",
  description: "Methods that solve linear systems of equations by exact factorization in a finite number of steps",
  domain: "Numerical Analysis",
  subdomain: "Linear Algebra",
  fundamentalPrinciples: [
    "Exact solution in finite steps (barring round-off errors)",
    "Matrix factorization approaches",
    "Deterministic computational complexity",
    "No iteration or convergence considerations"
  ],
  mathematicalProperties: [
    "Solution exactness up to floating-point precision",
    "Computational complexity typically O(n³) for dense systems",
    "Sparsity pattern preservation in specialized algorithms",
    "Numerical stability considerations in implementation"
  ],
  keyEquations: [
    "Linear system: Ax = b",
    "LU factorization: A = LU, then Ly = b, Ux = y",
    "Cholesky factorization: A = LLᵀ for positive definite A",
    "QR factorization: A = QR, then Rx = Qᵀb"
  ],
  theoreticalFoundation: "Linear algebra and matrix factorization theory",
  paperSources: ["Golub2013", "Demmel1997"],
  taxonomyLevel: "Core",
  tier_L1: "Direct solvers find exact solutions to linear systems through matrix factorization in a finite number of operations, with methods chosen based on matrix properties such as symmetry, definiteness, and sparsity pattern.",
  tier_L2_file: "numerics/linear_algebra/direct_solver_L2.md"
})
