# Differential Geometry Extraction Template

## Instructions
Use this template for extracting content related to manifolds, differential forms, and geometric structures. Ensure all coordinate expressions are preserved using full tensor notation and document transition maps between coordinate charts.

## Template
{
  "manifold": {
    "name": "manifold_name",
    "dimension": "n",
    "type": "smooth|riemannian|symplectic",
    "atlas": [
      {"chart_id": "chart1", "domain": "U_1", "coordinates": ["x^1", "x^2", "...", "x^n"]}
    ],
    "metric": {
      "coordinate_expression": "g_{ij} = ...",
      "signature": "(p,q)",
      "special_properties": ["flat", "constant_curvature"]
    },
    "connection": {
      "type": "levi_civita|...",
      "christoffel_symbols": "Γ^i_{jk} = ...",
      "curvature": {
        "riemann_tensor": "R^i_{jkl} = ...",
        "ricci_tensor": "R_{ij} = ...",
        "scalar_curvature": "R = ..."
      }
    }
  }
}

Extraction Guidelines:
Preserve all coordinate expressions using full tensor notation
Document transition maps between coordinate charts
Maintain global vs. local property distinctions
Reference standard model spaces where appropriate

## Knowledge Graph Representation

Create knowledge graph entities and relationships using Cypher:

```cypher
// Create manifold entity
CREATE (manifold:Manifold:Entity {
  name: "Sphere S²",
  dimension: 2,
  type: "riemannian",
  description: "Standard 2-sphere embedded in ℝ³",
  compact: true
})

// Create atlas with charts
CREATE (chart1:Chart:Entity {
  name: "Stereographic Projection (North)",
  domain: "S² - {North Pole}",
  coordinates: ["x", "y"],
  coordinate_map: "φ₁(θ,φ) = (sin θ cos φ, sin θ sin φ)/(1+cos θ)"
})

CREATE (chart2:Chart:Entity {
  name: "Stereographic Projection (South)",
  domain: "S² - {South Pole}",
  coordinates: ["u", "v"],
  coordinate_map: "φ₂(θ,φ) = (sin θ cos φ, sin θ sin φ)/(1-cos θ)"
})

// Create transition maps
CREATE (transition:TransitionMap:Entity {
  name: "Chart Transition S²",
  map: "φ₂∘φ₁⁻¹(x,y) = (x/r², y/r²) where r² = x² + y²",
  domain: "ℝ² - {(0,0)}"
})

// Create metric tensor
CREATE (metric:MetricTensor:Entity {
  name: "Standard Metric on S²",
  coordinate_expression: "g = 4/(1+(x²+y²))² (dx² + dy²)",
  signature: "(2,0)",
  special_properties: ["conformally flat", "constant positive curvature"]
})

// Create connection and curvature
CREATE (connection:Connection:Entity {
  name: "Levi-Civita Connection on S²",
  type: "levi_civita",
  christoffel_symbols: [
    "Γ¹₁₁ = 2x/(1+x²+y²)",
    "Γ¹₁₂ = Γ¹₂₁ = 2y/(1+x²+y²)",
    "Γ¹₂₂ = -2x/(1+x²+y²)",
    "Γ²₁₁ = -2y/(1+x²+y²)",
    "Γ²₁₂ = Γ²₂₁ = 2x/(1+x²+y²)",
    "Γ²₂₂ = 2y/(1+x²+y²)"
  ]
})

CREATE (curvature:Curvature:Entity {
  name: "Curvature of S²",
  riemann_tensor: "R¹₂₁₂ = 4/(1+x²+y²)²",
  ricci_tensor: "R₁₁ = R₂₂ = 1",
  scalar_curvature: "R = 2"
})

// Create relationships
CREATE (manifold)-[:HAS_ATLAS]->(chart1)
CREATE (manifold)-[:HAS_ATLAS]->(chart2)
CREATE (chart1)-[:TRANSITIONS_TO]->(transition)
CREATE (chart2)-[:TRANSITIONS_FROM]->(transition)
CREATE (manifold)-[:HAS_METRIC]->(metric)
CREATE (manifold)-[:HAS_CONNECTION]->(connection)
CREATE (connection)-[:HAS_CURVATURE]->(curvature)