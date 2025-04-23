// Multi-Level Method Mathematical Concept
CREATE (mlm:MathematicalConcept {
  name: "MultiLevelMethod",
  description: "A hierarchical approach to numerical discretization using multiple resolution levels",
  domain: "Numerical Analysis",
  subdomain: "Adaptive Methods",
  fundamentalPrinciples: [
    "Hierarchical basis functions",
    "Multi-resolution analysis",
    "Adaptive refinement",
    "Error estimation between levels"
  ],
  mathematicalProperties: [
    "Local refinement capability",
    "Hierarchical error estimation",
    "Conservation properties preserved across levels",
    "Efficient representation of multi-scale phenomena"
  ],
  keyEquations: [
    "Multi-level basis: φᵢⱼᵐ(x) = ℓⱼ(2ᵐx - i) for x ∈ [i/2ᵐ, (i+1)/2ᵐ], 0 elsewhere",
    "Level m approximation: uᵐ(x) = ∑ᵢ∑ⱼ cᵢⱼᵐ φᵢⱼᵐ(x)",
    "Error estimate: εᵐ = ||uᵐ⁺¹ - uᵐ||"
  ],
  theoreticalFoundation: "Multi-resolution analysis and adaptive mesh refinement",
  paperSources: ["Hesthaven2007", "Canuto2007"],
  taxonomyLevel: "Core",
  tier_L1: "Multi-level methods employ hierarchical representation of solutions across different resolution levels, enabling adaptive refinement where higher resolution is applied only in regions requiring greater accuracy.",
  tier_L2_file: "numerics/discretization_methods/multi_level_method_L2.md"
})
