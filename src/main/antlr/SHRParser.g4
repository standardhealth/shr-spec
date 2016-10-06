parser grammar SHRParser;

options { tokenVocab=SHRLexer; }

shr:                namespaceDef definitions;
namespaceDef:       KW_NAMESPACE COLON namespace;
namespace:          LOWER_WORD | DOT_SEPARATED_LW;
definitions:        definition+;
definition:         vocabularyDef | sectionDef | dataElementDef | groupDef | valuesetDef;

vocabularyDef:      KW_VOCABULARY COLON ALL_CAPS EQUAL URL;

sectionDef:         sectionHeader countedElements;
sectionHeader:      KW_SECTION COLON simpleName;

dataElementDef:     dataElementHeader dataElementProps?;
dataElementHeader:  (KW_DATA_ELEMENT | KW_ENTRY) COLON simpleName;
dataElementProps:   dataElementProp+;
dataElementProp:    extendsProp | conceptProp | descriptionProp | valueProp | defaultProp;

groupDef:           groupHeader groupProps? countedElements;
groupHeader:        (KW_GROUP | KW_ENTRY) COLON simpleName;
groupProps:         groupProp+;
groupProp:          extendsProp | conceptProp | descriptionProp;

valuesetDef:        valuesetHeader valuesetValues?;
valuesetHeader:     KW_VALUESET_DEFINITION COLON URL;
valuesetValues:     valuesetValue+;
valuesetValue:      CODE STRING;

extendsProp:        KW_EXTENDS COLON (simpleOrFQName);
conceptProp:        KW_CONCEPT COLON concepts;
concepts:           concept (COMMA concept)*;
concept:            KW_TBD | (ALL_CAPS CODE);
descriptionProp:    KW_DESCRIPTION COLON STRING;
valueProp:          KW_VALUE COLON values;
values:             count? value | count? OPEN_PAREN values CLOSE_PAREN| values KW_OR values;
value:              simpleOrFQName | ref | codeFromValueset | primitive;
valueset:           URL;
defaultProp:        KW_DEFAULT COLON defaultValue;
defaultValue:       KW_BOOLEAN_VALUE | STRING | CODE;

simpleName:         UPPER_WORD | ALL_CAPS;
fullyQualifiedName: DOT_SEPARATED_UW;
simpleOrFQName:     simpleName | fullyQualifiedName;
ref:                KW_REF OPEN_PAREN simpleOrFQName CLOSE_PAREN;
codeFromValueset:   KW_CODE KW_FROM valueset;
primitive:          KW_BOOLEAN | KW_INTEGER | KW_STRING | KW_DECIMAL | KW_URI | KW_BASE64_BINARY | KW_INSTANT | KW_DATE
                    | KW_DATE_TIME | KW_TIME | KW_CODE | KW_OID | KW_ID | KW_MARKDOWN | KW_UNSIGNED_INT
                    | KW_POSITIVE_INT;

count:              WHOLE_NUMBER RANGE (WHOLE_NUMBER | STAR);
countedElements:    countedElement+;
countedElement:     count simpleOrFQName;