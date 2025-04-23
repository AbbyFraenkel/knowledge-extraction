// HAS_INTERPRETATION_IN Relationship Template
// Use this template to create HAS_INTERPRETATION_IN relationships between Symbol nodes and ApplicationDomain nodes
// Replace all placeholders with appropriate values

// Basic HAS_INTERPRETATION_IN Relationship Creation
MATCH (sym:Symbol {name: "[SYMBOL_NAME]", context: "[SYMBOL_CONTEXT]"})
MATCH (domain:ApplicationDomain {name: "[DOMAIN_NAME]"})
CREATE (sym)-[:HAS_INTERPRETATION_IN {
  meaning: "[DOMAIN_SPECIFIC_MEANING]",  // E.g., "Thermal diffusivity in heat transfer"
  standardUsage: "[STANDARD_USAGE_IN_DOMAIN]",  // E.g., "Commonly used for thermal diffusivity"
  units: "[DOMAIN_SPECIFIC_UNITS]",  // E.g., "m²/s in SI units"
  
  // Optional properties - include all that apply
  typicalValues: "[TYPICAL_VALUE_RANGE]",  // E.g., "10^-7 to 10^-5 m²/s for liquids"
  determinationMethod: "[HOW_DETERMINED]",  // E.g., "Experimental measurement", "Derived from other properties"
  domainLiterature: ["[REFERENCE_1]", "[REFERENCE_2]"],  // Domain-specific references
  industryStandards: ["[STANDARD_1]", "[STANDARD_2]"],  // Relevant industry standards
  conversionFactor: "[CONVERSION_FACTOR]",  // E.g., "1000 if converting from SI to industry units"
  notes: "[INTERPRETATION_NOTES]"  // Additional notes on domain interpretation
}]->(domain);

// ------------------------------
// EXAMPLES
// ------------------------------

// Example 1: Heat transfer parameter
/*
MATCH (alpha:Symbol {name: "α", context: "Heat equation"})
MATCH (thermalEngineering:ApplicationDomain {name: "ThermalEngineering"})
CREATE (alpha)-[:HAS_INTERPRETATION_IN {
  meaning: "Thermal diffusivity",
  standardUsage: "Material property in heat transfer calculations",
  units: "m²/s in SI units",
  typicalValues: "0.14×10⁻⁶ m²/s (beer) to 4×10⁻⁵ m²/s (steel)",
  determinationMethod: "Calculated from k/(ρ·Cp) where k is thermal conductivity, ρ is density, and Cp is specific heat",
  domainLiterature: ["Incropera & DeWitt 2007", "Cengel 2020"],
  industryStandards: ["ASTM E1461", "ISO 22007-2"],
  notes: "Critical parameter for transient heat transfer calculations in pasteurization"
}]->(thermalEngineering)
*/

// Example 2: Fluid dynamics parameter
/*
MATCH (epsilon:Symbol {name: "ε", context: "Turbulence modeling"})
MATCH (fluidDynamics:ApplicationDomain {name: "FluidDynamics"})
CREATE (epsilon)-[:HAS_INTERPRETATION_IN {
  meaning: "Turbulent energy dissipation rate",
  standardUsage: "Variable in k-ε turbulence models",
  units: "m²/s³ in SI units",
  typicalValues: "Varies widely with flow conditions",
  determinationMethod: "Solved in k-ε model equations",
  domainLiterature: ["Pope 2000", "Wilcox 2006"],
  notes: "Represents the rate at which turbulent kinetic energy is converted to thermal energy"
}]->(fluidDynamics)
*/
