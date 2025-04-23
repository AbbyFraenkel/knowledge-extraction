# Mathematical Concept Extraction Prompt

## Purpose

This prompt guides the extraction of mathematical concepts from scientific papers, maintaining complete separation between concepts (meaning) and their symbolic representations (notation). The goal is to identify and document the fundamental mathematical ideas independent of notation, establishing a foundation for the knowledge graph that connects to specific symbol usages across papers.

## Extraction Process

### Phase 1: Initial Concept Identification

Scan the paper systematically to identify core mathematical concepts:

1. Focus on definitions, theorems, lemmas, and formal introductions of mathematical ideas
2. Examine section headings and topic sentences for concept declarations
3. Analyze mathematical formulations for underlying principles
4. Look for author explanations of foundational ideas

For each concept identified, capture:
- The name or description used by the authors
- The section and context where it's introduced
- Any formal definitions provided
- The relationship to other concepts in the paper

### Phase 2: Concept Formalization

For each identified concept, formalize its properties:

#### Core Properties
- **Concept Name**: Clear, normalized identifier (e.g., "OrthogonalCollocation", "ThermalDiffusivity")
- **Description**: Brief, precise explanation of the concept
- **Domain**: Primary mathematical domain (e.g., "Numerical Analysis", "Partial Differential Equations")
- **Subdomain**: Specific subdomain (e.g., "Spectral Methods", "Heat Transfer")
- **Formal Definition**: Mathematical definition if provided
- **Source**: Reference to paper section or equation

#### Concept-Specific Properties

##### For Mathematical Methods:
- **Fundamental Principles**: Core ideas underlying the method
- **Mathematical Properties**: Key properties and characteristics
- **Theoretical Foundation**: Mathematical basis or derivation
- **Advantages/Limitations**: Known strengths and weaknesses
- **Convergence Properties**: Convergence behavior and rates
- **Stability Characteristics**: Stability conditions or properties

##### For Mathematical Objects:
- **Structure**: Algebraic, topological, or other mathematical structure
- **Properties**: Defining properties and characteristics
- **Operations**: Associated operations or transformations
- **Representations**: How the object can be represented
- **Examples**: Concrete examples or special cases
- **Generalizations/Specializations**: Related broader or narrower concepts

##### For Theoretical Results:
- **Statement**: Precise statement of the theorem, lemma, or result
- **Conditions**: Prerequisites or assumptions
- **Proof Outline**: Key steps or approach in the proof
- **Implications**: Consequences or applications
- **Limitations**: Constraints or edge cases
- **Related Results**: Connected theorems or lemmas

### Phase 3: Concept Organization

Organize concepts into a hierarchical structure:

- **Hierarchical Classification**: Identify parent/child relationships
- **Lateral Connections**: Identify related concepts at the same level
- **Application Connections**: Link to application domains
- **Implementation Connections**: Link to computational realizations
- **Historical Context**: Place in the development of the field

### Phase 4: Tiered Knowledge Documentation

Document each concept following the three-tier knowledge structure:

#### L1: Core Definition (100-200 words)
- Essential definition and purpose
- Key mathematical properties
- Primary applications
- Related concept references

#### L2: Detailed Explanation (500-1000 words)
- Complete mathematical formulation
- Derivation and justification
- Key properties and behavior
- Implementation considerations
- Usage examples and applications

#### L3: Comprehensive Knowledge (2000+ words)
- Detailed mathematical analysis
- Rigorous proofs and derivations
- Edge cases and special conditions
- Alternative formulations
- Comparative analysis with alternatives
- Advanced applications

### Phase 5: Symbol Independence

Ensure concept documentation is independent of specific symbolic notation:

1. Document the mathematical meaning independent of symbols used
2. Reference symbol usage as separate entities that represent the concept
3. Note variations in notation across different papers
4. Avoid embedding specific notation in concept definitions
5. Use mathematical descriptions that transcend particular symbolic choices

### Phase 6: Concept Relationship Mapping

Document relationships between concepts:

#### Hierarchical Relationships
- **specializes**: Concept A is a special case of Concept B
- **generalizes**: Concept A is a generalization of Concept B
- **is_a**: Concept A is a type of Concept B
- **has_part**: Concept A contains Concept B as a component

#### Functional Relationships
- **uses**: Concept A uses Concept B in its definition or implementation
- **depends_on**: Concept A requires Concept B to be defined or useful
- **enhances**: Concept A improves or extends Concept B
- **equivalentTo**: Concept A is mathematically equivalent to Concept B

#### Comparative Relationships
- **similar_to**: Concept A shares significant properties with Concept B
- **different_from**: Concept A contrasts with Concept B in specific ways
- **derives_from**: Concept A is derived from Concept B
- **replaces**: Concept A supersedes or replaces Concept B

## Cypher Entity Creation

For each significant concept, create a Cypher entity definition following this pattern:

```cypher
CREATE (concept:MathematicalConcept {
  name: "[CONCEPT_NAME]",
  description: "[DESCRIPTION]",
  domain: "[MATHEMATICAL_DOMAIN]",
  subdomain: "[SUBDOMAIN]",
  
  // Core properties
  fundamentalPrinciples: ["[PRINCIPLE_1]", "[PRINCIPLE_2]"],
  mathematicalProperties: ["[PROPERTY_1]", "[PROPERTY_2]"],
  keyEquations: ["[EQUATION_1]", "[EQUATION_2]"],
  theoreticalFoundation: "[FOUNDATION]",
  historicalContext: "[HISTORY]",
  
  // Documentation properties
  paperSources: ["[PAPER_REF]"],
  taxonomyLevel: "[LEVEL]",
  formalDefinition: "[DEFINITION]",
  
  // Tiered knowledge
  tier_L1: "[CORE_DEFINITION]",
  tier_L2_file: "[PATH_TO_L2_FILE]",
})
```

## Important Considerations

### Concept-Symbol Separation

Maintain strict separation between concepts and their symbolic representations:

1. Document concepts independent of specific notation
2. Refer to symbols as separate entities that represent the concept
3. Note that the same concept may be represented by different symbols in different papers
4. Avoid embedding notation choices in concept definitions

### Concept Consistency

Ensure consistent concept definition across sources:

1. Harmonize concept definitions across different papers
2. Identify subtle variations in concept definitions
3. Note evolution of concepts across different sources
4. Maintain canonical concept definition while documenting variations

### Taxonomic Organization

Place concepts within the larger knowledge taxonomy:

1. Identify the precise location in the taxonomic hierarchy
2. Establish proper relationships to parent and child concepts
3. Maintain taxonomic consistency across the knowledge graph
4. Document cross-domain connections

### Cross-Referencing

Enable robust cross-referencing:

1. Use canonical concept identifiers for consistent reference
2. Document alternate names for the same concept
3. Establish clear relationships between related concepts
4. Provide sufficient context for disambiguation

## Example Extraction

### From Paper Text:

> Orthogonal collocation is a numerical method for solving differential equations by approximating the solution with a series of orthogonal polynomials. The method enforces the differential equation exactly at collocation points, typically chosen as the roots of orthogonal polynomials or their derivatives. For a function u(x), the approximation takes the form:
> 
> u(x) ≈ ∑ᵢ uᵢ ℓᵢ(x)
> 
> where ℓᵢ(x) are Lagrange interpolation polynomials satisfying ℓᵢ(xⱼ) = δᵢⱼ, and xⱼ are the collocation points. The method exhibits spectral convergence for smooth solutions.

### Extraction Result:

**Concept**: OrthogonalCollocation

**L1: Core Definition**
Orthogonal collocation is a numerical method for solving differential equations by approximating the solution using orthogonal polynomial basis functions, with the governing equations enforced exactly at specially chosen collocation points. The method achieves high accuracy with relatively few degrees of freedom and exhibits spectral convergence for smooth solutions.

**L2 Documentation Contents**
- Mathematical formulation using series expansion in orthogonal polynomials
- Selection of collocation points as roots of orthogonal polynomials
- Derivation of discrete equations by point-wise enforcement
- Convergence properties for different solution regularities
- Relationship to other spectral methods and weighted residual approaches
- Implementation considerations and strategies

**Hierarchical Classification**
- Parent Concepts: SpectralMethod, WeightedResidualMethod
- Child Concepts: LegendreCollocation, ChebyshevCollocation, RadauCollocation

**Relationship Mapping**
- uses: OrthogonalPolynomials, CollocationPoints
- depends_on: PolynomialInterpolation
- similar_to: PseudospectralMethod
- different_from: FiniteElementMethod

**Cypher Entity**
```cypher
CREATE (oc:MathematicalConcept {
  name: "OrthogonalCollocation",
  description: "A numerical method for solving differential equations by approximating the solution with orthogonal polynomials and enforcing equations at collocation points",
  domain: "Numerical Analysis",
  subdomain: "Spectral Methods",
  fundamentalPrinciples: [
    "Orthogonal polynomial expansion",
    "Collocation (point-wise equation satisfaction)",
    "Spectral convergence for smooth functions"
  ],
  mathematicalProperties: [
    "Exponential convergence for analytic functions",
    "Exact derivative representation at collocation points",
    "High accuracy per degree of freedom"
  ],
  keyEquations: [
    "u(x) ≈ ∑ᵢ uᵢ ℓᵢ(x) where ℓᵢ(x) are Lagrange interpolation polynomials",
    "ℓᵢ(xⱼ) = δᵢⱼ (Kronecker delta property)"
  ],
  theoreticalFoundation: "Approximation theory for orthogonal polynomials",
  historicalContext: "Developed in the 1970s, building on earlier spectral methods",
  paperSources: ["Smith2022"],
  taxonomyLevel: "Core",
  tier_L1: "Orthogonal collocation is a numerical method for solving differential equations by approximating the solution using orthogonal polynomial basis functions, with the governing equations enforced exactly at specially chosen collocation points.",
  tier_L2_file: "numerics/discretization_methods/orthogonal_collocation_L2.md"
})
```

## Deliverables

The concept extraction process should produce:

1. **Concept Entities**: Comprehensive documentation of mathematical concepts
2. **Tiered Knowledge**: L1/L2/L3 documentation for each significant concept
3. **Relationship Mapping**: Clear connections between related concepts
4. **Taxonomic Organization**: Proper placement in the knowledge taxonomy
5. **Symbol Independence**: Clear separation between concepts and notation
6. **Cypher Files**: Concept node creation files for the knowledge graph

## Follow-Up Tasks

After concept extraction, these tasks should be performed:

1. **Connect to Symbols**: Link concepts to the symbols that represent them
2. **Develop L2/L3 Documentation**: Create detailed concept documentation files
3. **Enhance Relationship Network**: Build out the network of concept relationships
4. **Validate Taxonomic Consistency**: Ensure proper taxonomic organization
5. **Domain Application Mapping**: Connect concepts to application domains

## Quality Checks

Verify the extraction with these checks:

1. **Completeness**: All significant mathematical concepts are captured
2. **Accuracy**: Concepts are defined precisely and correctly
3. **Independence**: Concepts are defined independent of specific notation
4. **Taxonomic Placement**: Concepts are properly situated in the taxonomy
5. **Relationship Clarity**: Relationships to other concepts are clear
6. **Documentation Quality**: Tiered knowledge documentation is thorough
7. **Cross-Reference Accuracy**: References to related concepts are correct

This structured approach ensures comprehensive extraction of mathematical concepts while maintaining the concept-symbol separation principle that is fundamental to the knowledge extraction system.
