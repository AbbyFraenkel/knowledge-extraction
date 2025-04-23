// Abstract Type Hierarchy Implementation Concept
CREATE (ath:Implementation {
  name: "AbstractTypeHierarchy",
  description: "Systematic organization of types in a hierarchical structure to represent mathematical concepts in code",
  language: "Julia",
  implementationDomain: "Scientific Computing",
  subdomain: "Type System Design",
  designPrinciples: [
    "Clear abstract type relationships",
    "Parametric type support",
    "Type-stable interfaces",
    "Mathematically meaningful structure"
  ],
  implementationProperties: [
    "Enables multiple dispatch based on mathematical structure",
    "Preserves mathematical relationships in code structure",
    "Facilitates method specialization for performance",
    "Provides clear extension points"
  ],
  codePattern: "abstract type AbstractNumericalMethod{T} end\nabstract type AbstractCollocationMethod{T} <: AbstractNumericalMethod{T} end",
  paperSources: ["Bezanson2017", "Rackauckas2020"],
  taxonomyLevel: "Core",
  tier_L1: "Abstract type hierarchies in scientific computing establish clear organizational structures for mathematical concepts, enabling multiple dispatch and preserving mathematical relationships in code.",
  tier_L2_file: "scientific_computing/implementation_methodologies/abstract_type_hierarchy_L2.md"
})
