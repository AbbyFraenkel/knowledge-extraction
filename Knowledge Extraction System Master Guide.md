# Knowledge Extraction System Master Guide

This master guide provides a comprehensive overview of the knowledge extraction system, designed to extract mathematical content from academic papers and organize it into a structured format, with direct Cypher file generation replacing the Atlas server.

## System Purpose

This system serves two interrelated projects:

1. **KitchenSink**: A novel multi-level orthogonal collocation solver in Julia
2. **MSc Thesis**: Modeling tunnel pasteurization of beer using numerical methods

The extraction system preserves mathematical knowledge with complete fidelity while organizing it for different audiences and applications.

## Core Workflows

### Paper Analysis Workflow

#### 1. Initial Processing
- Convert PDF to markdown with OCR for text, Latin, Greek, and mathematical notation
- Preserve complete equations and mathematical formulations
- Save full extraction to `/projects/git/extracted-content-markdown/papers/`

#### 2. Knowledge Extraction
- Extract key mathematical concepts with proper LaTeX
- Document algorithms with complete mathematical details
- Identify implementation considerations
- Create Cypher files for knowledge graph integration

#### 3. Implementation Analysis
- Design Julia type hierarchies following SciML conventions
- Outline function interfaces with type specifications
- Document performance considerations
- Develop testing strategies
- Create implementation notes in `/projects/git/extracted-numerical-methods/implementations/`

#### 4. Application Integration
- Analyze relevance to pasteurization modeling
- Identify integration pathways for KitchenSink
- Document practical applications
- Create application materials in `/projects/git/extracted-tunnel/`

#### 5. Cross-Paper Integration
- Identify relationships with existing knowledge
- Create comparative analyses
- Generate synthesis documents
- Update method comparisons

## Improved Prompt System

The updated system uses consolidated prompts to streamline the analysis process:

### 1. Master Guides
- `consolidated-master-prompt.md`: Complete framework for paper analysis
- Includes all aspects of workflow in a single, comprehensive guide

### 2. Analysis Prompts
- `consolidated-algorithm-extraction-prompt.md`: Focused extraction of algorithms
- Preserves complete mathematical details with no summarization

### 3. Implementation Prompts
- `julia-sciml-implementation-prompt.md`: SciML-style Julia implementation

## Cypher Integration (Replacing Atlas)

Instead of using the Atlas server, the system now uses direct Cypher file generation:

### 1. Schema Definition
- Entity types defined in `/cypher/schema/entity-types.cypher`
- Relationship types defined in `/cypher/schema/relationship-types.cypher`

### 2. Templates
- Algorithm node template in `/cypher/templates/algorithm-node.cypher`
- Method relationship template in `/cypher/templates/method-relationship.cypher`

### 3. Query Patterns
- Standard queries for algorithm extraction in `/cypher/queries/algorithm-extraction.cypher`
- Method comparison queries in `/cypher/queries/method-comparison.cypher`

### 4. Entity Creation Process
1. Extract knowledge from paper
2. Load appropriate template
3. Fill template with entity details
4. Save to `/cypher/entities/[EntityName].cypher`

### 5. Relationship Creation Process
1. Identify entity relationships
2. Load relationship template
3. Fill template with relationship details
4. Save to `/cypher/relationships/[RelationshipName].cypher`

## Knowledge Representation

The system uses a tiered approach to knowledge representation:

### 1. L1 Tier (Core Knowledge)
- Brief descriptions (100-200 words)
- Key equations and concepts
- Primary relationships
- Kept in context during analysis

### 2. L2 Tier (Detailed Knowledge)
- Extended explanations (500-1000 words)
- Complete mathematical derivations
- Detailed algorithm steps
- Loaded as needed during analysis

### 3. L3 Tier (Complete Knowledge)
- Comprehensive documentation (2000+ words)
- Full algorithm details with all cases
- Complete implementation considerations
- Always stored in file system, referenced via paths

## Repository Structure

The knowledge extraction system spans multiple repositories:

### 1. knowledge-extraction
- Core framework and tools
- Prompts and templates
- Cypher files and queries
- Documentation and guides

### 2. extracted-content-markdown
- Complete paper extractions
- Synthesis documents
- Cross-paper analyses
- General mathematical content

### 3. extracted-numerical-methods
- Algorithm documentation
- Method descriptions
- Implementation strategies
- Testing frameworks

### 4. extracted-tunnel
- Pasteurization models
- Heat transfer applications
- Container modeling
- Process optimizations

## Implementation Guidelines

### Julia SciML Implementation Standards

All Julia implementations should follow these guidelines:

#### 1. Type System Design
- Clear abstract type hierarchies
- Parametric types with constraints
- Type stability across all code paths
- Immutable structs where appropriate

#### 2. Function Interfaces
- Both in-place (!) and out-of-place versions
- Multiple dispatch for different types
- Clear parameter documentation
- Comprehensive docstrings with LaTeX

#### 3. Documentation
- Mathematical foundations in docstrings
- Paper references with equation numbers
- Usage examples
- Performance characteristics

#### 4. Testing
- Analytical solutions when available
- Convergence rate verification
- Edge case testing
- Parameter sensitivity analysis

## Application Integration

### KitchenSink Integration

Focus on these aspects when analyzing integration with KitchenSink:

#### 1. Orthogonal Collocation Compatibility
- Relationship to existing collocation framework
- Integration with basis function system
- Adaptation for multi-level approach

#### 2. Moving Boundary Handling
- Phase change modeling
- Interface tracking
- Mesh adaptation

#### 3. Conservation Properties
- Preservation of physical properties
- Error control
- Stability analysis

### Pasteurization Applications

Focus on these aspects when analyzing tunnel pasteurization:

#### 1. Heat Transfer Modeling
- Container thermal properties
- Spray and convection effects
- Temperature-dependent parameters

#### 2. Process Optimization
- Pasteurization unit calculation
- Energy efficiency
- Time-temperature profiles

## Documentation Standards

All extracted knowledge should be documented following these standards:

### 1. Mathematical Content
- Use LaTeX for all equations
- Preserve original notation where possible
- Document variable meanings
- Include units for physical quantities

### 2. Algorithm Documentation
- Structured pseudocode
- All preconditions and postconditions
- Complexity analysis
- Implementation considerations

### 3. Method Documentation
- Core mathematical foundation
- Relationship to other methods
- Convergence properties
- Application domains

### 4. Implementation Documentation
- Type hierarchies
- Function signatures
- Performance considerations
- Testing strategies

## Server Utilization

Use these servers efficiently during the extraction process:

### 1. pdf-to-markdown
- Convert PDFs with OCR support
- Preserve mathematical notation
- Save complete extractions immediately

### 2. sequential-thinking
- Complex mathematical analysis
- Algorithm complexity assessment
- Convergence proofs
- Method comparisons

### 3. File System Operations
- read_file for accessing content
- write_file for saving extractions
- Consistent file naming conventions
- Appropriate repository selection

### 4. Additional Servers (When Needed)
- juliadoc for SciML reference
- mcp-scholarly for academic context
- webresearch for application domains

## Best Practices

### Token Efficiency
- Save complete extractions immediately
- Reference files instead of including content
- Load specific sections as needed
- Use templates for consistency

### Context Window Management
- Maintain L1 knowledge in context
- Load L2 knowledge when analyzing specific aspects
- Reference L3 knowledge via file paths
- Release context by saving intermediate results

### Cross-Domain Integration
- Create explicit relationships between domains
- Document parameter mappings
- Establish consistent nomenclature
- Develop synthesis documents

## Example Workflow

```
1. Load consolidated master prompt
2. Process paper with OCR and save complete extraction
3. Extract algorithms and mathematical concepts
4. Create implementation strategy document
5. Generate Cypher files for knowledge graph
6. Analyze pasteurization applications
7. Create cross-references with existing knowledge
8. Generate synthesis documents
```

This master guide provides a comprehensive framework for extracting, organizing, and implementing mathematical knowledge from academic papers, with a focus on numerical methods and their applications to KitchenSink and tunnel pasteurization.
