// GPU Computing Mathematical Concept
CREATE (gpu:MathematicalConcept {
  name: "GPUComputing",
  description: "The use of graphics processing units (GPUs) to accelerate computations in scientific computing through massive parallelism",
  domain: "Numerical Analysis",
  subdomain: "Computational Acceleration",
  fundamentalPrinciples: [
    "Massive parallelism on many-core architecture",
    "SIMD (Single Instruction Multiple Data) execution model",
    "Memory hierarchy optimization",
    "Throughput-oriented computation"
  ],
  implementationProperties: [
    "Kernel-based programming model",
    "Thread hierarchy (grids, blocks, threads)",
    "Shared memory utilization for communication",
    "Memory transfer optimization between host and device"
  ],
  keyConsiderations: [
    "Thread divergence minimization",
    "Memory coalescing for efficient access",
    "Balancing arithmetic intensity and memory bandwidth",
    "Occupancy optimization for maximum utilization"
  ],
  mathematicalApplications: [
    "Dense linear algebra operations",
    "Structured grid problems (finite difference, spectral methods)",
    "Particle-based simulations",
    "Machine learning operations (convolutions, matrix multiplications)"
  ],
  paperSources: ["Owens2008", "Nickolls2010"],
  taxonomyLevel: "Core",
  tier_L1: "GPU computing leverages massively parallel graphics processing units to accelerate numerical calculations, particularly suited for problems with high arithmetic intensity, regular memory access patterns, and extensive data parallelism.",
  tier_L2_file: "numerics/computational_acceleration/gpu_computing_L2.md"
})
