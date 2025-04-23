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

   Perform the extraction systematically:
   ```
   1. Scan the entire paper starting with abstract and introduction
   2. Pay special attention to definition sections, equation blocks, and nomenclature lists
   3. Capture each unique symbol along with its first appearance location
   4. Document the precise contextual meaning for each symbol
   5. Group symbols by their mathematical or application context
   ```

   > **Symbol Extraction Process in Detail**
   > 
   > The symbol extraction process follows the symbol-concept separation principle:
   > 
   > **Phase 1: Initial Symbol Identification**
   > - Read through the entire paper methodically, section by section
   > - Document each new mathematical symbol at its first occurrence
   > - Note the exact visual form as it appears in the paper
   > - Record the section, page, and equation number for each first appearance
   > - Capture the contextual definition provided by the authors
   > 
   > **Phase 2: Symbol Property Documentation**
   > - For each identified symbol, compile a comprehensive property set:
   >   - **Original Notation**: Exact form as it appears (e.g., α, ∇Φ, C_p)
   >   - **LaTeX Representation**: Precise LaTeX code (e.g., `\alpha`, `\nabla\Phi`, `C_p`)
   >   - **Context**: Mathematical or application domain where the symbol is used
   >   - **Meaning**: Precise definition using the paper's own terminology
   >   - **Role**: Function of the symbol (variable, parameter, operator, etc.)
   >   - **Properties**: Dimensionality, units, constraints, etc.
   > 
   > **Phase 3: Concept Identification**
   > - For each symbol, identify the underlying mathematical concept it represents
   > - Note whether the concept appears in other papers under different notation
   > - Document the relationship between the symbol and the concept
   > 
   > **Phase 4: Context Grouping**
   > - Group symbols by their context within the paper:
   >   - Core mathematical formulation
   >   - Numerical discretization
   >   - Error analysis
   >   - Implementation considerations
   >   - Application domains

2. **Document Symbol Definitions**:
   ```
   For each identified symbol, please extract:
   - The original symbol (in LaTeX)
   - Its precise meaning in the paper's context
   - Any units or dimensions
   - Where it first appears
   - Any alternative notations used
   ```

   Document comprehensive properties for each symbol type:
   ```
   For variables and parameters:
   - Document range of values or constraints (e.g., "positive real number")
   - Note whether the symbol represents a known or unknown quantity
   - Specify whether the value is constant or varies within the problem domain
   - For KitchenSink: Note computational role (e.g., "Discretization parameter")

   For operators and functions:
   - Document precise input and output spaces
   - Note any special properties (linearity, continuity, etc.)
   - Record explicit definition or formula provided in the paper
   - For KitchenSink: Document implementation approach for operator discretization

   For indices and subscripts:
   - Document range and meaning of each index
   - Note any special indexing conventions
   - Record zero-based vs. one-based indexing choices
   - For KitchenSink: Map to Julia indexing conventions (one-based)

   For sets and spaces:
   - Document elements contained in the set
   - Note any topological or algebraic properties
   - Record notation for special subsets
   - For KitchenSink: Map to concrete data structures in implementation
   ```

3. **Create Symbol Registry**:
   ```
   Please create a symbol registry document using the Symbol Registry Template and save to:
   /projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle]_symbols.md
   ```
   
   Follow these steps to create a comprehensive Symbol Registry:
   
   - Use the template at `/projects/git/knowledge-extraction/2-templates/SymbolRegistryTemplate.md`
   - Complete all required sections for the paper's symbols
   - Organize symbols by category (variables, operators, indices, etc.)
   - Include KitchenSink-specific sections for relevant symbols
   - Document any domain-specific interpretations
   - Create tables for cross-domain mappings
   - Note any symbol conflicts with resolution strategies

4. **Generate Symbol Cypher Files**:
   ```
   Please create Cypher files for each significant symbol using the symbol-node.cypher template and save to:
   /projects/git/knowledge-extraction/cypher/symbols/[SymbolName]_[PaperContext].cypher
   ```
   
   For each significant symbol:
   
   - Use the template at `/projects/git/knowledge-extraction/cypher/templates/symbol-node.cypher`
   - Create the basic Symbol node with all properties
   - Establish APPEARS_IN relationships to papers
   - Create REPRESENTS relationships to concepts
   - Add HAS_INTERPRETATION_IN relationships for domain interpretations
   - Document any CONFLICTS_WITH or SYNONYM_OF relationships
   - Add KitchenSink-specific properties for specialized symbol types

5. **Check for Symbol Conflicts**:
   ```
   Please check if any of these symbols conflict with previously extracted symbols in our knowledge base.
   For any conflicts, document:
   - The conflicting symbols and their contexts
   - The different meanings assigned to the same symbol
   - A proposed resolution strategy
   ```
   
   Conflict types to identify:
   
   - **Same-paper conflicts**: Same symbol used with different meanings within one paper
   - **Cross-paper conflicts**: Symbol conflicts with previously extracted symbols
   - **Convention conflicts**: Symbol deviates from standard conventions in the field
   - **Implementation conflicts**: Symbol clashes with programming language keywords or reserved names
   
   For each conflict, create proper documentation in both the Symbol Registry and Cypher files.

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

1. **Identify Conflict Types**:
   ```
   Please categorize each symbol conflict by type:
   - Same-paper conflicts: Same symbol has different meanings within one paper
   - Cross-paper conflicts: Symbol conflicts with previously extracted symbols
   - Convention conflicts: Symbol deviates from standard conventions in the field
   - Implementation conflicts: Symbol clashes with programming language keywords
   ```

2. **Document Conflicts Explicitly**:
   ```
   Please create a conflict documentation for each symbol conflict:
   - Original symbol (in LaTeX)
   - Paper contexts where it appears
   - Different meanings in different contexts
   - Where each meaning is used in the paper
   - Author comments about notation choices (if any)
   - Potential for confusion across domains
   - Recommended canonical representation for cross-references
   ```

3. **Apply Resolution Strategies**:
   ```
   Please apply the appropriate resolution strategy for each conflict:
   - Context disambiguation: Use context to determine intended meaning
   - Explicit qualification: Add qualifiers when referencing (e.g., "α_thermal" vs "α_spectral")
   - Domain boundary: Keep meanings separate based on domain boundaries
   - Canonical reference: Designate preferred form for cross-domain references
   - Implementation mapping: Create explicit mapping to implementation variables
   ```

4. **Create Conflict Resolution Relationships**:
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

5. **Update Symbol Registry**:
   ```
   Please update the symbol registry with conflict information and save to:
   /projects/git/extracted-content-markdown/papers/[AuthorYear]_[ShortTitle]_symbols_with_conflicts.md
   ```

6. **Document Resolution Examples**:
   ```
   For each resolved conflict, please provide:
   - Clear examples of proper cross-referencing
   - Guidelines for using the symbols in different contexts
   - Mappings to implementation variables where applicable
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

2. **Create Domain Mapping Tables**:
   ```
   Please create explicit mapping tables between domains with the following structure:
   | Symbol | Mathematical Context | Engineering Domain | Domain-Specific Meaning | Units | Standard Usage |
   |--------|---------------------|-------------------|------------------------|-------|---------------|
   | [sym]  | [math context]      | [domain]          | [domain meaning]       | [domain units] | [usage notes] |
   ```

3. **Document KitchenSink Implementation Mappings**:
   ```
   Please map mathematical symbols to their Julia implementations:
   | Symbol | Mathematical Meaning | Julia Implementation | Variable Type | Module | Implementation Notes |
   |--------|---------------------|---------------------|---------------|--------|---------------------|
   | [sym]  | [math meaning]      | [julia var]         | [type]        | [module] | [notes] |
   
   For each mapping, document:
   - Symbol type (mathematical type)
   - Julia type (e.g., Float64, Array{Float64,1})
   - Module where implemented
   - Function signature
   - Type constraints
   - Default values (if applicable)
   - Documentation string
   ```

4. **Document Pasteurization-Specific Mappings**:
   ```
   Please map mathematical symbols to pasteurization parameters:
   | Symbol | Mathematical Meaning | Pasteurization Interpretation | Physical Units | Measurement Method |
   |--------|---------------------|-------------------------------|---------------|-------------------|
   | [sym]  | [math meaning]      | [pasteurization meaning]      | [units]       | [measurement] |
   
   For each mapping, document:
   - Physical interpretation in pasteurization
   - Industry-specific units
   - Typical range of values in brewing industry
   - Measurement or calculation method
   - Process impact
   - Regulatory considerations (if applicable)
   ```

5. **Create Domain Interpretation Relationships**:
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

6. **Create Cross-Domain Mapping Document**:
   ```
   Please create a cross-domain symbol mapping document and save to:
   /projects/git/extracted-content-markdown/cross-domain/[MathDomain]_to_[EngineeringDomain]_mapping.md
   ```

7. **Validate Cross-Domain Consistency**:
   ```
   Please verify consistency across domain interpretations:
   - Check for dimensional consistency
   - Validate unit conversions
   - Confirm physical meaning aligns with mathematical properties
   - Verify that the mapping preserves mathematical constraints
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
