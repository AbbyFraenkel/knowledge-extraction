// Orthogonal Collocation on Finite Cells (OCFC) Concept
CREATE (ocfc:MathematicalConcept {
  name: "OrthogonalCollocationOnFiniteCells",
  description: "A computational method combining orthogonal collocation with fictitious domain approaches to handle complex geometries while maintaining spectral accuracy",
  domain: "Numerical Analysis",
  subdomain: "Spectral Methods",
  fundamentalPrinciples: [
    "Orthogonal polynomial basis functions",
    "Fictitious domain embedding",
    "Penalty or Lagrange multiplier boundary enforcement",
    "High-order accuracy on complex geometries"
  ],
  mathematicalProperties: [
    "Spectral convergence in smooth regions",
    "Complex geometry handling without specialized meshing",
    "Retention of structured grid advantages",
    "Compatibility with adaptive refinement"
  ],
  keyEquations: [
    "Domain decomposition: Ω = ∪ᵢ Ωᵢ",
    "Local approximation: u|_Ωᵢ(x) = ∑ⱼ uᵢⱼ ℓⱼ(x)",
    "Embedded boundary: Γ ⊂ Ω not aligned with grid",
    "Boundary enforcement: ∫_Γ λ(u-g)v ds = 0"
  ],
  theoreticalFoundation: "Combination of spectral element methods and fictitious domain approaches",
  paperSources: ["Karniadakis1999", "Glowinski2001"],
  taxonomyLevel: "Specialized",
  tier_L1: "Orthogonal Collocation on Finite Cells (OCFC) combines high-accuracy spectral discretization with the geometric flexibility of fictitious domain methods, enabling efficient solution of problems with complex geometries without specialized mesh generation.",
  tier_L2_file: "numerics/discretization_methods/orthogonal_collocation_finite_cells_L2.md"
})
