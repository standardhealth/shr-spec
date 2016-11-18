parser grammar SHRParser;

options { tokenVocab=SHRLexer; }

shr:                dataDefsDoc | valuesetDefsDoc /* | contentProfiles*/;

// DATA DEFINITIONS (Vocabularies, Entries, Elements)

dataDefsDoc:        dataDefsHeader usesStatement? dataDefs;
dataDefsHeader:     KW_DATA_DEFINITIONS namespace;

usesStatement:      KW_USES namespace (COMMA namespace)*;

dataDefs:           dataDef+;
dataDef:            vocabularyDef | elementDef | entryDef;

vocabularyDef:      KW_VOCABULARY ALL_CAPS EQUAL URL;

elementDef:         elementHeader elementProps? (singleValue | multiValue);
elementHeader:      KW_ELEMENT simpleName;

entryDef:           entryHeader elementProps? (singleValue | multiValue);
entryHeader:        KW_ENTRY simpleName;

elementProps:       elementProp+;
elementProp:        conceptProp | descriptionProp;

singleValue:        countedType (KW_OR countedType)*;
countedType:        count types;
types:              type | OPEN_PAREN type (KW_OR type)* CLOSE_PAREN;
type:               simpleOrFQName | ref | codeConstraint | primitive;

multiValue:         countedElements+;
countedElements:    countedElement (KW_OR countedElement)*;
countedElement:     count elements;
elements:           element | OPEN_PAREN element (KW_OR element)* CLOSE_PAREN;
element:            simpleOrFQName | ref;

conceptProp:        KW_CONCEPT (KW_TBD | concepts);
concepts:           fullyQualifiedCode (COMMA fullyQualifiedCode)*;
descriptionProp:    KW_DESCRIPTION STRING;

// VALUESET DEFINITIONS

valuesetDefsDoc:    valuesetDefsHeader usesStatement? valuesetDefs;
valuesetDefsHeader:  KW_VALUESET_DEFINITIONS namespace;

valuesetDefs:       valuesetDef+;
valuesetDef:        valuesetHeader valuesetValues?;
valuesetHeader:     KW_VALUESET URL;
valuesetValues:     valuesetValue+;
valuesetValue:      CODE STRING?;

// CONTENT PROFILES: TODO -- May Be a Separate Grammar

// COMMON BITS

namespace:          LOWER_WORD | DOT_SEPARATED_LW;
simpleName:         UPPER_WORD | ALL_CAPS;
fullyQualifiedName: DOT_SEPARATED_UW;
simpleOrFQName:     simpleName | fullyQualifiedName;
ref:                KW_REF OPEN_PAREN simpleOrFQName CLOSE_PAREN;
code:               CODE EXTRA_INFO?;
fullyQualifiedCode: ALL_CAPS code;
codeConstraint:     codeFromValueset | codeDescendent;
codeFromValueset:   KW_CODE KW_FROM valueset;
codeDescendent:     KW_CODE KW_DESCENDING_FROM fullyQualifiedCode;
valueset:           URL;
primitive:          KW_BOOLEAN | KW_INTEGER | KW_STRING | KW_DECIMAL | KW_URI | KW_BASE64_BINARY | KW_INSTANT | KW_DATE
                    | KW_DATE_TIME | KW_TIME | KW_CODE | KW_OID | KW_ID | KW_MARKDOWN | KW_UNSIGNED_INT
                    | KW_POSITIVE_INT;
count:              WHOLE_NUMBER RANGE (WHOLE_NUMBER | STAR);
