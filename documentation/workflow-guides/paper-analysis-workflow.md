# Paper Analysis Workflow Guide

This guide provides a step-by-step process for analyzing academic papers and extracting knowledge into a structured format, using Cypher files for knowledge graph integration instead of the Atlas server.

## Workflow Overview

1. **Initial Setup**: Prepare the analysis environment
2. **Paper Processing**: Convert the paper to analyzable text
3. **Knowledge Extraction**: Extract core concepts, algorithms, and mathematical symbols
4. **Implementation Analysis**: Analyze implementation potential
5. **Cypher File Generation**: Create knowledge graph integration files
6. **Documentation Generation**: Create comprehensive documentation
7. **Cross-Paper Integration**: Integrate with previously analyzed papers

## Detailed Workflow Steps

### 1. Initial Setup

1. **Start Claude Session**: Begin a new Claude session
2. **Load Master Prompt**:
   ```
   Please analyze the following paper using the consolidated master prompt:
   /projects/git/knowledge-extraction/prompts/master-guides/consolidated-master-prompt.md
   ```
3. **Introduce Paper**: Provide paper metadata
   ```
   Paper title: "[Title]"
   Authors: "[Authors]"
   Year: [Year]
   Focus: [Primary focus area, e.g., "Algorithm extraction", "Method comparison"]
   ```

### 2. Paper Processing

1. **Upload Paper**: Upload the PDF file
2. **Process with OCR**:
   ```
   Please process this paper using OCR with support for English, Latin, Greek, and mathematical notation.
   ```
3. **Save Complete Extraction**:
   ```
   Please save the complete extraction to:
   /projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle].md
   ```
4. **Generate Initial Summary**:
   ```
   Please provide an initial summary focusing on the paper's mathematical contributions.
   ```

### 3. Knowledge Extraction

1. **Extract Mathematical Symbols**:
   ```
   Please identify all mathematical symbols used in the paper with their contexts and meanings.
   Focus on:
   - Variables and parameters
   - Mathematical operators
   - Special function notations
   - Index conventions
   ```

2. **Document Symbol Definitions**:
   ```
   For each identified symbol, please extract:
   - The original symbol (in LaTeX)
   - Its precise meaning in the paper's context
   - Any units or dimensions
   - Where it first appears
   - Any alternative notations used
   ```

3. **Create Symbol Registry**:
   ```
   Please create a symbol registry document and save to:
   /projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle]_symbols.md
   ```

4. **Generate Symbol Cypher Files**:
   ```
   Please create Cypher files for each significant symbol using the symbol-node.cypher template and save to:
   /projects/git/knowledge-extraction/cypher/symbols/[SymbolName]_[PaperContext].cypher
   ```

5. **Check for Symbol Conflicts**:
   ```
   Please check if any of these symbols conflict with previously extracted symbols in our knowledge base.
   For any conflicts, document:
   - The conflicting symbols and their contexts
   - The different meanings assigned to the same symbol
   - A proposed resolution strategy
   ```

6. **Select Specific Focus**:
   ```
   For this paper, please focus on [focus area] using the appropriate prompt from:
   /projects/git/knowledge-extraction/prompts/analysis-prompts/
   ```

7. **For Algorithm Extraction**:
   ```
   Please extract the [algorithm name] algorithm from section [section] using:
   /projects/git/knowledge-extraction/prompts/analysis-prompts/consolidated-algorithm-extraction-prompt.md
   ```

8. **For Method Comparison**:
   ```
   Please compare the [method 1] and [method 2] methods using the method comparison template.
   ```

9. **Save Extracted Knowledge**:
   ```
   Please save the extracted [content type] to:
   /projects/git/extracted-numerical-methods/[appropriate-subfolder]/[ContentName].md
   ```

### 4. Implementation Analysis

1. **Analyze Implementation Strategy**:
   ```
   Please analyze the Julia implementation strategy for [algorithm/method] using:
   /projects/git/knowledge-extraction/prompts/implementation-prompts/julia-sciml-implementation-prompt.md
   ```

2. **Generate Implementation Documentation**:
   ```
   Please create implementation documentation for [algorithm/method] and save to:
   /projects/git/extracted-numerical-methods/implementations/[AlgorithmName]_implementation.md
   ```

3. **Analyze KitchenSink Integration**:
   ```
   Please analyze how this implementation would integrate with the KitchenSink solver, particularly for orthogonal collocation.
   ```

4. **Analyze Pasteurization Relevance** (if applicable):
   ```
   Please analyze how this method could be applied to tunnel pasteurization modeling, specifically for heat transfer in beer containers.
   ```

### 5. Cypher File Generation

1. **Create Entity Nodes**:
   ```
   Please create Cypher files for the following entities using the templates in:
   /projects/git/knowledge-extraction/cypher/templates/
   
   Entities:
   - [Entity 1]
   - [Entity 2]
   - ...
   ```

2. **Create Relationship Definitions**:
   ```
   Please create Cypher relationship definitions between these entities:
   - [Entity 1] [RELATIONSHIP] [Entity 2]
   - [Entity 3] [RELATIONSHIP] [Entity 4]
   - ...
   ```

3. **Save Cypher Files**:
   ```
   Please save these Cypher files to:
   /projects/git/knowledge-extraction/cypher/entities/[EntityName].cypher
   /projects/git/knowledge-extraction/cypher/relationships/[RelationshipName].cypher
   ```

4. **Verify Cypher Syntax**:
   ```
   Please verify that all Cypher files follow our schema definitions in:
   /projects/git/knowledge-extraction/cypher/schema/
   ```

### 5.5 Symbol Conflict Resolution

If you identified symbol conflicts in step 3.5, follow these steps to resolve them:

1. **Document Conflicts Explicitly**:
   ```
   Please create a conflict documentation for each symbol conflict:
   - Original symbol (in LaTeX)
   - Paper contexts where it appears
   - Different meanings in different contexts
   - Recommended canonical representation for cross-references
   ```

2. **Create Conflict Resolution Relationships**:
   ```
   Please create Cypher relationships connecting the conflicting symbols:
   
   MATCH (sym1:Symbol {name: "[SYMBOL]", context: "[CONTEXT_1]"})
   MATCH (sym2:Symbol {name: "[SYMBOL]", context: "[CONTEXT_2]"})
   CREATE (sym1)-[:CONFLICTS_WITH {
     resolutionStrategy: "[RESOLUTION_APPROACH]",
     canonicalChoice: "[PREFERRED_SYMBOL]",
     resolutionNotes: "[RESOLUTION_JUSTIFICATION]"
   }]->(sym2)
   ```

3. **Update Symbol Registry**:
   ```
   Please update the symbol registry with conflict information and save to:
   /projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle]_symbols_with_conflicts.md
   ```

### 6. Documentation Generation

1. **Create Algorithm Documentation**:
   ```
   Please create comprehensive documentation for the [algorithm] algorithm and save to:
   /projects/git/extracted-numerical-methods/algorithms/[AlgorithmName].md
   ```

2. **Create Method Documentation**:
   ```
   Please create comprehensive documentation for the [method] method and save to:
   /projects/git/extracted-numerical-methods/methods/[MethodName].md
   ```

3. **Create Implementation Strategy**:
   ```
   Please create an implementation strategy document for [algorithm/method] and save to:
   /projects/git/extracted-numerical-methods/implementations/[Name]_implementation.md
   ```

4. **Create Application Documentation** (if applicable):
   ```
   Please create documentation on how [algorithm/method] applies to pasteurization and save to:
   /projects/git/extracted-tunnel/applications/[Name]_application.md
   ```

### 7. Cross-Paper Integration

1. **Find Related Papers**:
   ```
   Please identify relationships between this paper and previously analyzed papers in our repositories.
   ```

2. **Create Integration Cypher Files**:
   ```
   Please create Cypher files that connect entities from this paper with existing entities from:
   /projects/git/knowledge-extraction/cypher/entities/
   ```

3. **Update Method Comparisons**:
   ```
   Please update the comparison between [method 1] and [existing method 2] based on this paper's findings.
   ```

4. **Create Synthesis Document**:
   ```
   Please create a synthesis document combining knowledge from this paper and [related paper] and save to:
   /projects/git/extracted-content-markdown/synthesis/[Topic]_synthesis.md
   ```

### 7.5 Cross-Domain Symbol Mapping

For mathematical symbols that have specific interpretations in application domains:

1. **Identify Domain-Specific Interpretations**:
   ```
   Please identify how the mathematical symbols map to engineering concepts in the application domain:
   - Which symbols have special meaning in the engineering context
   - How their interpretation differs from pure mathematical usage
   - Any standard units or conventions specific to the domain
   ```

2. **Create Domain Interpretation Relationships**:
   ```
   Please create Cypher relationships for domain-specific interpretations:
   
   MATCH (sym:Symbol {name: "[SYMBOL]", context: "[MATHEMATICAL_CONTEXT]"})
   MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
   CREATE (sym)-[:HAS_INTERPRETATION_IN {
     meaning: "[DOMAIN_SPECIFIC_MEANING]",
     standardUsage: "[STANDARD_USAGE_IN_DOMAIN]",
     units: "[DOMAIN_SPECIFIC_UNITS]"
   }]->(domain)
   ```

3. **Create Cross-Domain Mapping Document**:
   ```
   Please create a cross-domain symbol mapping document and save to:
   /projects/git/extracted-content-markdown/cross-domain/[MathDomain]_to_[EngineeringDomain]_mapping.md
   ```

## Repository Structure Reference

Use these paths for saving extracted content:

1. **Paper Extractions**:
   - `/projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle].md`

2. **Symbol Registries**:
   - `/projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle]_symbols.md`

3. **Algorithms**:
   - `/projects/git/extracted-numerical-methods/algorithms/[AlgorithmName].md`

4. **Methods**:
   - `/projects/git/extracted-numerical-methods/methods/[MethodName].md`

5. **Implementations**:
   - `/projects/git/extracted-numerical-methods/implementations/[Name]_implementation.md`

6. **Pasteurization Applications**:
   - `/projects/git/extracted-tunnel/applications/[Name]_application.md`

7. **Cypher Files**:
   - `/projects/git/knowledge-extraction/cypher/entities/[EntityName].cypher`
   - `/projects/git/knowledge-extraction/cypher/relationships/[RelationshipName].cypher`
   - `/projects/git/knowledge-extraction/cypher/symbols/[SymbolName]_[PaperContext].cypher`

8. **Synthesis Documents**:
   - `/projects/git/extracted-content-markdown/synthesis/[Topic]_synthesis.md`

9. **Cross-Domain Mappings**:
   - `/projects/git/extracted-content-markdown/cross-domain/[MathDomain]_to_[EngineeringDomain]_mapping.md`

## Example Workflow

Here's an example workflow for analyzing a paper on spectral methods:

```
1. "I'd like to analyze this paper on spectral methods using the consolidated master prompt."
   [Upload the PDF]

2. "Please process this paper using OCR and save the complete extraction to:
    /projects/git/extracted-content-markdown/papers/Smith2022_AdaptiveSpectralMethods.md"

3. "Please identify all mathematical symbols used in this paper and create a symbol registry."

4. "Please create Cypher files for these mathematical symbols using the symbol-node.cypher template."

5. "Please focus on algorithm extraction using the consolidated algorithm extraction prompt."

6. "Please extract the adaptive hp-refinement algorithm from section 3.2."

7. "Please save the extracted algorithm to:
    /projects/git/extracted-numerical-methods/algorithms/AdaptiveHPRefinement.md"

8. "Please analyze the Julia implementation strategy using the Julia SciML implementation prompt."

9. "Please create Cypher files for the algorithm and its relationships using the templates."

10. "Please identify relationships between this algorithm and previously analyzed methods."

11. "Please identify any domain-specific interpretations of these mathematical symbols in heat transfer applications."

12. "Please create a cross-domain mapping document for these symbols."
```

This workflow ensures efficient knowledge extraction while maintaining a consistent structure across all analyzed papers.
