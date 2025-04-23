// Adaptive Refinement Mathematical Concept
CREATE (ar:MathematicalConcept {
  name: "AdaptiveRefinement",
  description: "Technique for selectively increasing numerical resolution in regions requiring higher accuracy while maintaining lower resolution elsewhere",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  fundamentalPrinciples: [
    "Error estimation to identify refinement regions",
    "Selective resolution increase in high-error areas",
    "Computational efficiency through targeted resource allocation",
    "Dynamic adjustment based on solution features"
  ],
  mathematicalProperties: [
    "Preserves accuracy of underlying discretization method",
    "Improves computational efficiency compared to uniform refinement",
    "Can handle solutions with localized features efficiently",
    "Maintains continuity and smoothness properties across refinement transitions"
  ],
  keyEquations: [
    "Error estimator: ε(x) = ||u_{h+1} - u_h|| or suitable proxy",
    "Refinement criterion: Refine element e if ε_e > τ (tolerance)",
    "h-refinement: Subdivide elements with high error",
    "p-refinement: Increase polynomial order where needed",
    "hp-refinement: ε_e = C h_e^{min(p_e,s)} p_e^{-s} (convergence estimate)"
  ],
  theoreticalFoundation: "Approximation theory and a posteriori error estimation",
  historicalContext: "Developed from the 1980s onward in finite element and spectral methods",
  alternateForms: ["Adaptive mesh refinement", "Adaptive resolution", "Solution-adaptive discretization"],
  paperSources: ["Babuska1978", "Demkowicz2006", "Houston2005"],
  taxonomyLevel: "Core",
  formalDefinition: "A systematic approach to discretization that dynamically allocates computational resources by increasing resolution (through h-refinement, p-refinement, or both) in regions where error estimates indicate higher accuracy is required",
  tier_L1: "Adaptive refinement selectively increases numerical resolution in regions requiring higher accuracy while maintaining lower resolution elsewhere, guided by error estimates to optimize computational resources for a given accuracy target.",
  tier_L2_file: "numerics/discretization_methods/adaptive_refinement_L2.md"
})
