// Numerical Methods Hierarchy - Complete Knowledge Structure
// This file establishes the comprehensive hierarchical structure for numerical methods

// ----------------------------------------
// Core Domain Hierarchy
// ----------------------------------------

// Root nodes for major domains
CREATE (na:MathematicalConcept {
  name: "NumericalAnalysis",
  description: "Field studying the development and analysis of algorithms for numerical approximation of mathematical problems",
  domain: "Mathematics",
  subdomain: "Applied Mathematics",
  taxonomyLevel: "Domain",
  tier_L1: "Numerical analysis is the study of algorithms and methods for numerical approximation of continuous mathematical problems, focusing on accuracy, efficiency, convergence, and stability."
})

CREATE (pde:MathematicalConcept {
  name: "PartialDifferentialEquations",
  description: "Equations involving unknown multivariate functions and their partial derivatives",
  domain: "Mathematics",
  subdomain: "Differential Equations",
  taxonomyLevel: "Domain",
  tier_L1: "Partial differential equations (PDEs) are equations involving unknown multivariate functions and their partial derivatives, used to model diverse phenomena in physics, engineering, and applied sciences."
})

CREATE (ode:MathematicalConcept {
  name: "OrdinaryDifferentialEquations",
  description: "Equations involving functions of a single variable and their derivatives",
  domain: "Mathematics",
  subdomain: "Differential Equations",
  taxonomyLevel: "Domain",
  tier_L1: "Ordinary differential equations (ODEs) are equations involving functions of a single variable and their derivatives, forming a foundation for modeling dynamic systems and time-dependent phenomena."
})

CREATE (opt:MathematicalConcept {
  name: "Optimization",
  description: "Field concerned with finding maxima or minima of functions, possibly subject to constraints",
  domain: "Mathematics",
  subdomain: "Operations Research",
  taxonomyLevel: "Domain",
  tier_L1: "Optimization is the mathematical discipline focused on finding maxima or minima of functions, possibly subject to constraints, with applications across science, engineering, and decision-making."
})

CREATE (la:MathematicalConcept {
  name: "LinearAlgebra",
  description: "Branch of mathematics concerning linear equations, vector spaces, and linear transformations",
  domain: "Mathematics",
  subdomain: "Algebra",
  taxonomyLevel: "Domain",
  tier_L1: "Linear algebra studies vector spaces, linear mappings, systems of linear equations, and their representations through matrices, providing essential tools for numerous mathematical domains."
})

CREATE (at:MathematicalConcept {
  name: "ApproximationTheory",
  description: "Branch of mathematics studying how functions can be approximated by simpler functions",
  domain: "Mathematics",
  subdomain: "Analysis",
  taxonomyLevel: "Domain",
  tier_L1: "Approximation theory studies how functions can be best approximated with simpler functions, providing theoretical foundation for numerical methods."
})

// ----------------------------------------
// Discretization Methods Hierarchy
// ----------------------------------------

// Create main discretization method categories
CREATE (dm:MathematicalConcept {
  name: "DiscretizationMethod",
  description: "Methods for transforming continuous problems into discrete approximations",
  domain: "Numerical Analysis",
  subdomain: "Approximation Methods",
  taxonomyLevel: "Category",
  tier_L1: "Discretization methods transform continuous mathematical problems into discrete forms amenable to numerical solution, forming the foundation of computational mathematics."
})

CREATE (fdm:MathematicalConcept {
  name: "FiniteDifferenceMethod",
  description: "Numerical method for solving differential equations by approximating derivatives with difference quotients",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Method Class",
  tier_L1: "Finite difference methods approximate derivatives in differential equations using difference quotients on a mesh, replacing continuous operators with discrete algebraic equations."
})

CREATE (fem:MathematicalConcept {
  name: "FiniteElementMethod",
  description: "Numerical method using variational methods and piecewise polynomial basis functions on a mesh",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Method Class",
  tier_L1: "Finite element methods discretize domains into smaller elements, approximating solutions using piecewise polynomial functions that satisfy integral forms of governing equations."
})

CREATE (fvm:MathematicalConcept {
  name: "FiniteVolumeMethod",
  description: "Numerical method using integral forms of conservation laws over control volumes",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Method Class",
  tier_L1: "Finite volume methods discretize integral conservation laws over control volumes, ensuring conserved quantities remain preserved at the discrete level."
})

CREATE (sm:MathematicalConcept {
  name: "SpectralMethod",
  description: "Numerical method using global basis functions with high-order accuracy",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Method Class",
  tier_L1: "Spectral methods approximate solutions using global basis functions (often orthogonal polynomials), achieving high accuracy through spectral convergence for smooth problems."
})

CREATE (cm:MathematicalConcept {
  name: "CollocationMethod",
  description: "Method enforcing governing equations exactly at selected points",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Method Class",
  tier_L1: "Collocation methods enforce governing equations exactly at specific discrete points, transforming differential equations into algebraic systems."
})

CREATE (mlm:MathematicalConcept {
  name: "MultiLevelMethod",
  description: "Hierarchical approach using multiple resolution levels",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Method Class",
  tier_L1: "Multi-level methods employ hierarchical representations across different resolution levels, enabling adaptive refinement and efficient solution of multi-scale problems."
})

CREATE (mm:MathematicalConcept {
  name: "MeshlessMethod",
  description: "Numerical method without fixed mesh connectivity",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Method Class",
  tier_L1: "Meshless methods approximate solutions using nodes without fixed connectivity, offering flexibility for complex geometries and moving boundaries."
})

CREATE (fdcm:MathematicalConcept {
  name: "FictitiousDomainMethod",
  description: "Method embedding complex geometries in simpler computational domains",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Method Class",
  tier_L1: "Fictitious domain methods simplify complex geometries by embedding them in simpler computational domains, using special techniques to enforce boundary conditions."
})

// Create specific methods under these categories
CREATE (oc:MathematicalConcept {
  name: "OrthogonalCollocation",
  description: "Collocation method using orthogonal polynomials as basis functions",
  domain: "Numerical Analysis",
  subdomain: "Spectral Methods",
  taxonomyLevel: "Method",
  tier_L1: "Orthogonal collocation approximates solutions using orthogonal polynomial basis functions, with governing equations enforced exactly at collocation points, typically roots of orthogonal polynomials."
})

CREATE (mloc:MathematicalConcept {
  name: "MultiLevelOrthogonalCollocation",
  description: "Hierarchical approach to spectral collocation enabling adaptive refinement across multiple resolution levels",
  domain: "Numerical Analysis",
  subdomain: "Spectral Methods",
  taxonomyLevel: "Method",
  tier_L1: "Multi-level orthogonal collocation combines spectral accuracy with hierarchical adaptivity, representing solutions across multiple resolution levels while maintaining spectral convergence properties."
})

CREATE (ocfc:MathematicalConcept {
  name: "OrthogonalCollocationOnFiniteCells",
  description: "Combination of orthogonal collocation with fictitious domain approaches for complex geometries",
  domain: "Numerical Analysis",
  subdomain: "Spectral Methods",
  taxonomyLevel: "Method",
  tier_L1: "Orthogonal Collocation on Finite Cells combines high-accuracy spectral discretization with the geometric flexibility of fictitious domain methods for complex geometries."
})

CREATE (se:MathematicalConcept {
  name: "SpectralElement",
  description: "Hybrid method combining domain decomposition with spectral approximation",
  domain: "Numerical Analysis",
  subdomain: "Spectral Methods",
  taxonomyLevel: "Method",
  tier_L1: "Spectral element methods combine domain decomposition with high-order spectral approximation within elements, balancing local refinement capability with spectral accuracy."
})

CREATE (hp:MathematicalConcept {
  name: "HPAdaptiveMethod",
  description: "Adaptive method combining mesh refinement (h) and polynomial order variation (p)",
  domain: "Numerical Analysis",
  subdomain: "Adaptive Methods",
  taxonomyLevel: "Method",
  tier_L1: "HP-adaptive methods selectively refine the computational mesh (h-refinement) and increase polynomial order (p-refinement) based on error indicators, optimizing computational resources."
})

CREATE (mbt:MathematicalConcept {
  name: "MovingBoundaryTransformation",
  description: "Transformation of problems with moving boundaries to fixed domains",
  domain: "Numerical Analysis",
  subdomain: "Moving Boundary Methods",
  taxonomyLevel: "Method",
  tier_L1: "Moving boundary transformations convert problems with time-dependent domains into equivalent problems on fixed domains through coordinate transformations."
})

CREATE (rbf:MathematicalConcept {
  name: "RadialBasisFunction",
  description: "Meshless method using radial basis functions for interpolation",
  domain: "Numerical Analysis",
  subdomain: "Meshless Methods",
  taxonomyLevel: "Method",
  tier_L1: "Radial basis function methods use distance-based functions centered at nodes to construct approximations without requiring mesh connectivity."
})

// ----------------------------------------
// Supporting Concepts Hierarchy
// ----------------------------------------

// Create supporting concept nodes
CREATE (bf:MathematicalConcept {
  name: "BasisFunction",
  description: "Function used as building block for approximating solutions",
  domain: "Numerical Analysis",
  subdomain: "Approximation Theory",
  taxonomyLevel: "Concept",
  tier_L1: "Basis functions are fundamental building blocks used to represent solutions in numerical methods, with a solution approximated as a weighted sum of these functions."
})

CREATE (cp:MathematicalConcept {
  name: "CollocationPoint",
  description: "Points where governing equations are enforced exactly",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Concept",
  tier_L1: "Collocation points are strategically selected positions where governing equations are enforced exactly, transforming differential equations into algebraic systems."
})

CREATE (dm_concept:MathematicalConcept {
  name: "DifferentiationMatrix",
  description: "Matrix representation of a differential operator",
  domain: "Numerical Analysis",
  subdomain: "Discretization Methods",
  taxonomyLevel: "Concept",
  tier_L1: "Differentiation matrices transform function values at discrete points to approximate derivative values, enabling matrix-based implementation of differential operators."
})

CREATE (qr:MathematicalConcept {
  name: "QuadratureRule",
  description: "Method for approximating definite integrals",
  domain: "Numerical Analysis",
  subdomain: "Numerical Integration",
  taxonomyLevel: "Concept",
  tier_L1: "Quadrature rules approximate definite integrals using weighted sums of function values at specific points, with weights and points chosen to maximize accuracy."
})

CREATE (ar:MathematicalConcept {
  name: "AdaptiveRefinement",
  description: "Technique for selectively increasing resolution where needed",
  domain: "Numerical Analysis",
  subdomain: "Adaptive Methods",
  taxonomyLevel: "Concept",
  tier_L1: "Adaptive refinement selectively increases numerical resolution in regions requiring higher accuracy, guided by error estimates to optimize computational resources."
})

CREATE (ee:MathematicalConcept {
  name: "ErrorEstimation",
  description: "Techniques for quantifying numerical approximation errors",
  domain: "Numerical Analysis",
  subdomain: "Error Analysis",
  taxonomyLevel: "Concept",
  tier_L1: "Error estimation provides quantitative measures of numerical approximation accuracy without requiring the exact solution, guiding adaptive refinement and providing confidence bounds."
})

CREATE (sc:MathematicalConcept {
  name: "SpectralConvergence",
  description: "Exponential convergence rate characteristic of high-order methods",
  domain: "Numerical Analysis",
  subdomain: "Approximation Theory",
  taxonomyLevel: "Concept",
  tier_L1: "Spectral convergence refers to exponential error decay as resolution increases, characteristic of high-order methods applied to smooth problems."
})

CREATE (po:MathematicalConcept {
  name: "PolynomialOrder",
  description: "Degree of polynomial approximation",
  domain: "Numerical Analysis",
  subdomain: "Approximation Theory",
  taxonomyLevel: "Concept",
  tier_L1: "Polynomial order refers to the degree of polynomial functions used in numerical approximations, directly affecting accuracy and computational cost."
})

CREATE (op:MathematicalConcept {
  name: "OrthogonalPolynomial",
  description: "Polynomial from a set satisfying orthogonality conditions",
  domain: "Mathematics",
  subdomain: "Approximation Theory",
  taxonomyLevel: "Concept",
  tier_L1: "Orthogonal polynomials form families of polynomials satisfying orthogonality conditions with respect to a weight function, providing optimal basis functions for approximation."
})

CREATE (mrm:MathematicalConcept {
  name: "MethodOfWeightedResiduals",
  description: "Framework for creating approximations by minimizing weighted residuals",
  domain: "Numerical Analysis",
  subdomain: "Approximation Methods",
  taxonomyLevel: "Framework",
  tier_L1: "The method of weighted residuals creates approximate solutions by minimizing residuals with respect to different weight functions, unifying various discretization approaches."
})

// ----------------------------------------
// Now establish SPECIALIZES relationships (hierarchical)
// ----------------------------------------

// Domain-level relationships
MATCH (na:MathematicalConcept {name: "NumericalAnalysis"})
MATCH (dm:MathematicalConcept {name: "DiscretizationMethod"})
CREATE (dm)-[:SPECIALIZES {
  nature: "Specific methodology within the broader field",
  description: "Discretization methods represent a core approach within numerical analysis"
}]->(na)

MATCH (pde:MathematicalConcept {name: "PartialDifferentialEquations"})
MATCH (ode:MathematicalConcept {name: "OrdinaryDifferentialEquations"})
CREATE (pde)-[:RELATED_TO {
  nature: "Different types of differential equations",
  description: "PDEs and ODEs represent different classes of differential equations"
}]->(ode)

// Discretization method relationships
MATCH (dm:MathematicalConcept {name: "DiscretizationMethod"})
MATCH (fdm:MathematicalConcept {name: "FiniteDifferenceMethod"})
MATCH (fem:MathematicalConcept {name: "FiniteElementMethod"})
MATCH (fvm:MathematicalConcept {name: "FiniteVolumeMethod"})
MATCH (sm:MathematicalConcept {name: "SpectralMethod"})
MATCH (cm:MathematicalConcept {name: "CollocationMethod"})
MATCH (mlm:MathematicalConcept {name: "MultiLevelMethod"})
MATCH (mm:MathematicalConcept {name: "MeshlessMethod"})
MATCH (fdcm:MathematicalConcept {name: "FictitiousDomainMethod"})

CREATE (fdm)-[:SPECIALIZES {nature: "Specific discretization approach", description: "Utilizes difference quotients on meshes"}]->(dm)
CREATE (fem)-[:SPECIALIZES {nature: "Specific discretization approach", description: "Utilizes weak formulations with piecewise basis functions"}]->(dm)
CREATE (fvm)-[:SPECIALIZES {nature: "Specific discretization approach", description: "Based on integral conservation laws over control volumes"}]->(dm)
CREATE (sm)-[:SPECIALIZES {nature: "Specific discretization approach", description: "Uses global basis functions for high accuracy"}]->(dm)
CREATE (cm)-[:SPECIALIZES {nature: "Specific discretization approach", description: "Enforces equations at discrete points"}]->(dm)
CREATE (mlm)-[:SPECIALIZES {nature: "Specific discretization approach", description: "Uses hierarchical representation across multiple levels"}]->(dm)
CREATE (mm)-[:SPECIALIZES {nature: "Specific discretization approach", description: "Operates without fixed mesh connectivity"}]->(dm)
CREATE (fdcm)-[:SPECIALIZES {nature: "Specific discretization approach", description: "Embeds complex geometries in simpler domains"}]->(dm)

// Specific method relationships
MATCH (cm:MathematicalConcept {name: "CollocationMethod"})
MATCH (sm:MathematicalConcept {name: "SpectralMethod"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
CREATE (oc)-[:SPECIALIZES {
  nature: "Specific collocation implementation",
  description: "Uses orthogonal polynomials as basis functions"
}]->(cm)
CREATE (oc)-[:SPECIALIZES {
  nature: "Type of spectral method",
  description: "Achieves spectral accuracy through orthogonal polynomial basis"
}]->(sm)

MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (mlm:MathematicalConcept {name: "MultiLevelMethod"})
MATCH (mloc:MathematicalConcept {name: "MultiLevelOrthogonalCollocation"})
CREATE (mloc)-[:SPECIALIZES {
  nature: "Multi-level extension of orthogonal collocation",
  description: "Adds hierarchical adaptivity to orthogonal collocation"
}]->(oc)
CREATE (mloc)-[:SPECIALIZES {
  nature: "Specific multi-level implementation",
  description: "Uses orthogonal collocation within multi-level framework"
}]->(mlm)

MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (fdcm:MathematicalConcept {name: "FictitiousDomainMethod"})
MATCH (ocfc:MathematicalConcept {name: "OrthogonalCollocationOnFiniteCells"})
CREATE (ocfc)-[:SPECIALIZES {
  nature: "Complex geometry extension of orthogonal collocation",
  description: "Applies orthogonal collocation to complex domains via embedding"
}]->(oc)
CREATE (ocfc)-[:SPECIALIZES {
  nature: "Specific fictitious domain implementation",
  description: "Uses orthogonal collocation within fictitious domain framework"
}]->(fdcm)

MATCH (sm:MathematicalConcept {name: "SpectralMethod"})
MATCH (se:MathematicalConcept {name: "SpectralElement"})
CREATE (se)-[:SPECIALIZES {
  nature: "Domain-decomposed spectral method",
  description: "Combines domain decomposition with spectral approximation"
}]->(sm)

MATCH (ar:MathematicalConcept {name: "AdaptiveRefinement"})
MATCH (hp:MathematicalConcept {name: "HPAdaptiveMethod"})
CREATE (hp)-[:SPECIALIZES {
  nature: "Specific adaptive strategy",
  description: "Combines h-refinement and p-refinement adaptively"
}]->(ar)

MATCH (mm:MathematicalConcept {name: "MeshlessMethod"})
MATCH (rbf:MathematicalConcept {name: "RadialBasisFunction"})
CREATE (rbf)-[:SPECIALIZES {
  nature: "Specific meshless approach",
  description: "Uses radial basis functions for approximation"
}]->(mm)

// ----------------------------------------
// Now establish UTILIZES/COMPONENT_OF relationships
// ----------------------------------------

// Method-concept relationships
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (bf:MathematicalConcept {name: "BasisFunction"})
MATCH (cp:MathematicalConcept {name: "CollocationPoint"})
MATCH (dm_concept:MathematicalConcept {name: "DifferentiationMatrix"})
MATCH (qr:MathematicalConcept {name: "QuadratureRule"})
MATCH (sc:MathematicalConcept {name: "SpectralConvergence"})
MATCH (op:MathematicalConcept {name: "OrthogonalPolynomial"})

CREATE (oc)-[:UTILIZES {role: "Core component", description: "Uses basis functions for solution representation"}]->(bf)
CREATE (oc)-[:UTILIZES {role: "Discretization mechanism", description: "Uses collocation points for equation enforcement"}]->(cp)
CREATE (oc)-[:UTILIZES {role: "Derivative approximation", description: "Uses differentiation matrices for operators"}]->(dm_concept)
CREATE (oc)-[:UTILIZES {role: "Integration mechanism", description: "Uses quadrature rules for inner products"}]->(qr)
CREATE (oc)-[:EXHIBITS {role: "Convergence property", description: "Demonstrates spectral convergence for smooth solutions"}]->(sc)
CREATE (oc)-[:UTILIZES {role: "Basis type", description: "Uses orthogonal polynomials as basis functions"}]->(op)

MATCH (mloc:MathematicalConcept {name: "MultiLevelOrthogonalCollocation"})
MATCH (ar:MathematicalConcept {name: "AdaptiveRefinement"})
MATCH (ee:MathematicalConcept {name: "ErrorEstimation"})

CREATE (mloc)-[:UTILIZES {role: "Core capability", description: "Uses adaptive refinement for local resolution control"}]->(ar)
CREATE (mloc)-[:UTILIZES {role: "Decision mechanism", description: "Uses error estimation to guide refinement"}]->(ee)
CREATE (ar)-[:DEPENDS_ON {role: "Guidance mechanism", description: "Requires error estimates to guide refinement"}]->(ee)

MATCH (ocfc:MathematicalConcept {name: "OrthogonalCollocationOnFiniteCells"})
MATCH (fdcm:MathematicalConcept {name: "FictitiousDomainMethod"})

CREATE (ocfc)-[:UTILIZES {role: "Domain handling", description: "Uses fictitious domain approach for complex geometries"}]->(fdcm)

// Framework relationships
MATCH (mrm:MathematicalConcept {name: "MethodOfWeightedResiduals"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})
MATCH (fem:MathematicalConcept {name: "FiniteElementMethod"})
MATCH (sm:MathematicalConcept {name: "SpectralMethod"})

CREATE (oc)-[:SPECIALIZES {nature: "Specific weighted residual method", description: "Uses Dirac delta test functions"}]->(mrm)
CREATE (fem)-[:SPECIALIZES {nature: "Specific weighted residual method", description: "Uses piecewise test functions"}]->(mrm)
CREATE (sm)-[:SPECIALIZES {nature: "Specific weighted residual method", description: "Uses global basis functions"}]->(mrm)

// Concept interrelationships
MATCH (bf:MathematicalConcept {name: "BasisFunction"})
MATCH (op:MathematicalConcept {name: "OrthogonalPolynomial"})

CREATE (op)-[:SPECIALIZES {nature: "Specific basis function type", description: "Basis functions with orthogonality properties"}]->(bf)

// ----------------------------------------
// Establish relationships with mathematical domains
// ----------------------------------------

MATCH (na:MathematicalConcept {name: "NumericalAnalysis"})
MATCH (at:MathematicalConcept {name: "ApproximationTheory"})
MATCH (sc:MathematicalConcept {name: "SpectralConvergence"})
MATCH (bf:MathematicalConcept {name: "BasisFunction"})
MATCH (op:MathematicalConcept {name: "OrthogonalPolynomial"})

CREATE (sc)-[:BELONGS_TO {domain: "Theoretical property", description: "Convergence concept within approximation theory"}]->(at)
CREATE (bf)-[:BELONGS_TO {domain: "Foundational concept", description: "Core concept within approximation theory"}]->(at)
CREATE (op)-[:BELONGS_TO {domain: "Mathematical object", description: "Specific class of mathematical functions"}]->(at)
CREATE (at)-[:BELONGS_TO {domain: "Sub-discipline", description: "Theoretical foundation within numerical analysis"}]->(na)

MATCH (pde:MathematicalConcept {name: "PartialDifferentialEquations"})
MATCH (sm:MathematicalConcept {name: "SpectralMethod"})
MATCH (oc:MathematicalConcept {name: "OrthogonalCollocation"})

CREATE (sm)-[:APPLIES_TO {domain: "Application area", description: "Used to solve partial differential equations"}]->(pde)
CREATE (oc)-[:APPLIES_TO {domain: "Application area", description: "Effective for solving many types of PDEs"}]->(pde)
