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