// Knowledge Graph Schema: Entity Type Definitions
// This file defines the core entity types for the knowledge extraction system

// Clear existing constraints (run separately when resetting schema)
// MATCH (n) DETACH DELETE n;
// CALL apoc.schema.assert({},{},true);

// Define uniqueness constraints
CREATE CONSTRAINT ON (c:MathematicalConcept) ASSERT c.name IS UNIQUE;
CREATE CONSTRAINT ON (a:Algorithm) ASSERT a.name IS UNIQUE;
CREATE CONSTRAINT ON (m:NumericalMethod) ASSERT m.name IS UNIQUE;
CREATE CONSTRAINT ON (d:ApplicationDomain) ASSERT d.name IS UNIQUE;
CREATE CONSTRAINT ON (i:Implementation) ASSERT i.name IS UNIQUE;
CREATE CONSTRAINT ON (e:Equation) ASSERT e.id IS UNIQUE;
CREATE CONSTRAINT ON (p:Paper) ASSERT p.id IS UNIQUE;
CREATE CONSTRAINT ON (t:TestCase) ASSERT t.name IS UNIQUE;
CREATE CONSTRAINT ON (s:Symbol) ASSERT (s.name, s.context) IS UNIQUE;

// Define indexes for performance
CREATE INDEX ON :MathematicalConcept(category);
CREATE INDEX ON :Algorithm(type);
CREATE INDEX ON :NumericalMethod(category);
CREATE INDEX ON :ApplicationDomain(field);
CREATE INDEX ON :Implementation(language);
CREATE INDEX ON :Paper(authors);
CREATE INDEX ON :Paper(year);
CREATE INDEX ON :TestCase(type);
CREATE INDEX ON :Symbol(latex);

// Mathematical Concept properties
//
// MathematicalConcept represents fundamental mathematical ideas,
// theories, or constructs. These form the theoretical foundation
// for numerical methods and algorithms.
//
// Required properties:
// - name: String - Unique concept name
// - description: String - Concise description
// - category: String - Mathematical category (e.g., "Analysis", "Algebra", "Geometry")
// 
// Optional properties:
// - alternativeNames: [String] - Alternative names or notations
// - prerequisites: [String] - Prerequisite concepts
// - formalDefinition: String - Formal mathematical definition (may contain LaTeX)
// - referenceFile: String - Path to detailed concept file
// - paperSources: [String] - References to defining papers
// - examples: [String] - Example applications or instances
// - visualizationType: String - How concept is typically visualized
// - tags: [String] - Classification tags

// Algorithm properties
//
// Algorithm represents specific computational procedures that
// implement numerical methods or solve mathematical problems.
//
// Required properties:
// - name: String - Unique algorithm name
// - description: String - Concise description
// - type: String - Algorithm type (e.g., "Iterative", "Direct", "Adaptive")
// - problemDomain: String - Problem domain addressed
// 
// Optional properties:
// - timeComplexity: String - Big-O notation with justification
// - spaceComplexity: String - Memory requirements
// - convergenceRate: String - Convergence properties
// - stabilityConditions: String - Numerical stability requirements
// - inputs: [String] - Required inputs
// - outputs: [String] - Generated outputs
// - parameters: [String] - Configurable parameters
// - prerequisites: [String] - Required conditions
// - pseudocode: String - Structured pseudocode representation
// - referenceFile: String - Path to algorithm file
// - paperSource: String - Original paper reference
// - bestCase: String - Best case performance scenario
// - worstCase: String - Worst case performance scenario
// - adaptivity: String - Adaptive behavior description
// - parallelizability: String - Parallel computation potential
// - tags: [String] - Classification tags

// Numerical Method properties
//
// NumericalMethod represents approaches for solving mathematical
// problems numerically. These are broader than specific algorithms
// and may encompass families of algorithms.
//
// Required properties:
// - name: String - Unique method name
// - description: String - Concise description
// - category: String - Method category (e.g., "Finite Element", "Spectral", "Finite Difference")
// 
// Optional properties:
// - accuracy: String - Accuracy characteristics
// - applicationAreas: [String] - Suitable application areas
// - limitations: [String] - Known limitations or constraints
// - variants: [String] - Method variants
// - historicalContext: String - Development history
// - referenceFile: String - Path to method file
// - paperSources: [String] - Key references
// - commonImplementations: [String] - Typical implementations
// - errorMeasures: [String] - Error measurement approaches
// - tags: [String] - Classification tags

// Application Domain properties
//
// ApplicationDomain represents fields or problems where
// numerical methods and algorithms are applied.
//
// Required properties:
// - name: String - Unique domain name
// - description: String - Concise description
// - field: String - Broader field (e.g., "Engineering", "Physics", "Biology")
// 
// Optional properties:
// - subdomains: [String] - More specific areas
// - keyProblems: [String] - Central problems in this domain
// - typicalEquations: [String] - Characteristic equations (may contain LaTeX)
// - relevantParameters: [String] - Domain-specific parameters
// - commonSimplifications: [String] - Typical modeling simplifications
// - benchmarkProblems: [String] - Standard test problems
// - referenceFile: String - Path to domain file
// - domainExperts: [String] - Notable researchers
// - tags: [String] - Classification tags

// Implementation properties
//
// Implementation represents specific code implementations of
// algorithms or methods, particularly in Julia for the KitchenSink solver.
//
// Required properties:
// - name: String - Unique implementation name
// - description: String - Concise description
// - language: String - Implementation language (typically "Julia")
// - ecosystem: String - Software ecosystem (typically "SciML")
// 
// Optional properties:
// - algorithmSource: String - Implemented algorithm
// - optimizations: [String] - Performance optimizations
// - dependencies: [String] - Required libraries or packages
// - interfaceType: String - API design pattern
// - typeSystem: String - Type system design
// - memoryModel: String - Memory management approach
// - testCoverage: String - Testing methodology
// - performanceCharacteristics: String - Performance notes
// - referenceFile: String - Path to implementation file
// - codeRepository: String - Code location
// - usageExample: String - Example code snippet
// - documentationQuality: String - Documentation assessment
// - tags: [String] - Classification tags

// Equation properties
//
// Equation represents mathematical equations that appear in
// papers, methods, or algorithms. These capture mathematical
// formulations precisely.
//
// Required properties:
// - id: String - Unique equation identifier
// - latex: String - LaTeX representation
// - description: String - Purpose and meaning
// 
// Optional properties:
// - name: String - Name if equation is named
// - paperSource: String - Original paper reference
// - sectionReference: String - Section in paper
// - variables: [String] - Variable definitions
// - assumptions: [String] - Underlying assumptions
// - derivation: String - Derivation notes or reference
// - applicabilityConditions: [String] - When equation applies
// - alternativeForms: [String] - Equivalent formulations
// - numericalConsiderations: String - Implementation notes
// - tags: [String] - Classification tags

// Paper properties
//
// Paper represents academic papers that serve as sources for
// extracted knowledge, algorithms, and methods.
//
// Required properties:
// - id: String - Unique paper identifier (e.g., "Smith2022")
// - title: String - Full paper title
// - authors: [String] - Author list
// - year: Integer - Publication year
// 
// Optional properties:
// - doi: String - Digital Object Identifier
// - journal: String - Publication venue
// - abstract: String - Paper abstract
// - keywords: [String] - Author keywords
// - url: String - Link to paper
// - extractionFile: String - Path to extraction
// - citationCount: Integer - Number of citations
// - keyContributions: [String] - Main contributions
// - extractionDate: String - When paper was processed
// - tags: [String] - Classification tags

// TestCase properties
//
// TestCase represents benchmark problems or validation cases
// for testing numerical methods and algorithms.
//
// Required properties:
// - name: String - Unique test case name
// - description: String - Concise description
// - type: String - Test type (e.g., "Analytical", "Benchmark", "Convergence")
// 
// Optional properties:
// - problemFormulation: String - Mathematical formulation
// - knownSolution: String - Analytical solution if available
// - initialConditions: String - Starting conditions
// - boundaryConditions: String - Boundary specifications
// - parameters: [String] - Test parameters
// - successCriteria: String - How to evaluate success
// - implementationFile: String - Reference implementation
// - paperSource: String - Original reference
// - difficulty: String - Relative difficulty
// - computationalDemand: String - Resource requirements
// - tags: [String] - Classification tags

// Symbol properties
//
// Symbol represents mathematical symbols used in papers,
// helping to standardize notation across sources.
//
// Required properties:
// - name: String - Symbol name
// - context: String - Usage context to ensure uniqueness
// - latex: String - LaTeX representation
// - meaning: String - Precise meaning
// 
// Optional properties:
// - alternativeNotations: [String] - Other common notations
// - dimensionality: String - Scalar, vector, tensor, etc.
// - units: String - Physical units if applicable
// - constraints: String - Value constraints
// - typicalValues: String - Normal value ranges
// - paperSources: [String] - Where symbol is used
// - tags: [String] - Classification tags

// Define domain-specific entity types

// HeatTransferModel properties
// 
// HeatTransferModel represents specific models for heat transfer
// processes, particularly relevant to pasteurization applications.
CREATE CONSTRAINT ON (h:HeatTransferModel) ASSERT h.name IS UNIQUE;
CREATE INDEX ON :HeatTransferModel(modelType);

// PhaseBoundaryMethod properties
//
// PhaseBoundaryMethod represents techniques for modeling moving
// interfaces, particularly for phase change problems.
CREATE CONSTRAINT ON (p:PhaseBoundaryMethod) ASSERT p.name IS UNIQUE;
CREATE INDEX ON :PhaseBoundaryMethod(approachType);

// KitchenSinkComponent properties
//
// KitchenSinkComponent represents specific components or modules
// of the KitchenSink solver.
CREATE CONSTRAINT ON (k:KitchenSinkComponent) ASSERT k.name IS UNIQUE;
CREATE INDEX ON :KitchenSinkComponent(componentType);
