/**
 * Cypher Validator Script
 * 
 * This script validates Cypher files for syntax correctness and schema compliance.
 * It performs the following checks:
 * 1. Basic syntax validation
 * 2. Schema compliance checking
 * 3. Property validation against schema definitions
 * 4. Relationship type validation
 * 
 * Usage: node cypher-validator.js <path-to-cypher-file>
 */

const fs = require('fs');
const path = require('path');

// Configuration
const SCHEMA_PATH = path.join(__dirname, '..', '..', 'cypher', 'schema');
const ENTITY_SCHEMA_FILE = path.join(SCHEMA_PATH, 'entity-types.cypher');
const RELATIONSHIP_SCHEMA_FILE = path.join(SCHEMA_PATH, 'relationship-types.cypher');

// Helper functions
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

function parseRelationshipSchema(schemaContent) {
  const relationshipTypes = {};
  const relSchemaRegex = /\/\/ Relationship Type: (\w+)\s*\/\/ From: ([\w, ]+)\s*\/\/ To: ([\w, ]+)\s*\/\/ Properties: ([\w, ]*)/g;
  
  let match;
  while ((match = relSchemaRegex.exec(schemaContent)) !== null) {
    const relType = match[1];
    const fromTypes = match[2].split(',').map(t => t.trim());
    const toTypes = match[3].split(',').map(t => t.trim());
    const properties = match[4].split(',').map(p => p.trim()).filter(p => p);
    
    relationshipTypes[relType] = { fromTypes, toTypes, properties };
  }
  
  return relationshipTypes;
}

function validateEntitySyntax(cypherContent) {
  const errors = [];
  
  // Check for basic syntax errors
  if (cypherContent.includes('CREATE (') && !cypherContent.includes('}') && !cypherContent.includes(')')) {
    errors.push('Possible unclosed parenthesis or missing property object');
  }
  
  // Check for node labels
  const nodeCreations = cypherContent.match(/CREATE \([\w\s]*:(\w+)/g) || [];
  for (const creation of nodeCreations) {
    const labelMatch = creation.match(/CREATE \([\w\s]*:(\w+)/);
    if (labelMatch && labelMatch[1] && !entityTypes[labelMatch[1]]) {
      errors.push(`Invalid entity type: ${labelMatch[1]}`);
    }
  }
  
  // Check for MATCH statements with correct labels
  const matchStatements = cypherContent.match(/MATCH \([\w\s]*:(\w+)[^\)]*\)/g) || [];
  for (const match of matchStatements) {
    const labelMatch = match.match(/MATCH \([\w\s]*:(\w+)/);
    if (labelMatch && labelMatch[1] && !entityTypes[labelMatch[1]]) {
      errors.push(`Invalid entity type in MATCH: ${labelMatch[1]}`);
    }
  }
  
  return errors;
}

function validateRelationshipSyntax(cypherContent) {
  const errors = [];
  
  // Check for relationship types
  const relCreations = cypherContent.match(/CREATE \([^)]+\)-\[:(\w+)[^\]]*\]->/g) || [];
  for (const creation of relCreations) {
    const typeMatch = creation.match(/CREATE \([^)]+\)-\[:(\w+)/);
    if (typeMatch && typeMatch[1] && !relationshipTypes[typeMatch[1]]) {
      errors.push(`Invalid relationship type: ${typeMatch[1]}`);
    }
  }
  
  // Check for relationship source and target types
  const fullRelCreations = cypherContent.match(/MATCH \([^:]+:(\w+)[^\)]*\).*\s+MATCH \([^:]+:(\w+)[^\)]*\).*\s+CREATE \([^)]+\)-\[:(\w+)[^\]]*\]->/gs) || [];
  for (const creation of fullRelCreations) {
    const match = creation.match(/MATCH \([^:]+:(\w+)[^\)]*\).*\s+MATCH \([^:]+:(\w+)[^\)]*\).*\s+CREATE \([^)]+\)-\[:(\w+)/s);
    if (match) {
      const sourceType = match[1];
      const targetType = match[2];
      const relType = match[3];
      
      if (relationshipTypes[relType]) {
        if (!relationshipTypes[relType].fromTypes.includes(sourceType)) {
          errors.push(`Invalid source type ${sourceType} for relationship ${relType}`);
        }
        if (!relationshipTypes[relType].toTypes.includes(targetType)) {
          errors.push(`Invalid target type ${targetType} for relationship ${relType}`);
        }
      }
    }
  }
  
  return errors;
}

function validateProperties(cypherContent) {
  const errors = [];
  
  // Extract CREATE statements with properties
  const createStatements = cypherContent.match(/CREATE \([\w\s]*:(\w+) {([^}]*)}/g) || [];
  
  for (const statement of createStatements) {
    const typeMatch = statement.match(/CREATE \([\w\s]*:(\w+)/);
    if (!typeMatch) continue;
    
    const entityType = typeMatch[1];
    const schema = entityTypes[entityType];
    if (!schema) continue;
    
    // Extract properties
    const propertiesStr = statement.match(/CREATE \([\w\s]*:(\w+) {([^}]*)}/)[2];
    const properties = propertiesStr.split(',').map(p => {
      const keyValue = p.match(/"?([^:"]+)"?\s*:/);
      return keyValue ? keyValue[1].trim() : null;
    }).filter(p => p);
    
    // Check for required properties
    for (const required of schema.required) {
      if (!properties.includes(required)) {
        errors.push(`Missing required property '${required}' for ${entityType}`);
      }
    }
    
    // Check for unknown properties
    for (const prop of properties) {
      if (!schema.required.includes(prop) && !schema.optional.includes(prop)) {
        errors.push(`Unknown property '${prop}' for ${entityType}`);
      }
    }
  }
  
  return errors;
}

function validateCypherFile(filePath) {
  console.log(`Validating ${filePath}...`);
  
  try {
    const content = fs.readFileSync(filePath, 'utf8');
    
    // Skip files that are just templates with placeholders
    if (content.includes('[ENTITY_TYPE]') || content.includes('[ENTITY_NAME]')) {
      console.log('File appears to be a template, skipping detailed validation');
      return { valid: true, warnings: ['This file is a template'] };
    }
    
    // Remove comments
    const cleanContent = content.replace(/\/\/[^\n]*/g, '').replace(/\/\*[\s\S]*?\*\//g, '');
    
    const syntaxErrors = validateEntitySyntax(cleanContent);
    const relationshipErrors = validateRelationshipSyntax(cleanContent);
    const propertyErrors = validateProperties(cleanContent);
    
    const allErrors = [...syntaxErrors, ...relationshipErrors, ...propertyErrors];
    
    return {
      valid: allErrors.length === 0,
      errors: allErrors
    };
  } catch (err) {
    return {
      valid: false,
      errors: [`Error reading file: ${err.message}`]
    };
  }
}

// Main execution
if (require.main === module) {
  try {
    // Load schemas
    const entitySchemaContent = fs.readFileSync(ENTITY_SCHEMA_FILE, 'utf8');
    const relationshipSchemaContent = fs.readFileSync(RELATIONSHIP_SCHEMA_FILE, 'utf8');
    
    // Parse schemas
    const entityTypes = parseEntitySchema(entitySchemaContent);
    const relationshipTypes = parseRelationshipSchema(relationshipSchemaContent);
    
    // Validate file
    const targetPath = process.argv[2];
    if (!targetPath) {
      console.error('Please provide a path to a Cypher file or directory');
      process.exit(1);
    }
    
    if (fs.lstatSync(targetPath).isDirectory()) {
      // Validate all .cypher files in directory
      const files = fs.readdirSync(targetPath)
        .filter(file => file.endsWith('.cypher'))
        .map(file => path.join(targetPath, file));
      
      let allValid = true;
      for (const file of files) {
        const result = validateCypherFile(file);
        if (!result.valid) {
          allValid = false;
          console.error(`❌ ${path.basename(file)}: INVALID`);
          for (const error of result.errors) {
            console.error(`  - ${error}`);
          }
        } else {
          console.log(`✅ ${path.basename(file)}: VALID`);
        }
      }
      
      process.exit(allValid ? 0 : 1);
    } else {
      // Validate single file
      const result = validateCypherFile(targetPath);
      if (!result.valid) {
        console.error('❌ VALIDATION FAILED:');
        for (const error of result.errors) {
          console.error(`  - ${error}`);
        }
        process.exit(1);
      } else {
        console.log('✅ VALIDATION PASSED');
        if (result.warnings && result.warnings.length > 0) {
          console.log('⚠️ WARNINGS:');
          for (const warning of result.warnings) {
            console.log(`  - ${warning}`);
          }
        }
        process.exit(0);
      }
    }
    
  } catch (err) {
    console.error(`Error during validation: ${err.message}`);
    process.exit(1);
  }
}

module.exports = {
  validateCypherFile
};
