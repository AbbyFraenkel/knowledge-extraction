// Model Predictive Control Application Domain Concept
CREATE (mpc:ApplicationDomain {
  name: "ModelPredictiveControl",
  description: "An advanced control strategy that uses a dynamic model to predict and optimize system behavior over a receding time horizon",
  applicationDomain: "Control Systems",
  subdomain: "Advanced Control",
  fundamentalPrinciples: [
    "Dynamic model-based prediction",
    "Receding horizon optimization",
    "Constraint handling capability",
    "Feedback correction"
  ],
  governingEquations: [
    "System dynamics: x(k+1) = f(x(k), u(k))",
    "Optimization objective: min_{u} ∑_k [J(x(k), u(k))]",
    "Constraints: g(x(k), u(k)) ≤ 0",
    "Receding horizon implementation: Apply u*(0), shift horizon"
  ],
  algorithmicComponents: [
    "State estimation",
    "Trajectory prediction",
    "Optimization solver",
    "Constraint handling"
  ],
  applicationAreas: [
    "Process control",
    "Robotic systems",
    "Autonomous vehicles",
    "Energy management"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Model Predictive Control (MPC) uses a dynamic system model to predict future behavior and optimize control actions over a finite horizon, applying only the first control action before re-optimizing, enabling constraint handling and anticipatory control.",
  tier_L2_file: "applications/control_systems/model_predictive_control_L2.md"
})
