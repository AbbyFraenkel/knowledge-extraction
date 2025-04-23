// Parallel Computing Mathematical Concept
CREATE (pc:MathematicalConcept {
  name: "ParallelComputing",
  description: "The simultaneous execution of computations on multiple processing units to solve computational problems more efficiently",
  domain: "Numerical Analysis",
  subdomain: "Computational Acceleration",
  fundamentalPrinciples: [
    "Decomposition of problems into concurrent tasks",
    "Distribution of computation across processing units",
    "Coordination of parallel execution",
    "Communication and synchronization between processes"
  ],
  implementationProperties: [
    "Parallelization strategies (data parallel, task parallel, pipeline)",
    "Scalability with processor count",
    "Load balancing for efficiency",
    "Memory models (shared vs. distributed)"
  ],
  keyConsiderations: [
    "Amdahl's Law: speedup limited by sequential portion",
    "Communication overhead vs. computation balance",
    "Parallel algorithm design and analysis",
    "Synchronization and race condition prevention"
  ],
  mathematicalApplications: [
    "Domain decomposition methods for PDEs",
    "Parallel linear algebra operations",
    "Concurrent evaluation of independent calculations",
    "Parallel-in-time integration methods"
  ],
  paperSources: ["Kumar1994", "Foster1995"],
  taxonomyLevel: "Core",
  tier_L1: "Parallel computing divides computational problems into parts that can be executed simultaneously on multiple processors, coordinating their efforts to solve problems faster than sequential approaches, constrained by communication overhead and sequential dependencies.",
  tier_L2_file: "numerics/computational_acceleration/parallel_computing_L2.md"
})
