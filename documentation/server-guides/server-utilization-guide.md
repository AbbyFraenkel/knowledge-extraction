# Server Utilization Guide for Paper Analysis

This guide outlines how to effectively use various servers and tools during paper analysis, with a focus on transitioning from Atlas to direct Cypher file generation. It provides specific commands and best practices for each server.

## Overview of Available Servers

### Primary Servers
1. `pdf-to-markdown`: Converts PDF files to markdown with OCR support
2. `sequential-thinking`: Assists with complex mathematical reasoning
3. `read_file` / `write_file`: Manages local file system
4. `juliadoc`: Accesses Julia documentation

### Domain-Specific Servers
1. `mcp-scholarly`: Provides academic context for papers
2. `webresearch`: Supplies application domain information

## Best Practices for Server Usage

### Context Window Optimization
- **Always** save complete paper extractions to file system immediately
- **Minimize** keeping large content in context
- **Prefer** loading specific sections or concepts as needed
- **Use** sequential-thinking for complex mathematical analysis only

### Token Efficiency
- **Prefer** `read_file` over any other method for accessing content
- **Save** interim results to files to free context
- **Avoid** repeating large extractions in the context

## Server-Specific Usage Guidelines

### 1. PDF Processing with OCR

#### Usage Pattern
```
<function_calls>
<invoke name="pdf-to-markdown">
<parameter name="filepath">[path-to-pdf]</parameter>
</invoke>
</function_calls>
```

#### Immediate Storage
After processing, immediately save the result:
```
<function_calls>
<invoke name="write_file">
<parameter name="path">/projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle].md</parameter>
<parameter name="content">[extraction-content]</parameter>
</invoke>
</function_calls>
```

#### Best Practices
- Always use OCR mode for mathematical papers
- Save complete extractions immediately
- Create a summary for continued analysis
- Release the full extraction from context after saving

### 2. Sequential Thinking for Mathematical Analysis

#### Usage Pattern
```
<function_calls>
<invoke name="sequential-thinking">
<parameter name="thought">[initial-analysis-step]</parameter>
<parameter name="thoughtNumber">1</parameter>
<parameter name="totalThoughts">[estimated-total]</parameter>
<parameter name="nextThoughtNeeded">true</parameter>
</invoke>
</function_calls>
```

#### When to Use
- Complex mathematical proofs
- Convergence analysis
- Algorithm complexity assessment
- Method comparison

#### Best Practices
- Start with a clear problem statement
- Break analysis into distinct steps
- Adjust thought count as needed
- Save final analysis to file system

### 3. File System Management

#### Reading Files
```
<function_calls>
<invoke name="read_file">
<parameter name="path">/projects/git/[repository]/[file-path]</parameter>
</invoke>
</function_calls>
```

#### Writing Files
```
<function_calls>
<invoke name="write_file">
<parameter name="path">/projects/git/[repository]/[file-path]</parameter>
<parameter name="content">[file-content]</parameter>
</invoke>
</function_calls>
```

#### Best Practices
- Use consistent file naming conventions
- Store content in appropriate repositories
- Create directory structure as needed
- Use descriptive file names with author and year

### 4. Julia Documentation Access

#### Usage Pattern
```
<function_calls>
<invoke name="juliadoc">
<parameter name="path">[package].[module].[function]</parameter>
</invoke>
</function_calls>
```

#### SciML Documentation
```
<function_calls>
<invoke name="juliadoc">
<parameter name="path">SciMLBase.ODEProblem</parameter>
</invoke>
</function_calls>
```

#### Best Practices
- Refer to SciML documentation for implementation patterns
- Compare paper algorithms with existing Julia implementations
- Look for similar functionality in the SciML ecosystem
- Save implementation notes to file system

### 5. Scholarly Research

#### Usage Pattern
```
<function_calls>
<invoke name="mcp-scholarly">
<parameter name="query">[research-question]</parameter>
</invoke>
</function_calls>
```

#### Best Practices
- Use for academic context not covered in the paper
- Focus on specific aspects of numerical methods
- Compare with established literature
- Save synthesized knowledge to file system

### 6. Web Research (When Needed)

#### Usage Pattern
```
<function_calls>
<invoke name="webresearch">
<parameter name="query">[domain-specific-question]</parameter>
</invoke>
</function_calls>
```

#### Best Practices
- Use only for application domain information
- Focus on engineering context for pasteurization
- Verify information with scholarly sources
- Use sparingly to conserve context space

## Cypher File Generation (Replacing Atlas)

### Entity Creation

#### Manual Approach
Instead of using Atlas for knowledge graph operations, create Cypher files:

```
<function_calls>
<invoke name="write_file">
<parameter name="path">/projects/git/knowledge-extraction/cypher/entities/[EntityName].cypher</parameter>
<parameter name="content">
// Create entity node
CREATE (entity:EntityType {
  name: "EntityName",
  description: "Entity description",
  properties: ["property1", "property2"],
  // Additional properties
})
</parameter>
</invoke>
</function_calls>
```

#### Using Templates
```
<function_calls>
<invoke name="read_file">
<parameter name="path">/projects/git/knowledge-extraction/cypher/templates/algorithm-node.cypher</parameter>
</invoke>
</function_calls>
```

Then modify the template and save as a new file.

### Relationship Creation

#### Manual Approach
```
<function_calls>
<invoke name="write_file">
<parameter name="path">/projects/git/knowledge-extraction/cypher/relationships/[RelationshipName].cypher</parameter>
<parameter name="content">
// Create relationship
MATCH (source:EntityType {name: "SourceName"})
MATCH (target:EntityType {name: "TargetName"})
CREATE (source)-[:RELATIONSHIP_TYPE {
  property1: "value1",
  property2: "value2"
}]->(target)
</parameter>
</invoke>
</function_calls>
```

#### Using Templates
```
<function_calls>
<invoke name="read_file">
<parameter name="path">/projects/git/knowledge-extraction/cypher/templates/method-relationship.cypher</parameter>
</invoke>
</function_calls>
```

Then modify the template and save as a new file.

## Workflow Integration Examples

### Complete Paper Analysis Workflow

1. **Process PDF and Save Extraction**
```
<function_calls>
<invoke name="pdf-to-markdown">
<parameter name="filepath">[path-to-pdf]</parameter>
</invoke>
</function_calls>

<function_calls>
<invoke name="write_file">
<parameter name="path">/projects/git/extracted-content-markdown/papers/Smith2022_SpectralMethod.md</parameter>
<parameter name="content">[extraction-content]</parameter>
</invoke>
</function_calls>
```

2. **Load Analysis Prompt**
```
<function_calls>
<invoke name="read_file">
<parameter name="path">/projects/git/knowledge-extraction/prompts/analysis-prompts/consolidated-algorithm-extraction-prompt.md</parameter>
</invoke>
</function_calls>
```

3. **Analyze Algorithm with Sequential Thinking**
```
<function_calls>
<invoke name="sequential-thinking">
<parameter name="thought">Analyzing the adaptive hp-refinement algorithm from section 3.2...</parameter>
<parameter name="thoughtNumber">1</parameter>
<parameter name="totalThoughts">5</parameter>
<parameter name="nextThoughtNeeded">true</parameter>
</invoke>
</function_calls>
```

4. **Save Algorithm Documentation**
```
<function_calls>
<invoke name="write_file">
<parameter name="path">/projects/git/extracted-numerical-methods/algorithms/AdaptiveHPRefinement.md</parameter>
<parameter name="content">[algorithm-documentation]</parameter>
</invoke>
</function_calls>
```

5. **Create Cypher Files**
```
<function_calls>
<invoke name="read_file">
<parameter name="path">/projects/git/knowledge-extraction/cypher/templates/algorithm-node.cypher</parameter>
</invoke>
</function_calls>

<function_calls>
<invoke name="write_file">
<parameter name="path">/projects/git/knowledge-extraction/cypher/entities/AdaptiveHPRefinementAlgorithm.cypher</parameter>
<parameter name="content">[modified-template-content]</parameter>
</invoke>
</function_calls>
```

6. **Analyze Implementation Strategy**
```
<function_calls>
<invoke name="read_file">
<parameter name="path">/projects/git/knowledge-extraction/prompts/implementation-prompts/julia-sciml-implementation-prompt.md</parameter>
</invoke>
</function_calls>

<function_calls>
<invoke name="write_file">
<parameter name="path">/projects/git/extracted-numerical-methods/implementations/AdaptiveHPRefinement_implementation.md</parameter>
<parameter name="content">[implementation-strategy]</parameter>
</invoke>
</function_calls>
```

## Token Usage Optimization

### High-Impact Practices
1. **Immediately save full extractions**: After PDF processing, immediately save the complete text
2. **Use file references**: Instead of including full content, reference file paths
3. **Load specific sections**: When analyzing, load only relevant sections
4. **Save intermediate results**: Store analysis steps as you go
5. **Use templates**: Load and modify templates rather than creating content from scratch

### Context Window Management
1. **Three-Tier Knowledge Approach**:
   - **L1 (Core)**: Keep in context (100-200 words per concept)
   - **L2 (Detailed)**: Load when needed (500-1000 words)
   - **L3 (Complete)**: Always keep in files (2000+ words)

2. **Progressive Knowledge Loading**:
   - Start with core concepts (L1)
   - Load details (L2) only when analyzing specific aspects
   - Reference complete content (L3) via file paths

This approach ensures efficient token usage while maintaining comprehensive knowledge extraction.
