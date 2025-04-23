/**
 * Conflict Detection Tool
 * 
 * This script detects potential conflicts between entities in the knowledge graph,
 * particularly focusing on symbol conflicts across different contexts.
 * 
 * It performs the following checks:
 * 1. Symbol name conflicts across different contexts
 * 2. Inconsistent relationship usage
 * 3. Contradictory property values
 * 4. Missing conflict relationships when conflicts exist
 * 
 * Usage: node conflict-detection.js [--symbols-only]
 */

const fs = require('fs');
const path = require('path');

// Configuration
const ENTITIES_PATH = path.join(__dirname, '..', '..', 'cypher', 'entities');
const SYMBOLS_PATH = path.join(__dirname, '..', '..', 'cypher', 'symbols');
const RELATIONSHIPS_PATH = path.join(__dirname, '..', '..', 'cypher', 'relationships');

// Helper functions
function getAllSymbols() {
  if (!fs.existsSync(SYMBOLS_PATH)) {
    return [];
  }
  
  const symbols = [];
  const files = fs.readdirSync(SYMBOLS_PATH)
    .filter(file => file.endsWith('.cypher'))
    .map(file => path.join(SYMBOLS_PATH, file));
  
  for (const file of files) {
    try {
      const content = fs.readFileSync(file, 'utf8');
      
      // Skip template files
      if (content.includes('[SYMBOL_NAME]') || content.includes('[PLACEHOLDER]')) {
        continue;
      }
      
      // Extract symbol properties
      const symbolMatch = content.match(/CREATE \([\w]*:Symbol {([^}]*)}/);
      if (!symbolMatch) continue;
      
      const propsText = symbolMatch[1];
      const props = {};
      
      // Extract property values
      const nameMatch = propsText.match(/name: ("[^"]*"|'[^']*')/);
      const contextMatch = propsText.match(/context: ("[^"]*"|'[^']*')/);
      const latexMatch = propsText.match(/latex: ("[^"]*"|'[^']*')/);
      const meaningMatch = propsText.match(/meaning: ("[^"]*"|'[^']*')/);
      
      if (nameMatch) props.name = nameMatch[1].replace(/["']/g, '');
      if (contextMatch) props.context = contextMatch[1].replace(/["']/g, '');
      if (latexMatch) props.latex = latexMatch[1].replace(/["']/g, '');
      if (meaningMatch) props.meaning = meaningMatch[1].replace(/["']/g, '');
      
      props.sourceFile = file;
      
      // Extract conflict relationships
      const conflictMatches = content.match(/CREATE \([\w]*\)-\[:CONFLICTS_WITH {([^}]*)}\]->\([\w]*\)/g) || [];
      props.conflicts = conflictMatches.length > 0;
      
      symbols.push(props);
    } catch (err) {
      console.error(`Error processing ${file}: ${err.message}`);
    }
  }
  
  return symbols;
}

function getEntityConflicts() {
  if (!fs.existsSync(ENTITIES_PATH)) {
    return [];
  }
  
  const conflicts = [];
  const files = fs.readdirSync(ENTITIES_PATH)
    .filter(file => file.endsWith('.cypher'))
    .map(file => path.join(ENTITIES_PATH, file));
  
  // Group entities by type
  const entitiesByType = {};
  
  for (const file of files) {
    try {
      const content = fs.readFileSync(file, 'utf8');
      
      // Skip template files
      if (content.includes('[ENTITY_NAME]') || content.includes('[PLACEHOLDER]')) {
        continue;
      }
      
      // Extract entity type and name
      const entityMatch = content.match(/CREATE \([\w]*:(\w+) {([^}]*)}/);
      if (!entityMatch) continue;
      
      const entityType = entityMatch[1];
      const propsText = entityMatch[2];
      
      // Extract name property
      const nameMatch = propsText.match(/name: ("[^"]*"|'[^']*')/);
      if (!nameMatch) continue;
      
      const name = nameMatch[1].replace(/["']/g, '');
      
      if (!entitiesByType[entityType]) {
        entitiesByType[entityType] = [];
      }
      
      entitiesByType[entityType].push({
        name,
        sourceFile: file
      });
    } catch (err) {
      console.error(`Error processing ${file}: ${err.message}`);
    }
  }
  
  // Check for name conflicts within each entity type
  for (const [type, entities] of Object.entries(entitiesByType)) {
    // Skip if only one entity of this type
    if (entities.length <= 1) continue;
    
    // Check for duplicate names
    const nameCount = {};
    for (const entity of entities) {
      nameCount[entity.name] = (nameCount[entity.name] || 0) + 1;
    }
    
    // Report conflicts
    for (const [name, count] of Object.entries(nameCount)) {
      if (count > 1) {
        const conflictingEntities = entities.filter(e => e.name === name);
        conflicts.push({
          type: 'DuplicateName',
          entityType: type,
          name,
          count,
          files: conflictingEntities.map(e => e.sourceFile),
          resolution: `Ensure unique names for ${type} entities or create EXTENDS/VARIANT_OF relationships`
        });
      }
    }
  }
  
  return conflicts;
}

function detectSymbolConflicts(symbols) {
  const conflicts = [];
  
  // Group symbols by name
  const symbolsByName = {};
  for (const symbol of symbols) {
    if (!symbol.name) continue;
    
    if (!symbolsByName[symbol.name]) {
      symbolsByName[symbol.name] = [];
    }
    symbolsByName[symbol.name].push(symbol);
  }
  
  // Check for symbols with same name but different contexts
  for (const [name, nameSymbols] of Object.entries(symbolsByName)) {
    if (nameSymbols.length <= 1) continue;
    
    // Group by context
    const contexts = new Set(nameSymbols.map(s => s.context));
    
    // If multiple contexts, check if conflicts are properly documented
    if (contexts.size > 1) {
      const hasConflictRel = nameSymbols.some(s => s.conflicts);
      
      if (!hasConflictRel) {
        conflicts.push({
          type: 'UndocumentedSymbolConflict',
          name,
          contexts: Array.from(contexts),
          symbols: nameSymbols,
          resolution: 'Create CONFLICTS_WITH relationships between these symbols'
        });
      }
    }
    
    // Check for same context but different meanings
    const symbolsByContext = {};
    for (const symbol of nameSymbols) {
      if (!symbol.context) continue;
      
      if (!symbolsByContext[symbol.context]) {
        symbolsByContext[symbol.context] = [];
      }
      symbolsByContext[symbol.context].push(symbol);
    }
    
    for (const [context, contextSymbols] of Object.entries(symbolsByContext)) {
      if (contextSymbols.length <= 1) continue;
      
      // Check for different meanings
      const meanings = new Set(contextSymbols.map(s => s.meaning).filter(m => m));
      if (meanings.size > 1) {
        conflicts.push({
          type: 'InconsistentMeaning',
          name,
          context,
          meanings: Array.from(meanings),
          symbols: contextSymbols,
          resolution: 'Consolidate symbols with consistent meanings or use more specific contexts'
        });
      }
    }
  }
  
  // Check for symbols with same LaTeX but different names
  const symbolsByLatex = {};
  for (const symbol of symbols) {
    if (!symbol.latex) continue;
    
    if (!symbolsByLatex[symbol.latex]) {
      symbolsByLatex[symbol.latex] = [];
    }
    symbolsByLatex[symbol.latex].push(symbol);
  }
  
  for (const [latex, latexSymbols] of Object.entries(symbolsByLatex)) {
    if (latexSymbols.length <= 1) continue;
    
    const names = new Set(latexSymbols.map(s => s.name));
    if (names.size > 1) {
      conflicts.push({
        type: 'InconsistentNaming',
        latex,
        names: Array.from(names),
        symbols: latexSymbols,
        resolution: 'Consider using SYNONYM_OF relationships or standardizing naming'
      });
    }
  }
  
  return conflicts;
}

function detectRelationshipConflicts() {
  if (!fs.existsSync(RELATIONSHIPS_PATH)) {
    return [];
  }
  
  const conflicts = [];
  const relationshipFiles = fs.readdirSync(RELATIONSHIPS_PATH)
    .filter(file => file.endsWith('.cypher'))
    .map(file => path.join(RELATIONSHIPS_PATH, file));
  
  // Extract relationships for analysis
  const relationships = [];
  for (const file of relationshipFiles) {
    try {
      const content = fs.readFileSync(file, 'utf8');
      
      // Skip template files
      if (content.includes('[ENTITY_NAME]') || content.includes('[PLACEHOLDER]')) {
        continue;
      }
      
      // Extract relationship type and endpoint entity names
      const relMatches = content.match(/MATCH \([\w]*:(\w+) {[^}]*name: ("[^"]*"|'[^']*')[^}]*}\)[^]*?MATCH \([\w]*:(\w+) {[^}]*name: ("[^"]*"|'[^']*')[^}]*}\)[^]*?CREATE \([^)]*\)-\[:(\w+)/g) || [];
      
      for (const match of relMatches) {
        const components = match.match(/MATCH \([\w]*:(\w+) {[^}]*name: ("[^"]*"|'[^']*')[^}]*}\)[^]*?MATCH \([\w]*:(\w+) {[^}]*name: ("[^"]*"|'[^']*')[^}]*}\)[^]*?CREATE \([^)]*\)-\[:(\w+)/);
        if (!components) continue;
        
        const sourceType = components[1];
        const sourceName = components[2].replace(/["']/g, '');
        const targetType = components[3];
        const targetName = components[4].replace(/["']/g, '');
        const relationType = components[5];
        
        relationships.push({
          sourceType,
          sourceName,
          targetType,
          targetName,
          relationType,
          sourceFile: file
        });
      }
    } catch (err) {
      console.error(`Error processing ${file}: ${err.message}`);
    }
  }
  
  // Check for contradictory relationships
  // Group by source and target
  const relsByEndpoints = {};
  for (const rel of relationships) {
    const key = `${rel.sourceName}_${rel.targetName}`;
    if (!relsByEndpoints[key]) {
      relsByEndpoints[key] = [];
    }
    relsByEndpoints[key].push(rel);
  }
  
  // Check for problematic relationship combinations
  const exclusiveRelTypes = [
    ['IMPLEMENTS', 'BASED_ON'],  // These typically shouldn't be mixed directly
    ['CONFLICTS_WITH', 'SYNONYM_OF']  // These are contradictory
  ];
  
  for (const [endpoints, endpointRels] of Object.entries(relsByEndpoints)) {
    if (endpointRels.length <= 1) continue;
    
    // Check for exclusive relationship types
    for (const exclusivePair of exclusiveRelTypes) {
      const hasFirst = endpointRels.some(r => r.relationType === exclusivePair[0]);
      const hasSecond = endpointRels.some(r => r.relationType === exclusivePair[1]);
      
      if (hasFirst && hasSecond) {
        conflicts.push({
          type: 'ConflictingRelationships',
          relTypes: exclusivePair,
          endpoints: endpoints.split('_'),
          relationships: endpointRels,
          resolution: `Resolve conflicting relationships; ${exclusivePair[0]} and ${exclusivePair[1]} are typically incompatible`
        });
      }
    }
  }
  
  return conflicts;
}

function reportConflicts(conflicts) {
  if (conflicts.length === 0) {
    console.log('No conflicts detected');
    return;
  }
  
  console.log(`\nDetected ${conflicts.length} potential conflicts:\n`);
  
  // Group by conflict type
  const conflictsByType = {};
  for (const conflict of conflicts) {
    if (!conflictsByType[conflict.type]) {
      conflictsByType[conflict.type] = [];
    }
    conflictsByType[conflict.type].push(conflict);
  }
  
  // Report each conflict type
  for (const [type, typeConflicts] of Object.entries(conflictsByType)) {
    console.log(`\n== ${type} (${typeConflicts.length}) ==`);
    
    for (const conflict of typeConflicts) {
      switch (conflict.type) {
        case 'UndocumentedSymbolConflict':
          console.log(`  Symbol '${conflict.name}' used in different contexts without CONFLICTS_WITH relationship`);
          console.log(`    Contexts: ${conflict.contexts.join(', ')}`);
          for (const symbol of conflict.symbols) {
            console.log(`    - ${path.basename(symbol.sourceFile)}: context = "${symbol.context}"`);
          }
          break;
        
        case 'InconsistentMeaning':
          console.log(`  Symbol '${conflict.name}' has inconsistent meanings in context "${conflict.context}"`);
          for (const symbol of conflict.symbols) {
            console.log(`    - ${path.basename(symbol.sourceFile)}: meaning = "${symbol.meaning}"`);
          }
          break;
        
        case 'InconsistentNaming':
          console.log(`  LaTeX '${conflict.latex}' has inconsistent names`);
          for (const symbol of conflict.symbols) {
            console.log(`    - ${path.basename(symbol.sourceFile)}: name = "${symbol.name}", context = "${symbol.context}"`);
          }
          break;
        
        case 'DuplicateName':
          console.log(`  Duplicate name '${conflict.name}' for entity type ${conflict.entityType}`);
          for (const file of conflict.files) {
            console.log(`    - ${path.basename(file)}`);
          }
          break;
        
        case 'ConflictingRelationships':
          console.log(`  Conflicting relationships between ${conflict.endpoints[0]} and ${conflict.endpoints[1]}`);
          for (const rel of conflict.relationships) {
            console.log(`    - ${rel.relationType} in ${path.basename(rel.sourceFile)}`);
          }
          break;
      }
      
      console.log(`    Resolution: ${conflict.resolution}`);
    }
  }
}

// Main execution
if (require.main === module) {
  const symbolsOnly = process.argv.includes('--symbols-only');
  const allConflicts = [];
  
  // Get all symbols
  const symbols = getAllSymbols();
  console.log(`Analyzing ${symbols.length} symbol nodes...`);
  const symbolConflicts = detectSymbolConflicts(symbols);
  allConflicts.push(...symbolConflicts);
  
  if (!symbolsOnly) {
    // Get entity conflicts
    console.log('Analyzing entities for name conflicts...');
    const entityConflicts = getEntityConflicts();
    allConflicts.push(...entityConflicts);
    
    // Get relationship conflicts
    console.log('Analyzing relationship consistency...');
    const relationshipConflicts = detectRelationshipConflicts();
    allConflicts.push(...relationshipConflicts);
  }
  
  // Report conflicts
  reportConflicts(allConflicts);
}

module.exports = {
  detectSymbolConflicts,
  getEntityConflicts,
  detectRelationshipConflicts
};
