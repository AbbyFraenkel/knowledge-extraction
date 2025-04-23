// Optimal Control Application Domain Concept
CREATE (oc:ApplicationDomain {
  name: "OptimalControl",
  description: "The theory and methods for finding control policies that optimize a specified performance criterion for a dynamical system",
  applicationDomain: "Control Systems",
  subdomain: "Advanced Control",
  fundamentalPrinciples: [
    "Optimization over control trajectories",
    "Trade-off between control effort and performance",
    "Handling of state and control constraints",
    "Dynamic optimization over time horizon"
  ],
  governingEquations: [
    "System dynamics: dx/dt = f(x, u, t)",
    "Performance criterion: J = ∫[t₀,tf] L(x, u, t)dt + Φ(x(tf), tf)",
    "Hamilton-Jacobi-Bellman equation: -∂V/∂t = min_u[L(x,u,t) + ∇V·f(x,u,t)]",
    "Pontryagin's maximum principle: u*(t) = argmin_u H(x,u,λ,t)"
  ],
  theoreticalFoundations: [
    "Calculus of variations",
    "Dynamic programming",
    "Pontryagin's maximum principle",
    "Numerical optimization"
  ],
  applicationAreas: [
    "Aerospace trajectory optimization",
    "Process control optimization",
    "Robotics motion planning",
    "Economic optimal control"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Optimal control determines control policies that minimize a performance criterion for a dynamical system, balancing control objectives and constraints while accounting for system dynamics over a specified time horizon.",
  tier_L2_file: "applications/control_systems/optimal_control_L2.md"
})
