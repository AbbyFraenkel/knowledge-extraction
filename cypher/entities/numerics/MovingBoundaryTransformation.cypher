// Moving Boundary Transformation Concept
CREATE (mbt:MathematicalConcept {
  name: "MovingBoundaryTransformation",
  description: "A mathematical technique that transforms problems with moving boundaries to equivalent problems on fixed domains",
  domain: "Partial Differential Equations",
  subdomain: "Boundary Transform Methods",
  fundamentalPrinciples: [
    "Coordinate transformation",
    "Fixed computational domain",
    "Transformed governing equations",
    "Boundary evolution equations"
  ],
  mathematicalProperties: [
    "Preserves solution properties",
    "Introduces additional terms in governing equations",
    "Maps physical space to computational space",
    "Handles arbitrary boundary motion"
  ],
  keyEquations: [
    "Coordinate transformation: x = η·s(t) for domain [0, s(t)] → [0, 1]",
    "Transformed derivative: ∂u/∂x = (1/s(t))·∂u/∂η",
    "Transformed time derivative: ∂u/∂t = ∂u/∂t|η - (η/s)·(ds/dt)·∂u/∂η"
  ],
  theoreticalFoundation: "Coordinate transformation theory and moving reference frames",
  paperSources: ["Stefan1891", "Crank1984"],
  taxonomyLevel: "Core",
  tier_L1: "Moving boundary transformations convert problems with time-dependent domains into equivalent problems on fixed domains, simplifying numerical treatment while introducing additional terms in the governing equations.",
  tier_L2_file: "numerics/differential_equations/moving_boundary_transformation_L2.md"
})
