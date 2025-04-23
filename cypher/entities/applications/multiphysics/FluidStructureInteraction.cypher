// Fluid-Structure Interaction Application Domain Concept
CREATE (fsi:ApplicationDomain {
  name: "FluidStructureInteraction",
  description: "The study of interactions between deformable structures and surrounding fluid flows",
  applicationDomain: "Multiphysics",
  subdomain: "Coupled Problems",
  fundamentalPrinciples: [
    "Bidirectional coupling between fluids and structures",
    "Interface conditions for force and displacement transfer",
    "Moving boundaries and meshes",
    "Conservation of energy across fluid-structure interfaces"
  ],
  governingEquations: [
    "Fluid dynamics: Navier-Stokes equations",
    "Structural mechanics: Momentum conservation with constitutive laws",
    "Interface conditions: Continuity of velocity and traction",
    "Arbitrary Lagrangian-Eulerian formulation: ∂u/∂t + (v-w)·∇u = source terms"
  ],
  computationalApproaches: [
    "Monolithic coupling",
    "Partitioned coupling",
    "Arbitrary Lagrangian-Eulerian methods",
    "Immersed boundary methods"
  ],
  applicationAreas: [
    "Aeroelasticity",
    "Hemodynamics",
    "Wave-structure interactions",
    "Hydroelasticity"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Fluid-Structure Interaction (FSI) studies the mutual influence between movable or deformable structures and surrounding fluid flow, requiring coupled solution approaches that address the bidirectional transfer of forces and displacements at interfaces.",
  tier_L2_file: "applications/multiphysics/fluid_structure_interaction_L2.md"
})
