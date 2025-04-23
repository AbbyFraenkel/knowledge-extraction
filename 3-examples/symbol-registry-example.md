# Symbol Registry: Orthogonal Collocation Methods for Moving Boundary Problems

## Paper Information
- **Title**: Orthogonal Collocation Methods for Moving Boundary Problems in Heat Transfer
- **Authors**: Chen, L. and Wilson, D.R.
- **Year**: 2023
- **DOI**: 10.1016/j.jcp.2023.05.018
- **Extraction Date**: March 19, 2025

## Symbol Definitions

| Symbol | LaTeX | Context | Meaning | Units | First Appearance | Notes |
|--------|-------|---------|---------|-------|------------------|-------|
| α | `\alpha` | Heat transfer | Thermal diffusivity | m²/s | Eq. (3) | Appears as parameter in heat equation |
| β | `\beta` | Moving boundary | Interface movement parameter | dimensionless | Eq. (7) | Controls interface velocity |
| σ | `\sigma` | Spectral approximation | Decay rate parameter | dimensionless | Sec. 3.2 | Related to smoothness of solution |
| τ | `\tau` | Time scaling | Dimensionless time | dimensionless | Eq. (4) | τ = t/t₀ where t₀ is reference time |
| η | `\eta` | Spatial transformation | Transformed spatial coordinate | dimensionless | Eq. (5) | Maps moving domain to fixed domain |
| ξ | `\xi` | Collocation points | Spatial discretization nodes | dimensionless | Sec. 4.1 | Roots of orthogonal polynomials |
| ω | `\omega` | Collocation weights | Quadrature weights | dimensionless | Eq. (12) | Used in discretized integrals |
| κ | `\kappa` | Heat conduction | Thermal conductivity | W/(m·K) | Eq. (3) | Material property |
| ρ | `\rho` | Heat transfer | Density | kg/m³ | Eq. (3) | Material property |
| c_p | `c_p` | Heat transfer | Specific heat capacity | J/(kg·K) | Eq. (3) | Material property |
| T | `T` | Heat transfer | Temperature | K | Eq. (1) | Primary variable |
| T_0 | `T_0` | Initial conditions | Initial temperature | K | Eq. (2a) | Reference temperature |
| T_∞ | `T_{\infty}` | Boundary conditions | Ambient temperature | K | Eq. (2b) | Far-field condition |
| h | `h` | Heat transfer | Heat transfer coefficient | W/(m²·K) | Eq. (2b) | Convection coefficient |
| s(t) | `s(t)` | Moving boundary | Interface position | m | Eq. (6) | Function of time |
| ṡ(t) | `\dot{s}(t)` | Moving boundary | Interface velocity | m/s | Eq. (6) | Time derivative of s(t) |
| L_n(x) | `L_n(x)` | Spectral approximation | Legendre polynomials | dimensionless | Eq. (9) | Orthogonal basis functions |
| P_n(x) | `P_n(x)` | Spectral approximation | Legendre polynomials | dimensionless | Footnote 2 | Alternative notation for L_n(x) |
| ψ_j(η) | `\psi_j(\eta)` | Basis functions | Transformed basis functions | dimensionless | Eq. (10) | Basis for transformed domain |
| a_j(τ) | `a_j(\tau)` | Spectral approximation | Expansion coefficients | K | Eq. (10) | Time-dependent coefficients |
| ε | `\varepsilon` | Error analysis | Error tolerance | dimensionless | Sec. 5.2 | Convergence criterion |
| N | `N` | Discretization | Number of collocation points | dimensionless | Sec. 4.3 | Integer parameter |
| δ | `\delta` | Error analysis | Relative error measure | dimensionless | Eq. (19) | For convergence testing |
| λ | `\lambda` | Heat transfer | Latent heat | J/kg | Eq. (7) | For phase change problems |
| St | `\text{St}` | Dimensionless numbers | Stefan number | dimensionless | Eq. (8) | St = c_p·ΔT/λ |
| Fo | `\text{Fo}` | Dimensionless numbers | Fourier number | dimensionless | Eq. (8) | Fo = α·t/L² |
| J | `J` | Coordinate transformation | Jacobian of transformation | dimensionless | Eq. (5) | Related to grid deformation |
| E_n | `E_n` | Error analysis | Energy norm of error | varies | Eq. (20) | Measures solution accuracy |
| Bi | `\text{Bi}` | Dimensionless numbers | Biot number | dimensionless | Sec. 6.1 | Bi = h·L/κ |

## Context-Specific Symbol Sets

### Heat Transfer
- **α**: Thermal diffusivity (m²/s)
- **κ**: Thermal conductivity (W/(m·K))
- **ρ**: Density (kg/m³)
- **c_p**: Specific heat capacity (J/(kg·K))
- **T**: Temperature (K)
- **h**: Heat transfer coefficient (W/(m²·K))
- **λ**: Latent heat (J/kg)
- **Bi**: Biot number (dimensionless)
- **St**: Stefan number (dimensionless)
- **Fo**: Fourier number (dimensionless)

### Moving Boundary
- **s(t)**: Interface position (m)
- **ṡ(t)**: Interface velocity (m/s)
- **β**: Interface movement parameter (dimensionless)
- **η**: Transformed spatial coordinate (dimensionless)
- **J**: Jacobian of transformation (dimensionless)

### Orthogonal Collocation
- **ξ**: Collocation points (dimensionless)
- **ω**: Collocation weights (dimensionless)
- **L_n(x)**: Legendre polynomials (dimensionless)
- **ψ_j(η)**: Transformed basis functions (dimensionless)
- **a_j(τ)**: Expansion coefficients (K)
- **N**: Number of collocation points (dimensionless)

### Error Analysis
- **σ**: Decay rate parameter (dimensionless)
- **ε**: Error tolerance (dimensionless)
- **δ**: Relative error measure (dimensionless)
- **E_n**: Energy norm of error (varies)

## Symbol Conflicts and Resolutions

| Symbol | Conflict Type | Contexts | Resolution Strategy | Canonical Choice |
|--------|--------------|----------|---------------------|------------------|
| α | Notation Overloading | Heat transfer (thermal diffusivity) vs. Mathematical literature (convergence rate parameter) | Context-dependent interpretation | Use α for thermal diffusivity in engineering contexts; use α_c for convergence parameter in cross-domain references |
| P_n(x) | Notation Alternative | Spectral methods (Legendre polynomials) | Explicit acknowledgment of alternative notation | Prefer L_n(x) for consistency with paper's main notation |
| λ | Notation Overloading | Heat transfer (latent heat) vs. Mathematical literature (eigenvalue) | Context-dependent interpretation | Use λ for latent heat in heat transfer; use λ_e for eigenvalues in mathematical analysis |
| τ | Notation Overloading | Dimensionless time vs. Stress tensor in mechanics | Domain separation | Use τ exclusively for dimensionless time in this context |

## Cross-Domain Mappings

| Symbol | Math Context | Engineering Domain | Domain-Specific Meaning | Units | Standard Usage |
|--------|-------------|-------------------|------------------------|-------|---------------|
| α | Heat equation parameter | Thermal Engineering | Thermal diffusivity of material | m²/s | Key parameter in heat conduction models |
| κ | Diffusion coefficient | Thermal Engineering | Thermal conductivity | W/(m·K) | Material property in heat transfer calculation |
| St | Dimensionless parameter | Process Engineering | Stefan number | dimensionless | Ratio of sensible to latent heat |
| Fo | Dimensionless parameter | Process Engineering | Fourier number | dimensionless | Dimensionless time in transient analysis |
| Bi | Dimensionless parameter | Process Engineering | Biot number | dimensionless | Ratio of convection to conduction resistance |
| σ | Series decay parameter | Numerical Analysis | Spectral convergence rate | dimensionless | Determines approximation accuracy |
| ξ | Discretization points | Numerical Methods | Collocation points | dimensionless | Points where equations are enforced exactly |

## Symbol Relationships

### Synonyms
- L_n(x) ↔ P_n(x) (equivalent notation for Legendre polynomials)
- α ↔ κ/(ρ·c_p) (thermal diffusivity definition)

### Hierarchical Relationships
- T → T_0 (specific instance: initial temperature)
- T → T_∞ (specific instance: ambient temperature)
- s(t) → ṡ(t) (derivative relationship)
- ξ → ψ_j(η) (basis functions defined at collocation points)

## Notes on Notation

The paper follows standard notation for heat transfer and spectral methods, with some specific choices:

1. Uses η for the transformed spatial coordinate, which is common in moving boundary problems
2. Consistently uses τ for dimensionless time rather than t* seen in some other works
3. Prefers L_n(x) for Legendre polynomials instead of the alternative P_n(x)
4. Uses a dot notation (ṡ) for time derivatives rather than partial derivative notation
5. Employs both Greek (α, κ) and Latin (h, T) letters following conventional heat transfer notation
6. Dimensional consistency is maintained throughout all equations

## Cypher Files Generated
- `/projects/git/knowledge-extraction/cypher/symbols/Alpha_HeatTransfer.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/Beta_MovingBoundary.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/Sigma_SpectralApproximation.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/Eta_SpatialTransformation.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/Xi_CollocationPoints.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/LegendrePoly_SpectralApproximation.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/InterfacePosition_MovingBoundary.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/Temperature_HeatTransfer.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/StefanNumber_Dimensionless.cypher`
- `/projects/git/knowledge-extraction/cypher/symbols/BiotNumber_Dimensionless.cypher`

---

## Cross-Domain Integration Notes

The symbols in this paper bridge multiple domains relevant to both KitchenSink development and pasteurization modeling:

1. **Orthogonal Collocation Implementation**:
   - The symbols ξ, ω, L_n(x), and ψ_j(η) directly map to KitchenSink components
   - Discretization parameter N controls polynomial order in the solver
   - Error measures δ and E_n connect to solver convergence criteria

2. **Pasteurization Application**:
   - Thermal parameters α, κ, ρ, and c_p map directly to beer and container properties
   - Moving boundary parameter β relates to phase change in pasteurization
   - Heat transfer coefficient h corresponds to tunnel conditions
   - Dimensionless numbers St, Fo, and Bi provide scaling for tunnel models

3. **Implementation Considerations**:
   - Transformed coordinate η maps to the KitchenSink domain transformation module
   - Spectral coefficients a_j(τ) correspond to solver state variables
   - Interface position s(t) maps to moving boundary tracking in the solver

These cross-domain mappings facilitate integration between the mathematical formulation, KitchenSink implementation, and pasteurization application, providing clear pathways for knowledge transfer across domains.
