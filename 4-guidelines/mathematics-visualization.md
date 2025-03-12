# Mathematics Visualization Guidelines

## Overview

This document provides standards and best practices for creating, extracting, and integrating visual mathematical content. Effective visualization enhances understanding of complex mathematical concepts and demonstrates the behavior of algorithms and numerical methods.

## Visual Content Types

### 1. Analytical Visualizations

- **Function Plots**
  * Plot domain should include all critical features (extrema, inflection points)
  * Include grid lines when relevant to understanding
  * Use consistent color schemes for multiple functions
  * Clearly label axes with quantities and units
  * Include titles that describe the mathematical significance

- **Phase Portraits and Vector Fields**
  * Use appropriate density of vectors/streamlines
  * Highlight critical points and invariant structures
  * Include nullclines when relevant
  * Ensure proper scaling to show key behaviors
  * Label regions with different qualitative behaviors

- **Geometric Structures**
  * Use 3D perspectives that highlight key properties
  * Include reference elements (coordinate planes, principal directions)
  * Use transparency to show internal structures
  * Add cross-sections when appropriate
  * Include scale indicators for size reference

### 2. Computational Visualizations

- **Convergence Plots**
  * Use semi-log or log-log plots for exponential convergence
  * Include theoretical convergence rates as reference lines
  * Plot against appropriate variables (iterations, degrees of freedom)
  * Label different convergence regimes
  * Include error bars or uncertainty regions when applicable

- **Error Analysis Visualizations**
  * Show spatial or temporal distribution of errors
  * Use appropriate color maps for error magnitude
  * Include reference scales for error interpretation
  * Compare errors across methods when relevant
  * Highlight regions of maximum error

- **Algorithm Behavior Visualizations**
  * Create step-by-step visualizations of algorithm progress
  * Highlight critical decision points
  * Show data transformations visually
  * Use consistent visual language for algorithm components
  * Include timing information when relevant

## Visualization Standards

### 1. Mathematical Fidelity

- **Accurate Representation**
  * Visualizations must accurately represent mathematical behavior
  * Avoid visual distortions that misrepresent mathematical properties
  * Include sufficient resolution to capture important features
  * Verify visualization correctness with analytical results when possible
  * Document any approximations or simplifications

- **Domain Relevance**
  * Select visualization domains that reveal key mathematical behavior
  * Include special cases and edge conditions
  * Show parameter sensitivity when relevant
  * Highlight transitions between different behaviors
  * Demonstrate both typical and exceptional cases

### 2. Visual Clarity

- **Color Usage**
  * Use colorblind-friendly palettes
  * Maintain consistent color meaning across related visualizations
  * Choose appropriate color scales (sequential, diverging, categorical)
  * Avoid unnecessary color when simpler representations suffice
  * Include color legends with clear labels

- **Typography and Labeling**
  * Use mathematical notation consistent with document
  * Include units where applicable
  * Position labels to avoid overlap with key features
  * Use consistent font sizes for similar visualization types
  * Ensure all text is legible at intended display size

- **Element Hierarchy**
  * Emphasize the most important mathematical features
  * De-emphasize secondary elements (grid lines, reference markers)
  * Use line weights and styles to distinguish different elements
  * Apply visual highlighting to key regions or points
  * Maintain clear figure/ground separation

### 3. Reproducibility

- **Code Generation**
  * Provide code that generates all visualizations
  * Document specific library versions and dependencies
  * Include random seeds for stochastic visualizations
  * Parameterize visualizations for easy modification
  * Create modular visualization functions

- **Data Sources**
  * Document origin of data used in visualizations
  * Include preprocessing steps applied to raw data
  * Provide access to data when possible
  * Cite external data sources appropriately
  * Note any data transformations (normalization, filtering)

## Implementation Guidelines

### 1. Visualization Tools

- **Recommended Libraries**
  * Julia: Plots.jl, Makie.jl, VegaLite.jl
  * Python: Matplotlib, Plotly, Bokeh
  * JavaScript: D3.js, Three.js, MathBox.js
  * LaTeX: PGFPlots, TikZ

- **Tool Selection Criteria**
  * Mathematical precision requirements
  * Interactive vs. static needs
  * Publication vs. exploration purposes
  * Web/document integration requirements
  * Performance with large datasets

### 2. Interactive Visualizations

- **Interaction Types**
  * Parameter exploration with sliders/controls
  * Zoom and pan for detailed examination
  * Rotating 3D structures to view from different angles
  * Toggling between different representations
  * Stepping through algorithm iterations

- **Implementation Considerations**
  * Ensure reasonable performance on target platforms
  * Include reset functionality for default views
  * Provide clear instructions for interactive elements
  * Design discoverable interface elements
  * Create fallback static versions for non-interactive contexts

### 3. Accessibility Considerations

- **Color Independence**
  * Ensure visualizations work in grayscale
  * Use multiple visual channels (shape, size, texture)
  * Test with colorblindness simulation tools
  * Include text descriptions of key features
  * Avoid relying solely on color to convey information

- **Text Alternatives**
  * Provide alt text for all visualizations
  * Include detailed figure captions
  * Create text descriptions of key insights
  * Use structured data for programmatic interpretation
  * Support screen reader navigation

## Visualization Extraction Workflow

### 1. Source Material Analysis

1. **Identify Visual Content Types**
   * Find all figures, diagrams, plots, and charts
   * Classify by mathematical purpose
   * Note dependencies on surrounding text
   * Identify sequences or related visual elements

2. **Extract Visual Data**
   * Capture raw data when available
   * Extract data points from plots using digitization tools
   * Document mathematical functions depicted
   * Note parameter values and conditions

3. **Analyze Visual Organization**
   * Identify visual hierarchy in original
   * Note special emphasis techniques
   * Document color schemes and conventions
   * Analyze labeling and annotation approach

### 2. Visualization Recreation

1. **Mathematical Validation**
   * Verify underlying mathematical correctness
   * Compare with analytical solutions when possible
   * Check numerical accuracy of visualized results
   * Ensure consistency with textual descriptions

2. **Visual Enhancement**
   * Improve clarity while maintaining fidelity
   * Standardize visual elements for consistency
   * Add interactive elements where beneficial
   * Optimize for different display contexts

3. **Integration with Knowledge Graph**
   * Link visualizations to relevant mathematical entities
   * Create visualization entities with metadata
   * Document relationships between visuals and equations
   * Connect visualizations to implementations

## Domain-Specific Guidelines

### 1. Dynamical Systems

- **Phase Space Visualization**
  * Show trajectory evolution with appropriate time markers
  * Highlight attractors, repellers, and saddle points
  * Include stable and unstable manifolds when relevant
  * Use Poincaré sections for higher-dimensional systems
  * Indicate basins of attraction with color coding

- **Bifurcation Diagrams**
  * Plot bifurcation parameter on x-axis
  * Show all stable and unstable branches
  * Indicate bifurcation points clearly
  * Include zoomed views of complex bifurcation structures
  * Add stability information using color or line style

### 2. Numerical Analysis

- **Error and Convergence**
  * Use log scales for exponential convergence
  * Show both absolute and relative errors
  * Include theoretical convergence rates as reference
  * Plot error distribution across domain
  * Compare multiple methods on same axes

- **Mesh and Discretization**
  * Show initial and adapted meshes
  * Highlight regions of refinement
  * Indicate error estimates on elements
  * Use appropriate visualization for different element types
  * Include node and element numbering for small problems

### 3. Optimization

- **Objective Function Landscapes**
  * Use contour plots for 2D problems
  * Add 3D surface plots for perspective
  * Highlight global and local minima/maxima
  * Show optimization algorithm trajectories
  * Indicate constraint boundaries clearly

- **Algorithm Convergence**
  * Plot objective value vs. iterations
  * Show constraint violation if applicable
  * Visualize search directions and step sizes
  * Include trust region or line search information
  * Annotate key events (e.g., switching strategies)

## File Formats and Export Guidelines

### 1. Static Visualizations

- **Vector Formats**
  * SVG: Preferred for web integration
  * PDF: Preferred for publication
  * EPS: For compatibility with older systems

- **Raster Formats**
  * PNG: For web display with transparency
  * TIFF: For high-resolution publication figures
  * Minimum 300 DPI resolution for print

### 2. Interactive Visualizations

- **Web Formats**
  * HTML + JavaScript: Self-contained interactive files
  * Jupyter Notebooks: For exploratory analysis
  * Observable Notebooks: For web-based interactive sharing

- **Embedding Guidelines**
  * Ensure visualization works in offline mode when needed
  * Provide fallback static versions
  * Include download options for data
  * Document browser/system requirements

## Quality Assurance Checklist

### 1. Mathematical Accuracy

- [ ] Mathematical formulations correctly visualized
- [ ] Axes scales and ranges appropriate
- [ ] Equations and formulas match surrounding text
- [ ] Special functions and transformations verified

### 2. Visual Quality

- [ ] Resolution sufficient for intended medium
- [ ] Text elements properly sized and legible
- [ ] Color scheme effective and accessible
- [ ] Important features visually emphasized

### 3. Reproducibility

- [ ] Visualization code documented and available
- [ ] Data sources referenced or included
- [ ] Parameters and settings specified
- [ ] Random elements (if any) have fixed seeds
