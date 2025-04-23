// Convergence Analysis Mathematical Concept
CREATE (ca:MathematicalConcept {
  name: "ConvergenceAnalysis",
  description: "The mathematical study of how numerical approximations approach exact solutions as discretization parameters approach zero or basis sizes approach infinity",
  domain: "Numerical Analysis",
  subdomain: "Fundamental Theory",
  fundamentalPrinciples: [
    "Quantification of approximation error",
    "Rate of convergence with respect to discretization parameters",
    "Asymptotic behavior of numerical schemes",
    "Relationship between error and computational effort"
  ],
  mathematicalProperties: [
    "Order of convergence (p in O(h^p))",
    "Exponential vs. algebraic convergence rates",
    "Factors affecting convergence behavior",
    "Superconvergence at special points"
  ],
  keyEquations: [
    "Error bound: ||u - u_h|| ≤ C·h^p where h is mesh size, p is convergence order",
    "Spectral convergence: ||u - u_N|| ~ O(e^(-αN)) for analytic solutions",
    "Asymptotic convergence: lim_{h→0} ||u - u_h||/h^p = C",
    "Rate of convergence: r = log(||e_h1||/||e_h2||)/log(h1/h2)"
  ],
  theoreticalFoundation: "Approximation theory and functional analysis",
  paperSources: ["Ciarlet1978", "Babuska1972"],
  taxonomyLevel: "Core",
  tier_L1: "Convergence analysis studies how numerical approximations approach exact solutions as discretization parameters are refined, quantifying the rate at which error decreases and establishing theoretical guarantees for numerical methods.",
  tier_L2_file: "numerics/fundamental_theory/convergence_analysis_L2.md"
})
