# Abstract Algebra Extraction Template

## Instructions
Use this template for extracting content related to algebraic structures, operations, and group theory concepts. When using this template:
- Identify all algebraic structures precisely with their operations
- Document all homomorphisms and structure-preserving maps
- Catalog isomorphism theorems and structure classifications
- Cross-reference with standard classification theorems
- Extract computational algorithms for structure analysis

## Template
{
  "algebraic_structure": {
    "structure_type": "group|ring|field|module|algebra",
    "elements": "Description of elements",
    "operations": [
      {"name": "operation_1", "symbol": "∘", "properties": ["associative", "commutative"]},
      {"name": "operation_2", "symbol": "⋅", "properties": ["distributive"]}
    ],
    "axioms": ["axiom_1", "axiom_2", "axiom_3"],
    "substructures": [
      {"name": "substructure_1", "relationship": "normal_subgroup|ideal|submodule"}
    ],
    "isomorphisms": ["related_structure_1", "related_structure_2"]
  },
  "theorems": [
    {"theorem_id": "thm1", "name": "Main Structure Theorem", "statement": "...", "proof_approach": "constructive|contradiction|induction"}
  ]
}

## Knowledge Graph Representation

Create knowledge graph entities and relationships using Cypher:

```cypher
// Create algebraic structure entity
CREATE (group:AlgebraicStructure:Entity {
  name: "Dihedral Group D₄",
  structure_type: "group",
  elements: "Symmetries of a square: {e, r, r², r³, s, sr, sr², sr³}",
  order: 8,
  abelian: false,
  description: "Group of symmetries of a square, consisting of rotations and reflections"
})

// Create operations
CREATE (operation:Operation:Entity {
  name: "Group Composition",
  symbol: "·",
  properties: ["associative", "has identity", "has inverses"],
  identity_element: "e",
  description: "Composition of symmetry operations"
})

// Create presentation
CREATE (presentation:Presentation:Entity {
  name: "D₄ Presentation",
  generators: ["r", "s"],
  relations: ["r⁴ = e", "s² = e", "srs = r⁻¹"]
})

// Create substructures
CREATE (subgroup1:AlgebraicStructure:Entity {
  name: "Cyclic Subgroup C₄",
  structure_type: "group",
  elements: "{e, r, r², r³}",
  order: 4,
  abelian: true,
  description: "Subgroup consisting of rotations only"
})

CREATE (subgroup2:AlgebraicStructure:Entity {
  name: "Cyclic Subgroup C₂",
  structure_type: "group",
  elements: "{e, r²}",
  order: 2,
  abelian: true,
  description: "Subgroup consisting of 180° rotation and identity"
})

// Create theorems
CREATE (theorem:Theorem:Entity {
  name: "Structure Theorem for D₄",
  statement: "D₄ is isomorphic to the semidirect product C₄ ⋊ C₂",
  proof_approach: "direct verification of semidirect product structure",
  significance: "Shows how D₄ can be built from simpler cyclic groups"
})

// Create relationships
CREATE (group)-[:HAS_OPERATION]->(operation)
CREATE (group)-[:HAS_PRESENTATION]->(presentation)
CREATE (group)-[:CONTAINS]->(subgroup1)
CREATE (group)-[:CONTAINS]->(subgroup2)
CREATE (subgroup2)-[:CONTAINED_IN]->(subgroup1)
CREATE (group)-[:CHARACTERIZED_BY]->(theorem)