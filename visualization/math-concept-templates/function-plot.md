# Function Plotting Template

This template provides a standardized way to visualize mathematical functions, particularly for numerical methods, basis functions, error analysis, and solution representations.

## Standard Function Plot Structure

For static function plots, use SVG images with consistent styling:

```svg
<svg width="600" height="400" viewBox="0 0 600 400" xmlns="http://www.w3.org/2000/svg">
    <!-- Border and grid -->
    <rect x="50" y="20" width="520" height="320" fill="white" stroke="#ddd" stroke-width="1" />
    
    <!-- Grid lines -->
    <!-- Horizontal grid lines -->
    <line x1="50" y1="20" x2="50" y2="340" stroke="#ddd" stroke-width="1" />
    <line x1="180" y1="20" x2="180" y2="340" stroke="#ddd" stroke-width="1" />
    <line x1="310" y1="20" x2="310" y2="340" stroke="#ddd" stroke-width="1" />
    <line x1="440" y1="20" x2="440" y2="340" stroke="#ddd" stroke-width="1" />
    <line x1="570" y1="20" x2="570" y2="340" stroke="#ddd" stroke-width="1" />
    
    <!-- Vertical grid lines -->
    <line x1="50" y1="20" x2="570" y2="20" stroke="#ddd" stroke-width="1" />
    <line x1="50" y1="100" x2="570" y2="100" stroke="#ddd" stroke-width="1" />
    <line x1="50" y1="180" x2="570" y2="180" stroke="#ddd" stroke-width="1" />
    <line x1="50" y1="260" x2="570" y2="260" stroke="#ddd" stroke-width="1" />
    <line x1="50" y1="340" x2="570" y2="340" stroke="#ddd" stroke-width="1" />
    
    <!-- X and Y Axes -->
    <line x1="50" y1="180" x2="570" y2="180" stroke="black" stroke-width="1.5" />
    <line x1="310" y1="20" x2="310" y2="340" stroke="black" stroke-width="1.5" />
    
    <!-- X-Axis Labels -->
    <text x="50" y="360" font-family="Arial" font-size="12" text-anchor="middle">-5</text>
    <text x="180" y="360" font-family="Arial" font-size="12" text-anchor="middle">-2.5</text>
    <text x="310" y="360" font-family="Arial" font-size="12" text-anchor="middle">0</text>
    <text x="440" y="360" font-family="Arial" font-size="12" text-anchor="middle">2.5</text>
    <text x="570" y="360" font-family="Arial" font-size="12" text-anchor="middle">5</text>
    
    <!-- Y-Axis Labels -->
    <text x="30" y="20" font-family="Arial" font-size="12" text-anchor="end">2</text>
    <text x="30" y="100" font-family="Arial" font-size="12" text-anchor="end">1</text>
    <text x="30" y="180" font-family="Arial" font-size="12" text-anchor="end">0</text>
    <text x="30" y="260" font-family="Arial" font-size="12" text-anchor="end">-1</text>
    <text x="30" y="340" font-family="Arial" font-size="12" text-anchor="end">-2</text>
    
    <!-- Title -->
    <text x="310" y="395" font-family="Arial" font-size="16" text-anchor="middle" font-weight="bold">Title: Function Name or Description</text>
    
    <!-- Function Curves -->
    <!-- Example: sin(x) curve -->
    <path d="M50,180 C70,100 90,100 110,180 C130,260 150,260 170,180 C190,100 210,100 230,180 C250,260 270,260 290,180 C310,100 330,100 350,180 C370,260 390,260 410,180 C430,100 450,100 470,180 C490,260 510,260 530,180 C550,100 570,100 590,180" fill="none" stroke="#1f77b4" stroke-width="2" />
    
    <!-- Legend -->
    <rect x="450" y="30" width="100" height="50" fill="white" stroke="#ddd" stroke-width="1" />
    <line x1="460" y1="45" x2="480" y2="45" stroke="#1f77b4" stroke-width="2" />
    <text x="485" y="50" font-family="Arial" font-size="12">sin(x)</text>
    
    <!-- LaTeX Equation (use text as placeholder, replace with actual equation rendering) -->
    <text x="310" y="380" font-family="Arial" font-size="14" text-anchor="middle" font-style="italic">f(x) = sin(x)</text>
</svg>
```

For interactive or more complex function plots, use React components with appropriate libraries (Plotly, Recharts):

```jsx
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

const FunctionPlot = () => {
  // Generate data points
  const generateData = (func, xMin, xMax, points) => {
    const data = [];
    const step = (xMax - xMin) / (points - 1);
    for (let i = 0; i < points; i++) {
      const x = xMin + i * step;
      data.push({ x, y: func(x) });
    }
    return data;
  };
  
  // Example functions
  const sinData = generateData(x => Math.sin(x), -5, 5, 100);
  const cosData = generateData(x => Math.cos(x), -5, 5, 100);
  
  return (
    <div className="function-plot-container">
      <h3 className="plot-title">Trigonometric Functions</h3>
      
      <ResponsiveContainer width="100%" height={400}>
        <LineChart>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis 
            dataKey="x" 
            domain={[-5, 5]} 
            ticks={[-5, -2.5, 0, 2.5, 5]} 
            label={{ value: 'x', position: 'bottom' }}
          />
          <YAxis 
            domain={[-2, 2]} 
            ticks={[-2, -1, 0, 1, 2]} 
            label={{ value: 'f(x)', angle: -90, position: 'left' }}
          />
          <Tooltip formatter={(value) => value.toFixed(4)} />
          <Legend />
          <Line 
            data={sinData} 
            dataKey="y" 
            name="sin(x)" 
            stroke="#1f77b4" 
            dot={false} 
            isAnimationActive={false}
          />
          <Line 
            data={cosData} 
            dataKey="y" 
            name="cos(x)" 
            stroke="#ff7f0e" 
            dot={false} 
            isAnimationActive={false}
          />
        </LineChart>
      </ResponsiveContainer>
      
      <div className="plot-equation">
        <p>sin(x) = ...</p>
        <p>cos(x) = ...</p>
      </div>
    </div>
  );
};
```

## Function Types and Visualization Approaches

### Basis Functions

For spectral and finite element methods, clearly visualize the basis functions:

```jsx
// Legendre Polynomial Basis Functions
const LegendrePolynomialPlot = () => {
  // Legendre polynomial functions
  const legendre = [
    x => 1, // P_0(x) = 1
    x => x, // P_1(x) = x
    x => (3*x*x - 1)/2, // P_2(x) = (3x² - 1)/2
    x => (5*x*x*x - 3*x)/2, // P_3(x) = (5x³ - 3x)/2
    x => (35*x*x*x*x - 30*x*x + 3)/8 // P_4(x) = (35x⁴ - 30x² + 3)/8
  ];
  
  // Generate data for each polynomial
  const data = [];
  for (let x = -1; x <= 1; x += 0.02) {
    const point = { x };
    for (let i = 0; i < legendre.length; i++) {
      point[`P${i}`] = legendre[i](x);
    }
    data.push(point);
  }
  
  // Colors for each polynomial
  const colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd'];
  
  return (
    <div className="function-plot-container">
      <h3 className="plot-title">Legendre Polynomials P₀(x) to P₄(x)</h3>
      
      <ResponsiveContainer width="100%" height={400}>
        <LineChart data={data}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis 
            dataKey="x" 
            domain={[-1, 1]} 
            ticks={[-1, -0.5, 0, 0.5, 1]} 
            label={{ value: 'x', position: 'bottom' }}
          />
          <YAxis 
            domain={[-1, 1]} 
            ticks={[-1, -0.5, 0, 0.5, 1]} 
          />
          <Tooltip formatter={(value) => value.toFixed(4)} />
          <Legend />
          {legendre.map((_, i) => (
            <Line
              key={i}
              type="monotone"
              dataKey={`P${i}`}
              name={`P${i}(x)`}
              stroke={colors[i]}
              dot={false}
              isAnimationActive={false}
            />
          ))}
        </LineChart>
      </ResponsiveContainer>
      
      <div className="plot-equation">
        <p>P₀(x) = 1</p>
        <p>P₁(x) = x</p>
        <p>P₂(x) = (3x² - 1)/2</p>
        <p>P₃(x) = (5x³ - 3x)/2</p>
        <p>P₄(x) = (35x⁴ - 30x² + 3)/8</p>
      </div>
    </div>
  );
};
```

### Error Convergence Analysis

For error analysis plots, use log scales when appropriate:

```jsx
// Error Convergence Plot
const ErrorConvergencePlot = () => {
  // Convergence data (N vs error)
  const spectralData = Array.from({length: 20}, (_, i) => {
    const N = i + 1;
    return {
      N,
      spectralError: 10 * Math.exp(-N), // Exponential convergence
      algebraicP2: 5 / (N*N), // O(N^-2) convergence
      algebraicP4: 2 / Math.pow(N, 4) // O(N^-4) convergence
    };
  });
  
  return (
    <div className="function-plot-container">
      <h3 className="plot-title">Error Convergence Analysis</h3>
      
      <ResponsiveContainer width="100%" height={400}>
        <LineChart data={spectralData}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis 
            dataKey="N" 
            type="number"
            domain={[1, 20]}
            ticks={[1, 5, 10, 15, 20]} 
            scale="log"
            label={{ value: 'N (degrees of freedom)', position: 'bottom' }}
          />
          <YAxis 
            type="number"
            domain={[0.00001, 10]}
            scale="log"
            ticks={[0.00001, 0.0001, 0.001, 0.01, 0.1, 1, 10]}
            tickFormatter={(value) => `10^${Math.log10(value).toFixed(0)}`}
            label={{ value: 'Error', angle: -90, position: 'left' }}
          />
          <Tooltip 
            formatter={(value) => value.toExponential(2)} 
            labelFormatter={(value) => `N = ${value}`}
          />
          <Legend />
          <Line 
            type="monotone"
            dataKey="spectralError"
            name="Spectral (e^-N)"
            stroke="#1f77b4"
            strokeWidth={2}
            dot={true}
          />
          <Line 
            type="monotone"
            dataKey="algebraicP2"
            name="Algebraic (N^-2)"
            stroke="#ff7f0e"
            strokeWidth={2}
            dot={true}
          />
          <Line 
            type="monotone"
            dataKey="algebraicP4"
            name="Algebraic (N^-4)"
            stroke="#2ca02c"
            strokeWidth={2}
            dot={true}
          />
        </LineChart>
      </ResponsiveContainer>
      
      <div className="plot-equation">
        <p>Spectral convergence: E(N) ≈ C·e^(-αN)</p>
        <p>Algebraic convergence: E(N) ≈ C·N^(-p)</p>
      </div>
    </div>
  );
};
```

### Multi-Level Basis Visualization

For multi-level methods, visualize hierarchical basis functions:

```jsx
// Multi-Level Basis Functions Plot
const MultiLevelBasisPlot = () => {
  // Hierarchical basis functions (simplified)
  const generateBasisFunction = (level, segment, x) => {
    const h = 1 / Math.pow(2, level);
    const left = segment * h;
    const right = (segment + 1) * h;
    
    if (x < left || x > right) return 0;
    
    // Simple hat function
    return 1 - Math.abs(2 * (x - (left + right)/2) / h);
  };
  
  // Generate data points
  const data = [];
  for (let x = 0; x <= 1; x += 0.005) {
    const point = { x };
    
    // Level 0 (coarse)
    point.level0_0 = generateBasisFunction(0, 0, x);
    
    // Level 1 (finer)
    point.level1_0 = generateBasisFunction(1, 0, x);
    point.level1_1 = generateBasisFunction(1, 1, x);
    
    // Level 2 (finest)
    point.level2_0 = generateBasisFunction(2, 0, x);
    point.level2_1 = generateBasisFunction(2, 1, x);
    point.level2_2 = generateBasisFunction(2, 2, x);
    point.level2_3 = generateBasisFunction(2, 3, x);
    
    data.push(point);
  }
  
  return (
    <div className="function-plot-container">
      <h3 className="plot-title">Multi-Level Hierarchical Basis Functions</h3>
      
      <ResponsiveContainer width="100%" height={400}>
        <LineChart data={data}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis 
            dataKey="x" 
            domain={[0, 1]}
            ticks={[0, 0.25, 0.5, 0.75, 1]} 
            label={{ value: 'x', position: 'bottom' }}
          />
          <YAxis 
            domain={[0, 1.1]}
            ticks={[0, 0.25, 0.5, 0.75, 1]} 
          />
          <Tooltip formatter={(value) => value.toFixed(2)} />
          <Legend />
          
          {/* Level 0 */}
          <Line 
            type="monotone"
            dataKey="level0_0"
            name="φ₀⁰(x)"
            stroke="#1f77b4"
            strokeWidth={3}
            dot={false}
          />
          
          {/* Level 1 */}
          <Line 
            type="monotone"
            dataKey="level1_0"
            name="φ₀¹(x)"
            stroke="#ff7f0e"
            strokeWidth={2}
            dot={false}
            strokeDasharray="5 5"
          />
          <Line 
            type="monotone"
            dataKey="level1_1"
            name="φ₁¹(x)"
            stroke="#ff7f0e"
            strokeWidth={2}
            dot={false}
            strokeDasharray="5 5"
          />
          
          {/* Level 2 */}
          <Line 
            type="monotone"
            dataKey="level2_0"
            name="φ₀²(x)"
            stroke="#2ca02c"
            strokeWidth={1}
            dot={false}
            strokeDasharray="3 3"
          />
          <Line 
            type="monotone"
            dataKey="level2_1"
            name="φ₁²(x)"
            stroke="#2ca02c"
            strokeWidth={1}
            dot={false}
            strokeDasharray="3 3"
          />
          <Line 
            type="monotone"
            dataKey="level2_2"
            name="φ₂²(x)"
            stroke="#2ca02c"
            strokeWidth={1}
            dot={false}
            strokeDasharray="3 3"
          />
          <Line 
            type="monotone"
            dataKey="level2_3"
            name="φ₃²(x)"
            stroke="#2ca02c"
            strokeWidth={1}
            dot={false}
            strokeDasharray="3 3"
          />
        </LineChart>
      </ResponsiveContainer>
      
      <div className="plot-equation">
        <p>Level 0: 1 basis function spanning the domain</p>
        <p>Level 1: 2 basis functions with support width h=0.5</p>
        <p>Level 2: 4 basis functions with support width h=0.25</p>
        <p>General form: φᵢᵐ(x) for segment i at level m</p>
      </div>
    </div>
  );
};
```

## Guidelines for Effective Function Visualization

1. **Clear Axes Labels**: Always include properly labeled x and y axes
2. **Appropriate Scales**: Use linear or logarithmic scales as appropriate
3. **Meaningful Title**: Include a descriptive title for the plot
4. **Mathematical Notation**: Show the mathematical equation or definition
5. **Color Consistency**: Use consistent colors for similar function types
6. **Grid Lines**: Include grid lines for easier value estimation
7. **Domain Selection**: Choose a domain that clearly shows the function's behavior
8. **Multiple Functions**: When showing multiple functions, use distinct colors and line styles
9. **Interactive Features**: For complex functions, add interactive features (zooming, tooltips)
10. **Error Bands**: When applicable, show error bands or confidence intervals

## Usage in Knowledge Extraction

When creating function plots for mathematical concepts from papers:

1. Identify the key functions to visualize
2. Determine the appropriate domain and range
3. Decide on the most appropriate visualization type (static vs. interactive)
4. Include the mathematical equation or definition
5. Add relevant annotations or markers for special points
6. Use consistent styling with other visualizations
7. Include reference to the original paper and equation numbers

## Example Usage

```
# Function Visualization: Legendre Polynomial Basis

## Overview
- **Function Family**: Legendre Polynomials
- **Source**: Smith and Johnson (2023), Section 2.1
- **Purpose**: Basis functions for spectral collocation method

## Visualization

[Insert function plot visualization here]

## Mathematical Definition

The Legendre polynomials P_n(x) are defined by the recurrence relation:
- P₀(x) = 1
- P₁(x) = x
- (n+1)P_{n+1}(x) = (2n+1)xP_n(x) - nP_{n-1}(x)

The first few polynomials are:
- P₀(x) = 1
- P₁(x) = x
- P₂(x) = (3x² - 1)/2
- P₃(x) = (5x³ - 3x)/2
- P₄(x) = (35x⁴ - 30x² + 3)/8

## Properties
- Orthogonal on [-1, 1] with respect to the weight function w(x) = 1
- Satisfy the differential equation: (1-x²)y'' - 2xy' + n(n+1)y = 0
- Have exactly n roots in the interval (-1, 1)
- P_n(1) = 1 and P_n(-1) = (-1)^n for all n

## Implementation Notes

In the KitchenSink solver, these polynomials are implemented using the recurrence relation for numerical stability.
```
