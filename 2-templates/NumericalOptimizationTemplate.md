# Numerical Optimization Extraction Template

## Instructions
Use this template for extracting optimization methods, convergence properties, and implementation strategies. This template is suitable for all types of optimization algorithms, whether convex, nonconvex, constrained or unconstrained problems.

## Template
{
  "optimization_method": {
    "name": "method_name",
    "problem_class": "convex|nonconvex|constrained|unconstrained",
    "algorithm_type": "first_order|second_order|zeroth_order|interior_point",
    "convergence_properties": {
      "rate": "linear|superlinear|quadratic",
      "conditions": "Lipschitz|strong_convexity|regularity"
    },
    "iteration_scheme": {
      "initialization": "x_0 = ...",
      "update_rule": "x_{k+1} = ...",
      "termination": "||∇f(x_k)|| < ε"
    },
    "complexity": {
      "per_iteration": "O(...)",
      "overall": "O(...)"
    }
  },
  "implementation": {
    "line_search_strategy": "Armijo|Wolfe|fixed",
    "hyperparameters": [
      {"name": "learning_rate", "typical_range": "[0.001, 0.1]", "tuning_method": "adaptive"},
      {"name": "momentum", "typical_range": "[0.9, 0.999]"}
    ],
    "example_problem_class": "reference to standard test problems"
  }
}

# Example KitchenSink code pattern for optimization methods
function optimization_method(f, ∇f, x0; max_iter=100, tol=1e-6, parameters...)
    x = copy(x0)
    for i in 1:max_iter
        # Update rule implementation matching mathematical formulation
        # ...

        # Convergence check matching termination criterion
        if norm(∇f(x)) < tol
            return x, f(x), "converged", i
        end
    end
    return x, f(x), "max_iter", max_iter
end

## Knowledge Graph Representation

```cypher
// Create optimization method entity
CREATE (method:OptimizationMethod:Entity {
  name: "Newton's Method with Line Search",
  problem_class: "nonlinear",
  algorithm_type: "second_order",
  convergence_rate: "quadratic",
  convergence_conditions: ["twice continuously differentiable", "positive definite Hessian"]
})

// Create iteration scheme
CREATE (scheme:IterationScheme:Entity {
  name: "Newton Iteration",
  initialization: "x₀ ∈ ℝⁿ",
  update_rule: "xₖ₊₁ = xₖ - αₖ[∇²f(xₖ)]⁻¹∇f(xₖ)",
  termination: "||∇f(xₖ)|| < ε"
})

// Create implementation details
CREATE (implementation:OptimizationImplementation:Entity {
  name: "Newton-LS Implementation",
  line_search_strategy: "Armijo-Goldstein",
  hyperparameters: [
    {name: "tolerance", default_value: "1e-6"},
    {name: "max_iterations", default_value: "100"}
  ]
})

// Create relationships
CREATE (method)-[:USES_SCHEME]->(scheme)
CREATE (method)-[:HAS_IMPLEMENTATION]->(implementation)

// Create test problem
CREATE (problem:OptimizationProblem:Entity {
  name: "Rosenbrock Function",
  definition: "f(x,y) = (1-x)² + 100(y-x²)²",
  characteristics: ["nonconvex", "valley-shaped"]
})

// Link method to test problem
CREATE (method)-[:APPLIED_TO]->(problem)
CREATE (problem)-[:SOLVED_BY]->(method)
