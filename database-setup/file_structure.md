# Knowledge Graph File Structure

This document outlines the recommended file structure for storing the L2 and L3 knowledge tiers referenced from the Atlas knowledge graph.

## Root Structure

```
knowledge-extraction/
├── numerics/
│   ├── concepts/            # Mathematical concepts
│   ├── equations/           # Mathematical equations
│   ├── algorithms/          # Algorithm descriptions
│   ├── methods/             # Numerical methods
│   └── implementations/     # Implementations
├── computer_vision/
│   ├── concepts/
│   ├── techniques/
│   ├── algorithms/
│   └── implementations/
├── applications/
│   ├── tunnel_pasteurization/
│   ├── control_systems/
│   └── fluid_dynamics/
└── cross_domain_bridges/
    ├── vision_to_numerics/
    ├── numerics_to_control/
    └── vision_to_applications/
```

## File Naming Conventions

Files should be named using lowercase with underscores, following the entity name in the knowledge graph:

- Concepts: `concept_name.md`
- Equations: `equation_name.md`
- Algorithms: `algorithm_name.md`
- Methods: `method_name.md`
- Applications: `application_name.md`

## Knowledge Tier Structure

Each entity should have knowledge separated into tiers:

- **L1 Tier**: 100-200 words, stored directly in Atlas entity
- **L2 Tier**: 500-1000 words, stored in `.md` files
- **L3 Tier**: 2000+ words, stored in separate `.md` files with `_full` suffix

Example:
```
numerics/concepts/legendre_polynomials.md          # L2 knowledge
numerics/concepts/legendre_polynomials_full.md     # L3 knowledge
```

## File Reference Format

In Atlas entities, use the following format to reference files:

```
FILE:path/to/file.md
```

Example:
```
tier1_knowledge: "Core concept description (100-200 words)"
file_references: "FILE:numerics/concepts/legendre_polynomials.md"
```

## Template Usage

Use the provided templates for creating new files:
- `template_L2_knowledge.md` for L2 knowledge tier
- `template_L3_knowledge.md` for L3 knowledge tier

This maintains consistency across all knowledge files.