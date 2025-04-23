// PDE Solvers Application Domain Concept
CREATE (pdes:ApplicationDomain {
  name: "PDESolvers",
  description: "Computational methods and software for solving partial differential equations in science and engineering",
  applicationDomain: "Scientific Computing",
  subdomain: "Differential Equations",
  fundamentalPrinciples: [
    "Discretization of continuous equations",
    "Approximation of spatial and temporal derivatives",
    "Solution of resulting algebraic systems",
    "Error estimation and adaptivity"
  ],
  governingEquations: [
    "General PDE: F(x, u, ∇u, ∇²u, ...) = 0",
    "Elliptic PDEs: -∇·(a∇u) = f",
    "Parabolic PDEs: ∂u/∂t - ∇·(a∇u) = f",
    "Hyperbolic PDEs: ∂²u/∂t² - c²∇²u = f"
  ],
  computationalApproaches: [
    "Finite difference methods",
    "Finite element methods",
    "Spectral methods",
    "Finite volume methods"
  ],
  applicationAreas: [
    "Computational fluid dynamics",
    "Structural mechanics",
    "Heat transfer simulation",
    "Electromagnetics"
  ],
  taxonomyLevel: "Core",
  tier_L1: "PDE solvers are computational methods and software tools for approximating solutions to partial differential equations, involving spatial and temporal discretization, algebraic system solution, and error control techniques.",
  tier_L2_file: "applications/scientific_computing/pde_solvers_L2.md"
})
