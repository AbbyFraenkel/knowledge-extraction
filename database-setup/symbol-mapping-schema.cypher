// Symbol Mapping Database Schema

// Create core entity types
CREATE
(concept:EntityType {
    name: 'Concept',
    description: 'Generic knowledge representation',
    attributes: ['name', 'aliases', 'domain_tags', 'complexity']
}),
(symbol:EntityType {
    name: 'Symbol',
    description: 'Mathematical or scientific symbol',
    attributes: [
        'original_notation',
        'domains',
        'context_definitions',
        'alternative_notations',
        'paper_source'
    ]
}),
(equation:EntityType {
    name: 'Equation',
    description: 'Mathematical formulation',
    attributes: ['notation', 'derivation', 'domain_context', 'validation_sources']
}),
(domain:EntityType {
    name: 'Domain',
    description: 'Mathematical or scientific knowledge domain',
    attributes: ['name', 'description', 'parent_domain']
}),
(symbolContext:EntityType {
    name: 'SymbolContext',
    description: 'Domain-specific interpretation of a symbol',
    attributes: ['domain', 'meaning', 'units', 'equation_context']
}),
(publication:EntityType {
    name: 'Publication',
    description: 'Academic publication where symbols appear',
    attributes: ['title', 'authors', 'year', 'doi', 'reference_key']
}),
(mscClassification:EntityType {
    name: 'MSCClassification',
    description: 'Mathematics Subject Classification reference',
    attributes: ['primary', 'secondary', 'descriptors']
}),
(mathematicalConcept:EntityType {
    name: 'MathematicalConcept',
    description: 'Fundamental mathematical ideas',
    attributes: ['name', 'description', 'properties', 'applications']
}),
(mathematicalEquation:EntityType {
    name: 'MathematicalEquation',
    description: 'Formal mathematical expressions',
    attributes: ['name', 'latex_representation', 'explanation', 'context']
}),
(algorithm:EntityType {
    name: 'Algorithm',
    description: 'Step-by-step computational procedures',
    attributes: ['name', 'purpose', 'steps', 'complexity']
}),
(numericalMethod:EntityType {
    name: 'NumericalMethod',
    description: 'Specific computational approaches',
    attributes: ['name', 'mathematical_foundation', 'implementation_details', 'error_analysis']
}),
(implementation:EntityType {
    name: 'Implementation',
    description: 'Code realizations',
    attributes: ['name', 'language', 'path', 'version']
}),
(visualTechnique:EntityType {
    name: 'VisualTechnique',
    description: 'Computer vision methods',
    attributes: ['name', 'method_type', 'key_advantages']
}),
(physicalApplication:EntityType {
    name: 'PhysicalApplication',
    description: 'Domain-specific applications',
    attributes: ['name', 'domain', 'benefits', 'implementation']
}),
(crossDomainBridge:EntityType {
    name: 'CrossDomainBridge',
    description: 'Connections between domains',
    attributes: ['name', 'source_domain', 'target_domain', 'transformation_process']
}),
(entityTemplate:EntityType {
    name: 'EntityTemplate',
    description: 'Template for entities with tiered knowledge structure',
    attributes: [
        'name',
        'description',
        'tier_L1',      // Core concepts (100-200 words)
        'tier_L2_file', // Functional details file reference (500-1000 words)
        'tier_L3_file'  // Complete knowledge file reference (2000+ words)
    ]
});

// Example Symbol Creation Template
CREATE (example_symbol:Symbol {
    original_notation: 'α',
    domains: ['Physics', 'Mathematics', 'Engineering'],
    context_definitions: [
        {
            domain: 'Heat Transfer',
            meaning: 'Thermal diffusivity',
            units: 'm²/s',
            equation_context: 'q = α ∇²T'
        }
    ],
    alternative_notations: ['thermal_diffusivity'],
    paper_source: {
        title: 'Heat Transfer Principles',
        authors: ['Smith et al.'],
        year: 2024,
        doi: '10.xxxx/example'
    }
})

// Create Indexes for Efficient Querying
CREATE INDEX symbol_original_notation_idx FOR (s:Symbol) ON (s.original_notation)
CREATE INDEX symbol_domains_idx FOR (s:Symbol) ON (s.domains)
CREATE INDEX symbol_alt_notations_idx FOR (s:Symbol) ON (s.alternative_notations)

// Create relationships for symbol conflict resolution
MATCH (s1:Symbol), (s2:Symbol)
WHERE s1.original_notation = s2.original_notation AND id(s1) <> id(s2)
CREATE (s1)-[:POTENTIAL_CONFLICT {
    resolution_strategy: "context_dependent",
    disambiguation_rule: "Use domain context to differentiate meaning"
}]->(s2)

// Define key relationship types
CREATE
(symbolInterpretation:RelationshipType {
    name: 'HAS_INTERPRETATION',
    description: 'Connects a symbol to its domain-specific interpretations'
}),
(symbolAppearance:RelationshipType {
    name: 'APPEARS_IN',
    description: 'Connects a symbol to publications where it appears',
    attributes: ['page', 'context', 'notation_used']
}),
(domainHierarchy:RelationshipType {
    name: 'BELONGS_TO',
    description: 'Connects a domain to its parent domain'
}),
(symbolEquivalence:RelationshipType {
    name: 'IS_EQUIVALENT_TO',
    description: 'Connects symbols that have the same meaning in different notations'
}),
(mathematicalRelations:RelationshipType {
    name: 'MathematicalRelations',
    description: 'Mathematical relationships between entities',
    types: ['derives_from', 'is_equivalent_to', 'approximates']
}),
(hierarchicalRelations:RelationshipType {
    name: 'HierarchicalRelations',
    description: 'Hierarchical relationships between entities',
    types: ['is_a', 'type_of', 'subclass_of', 'instance_of']
}),
(implementationRelations:RelationshipType {
    name: 'ImplementationRelations',
    description: 'Implementation relationships between entities',
    types: ['implements', 'realizes', 'extends', 'optimizes']
}),
(crossDomainRelations:RelationshipType {
    name: 'CrossDomainRelations',
    description: 'Cross-domain relationships between entities',
    types: ['transforms_to', 'maps_between', 'translates_from']
}),
(comparativeRelations:RelationshipType {
    name: 'ComparativeRelations',
    description: 'Comparative relationships between entities',
    types: ['similar_to', 'different_from', 'improves_upon']
});

// Add constraints to ensure data integrity
CREATE CONSTRAINT symbol_unique_constraint FOR (s:Symbol) REQUIRE (s.original_notation, s.domain) IS UNIQUE;
CREATE CONSTRAINT publication_doi_constraint FOR (p:Publication) REQUIRE p.doi IS UNIQUE;

// Add example relationships for the existing symbol
MATCH (s:Symbol {original_notation: 'α'})
CREATE (htDomain:Domain {name: 'Heat Transfer', description: 'Study of thermal energy transfer'})
CREATE (htContext:SymbolContext {
    domain: 'Heat Transfer',
    meaning: 'Thermal diffusivity',
    units: 'm²/s',
    equation_context: 'q = α ∇²T'
})
CREATE (pub:Publication {
    title: 'Heat Transfer Principles',
    authors: ['Smith et al.'],
    year: 2024,
    doi: '10.xxxx/example'
})
CREATE (s)-[:HAS_INTERPRETATION]->(htContext)
CREATE (htContext)-[:BELONGS_TO]->(htDomain)
CREATE (s)-[:APPEARS_IN {page: 42, context: 'Introduction of thermal diffusivity coefficient'}]->(pub);

// Connect nomenclature system to broader knowledge domain structure
CREATE (nomenclatureSystem:System:Entity {
    name: 'Nomenclature System',
    description: 'System for standardizing mathematical terminology and notation',
    primary_domain: 'cross_domain'
})

// Create example cross-domain connection
CREATE (mathConcept:MathematicalConcept:Entity {
    name: 'Legendre Polynomial Coefficient Decay Rate',
    tier_L1: 'Characterizes how quickly Legendre polynomial coefficients decrease. Indicates function smoothness when rate exceeds threshold.',
    tier_L2_file: 'numerics/concepts/legendre_polynomial_decay_rate.md',
    tier_L3_file: 'numerics/concepts/legendre_polynomial_decay_rate_full.md'
})

// Connect symbol to mathematical concept
MATCH (s:Symbol {original_notation: 'α'})
MATCH (concept:MathematicalConcept {name: 'Legendre Polynomial Coefficient Decay Rate'})
CREATE (concept)-[:has_notation]->(s)

// Connect symbol system to domain hierarchy example
CREATE (domainNode:Domain:Entity {
    name: 'Approximation Theory',
    path: 'numerics/spectral_methods/approximation_theory'
})

CREATE (nomenclatureSystem)-[:applies_to]->(domainNode)

// Create cross-domain bridge example
CREATE (bridge:CrossDomainBridge:Entity {
    name: 'Nomenclature Standardization Bridge',
    source_domain: 'mathematics',
    target_domain: 'applications',
    transformation_process: 'Standardization of notation across pure and applied domains',
    tier_L1: 'System for ensuring consistent mathematical notation across theoretical and applied domains.',
    tier_L2_file: 'cross_domain_bridges/nomenclature_standardization.md'
})

CREATE (nomenclatureSystem)-[:enables]->(bridge)

// Add MSC, ZbMATH, and MathSciNet integration
CREATE (conceptToLink:MathematicalConcept {name: 'Spectral Method'})

CREATE (mscClass:MSCClassification:Entity {
  primary: "65M70",
  secondary: ["65M60", "35Q30"],
  descriptors: {
    "65M70": "Spectral, collocation and related methods",
    "65M60": "Finite element methods",
    "35Q30": "Navier-Stokes equations"
  }
})

CREATE (extRef:ExternalReference:Entity {
  zbmath_id: "4081.65093",
  mathscinet_id: "MR1178650",
  standard_references: [
    {
      type: "book",
      title: "Spectral Methods in Fluid Dynamics",
      authors: ["C. Canuto", "M.Y. Hussaini", "A. Quarteroni", "T.A. Zang"],
      year: 1988,
      publisher: "Springer-Verlag"
    }
  ]
})

CREATE (conceptToLink)-[:HAS_CLASSIFICATION]->(mscClass)
CREATE (conceptToLink)-[:HAS_EXTERNAL_REFERENCE]->(extRef)

// Add detailed conflict resolution documentation
CREATE (conflictDoc:SymbolConflictDocumentation:Entity {
  conflict_type: "symbol",
  symbol: "λ",
  sources: [
    {paper_id: "Smith2020", meaning: "eigenvalue", context: "linear algebra"},
    {paper_id: "Jones2019", meaning: "wavelength", context: "wave mechanics"}
  ],
  resolution: {
    choice: "context_dependent",
    rule: "Use λ for eigenvalues in linear algebra contexts; specify as λ_wave for wavelength"
  },
  metadata: {
    resolved_by: "J. Chen",
    resolution_date: "2023-04-15",
    authority: "SIAM Notation Guide 2019"
  }
})