// Eigenvalue Problem Mathematical Concept
CREATE (ep:MathematicalConcept {
  name: "EigenvalueProblem",
  description: "The mathematical problem of finding scalars (eigenvalues) and vectors (eigenvectors) that satisfy Ax = λx for a square matrix A",
  domain: "Numerical Analysis",
  subdomain: "Linear Algebra",
  fundamentalPrinciples: [
    "Identification of special directions (eigenvectors) and scaling factors (eigenvalues)",
    "Diagonalization of matrices via eigenvector bases",
    "Spectral decomposition and analysis",
    "Classification of system behavior through eigenvalue patterns"
  ],
  mathematicalProperties: [
    "Eigenvalues as roots of characteristic polynomial",
    "Eigenvector independence for distinct eigenvalues",
    "Relationship to matrix powers and dynamics",
    "Connection to singular value decomposition"
  ],
  keyEquations: [
    "Eigenvalue equation: Av = λv",
    "Characteristic polynomial: det(A - λI) = 0",
    "Matrix diagonalization: A = PDP⁻¹ where D is diagonal",
    "Power iteration: vₖ₊₁ = Avₖ/||Avₖ|| converges to dominant eigenvector"
  ],
  theoreticalFoundation: "Linear algebra and spectral theory",
  paperSources: ["Golub2013", "Trefethen1997"],
  taxonomyLevel: "Core",
  tier_L1: "Eigenvalue problems involve finding scalar values (eigenvalues) and corresponding vectors (eigenvectors) for which a linear transformation is equivalent to scalar multiplication, forming the basis of spectral analysis and many applications in science and engineering.",
  tier_L2_file: "numerics/linear_algebra/eigenvalue_problem_L2.md"
})
