// Dynamic Optimization Application Domain Concept
CREATE (do:ApplicationDomain {
  name: "DynamicOptimization",
  description: "The process of finding optimal decision variables over time for a system with dynamic constraints",
  applicationDomain: "Control Systems",
  subdomain: "Advanced Control",
  fundamentalPrinciples: [
    "Optimization with dynamic system constraints",
    "Discretization of continuous-time problems",
    "Direct and indirect solution approaches",
    "Sequential and simultaneous solution methods"
  ],
  governingEquations: [
    "General form: min_u J = ∫[t₀,tf] L(x,u,t)dt + E(x(tf),tf) subject to dx/dt = f(x,u,t)",
    "Direct transcription: Approximate x(t) and u(t) with discrete variables",
    "Collocation constraints: x'ᵢ = f(xᵢ, uᵢ, tᵢ)",
    "Dynamic programming: V(x,t) = min_u[L(x,u,t)dt + V(x+f(x,u,t)dt, t+dt)]"
  ],
  solutionApproaches: [
    "Direct methods (shooting, transcription)",
    "Indirect methods (costate equations)",
    "Dynamic programming",
    "Differential flatness"
  ],
  applicationAreas: [
    "Process optimization over time",
    "Batch process control",
    "Vehicle trajectory planning",
    "Resource allocation over time"
  ],
  taxonomyLevel: "Core",
  tier_L1: "Dynamic optimization determines optimal time-varying decision variables for systems with dynamic constraints, using approaches like direct transcription that discretize the problem or indirect methods based on optimality conditions.",
  tier_L2_file: "applications/control_systems/dynamic_optimization_L2.md"
})
