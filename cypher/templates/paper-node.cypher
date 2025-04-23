// Paper Node Template
// Use this template to create Paper nodes in the knowledge graph
// Replace all placeholders with appropriate values

// Basic Paper Node Creation
CREATE (paper:Paper {
  id: "[PAPER_ID]",  // Unique identifier, typically AuthorYear format (e.g., "Smith2023")
  title: "[PAPER_TITLE]",  // Full title of the paper
  authors: ["[AUTHOR_1]", "[AUTHOR_2]"],  // List of authors
  year: [PUBLICATION_YEAR],  // Publication year as integer
  doi: "[DOI]",  // Digital Object Identifier (if available)
  url: "[URL]",  // URL to the paper (if available)
  
  // Optional properties - include all that apply
  journal: "[JOURNAL_NAME]",  // Journal or conference name
  volume: "[VOLUME]",  // Journal volume
  issue: "[ISSUE]",  // Journal issue
  pages: "[PAGE_RANGE]",  // Page range (e.g., "123-145")
  publisher: "[PUBLISHER]",  // Publisher name
  abstract: "[ABSTRACT]",  // Paper abstract
  keywords: ["[KEYWORD_1]", "[KEYWORD_2]"],  // List of keywords
  extractionDate: "[EXTRACTION_DATE]",  // Date when paper was extracted
  extractionNotes: "[NOTES]"  // Notes about the extraction process
})

// Connect to Mathematical Concepts
MATCH (concept:MathematicalConcept {name: "[CONCEPT_NAME]"})
CREATE (paper)-[:INTRODUCES {
  significance: "[SIGNIFICANCE]",  // E.g., "First formulation", "Novel extension", "Comprehensive review"
  context: "[CONTEXT]"  // E.g., "In the context of spectral methods"
}]->(concept)

// Connect to Related Papers
MATCH (relatedPaper:Paper {id: "[RELATED_PAPER_ID]"})
CREATE (paper)-[:CITES {
  context: "[CITATION_CONTEXT]",  // Why this paper is cited
  criticality: "[CRITICALITY]"  // How important this citation is (e.g., "Fundamental", "Supporting", "Contrasting")
}]->(relatedPaper)

// Connect to Methods
MATCH (method:NumericalMethod {name: "[METHOD_NAME]"})
CREATE (paper)-[:DEVELOPS {
  nature: "[DEVELOPMENT_NATURE]",  // E.g., "Introduction", "Extension", "Analysis", "Comparison"
  contribution: "[CONTRIBUTION]"  // Specific contribution to the method
}]->(method)

// Connect to Algorithms
MATCH (algorithm:Algorithm {name: "[ALGORITHM_NAME]"})
CREATE (paper)-[:PRESENTS {
  completeness: "[COMPLETENESS]",  // E.g., "Complete", "Partial", "Pseudocode"
  novelty: "[NOVELTY]"  // E.g., "Novel", "Improved", "Review"
}]->(algorithm)

// Connect to Application Domains
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (paper)-[:APPLIES_TO {
  relevance: "[RELEVANCE]",  // Relevance to this domain
  impact: "[IMPACT]"  // Impact in this domain
}]->(domain)

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Basic Paper Creation
/*
CREATE (paper:Paper {
  id: "Smith2023",
  title: "Multi-Level Spectral Collocation for Moving Boundary Problems",
  authors: ["Smith, J.", "Johnson, A."],
  year: 2023,
  doi: "10.1234/jcm.2023.1234",
  url: "https://doi.org/10.1234/jcm.2023.1234",
  journal: "Journal of Computational Mathematics",
  volume: "45",
  issue: "3",
  pages: "321-345",
  publisher: "Academic Press",
  abstract: "This paper introduces a novel multi-level spectral collocation method specifically designed for problems with moving boundaries...",
  keywords: ["Spectral methods", "Collocation", "Moving boundary", "Adaptive refinement"],
  extractionDate: "2025-03-20",
  extractionNotes: "Extracted by Claude for the Knowledge Extraction System"
})
*/

// Example 2: Paper Introducing a Method
/*
MATCH (paper:Paper {id: "Smith2023"})
MATCH (concept:MathematicalConcept {name: "MultiLevelSpectralCollocation"})
CREATE (paper)-[:INTRODUCES {
  significance: "First formulation of multi-level approach to spectral collocation",
  context: "In the context of moving boundary problems"
}]->(concept)

MATCH (method:NumericalMethod {name: "MultiLevelAdaptiveSpectralCollocation"})
CREATE (paper)-[:DEVELOPS {
  nature: "Introduction",
  contribution: "Complete theoretical framework and algorithmic implementation"
}]->(method)
*/

// Example 3: Paper Related to Pasteurization
/*
MATCH (paper:Paper {id: "Johnson2022"})
MATCH (domain:ApplicationDomain {name: "TunnelPasteurization"})
CREATE (paper)-[:APPLIES_TO {
  relevance: "Directly addresses heat transfer modeling in tunnel pasteurization",
  impact: "Enables more accurate prediction of pasteurization units"
}]->(domain)

MATCH (relatedPaper:Paper {id: "Smith2023"})
CREATE (paper)-[:CITES {
  context: "Applies the multi-level collocation method to pasteurization models",
  criticality: "Fundamental to the numerical approach"
}]->(relatedPaper)
*/
