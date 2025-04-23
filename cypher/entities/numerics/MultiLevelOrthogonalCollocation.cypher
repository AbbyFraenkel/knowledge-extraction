// Multi-Level Orthogonal Collocation Concept
CREATE (mloc:MathematicalConcept {
  name: "MultiLevelOrthogonalCollocation",
  description: "A hierarchical approach to spectral collocation that enables adaptive refinement across multiple resolution levels",
  domain: "Numerical Analysis",
  subdomain: "Spectral Methods",
  fundamentalPrinciples: [
    "Hierarchical basis functions",
    "Spectral approximation theory",
    "Multi-resolution analysis",
    "Adaptive refinement"
  ],
  mathematicalProperties: [
    "Spectral convergence for smooth regions",
    "Local refinement capability",
    "Hierarchical error estimation",
    "Conservation properties preserved across levels"
  ],
  keyEquations: [
    "Multi-level basis: φᵢⱼᵐ(x) = ℓⱼ(2ᵐx - i) for x ∈ [i/2ᵐ, (i+1)/2ᵐ], 0 elsewhere",
    "Level m approximation: uᵐ(x) = ∑ᵢ∑ⱼ cᵢⱼᵐ φᵢⱼᵐ(x)",
    "Error estimate: εᵐ = ||uᵐ⁺¹ - uᵐ||"
  ],
  theoreticalFoundation: "Combination of spectral collocation and multi-resolution analysis",
  paperSources: ["Smith2023"],
  taxonomyLevel: "Specialized",
  tier_L1: "Multi-level orthogonal collocation combines the spectral accuracy of orthogonal collocation with the adaptive flexibility of multi-level methods, enabling high-accuracy solutions with efficient computational resources.",
  tier_L2_file: "numerics/discretization_methods/multi_level_orthogonal_collocation_L2.md"
})
