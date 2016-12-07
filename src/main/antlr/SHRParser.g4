parser grammar SHRParser;

options { tokenVocab=SHRLexer; }

shr:                dataDefsDoc | valuesetDefsDoc /* | contentProfiles*/;

// DATA DEFINITIONS (Vocabularies, Entries, Elements)

dataDefsDoc:        dataDefsHeader usesStatement? pathDefs? vocabularyDefs? dataDefs;
dataDefsHeader:     KW_DATA_DEFINITIONS namespace;

usesStatement:      KW_USES namespace (COMMA namespace)*;

pathDefs:           (defaultPathDef pathDef*) | (defaultPathDef? pathDef+);
defaultPathDef:     KW_PATH URL;
pathDef:            KW_PATH ALL_CAPS EQUAL URL;

vocabularyDefs:     vocabularyDef+;
vocabularyDef:      KW_VOCABULARY ALL_CAPS EQUAL (URL | URN_OID);

dataDefs:           dataDef*;
dataDef:            elementDef | entryDef;

elementDef:         elementHeader elementProps? values;
elementHeader:      KW_ELEMENT simpleName;

entryDef:           entryHeader elementProps? values;
entryHeader:        KW_ENTRY_ELEMENT simpleName;

elementProps:       elementProp+;
elementProp:        basedOnProp | conceptProp | descriptionProp;

values:             (value supportingValue*) | (value? supportingValue+);

value:              KW_VALUE (uncountedValue | countedValue);
uncountedValue:     (valueType (KW_OR valueType)*) | (OPEN_PAREN valueType (KW_OR valueType)* CLOSE_PAREN);
countedValue:       count valueType | count OPEN_PAREN valueType (KW_OR valueType)* CLOSE_PAREN;
valueType:          simpleOrFQName | ref | primitive | codeFromVS | elementWithConstraint | quantityWithUnits | KW_TBD;

supportingValue:        countedSupportingValue (KW_OR countedSupportingValue)*;
countedSupportingValue: count (supportingValueType | OPEN_PAREN supportingValueType (KW_OR supportingValueType)* CLOSE_PAREN);
supportingValueType:    simpleOrFQName | ref | elementWithConstraint;

basedOnProp:        KW_BASED_ON simpleOrFQName;
conceptProp:        KW_CONCEPT (KW_TBD | concepts);
concepts:           fullyQualifiedCode (COMMA fullyQualifiedCode)*;
descriptionProp:    KW_DESCRIPTION STRING;

// VALUESET DEFINITIONS

valuesetDefsDoc:    valuesetDefsHeader usesStatement? pathDefs? vocabularyDefs? valuesetDefs;
valuesetDefsHeader: KW_VALUESET_DEFINITIONS namespace;

valuesetDefs:           valuesetDef*;
valuesetDef:            valuesetHeader valuesetProps? valuesetValues?;
valuesetHeader:         KW_VALUESET (URL | URN_OID| simpleName);
valuesetValues:         valuesetValue+;
valuesetValue:          fullyQualifiedCode | valuesetInlineValue | valuesetDescendingFrom | valuesetFrom;
valuesetInlineValue:    CODE STRING?;
valuesetDescendingFrom: KW_INCLUDES_CODES_DESCENDING_FROM fullyQualifiedCode (KW_AND_NOT_DESCENDING_FROM fullyQualifiedCode)*;
valuesetFrom:           KW_INCLUDES_CODES_FROM fullyQualifiedCode;

valuesetProps:      valuesetProp+;
valuesetProp:       conceptProp | descriptionProp;


// CONTENT PROFILES: TODO -- May Be a Separate Grammar

// COMMON BITS

namespace:          LOWER_WORD | DOT_SEPARATED_LW;
simpleName:         UPPER_WORD | ALL_CAPS;
fullyQualifiedName: DOT_SEPARATED_UW;
simpleOrFQName:     simpleName | fullyQualifiedName;
ref:                KW_REF OPEN_PAREN simpleOrFQName CLOSE_PAREN;
code:               CODE STRING?;
fullyQualifiedCode: ALL_CAPS code;
codeFromVS:         (KW_CODE_FROM | KW_CODING_FROM) valueset;
elementWithConstraint:      simpleOrFQName (DOT simpleName)* elementConstraint;
elementConstraint:          elementCodeVSConstraint | elementCodeValueConstraint | elementTypeConstraint;
elementCodeVSConstraint:    KW_WITH codeFromVS;
elementCodeValueConstraint: KW_IS fullyQualifiedCode;
elementTypeConstraint:      KW_IS simpleOrFQName;
quantityWithUnits:  KW_QUANTITY_WITH_UNITS fullyQualifiedCode;
valueset:           URL | PATH_URL | URN_OID | simpleName;
primitive:          KW_BOOLEAN | KW_INTEGER | KW_STRING | KW_DECIMAL | KW_URI | KW_BASE64_BINARY | KW_INSTANT | KW_DATE
                    | KW_DATE_TIME | KW_TIME | KW_CODE | KW_OID | KW_ID | KW_MARKDOWN | KW_UNSIGNED_INT
                    | KW_POSITIVE_INT;
count:              WHOLE_NUMBER RANGE (WHOLE_NUMBER | STAR);
