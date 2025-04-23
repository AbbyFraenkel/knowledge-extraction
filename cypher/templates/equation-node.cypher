// Equation Node Template
// Use this template to create Equation nodes in the knowledge graph
// Replace all placeholders with appropriate values

// Basic Equation Node Creation
CREATE (equation:Equation {
  name: "[EQUATION_NAME]",  // Name of the equation (e.g., "Heat Equation", "Navier-Stokes Equation")
  latex: "[LATEX_REPRESENTATION]",  // LaTeX representation of the equation
  description: "[DESCRIPTION]",  // Brief description of what the equation represents
  category: "[CATEGORY]",  // Category (e.g., "PDE", "ODE", "Algebraic", "Integral")
  
  // Optional properties - include all that apply
  dimensionality: "[DIMENSIONALITY]",  // Dimensionality (e.g., "1D", "2D", "3D", "N-dimensional")
  domainType: "[DOMAIN_TYPE]",  // Domain type (e.g., "Bounded", "Unbounded", "Periodic")
  timeDependent: [TIME_DEPENDENT],  // Boolean indicating if time-dependent (true/false)
  linearityType: "[LINEARITY]",  // Linearity (e.g., "Linear", "Nonlinear", "Quasilinear")
  orderType: "[ORDER]",  // Order (e.g., "First-order", "Second-order")
  boundaryConditionTypes: ["[BC_TYPE_1]", "[BC_TYPE_2]"],  // Types of boundary conditions typically used
  initialConditionTypes: ["[IC_TYPE_1]", "[IC_TYPE_2]"],  // Types of initial conditions typically used
  analyticalSolutions: ["[SOLUTION_1]", "[SOLUTION_2]"],  // Known analytical solutions
  conservationProperties: ["[PROPERTY_1]", "[PROPERTY_2]"],  // Conservation properties
  physicalInterpretation: "[INTERPRETATION]",  // Physical meaning or interpretation
  historicalContext: "[HISTORY]",  // Historical development context
  paperSources: ["[PAPER_REF]"],  // References to papers
  alternativeForms: ["[FORM_1]", "[FORM_2]"]  // Alternative forms of the equation
})

// Create Symbol Relationship
MATCH (symbol:Symbol {name: "[SYMBOL_NAME]", context: "[CONTEXT]"})
CREATE (equation)-[:USES_SYMBOL {
  role: "[SYMBOL_ROLE]",  // Role in the equation (e.g., "Variable", "Parameter", "Operator")
  significance: "[SIGNIFICANCE]"  // Significance in this equation
}]->(symbol)

// Connect to Mathematical Concepts
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (equation)-[:REPRESENTS {
  aspect: "[ASPECT]",  // Which aspect of the concept it represents
  formalism: "[FORMALISM]"  // Mathematical formalism used
}]->(concept)

// Connect to Application Domains
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (equation)-[:APPLIES_TO {
  contextSpecificForm: "[SPECIFIC_FORM]",  // Domain-specific form
  modelingAssumptions: ["[ASSUMPTION_1]", "[ASSUMPTION_2]"]  // Assumptions for this domain
}]->(domain)

// Connect to Related Equations
MATCH (related:Equation {name: "[RELATED_EQUATION]"})
CREATE (equation)-[:RELATES_TO {
  relationship: "[RELATIONSHIP]",  // Nature of the relationship
  transformationType: "[TRANSFORMATION]"  // How one can transform between equations
}]->(related)

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Heat Conduction Equation
/*
CREATE (heat:Equation {
  name: "HeatConductionEquation",
  latex: "\\rho C_p \\frac{\\partial T}{\\partial t} = \\nabla \\cdot (k \\nabla T) + q",
  description: "Describes the evolution of temperature in a material due to heat conduction",
  category: "PDE",
  dimensionality: "1D-3D",
  domainType: "Bounded",
  timeDependent: true,
  linearityType: "Linear (for constant properties)",
  orderType: "Second-order in space, first-order in time",
  boundaryConditionTypes: [
    "Dirichlet (prescribed temperature)",
    "Neumann (prescribed heat flux)",
    "Robin (convective boundary)"
  ],
  initialConditionTypes: [
    "Uniform initial temperature",
    "Spatially varying temperature profile"
  ],
  analyticalSolutions: [
    "1D transient solution for semi-infinite solid",
    "Steady-state solutions for simple geometries"
  ],
  conservationProperties: ["Thermal energy conservation"],
  physicalInterpretation: "Balance of thermal energy in a control volume",
  historicalContext: "Developed by Joseph Fourier in the early 19th century",
  paperSources: ["Fourier1822", "Carslaw1959"],
  alternativeForms: ["Diffusion form: ∂T/∂t = α∇²T + q/(ρCp)", "Weak form for finite element analysis"]
})

MATCH (heat:Equation {name: "HeatConductionEquation"})
MATCH (alpha:Symbol {name: "α", context: "Heat transfer equation"})
CREATE (heat)-[:USES_SYMBOL {
  role: "Parameter",
  significance: "Thermal diffusivity, key parameter controlling heat propagation speed"
}]->(alpha)

MATCH (heat:Equation {name: "HeatConductionEquation"})
MATCH (temp:Symbol {name: "T", context: "Heat transfer equation"})
CREATE (heat)-[:USES_SYMBOL {
  role: "Variable",
  significance: "Primary unknown - temperature distribution"
}]->(temp)

MATCH (heat:Equation {name: "HeatConductionEquation"})
MATCH (concept:MathematicalConcept {name: "HeatTransferTheory"})
CREATE (heat)-[:REPRESENTS {
  aspect: "Mathematical formulation of conductive heat transfer",
  formalism: "Partial differential equation in conservation form"
}]->(concept)

MATCH (heat:Equation {name: "HeatConductionEquation"})
MATCH (domain:ApplicationDomain {name: "TunnelPasteurization"})
CREATE (heat)-[:APPLIES_TO {
  contextSpecificForm: "∂T/∂t = ∇·(k(T)∇T) with temperature-dependent properties",
  modelingAssumptions: [
    "Container materials have temperature-dependent properties",
    "Heat generation term omitted",
    "Convective boundaries with spray water"
  ]
}]->(domain)
*/

// Example 2: Moving Boundary Heat Equation
/*
CREATE (movingHeat:Equation {
  name: "MovingBoundaryHeatEquation",
  latex: "\\frac{\\partial T}{\\partial t} = \\alpha \\frac{\\partial^2 T}{\\partial x^2} - \\frac{v(t)x}{s(t)}\\frac{\\partial T}{\\partial x}",
  description: "Heat equation with coordinate transformation for problems with moving boundaries",
  category: "PDE",
  dimensionality: "1D (transformed)",
  domainType: "Fixed computational domain with physical moving boundary",
  timeDependent: true,
  linearityType: "Linear in transformed coordinates",
  orderType: "Second-order in space, first-order in time",
  boundaryConditionTypes: [
    "Fixed temperature at boundaries",
    "Stefan condition at moving interface"
  ],
  analyticalSolutions: [
    "Neumann solution for constant properties",
    "Self-similar solutions for specific cases"
  ],
  conservationProperties: ["Thermal energy conservation in transformed domain"],
  physicalInterpretation: "Heat conduction in a domain with moving boundary, transformed to fixed domain",
  paperSources: ["Smith2023"],
  alternativeForms: ["Physical coordinate form", "Enthalpy formulation"]
})

MATCH (movingHeat:Equation {name: "MovingBoundaryHeatEquation"})
MATCH (standardHeat:Equation {name: "HeatConductionEquation"})
CREATE (movingHeat)-[:RELATES_TO {
  relationship: "Transformed version",
  transformationType: "Coordinate transformation x = η·s(t)"
}]->(standardHeat)

MATCH (movingHeat:Equation {name: "MovingBoundaryHeatEquation"})
MATCH (s:Symbol {name: "s(t)", context: "Moving boundary"})
CREATE (movingHeat)-[:USES_SYMBOL {
  role: "Parameter function",
  significance: "Position of moving boundary at time t"
}]->(s)

MATCH (movingHeat:Equation {name: "MovingBoundaryHeatEquation"})
MATCH (v:Symbol {name: "v(t)", context: "Moving boundary"})
CREATE (movingHeat)-[:USES_SYMBOL {
  role: "Parameter function",
  significance: "Velocity of moving boundary at time t"
}]->(v)
*/

// Example 3: Multi-Level Spectral Collocation Discretized System
/*
CREATE (mlsc:Equation {
  name: "MultiLevelSpectralCollocationSystem",
  latex: "\\sum_{m=0}^{M-1} \\sum_{i=0}^{2^m-1} \\sum_{j=0}^{N} A^m_{ij} c^m_{ij} = \\sum_{m=0}^{M-1} \\sum_{i=0}^{2^m-1} \\sum_{j=0}^{N} b^m_{ij}",
  description: "Discretized system from multi-level spectral collocation method",
  category: "Algebraic system",
  dimensionality: "Multi-level hierarchy",
  timeDependent: false,
  linearityType: "Linear system for linear PDEs, nonlinear for nonlinear PDEs",
  orderType: "Matches original PDE order",
  analyticalSolutions: ["Exact for polynomials of degree ≤ N at each level"],
  conservationProperties: ["Maintains conservation properties of original PDE"],
  physicalInterpretation: "Discretized form of PDE using hierarchical basis functions",
  paperSources: ["Smith2023"],
  alternativeForms: [
    "Level-wise form with inter-level coupling",
    "Matrix-vector form for computational implementation"
  ]
})

MATCH (mlsc:Equation {name: "MultiLevelSpectralCollocationSystem"})
MATCH (phi:Symbol {name: "φᵢⱼᵐ", context: "Multi-level basis"})
CREATE (mlsc)-[:USES_SYMBOL {
  role: "Basis function",
  significance: "Multi-level hierarchical basis function at level m, segment i, degree j"
}]->(phi)

MATCH (mlsc:Equation {name: "MultiLevelSpectralCollocationSystem"})
MATCH (concept:MathematicalConcept {name: "MultiLevelSpectralCollocation"})
CREATE (mlsc)-[:REPRESENTS {
  aspect: "Discretized system",
  formalism: "Algebraic system from collocation method"
}]->(concept)
*/
