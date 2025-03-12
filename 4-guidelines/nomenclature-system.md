# Nomenclature System

## Overview

This document defines the standardized nomenclature system for mathematical knowledge extraction, ensuring consistent terminology, notation, and symbol usage across all extracted content.

## Master Nomenclature Framework

### 1. Symbol Registry Structure

All mathematical symbols must be registered in the master nomenclature graph using the following format:

```json
{
  "symbol": "σ",
  "canonical_name": "Decay Rate Parameter",
  "domain": "Approximation Theory",
  "standard_definition": "Characterizes the exponential decay rate of series coefficients",
  "latex_representation": "\\sigma",
  "unicode_codepoint": "U+03C3",
  "alternative_notations": ["s", "σ_d"],
  "related_symbols": ["τ", "μ"]
}
```

### 2. Domain-Specific Terminology

Each mathematical domain has a dedicated terminology section:

#### Numerical Analysis
- **Convergence Rate**: Measure of how quickly a sequence approaches its limit
- **Stability**: Behavior of numerical methods under small perturbations
- **Consistency**: Agreement of discretized equations with continuous counterparts
- **Order of Accuracy**: Leading term in the error's asymptotic expansion

#### Dynamical Systems
- **Attractor**: Set toward which a system evolves over time
- **Bifurcation**: Qualitative change in system behavior due to parameter change
- **Phase Space**: Space describing all possible states of a system
- **Lyapunov Exponent**: Measure of trajectory divergence or convergence

#### Differential Geometry
- **Manifold**: Topological space locally resembling Euclidean space
- **Connection**: Structure relating tangent spaces at different points
- **Geodesic**: Path of shortest distance between points on a manifold
- **Curvature**: Measure of manifold's deviation from flatness

#### Abstract Algebra
- **Group**: Set with associative binary operation, identity, and inverses
- **Ring**: Set with two operations satisfying specific axioms
- **Field**: Ring where all non-zero elements have multiplicative inverses
- **Module**: Generalization of vector space over rings

## Term Resolution Process

### 1. Source Mapping
When extracting from publications, create explicit mappings between source-specific terminology and canonical terms:

```json
{
  "paper_term": "coefficient decay",
  "canonical_term": "Decay Rate Parameter",
  "paper_id": "Liu2018",
  "context": "Legendre polynomial approximation",
  "symbol_used": "σ",
  "definition_location": "Section 2.3, p.1477"
}
```

### 2. Resolution Guidelines

1. **Preserve Original Notation**: When displaying equations, always maintain the original paper's notation
2. **Provide Canonical Mapping**: Link all terms to their canonical representations
3. **Document Notational Differences**: When symbols conflict across sources, document the differences
4. **Use Domain Context**: Resolve ambiguous symbols based on their mathematical domain

### 3. Conflict Resolution Procedure

When extracting conflicting terminology or notation:

1. **Identify Conflict Type**:
   - Symbol conflict (same symbol, different meanings)
   - Term conflict (same concept, different terms)
   - Definition conflict (same term, different definitions)

2. **Resolution Steps**:
   - Research standard usage across the literature
   - Consult domain-specific reference texts
   - Prioritize notation from most authoritative sources
   - Create explicit mapping documenting both usages

3. **Documentation Format**:
```json
{
  "conflict_type": "symbol",
  "symbol": "λ",
  "sources": [
    {"paper_id": "Smith2020", "meaning": "eigenvalue", "context": "linear algebra"},
    {"paper_id": "Jones2019", "meaning": "wavelength", "context": "wave mechanics"}
  ],
  "resolution": {
    "choice": "context_dependent",
    "rule": "Use λ for eigenvalues in linear algebra contexts; specify as λ_wave for wavelength"
  },
  "metadata": {
    "resolved_by": "J. Chen",
    "resolution_date": "2023-04-15",
    "authority": "SIAM Notation Guide 2019"
  }
}
```

## Cross-Domain Terminology Mapping

For concepts that span multiple mathematical domains, maintain cross-domain mappings:

```json
{
  "concept": "Eigenvalue",
  "domains": [
    {
      "domain": "Linear Algebra",
      "standard_symbol": "λ",
      "definition": "Scalar factor in the equation Av = λv"
    },
    {
      "domain": "Differential Equations",
      "standard_symbol": "λ",
      "definition": "Parameter in the characteristic equation"
    },
    {
      "domain": "Quantum Mechanics",
      "standard_symbol": "E",
      "definition": "Energy level in the eigenvalue equation Hψ = Eψ"
    }
  ],
  "canonical_mapping": {
    "preferred_symbol": "λ",
    "exception_domains": ["Quantum Mechanics"]
  }
}
```

## External Reference Alignment

### Mathematical Subject Classification (MSC)

Link all mathematical entities to the appropriate MSC2020 classification code:

```json
{
  "concept": "Legendre Polynomial",
  "msc_primary": "33C45",
  "msc_secondary": ["42C10", "65D15"],
  "msc_descriptors": {
    "33C45": "Orthogonal polynomials and functions of hypergeometric type",
    "42C10": "Fourier series in special orthogonal functions",
    "65D15": "Algorithms for functional approximation"
  }
}
```

### ZbMATH and MathSciNet Integration

For established mathematical concepts, include references to standard databases:

```json
{
  "concept": "Spectral Method",
  "zbmath_id": "4081.65093",
  "mathscinet_id": "MR1178650",
  "standard_references": [
    {
      "type": "book",
      "title": "Spectral Methods in Fluid Dynamics",
      "authors": ["C. Canuto", "M.Y. Hussaini", "A. Quarteroni", "T.A. Zang"],
      "year": 1988,
      "publisher": "Springer-Verlag"
    }
  ]
}
```

## Regular Updates and Maintenance

The nomenclature system requires:

1. Quarterly updates based on new mathematical literature
2. Annual review of canonical mappings and conflict resolutions
3. Version control of the nomenclature database with change tracking
4. Feedback mechanism for terminology disputes
