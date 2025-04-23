// Fictitious Domain Method Mathematical Concept
CREATE (fdm:MathematicalConcept {
  name: "FictitiousDomainMethod",
  description: "An approach for handling complex geometries by embedding them in simpler computational domains",
  domain: "Numerical Analysis",
  subdomain: "Complex Geometry Methods",
  fundamentalPrinciples: [
    "Domain embedding",
    "Boundary condition enforcement on non-conforming boundaries",
    "Penalty or Lagrange multiplier methods for constraints",
    "Non-conforming meshes"
  ],
  mathematicalProperties: [
    "Preserves accuracy of underlying discretization",
    "Enables complex geometry handling with structured grids",
    "Applicable to moving boundary problems",
    "Supports mesh-independent representations"
  ],
  keyEquations: [
    "Extended weak form: a(u,v) + ∫_Γ λ(u-g)v ds = f(v)",
    "Penalty approach: a(u,v) + γ∫_Γ (u-g)v ds = f(v)",
    "Extended domain: Ω = Ω_physical ∪ Ω_fictitious"
  ],
  theoreticalFoundation: "Constrained optimization and extended domain methods",
  paperSources: ["Glowinski1994", "Peskin2002"],
  taxonomyLevel: "Core",
  tier_L1: "Fictitious domain methods simplify handling of complex geometries by embedding them within simpler computational domains, with appropriate techniques to enforce boundary conditions on the embedded boundaries.",
  tier_L2_file: "numerics/discretization_methods/fictitious_domain_method_L2.md"
})
