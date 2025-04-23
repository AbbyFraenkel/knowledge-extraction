// Spectral Method Mathematical Concept
CREATE (sm:MathematicalConcept {
  name: "SpectralMethod",
  description: "A class of numerical methods that approximate solutions using global basis functions with spectral convergence properties",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  fundamentalPrinciples: [
    "Global basis function approximation",
    "Spectral (exponential) convergence for smooth solutions",
    "Typically uses orthogonal polynomial or Fourier bases",
    "High accuracy with relatively few degrees of freedom"
  ],
  mathematicalProperties: [
    "Exponential convergence rate for analytic solutions",
    "Minimal numerical dispersion and dissipation",
    "Global error propagation",
    "High-order derivative accuracy"
  ],
  keyEquations: [
    "Solution approximation: u(x) ≈ ∑_n a_n φ_n(x)",
    "Exponential convergence: ||u - u_N|| ~ O(e^(-αN))",
    "Galerkin formulation: ∫_Ω r(u_N)·φ_m dx = 0",
    "Collocation enforcement: Lu_N(x_j) = f(x_j)"
  ],
  theoreticalFoundation: "Approximation theory and orthogonal function expansions",
  paperSources: ["Gottlieb1977", "Canuto1988"],
  taxonomyLevel: "Core",
  tier_L1: "Spectral methods approximate solutions using global basis functions (typically orthogonal polynomials or trigonometric functions), achieving exponential convergence rates for smooth problems with significantly fewer degrees of freedom than low-order methods.",
  tier_L2_file: "numerics/discretization_methods/spectral_method_L2.md"
})
