// Error Estimation Mathematical Concept
CREATE (ee:MathematicalConcept {
  name: "ErrorEstimation",
  description: "Techniques for quantifying the approximation error in numerical solutions without knowing the exact solution",
  domain: "Numerical Analysis",
  subdomain: "Fundamental Theory",
  fundamentalPrinciples: [
    "Approximation of solution error",
    "A posteriori and a priori error estimates",
    "Computability without known exact solution",
    "Relationship to refinement strategies"
  ],
  mathematicalProperties: [
    "Error bounds (upper and lower)",
    "Local vs. global error estimation",
    "Sharpness of error estimates",
    "Reliability and efficiency indices"
  ],
  keyEquations: [
    "A posteriori error: ||u - u_h|| ≤ η(u_h) where η is computable from u_h",
    "Residual-based estimate: η² = ∑_K η_K² where η_K is element-wise indicator",
    "Richardson extrapolation: e_h ≈ (u_h - u_{h/2})/(2^p - 1) for p-th order method",
    "Hierarchical error estimate: e_h ≈ u_{h,p+1} - u_{h,p}"
  ],
  theoreticalFoundation: "Functional analysis and approximation theory",
  paperSources: ["Babuska1978", "Zienkiewicz1992"],
  taxonomyLevel: "Core",
  tier_L1: "Error estimation provides computable measures of numerical approximation errors without knowing the exact solution, enabling adaptive refinement strategies and verification of solution accuracy for practical problems.",
  tier_L2_file: "numerics/fundamental_theory/error_estimation_L2.md"
})
