/**
 * Entity Consistency Checker
 * 
 * This script validates entity nodes for consistency across the knowledge graph.
 * It performs the following checks:
 * 1. Entity property consistency (naming conventions, value formats)
 * 2. Cross-entity relationship integrity
 * 3. Domain-specific validation rules
 * 4. Referential integrity for entity relationships
 * 
 * Usage: node entity-consistency.js <entity-type> [<entity-name>]
 */

const fs = require('fs');
const path = require('path');

// Configuration
const ENTITIES_PATH = path.join(__dirname, '..', '..', 'cypher', 'entities');
const SYMBOLS_PATH = path.join(__dirname, '..', '..', 'cypher', 'symbols');
const SCHEMA_PATH = path.join(__dirname, '..', '..', 'cypher', 'schema');
const ENTITY_SCHEMA_FILE = path.join(SCHEMA_PATH, 'entity-types.cypher');

// Helper functions
function loadEntitySchema() {
  try {
    const content = fs.readFileSync(ENTITY_SCHEMA_FILE, 'utf8');
    return parseEntitySchema(content);
  } catch (err) {
    console.error(`Error loading entity schema: ${err.message}`);
    return {};
  }
}

function parseEntitySchema(schemaContent) {
  const entityTypes = {};
  const entitySchemaRegex = /CREATE CONSTRAINT.*FOR \(n:(\w+)\).*REQUIRE n\.(\w+) IS UNIQUE/g;
  const propertySchemaRegex = /\/\/ Properties for (\w+):\s*\/\/ Required: ([\w, ]+)\s*\/\/ Optional: ([\w, ]*)/g;
  
  let match;
  while ((match = entitySchemaRegex.exec(schemaContent)) !== null) {
    const entityType = match[1];
    const uniqueProperty = match[2];
    entityTypes[entityType] = { uniqueProperty, required: [], optional: [] };
  }
  
  while ((match = propertySchemaRegex.exec(schemaContent)) !== null) {
    const entityType = match[1];
    const requiredProps = match[2].split(',').map(p => p.trim()).filter(p => p);
    const optionalProps = match[3].split(',').map(p => p.trim()).filter(p => p);
    
    if (entityTypes[entityType]) {
      entityTypes[entityType].required = requiredProps;
      entityTypes[entityType].optional = optionalProps;
    }
  }
  
  return entityTypes;
}

function findEntityFiles(entityType, entityName = null) {
  let basePath;
  if (entityType === 'Symbol') {
    basePath = SYMBOLS_PATH;
  } else {
    basePath = ENTITIES_PATH;
  }
  
  if (!fs.existsSync(basePath)) {
    return [];
  }
  
  const files = fs.readdirSync(basePath)
    .filter(file => file.endsWith('.cypher'))
    .map(file => path.join(basePath, file));
  
  if (entityName) {
    return files.filter(file => {
      const basename = path.basename(file, '.cypher');
      return basename.includes(entityName);
    });
  }
  
  return files;
}

function extractEntityProperties(cypherContent, entityType) {
  const createPattern = new RegExp(`CREATE \\(\\w*:${entityType} {([^}]*)}\\)`, 'g');
  const properties = {};
  
  let match;
  while ((match = createPattern.exec(cypherContent)) !== null) {
    const propsText = match[1];
    const propMatches = propsText.match(/([\w]+): ("[^"]*"|'[^']*'|\[[^\]]*\]|{[^}]*}|\w+)/g) || [];
    
    for (const propMatch of propMatches) {
      const [key, value] = propMatch.split(':').map(p => p.trim());
      properties[key] = value;
    }
  }
  
  return properties;
}

function extractRelationships(cypherContent) {
  const relationships = [];
  const relPattern = /MATCH \((\w+):(\w+) {[^}]*}\)\s*MATCH \((\w+):(\w+) {[^}]*}\)\s*CREATE \((\w+)\)-\[:(\w+) {([^}]*)?}\]->\((\w+)\)/g;
  
  let match;
  while ((match = relPattern.exec(cypherContent)) !== null) {
    relationships.push({
      sourceVariable: match[1],
      sourceType: match[2],
      targetVariable: match[3],
      targetType: match[4],
      actualSourceVar: match[5],
      relationType: match[6],
      properties: match[7] || '',
      actualTargetVar: match[8]
    });
  }
  
  return relationships;
}

function validateNamingConventions(properties, entityType) {
  const errors = [];
  
  // Check naming conventions based on entity type
  switch (entityType) {
    case 'MathematicalConcept':
      if (properties.name && !/^[A-Z][a-zA-Z0-9]*$/.test(properties.name.replace(/["']/g, ''))) {
        errors.push(`MathematicalConcept name should be in PascalCase: ${properties.name}`);
      }
      break;
    case 'NumericalMethod':
      if (properties.name && !/^[A-Z][a-zA-Z0-9]*$/.test(properties.name.replace(/["']/g, ''))) {
        errors.push(`NumericalMethod name should be in PascalCase: ${properties.name}`);
      }
      break;
    case 'Algorithm':
      if (properties.name && !/^[A-Z][a-zA-Z0-9]*$/.test(properties.name.replace(/["']/g, ''))) {
        errors.push(`Algorithm name should be in PascalCase: ${properties.name}`);
      }
      break;
    case 'Symbol':
      // Symbols can follow various conventions
      break;
    case 'Paper':
      if (properties.id && !/^[A-Z][a-z]+\d{4}[a-z]?$/.test(properties.id.replace(/["']/g, ''))) {
        errors.push(`Paper ID should follow format 'Author1234': ${properties.id}`);
      }
      break;
  }
  
  return errors;
}

function validatePropertyValues(properties, entityType, entitySchema) {
  const errors = [];
  
  // Check required properties
  if (entitySchema && entitySchema.required) {
    for (const requiredProp of entitySchema.required) {
      if (!properties[requiredProp]) {
        errors.push(`Missing required property: ${requiredProp}`);
      }
    }
  }
  
  // Check property value types and formats
  for (const [key, value] of Object.entries(properties)) {
    // Check if property exists in schema
    if (entitySchema && 
        !entitySchema.required.includes(key) && 
        !entitySchema.optional.includes(key)) {
      errors.push(`Unknown property: ${key}`);
      continue;
    }
    
    // Remove quotes for string analysis
    const cleanValue = typeof value === 'string' ? value.replace(/^["']|["']$/g, '') : value;
    
    // Type-specific validations
    switch (key) {
      case 'year':
        if (!/^\d{4}$/.test(cleanValue)) {
          errors.push(`Year should be a 4-digit number: ${value}`);
        }
        break;
      case 'doi':
        if (cleanValue && !/^10\.\d{4,9}\/[-._;()/:A-Za-z0-9]+$/.test(cleanValue)) {
          errors.push(`DOI format is incorrect: ${value}`);
        }
        break;
      case 'url':
        if (cleanValue && !/^https?:\/\/\S+$/.test(cleanValue)) {
          errors.push(`URL format is incorrect: ${value}`);
        }
        break;
      case 'latex':
        // Basic LaTeX validation - should start with a backslash for commands
        if (entityType === 'Symbol' && cleanValue && 
            cleanValue.includes('\\') && 
            !cleanValue.startsWith('\\')) {
          errors.push(`LaTeX may be malformed: ${value}`);
        }
        break;
    }
  }
  
  return errors;
}

function validateMathSymbols(properties) {
  const errors = [];
  
  // Symbol-specific validations
  if (properties.latex && !properties.name) {
    errors.push('Symbol has LaTeX representation but no name property');
  }
  
  if (properties.name && !properties.context) {
    errors.push('Symbol has name but no context property');
  }
  
  if (properties.dimensionality && 
      !['Scalar', 'Vector', 'Matrix', 'Tensor'].includes(properties.dimensionality.replace(/["']/g, ''))) {
    errors.push(`Invalid dimensionality: ${properties.dimensionality}`);
  }
  
  return errors;
}

function validateSingleEntity(filePath, entityType, entitySchema) {
  try {
    console.log(`Validating ${path.basename(filePath)}...`);
    const content = fs.readFileSync(filePath, 'utf8');
    
    // Skip template files
    if (content.includes('[ENTITY_NAME]') || content.includes('[PLACEHOLDER]')) {
      console.log('  File appears to be a template, skipping detailed validation');
      return { valid: true, warnings: ['This file is a template'] };
    }
    
    // Extract entity properties
    const properties = extractEntityProperties(content, entityType);
    if (Object.keys(properties).length === 0) {
      return { 
        valid: false,
        errors: [`No ${entityType} entity found in file`]
      };
    }
    
    // Extract relationships
    const relationships = extractRelationships(content);
    
    // Perform validations
    const namingErrors = validateNamingConventions(properties, entityType);
    const propertyErrors = validatePropertyValues(properties, entityType, entitySchema);
    
    // Entity-specific validations
    let specificErrors = [];
    if (entityType === 'Symbol') {
      specificErrors = validateMathSymbols(properties);
    }
    
    // Relationship validations
    const relationshipErrors = validateRelationships(relationships, filePath);
    
    const allErrors = [
      ...namingErrors,
      ...propertyErrors,
      ...specificErrors,
      ...relationshipErrors
    ];
    
    return {
      valid: allErrors.length === 0,
      properties,
      relationships,
      errors: allErrors
    };
  } catch (err) {
    return {
      valid: false,
      errors: [`Error processing file: ${err.message}`]
    };
  }
}

function validateRelationships(relationships, filePath) {
  const errors = [];
  
  // Check source and target variable consistency
  for (const rel of relationships) {
    if (rel.sourceVariable !== rel.actualSourceVar) {
      errors.push(`Source variable mismatch: ${rel.sourceVariable} vs ${rel.actualSourceVar}`);
    }
    if (rel.targetVariable !== rel.actualTargetVar) {
      errors.push(`Target variable mismatch: ${rel.targetVariable} vs ${rel.actualTargetVar}`);
    }
    
    // Check for standard relationship types
    const validTypes = [
      'BASED_ON', 'IMPLEMENTS', 'APPLIES_TO', 'IMPROVES_UPON', 
      'DEPENDS_ON', 'INTEGRATES_WITH', 'APPEARS_IN', 'REPRESENTS', 
      'HAS_INTERPRETATION_IN', 'CONFLICTS_WITH', 'SYNONYM_OF',
      'DERIVED_FROM', 'USED_IN_EQUATION', 'SPECIALIZES', 'RELATES_TO', 
      'INTRODUCES', 'CITES', 'DEVELOPS', 'PRESENTS', 'SUBDOMAIN_OF',
      'USES_SYMBOL', 'EXTENDS'
    ];
    
    if (!validTypes.includes(rel.relationType)) {
      errors.push(`Non-standard relationship type: ${rel.relationType}`);
    }
  }
  
  return errors;
}

function validateEntities(entityType, entityName = null) {
  // Load entity schema
  const entitySchema = loadEntitySchema();
  
  // Find relevant files
  const files = findEntityFiles(entityType, entityName);
  if (files.length === 0) {
    console.log(`No ${entityType} files found${entityName ? ` for ${entityName}` : ''}`);
    return;
  }
  
  // Validate each file
  let validCount = 0;
  let errorCount = 0;
  
  for (const file of files) {
    const result = validateSingleEntity(file, entityType, entitySchema[entityType]);
    
    if (result.valid) {
      console.log(`✅ ${path.basename(file)}: VALID`);
      validCount++;
    } else {
      console.error(`❌ ${path.basename(file)}: INVALID`);
      for (const error of result.errors) {
        console.error(`  - ${error}`);
      }
      errorCount++;
    }
  }
  
  console.log(`\nValidation Summary: ${validCount} valid, ${errorCount} invalid out of ${files.length} files`);
}

// Main execution
if (require.main === module) {
  const entityType = process.argv[2];
  const entityName = process.argv[3];
  
  if (!entityType) {
    console.error('Please provide an entity type (e.g., Symbol, MathematicalConcept, NumericalMethod)');
    process.exit(1);
  }
  
  validateEntities(entityType, entityName);
}

module.exports = {
  validateSingleEntity,
  validateEntities
};
