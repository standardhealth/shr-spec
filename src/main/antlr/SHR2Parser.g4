parser grammar SHR2Parser;

options { tokenVocab=SHR2Lexer; }

shr:                namespaceDef definitions;
namespaceDef:       KW_NAMESPACE COLON namespace;
namespace:          LOWER_WORD | DOT_SEPARATED_LW;
definitions:        definition+;
definition:         vocabularyDef | dataElementDef | compositionDef | entryDef | valuesetDef;

vocabularyDef:      KW_VOCABULARY COLON ALL_CAPS EQUAL URL;

dataElementDef:     dataElementHeader dataElementProps?;
dataElementHeader:  KW_DATA_ELEMENT COLON dataElementName;
dataElementName:    LOWER_WORD;
dataElementProps:   dataElementProp+;
dataElementProp:    extendsProp | conceptProp | descriptionProp | answerProp | valuesetProp | bindingProp;

compositionDef:     compositionHeader compositionProps?;
compositionHeader:  KW_COMPOSITION COLON dataElementName;
compositionProps:   compositionProp+;
compositionProp:    extendsProp | conceptProp | descriptionProp | hasProp;

entryDef:           entryHeader entryProps?;
entryHeader:        KW_ENTRY COLON entryName;
entryName:          UPPER_WORD | ALL_CAPS;
entryProps:         (dataElementProp | compositionProp)+;

valuesetDef:        valuesetHeader valuesetValues?;
valuesetHeader:     KW_VALUESET_DEFINITION COLON URL;
valuesetValues:     valuesetValue+;
valuesetValue:      CODE COLON STRING;

extendsProp:        KW_EXTENDS COLON (dataElementName | entryName);
conceptProp:        KW_CONCEPT COLON concepts;
concepts:           concept (COMMA concept)*;
concept:            ALL_CAPS CODE;
descriptionProp:    KW_DESCRIPTION COLON STRING;
answerProp:         KW_ANSWER COLON answers;
answers:            answer (COMMA answer)*;
answer:             dataElementName | primitive;
valuesetProp:       KW_VALUESET COLON URL;
bindingProp:        KW_BINDING COLON KW_REQUIRED; // TODO: Define more bindings
hasProp:            KW_HAS COLON countedThings;

primitive:          KW_BOOLEAN | KW_INTEGER | KW_STRING | KW_DECIMAL | KW_URI | KW_BASE64_BINARY | KW_INSTANT | KW_DATE
                    | KW_DATE_TIME | KW_TIME | KW_CODE | KW_OID | KW_ID | KW_MARKDOWN | KW_UNSIGNED_INT
                    | KW_POSITIVE_INT;

countedThings:      countedThing+;
countedThing:       WHOLE_NUMBER RANGE (WHOLE_NUMBER|STAR) dataElementName;