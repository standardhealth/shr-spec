parser grammar SHRParser;

options { tokenVocab=SHRLexer; }

shr:                namespaceDef definitions;
namespaceDef:       KW_NAMESPACE COLON namespace;
namespace:          LOWER_WORD | DOT_SEPARATED_LW;
definitions:        definition+;
definition:         vocabularyDef | sectionDef | dataElementDef | entryDef | groupDef | valuesetDef;

vocabularyDef:      KW_VOCABULARY COLON ALL_CAPS EQUAL URL;

sectionDef:           sectionHeader sectionProps?;
sectionHeader:        KW_SECTION COLON sectionName;
sectionName:          UPPER_WORD | ALL_CAPS;
sectionProps:         hasProp+;

dataElementDef:     dataElementHeader dataElementProps?;
dataElementHeader:  KW_DATA_ELEMENT COLON dataElementName;
dataElementName:    LOWER_WORD;
dataElementProps:   dataElementProp+;
dataElementProp:    extendsProp | conceptProp | descriptionProp | valueProp | defaultProp;

entryDef:           entryHeader entryProps?;
entryHeader:        KW_ENTRY COLON entryName;
entryName:          UPPER_WORD | ALL_CAPS;
entryProps:         entryProp+;
entryProp:          extendsProp | conceptProp | descriptionProp | valueProp | hasProp | defaultProp;

groupDef:           groupHeader groupProps?;
groupHeader:        KW_GROUP COLON groupName;
groupName:          LOWER_WORD | UPPER_WORD | ALL_CAPS;
groupProps:         groupProp+;
groupProp:          extendsProp | conceptProp | descriptionProp | hasProp;

valuesetDef:        valuesetHeader valuesetValues?;
valuesetHeader:     KW_VALUESET_DEFINITION COLON URL;
valuesetValues:     valuesetValue+;
valuesetValue:      CODE COLON STRING;

extendsProp:        KW_EXTENDS COLON (dataElementName | entryName);
conceptProp:        KW_CONCEPT COLON concepts;
concepts:           concept (COMMA concept)*;
concept:            KW_TBD | (ALL_CAPS CODE);
descriptionProp:    KW_DESCRIPTION COLON STRING;
valueProp:          KW_VALUE COLON values;
values:             count? value | count? OPEN_PAREN values CLOSE_PAREN| values KW_OR values;
value:              dataElementId | entryId | entryRef | codeFromValueset | primitive;
valueset:           URL;
defaultProp:        KW_DEFAULT COLON defaultValue;
defaultValue:       KW_BOOLEAN_VALUE | STRING | CODE;
hasProp:            (KW_HAS COLON)? countedThings;

dataElementId:      LOWER_WORD | DOT_SEPARATED_LW;
entryId:            UPPER_WORD | DOT_SEPARATED_UW;
entryRef:           KW_REF OPEN_PAREN entryId CLOSE_PAREN;
codeFromValueset:   KW_CODE KW_FROM valueset;
primitive:          KW_BOOLEAN | KW_INTEGER | KW_STRING | KW_DECIMAL | KW_URI | KW_BASE64_BINARY | KW_INSTANT | KW_DATE
                    | KW_DATE_TIME | KW_TIME | KW_CODE | KW_OID | KW_ID | KW_MARKDOWN | KW_UNSIGNED_INT
                    | KW_POSITIVE_INT;

count:              WHOLE_NUMBER RANGE (WHOLE_NUMBER | STAR);
countedThings:      countedThing+;
countedThing:       count (dataElementId | entryId);