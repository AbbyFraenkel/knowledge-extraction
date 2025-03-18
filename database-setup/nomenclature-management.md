# Nomenclature Management Guidelines

## Core Principles

1. **Symbol Preservation**
   - Capture symbols exactly as they appear in source documents
   - Never modify original mathematical notation
   - Maintain explicit links to source papers

2. **Multi-Domain Interpretation**
   - Allow multiple domain-specific interpretations
   - Track context and usage for each symbol
   - Prevent inappropriate equivalencies

## Symbol Representation Schema

### Attributes
- `original_notation`: Exact symbol from source
- `domains`: Applicable research domains
- `context_definitions`: Domain-specific meanings
- `alternative_notations`: Known aliases
- `paper_source`: Bibliographic information

### Example Template
```json
{
    "original_notation": "α",
    "domains": ["Physics", "Mathematics", "Engineering"],
    "context_definitions": [
        {
            "domain": "Heat Transfer",
            "meaning": "Thermal diffusivity",
            "units": "m²/s",
            "equation_context": "q = α ∇²T"
        }
    ]
}
```

## Extraction Guidelines
1. Capture symbol verbatim
2. Link to source document
3. Provide comprehensive context
4. Allow flexible interpretation

## Search and Retrieval Strategies
- Context-aware symbol resolution
- Multiple domain mapping
- Provenance tracking

## Knowledge Graph Implementation

Use the following Cypher commands to implement the nomenclature management system:

```cypher
// Create a mathematical symbol with domain-specific interpretations
CREATE (symbol:MathematicalSymbol:Entity {
  original_notation: "α",
  unicode_codepoint: "U+03B1",
  latex_representation: "\\alpha",
  domains: ["Physics", "Mathematics", "Engineering"]
})

// Create domain-specific interpretations
CREATE (heat_transfer:SymbolContext:Entity {
  domain: "Heat Transfer",
  meaning: "Thermal diffusivity",
  units: "m²/s",
  equation_context: "q = α ∇²T"
})

CREATE (fluid_dynamics:SymbolContext:Entity {
  domain: "Fluid Dynamics",
  meaning: "Angle of attack",
  units: "radians",
  equation_context: "L = L_0 + L_α·α"
})

// Link symbol to its domain-specific interpretations
CREATE (symbol)-[:HAS_INTERPRETATION]->(heat_transfer)
CREATE (symbol)-[:HAS_INTERPRETATION]->(fluid_dynamics)

// Link symbol to source publications
CREATE (paper:Publication:Entity {
  title: "Heat Transfer Principles",
  authors: ["Smith et al."],
  year: 2024,
  doi: "10.xxxx/example"
})

CREATE (symbol)-[:APPEARS_IN {
  page: 42,
  context: "Introduction of thermal diffusivity coefficient"
}]->(paper)
```