# Knowledge Extraction System

This repository contains the framework and tools for extracting, organizing, and implementing mathematical knowledge from academic papers, with a focus on numerical methods, algorithms, and their applications to the KitchenSink solver and tunnel pasteurization modeling.

## Repository Structure

```
knowledge-extraction/
├── prompts/                        # Analysis and extraction prompts
│   ├── master-guides/              # Master guides for analysis workflow
│   ├── analysis-prompts/           # Specialized analysis prompts
│   └── implementation-prompts/     # Implementation-focused prompts
├── cypher/                         # Cypher files for knowledge graph
│   ├── schema/                     # Schema definitions and constraints
│   ├── queries/                    # Query templates for knowledge retrieval
│   ├── templates/                  # Templates for node and relationship creation
│   ├── entities/                   # Entity node Cypher files
│   ├── relationships/              # Relationship Cypher files
│   └── symbols/                    # Symbol node Cypher files
├── documentation/                  # System documentation
│   ├── workflow-guides/            # Step-by-step workflow guides
│   └── server-guides/              # Server utilization documentation
├── 1-process/                      # Process documentation
├── 2-templates/                    # Domain-specific templates
├── 3-examples/                     # Example extractions
├── 4-guidelines/                   # Style and methodology guidelines
├── cross_domain_bridges/           # Cross-domain integration
├── database-setup/                 # Knowledge graph setup files
└── numerics/                       # Numerical method concepts
```

## Getting Started

### Using the Knowledge Extraction System

1. Start with the consolidated master prompt:
   ```
   /prompts/master-guides/consolidated-master-prompt.md
   ```

2. Follow the workflow guide:
   ```
   /documentation/workflow-guides/paper-analysis-workflow.md
   ```

3. Learn about nomenclature handling:
   ```
   /documentation/workflow-guides/nomenclature-handling-tutorial.md
   ```

### Creating Cypher Files

This system uses direct Cypher file generation instead of the Atlas server. To create knowledge graph nodes and relationships:

1. Use templates from `/cypher/templates/`
2. Follow schema definitions in `/cypher/schema/`
3. Save entity and relationship files to appropriate locations

## Core Components

### Prompts

- **Consolidated Master Prompt**: Comprehensive guide for paper analysis
- **Algorithm Extraction Prompt**: Focused on extracting algorithms with complete mathematical details
- **Julia Implementation Prompt**: Analysis of SciML-style implementation approaches

### Cypher Templates

- **Entity Node Templates**: For creating various types of knowledge entities
- **Symbol Node Template**: For creating mathematical symbol entities with context
- **Relationship Templates**: For creating connections between entities
- **Query Templates**: For retrieving and analyzing knowledge

### Documentation

- **Workflow Guides**: Step-by-step process guides
- **Nomenclature Tutorial**: Guide to handling mathematical notation
- **Server Utilization Guides**: How to effectively use available servers

## Analysis Focus Areas

The system supports these primary analysis types:

1. **Mathematical Symbol Extraction**: Extracting and managing mathematical notation
2. **Algorithm Extraction**: Extracting and documenting computational procedures
3. **Method Comparison**: Comparing different numerical approaches
4. **Implementation Strategy**: Analyzing Julia implementation approaches
5. **Application Analysis**: Examining domain-specific applications
6. **Knowledge Graph Construction**: Creating structured knowledge representations

## Key Nomenclature Features

The system includes enhanced support for mathematical notation handling:

1. **Symbol Preservation**: Maintains original notation used in papers
2. **Context-Aware Symbols**: Documents symbol meanings in specific contexts
3. **Symbol Registry**: Creates comprehensive notation reference for papers
4. **Conflict Resolution**: Manages notation conflicts between papers and domains
5. **Cross-Domain Mapping**: Links mathematical notation to engineering interpretations

## Integration with Related Repositories

This knowledge extraction system works with these related repositories:

1. **extracted-content-markdown**
   - General extracted content
   - Symbol registries
   - Cross-domain mappings
   - Location: `/projects/git/extracted-content-markdown/`

2. **extracted-numerical-methods**
   - Numerical method implementations
   - Algorithm descriptions
   - Location: `/projects/git/extracted-numerical-methods/`

3. **extracted-tunnel**
   - Tunnel pasteurization content
   - Applied engineering models
   - Location: `/projects/git/extracted-tunnel/`

## Usage Examples

### Basic Paper Analysis

```
1. Load the consolidated master prompt
2. Upload the PDF and process with OCR
3. Save the complete extraction to extracted-content-markdown
4. Extract mathematical symbols and create a symbol registry
5. Extract algorithms and methods
6. Generate Cypher files for knowledge graph integration
7. Create implementation strategy documents
8. Integrate with existing knowledge
```

### Cross-Domain Integration

```
1. Identify mathematical notation with engineering interpretations
2. Create domain-specific interpretations
3. Generate cross-domain mapping documents
4. Create implementation guidelines for applied contexts
```

## Best Practices

- **Symbol Preservation**: Always maintain original mathematical notation
- **Structured Storage**: Save all extracted content to appropriate repositories
- **Context Awareness**: Document the specific context for each symbol
- **Conflict Documentation**: Explicitly document notation conflicts
- **Complete Preservation**: Maintain all mathematical details in extractions
- **Implementation Pathways**: Always document integration with KitchenSink
- **Knowledge Linkage**: Create explicit relationships between extracted knowledge

## Projects & Applications

The extracted knowledge supports two primary projects:

1. **KitchenSink**: A novel multi-level orthogonal collocation solver in Julia
2. **MSc Thesis**: Modeling tunnel pasteurization of beer using numerical methods

## Contributing

When contributing to this repository:

1. Follow the file structure conventions
2. Use the provided templates for consistency
3. Document all additions and changes
4. Maintain cross-references between related content
5. Preserve original mathematical notation while creating meaning-based links
