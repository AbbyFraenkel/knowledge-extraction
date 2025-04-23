// Tunnel Pasteurization Application Domain Concept
CREATE (tp:ApplicationDomain {
  name: "TunnelPasteurization",
  description: "Thermal processing method for food and beverage products in containers using controlled temperature-time profiles",
  applicationDomain: "Food Processing",
  subdomain: "Thermal Treatment",
  fundamentalPrinciples: [
    "Thermal inactivation of microorganisms",
    "Heat transfer through container walls",
    "Temperature-time dependent pasteurization units (PU)",
    "Continuous processing in tunnels with temperature zones"
  ],
  governingEquations: [
    "Heat equation: ∂T/∂t = α∇²T",
    "First-order microbial inactivation: dN/dt = -kN",
    "Pasteurization unit: PU = ∫ 10^((T-T_ref)/z) dt",
    "Heat transfer at boundary: -k∇T = h(T - T_∞)"
  ],
  physicalParameters: [
    "Container thermal properties (conductivity, capacity)",
    "Product thermal properties",
    "Heat transfer coefficients",
    "D and z values for target microorganisms"
  ],
  applicationAreas: [
    "Beer pasteurization",
    "Bottled beverages",
    "Canned foods",
    "Dairy products"
  ],
  taxonomyLevel: "Specialized",
  tier_L1: "Tunnel pasteurization is a continuous thermal process where packaged products move through a tunnel with controlled temperature zones to achieve microbial safety while minimizing thermal impact on product quality.",
  tier_L2_file: "applications/heat_transfer/thermal_processing/tunnel_pasteurization_L2.md"
})
