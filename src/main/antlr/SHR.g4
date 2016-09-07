grammar SHR;

/*
 * Parser Rules
 */

shr
    : namespaceHeader section+;

namespaceHeader
    : HASHES namespace HASHES;

namespace
    : ALPHNUMERICWORD | DOTSEPARATEDWORDS;

section
    : dataElementSection | entrySection;

dataElementSection
    : dataElementSectionHeader dataElementDefinition*;

dataElementSectionHeader
    : EQUALS 'DATA ELEMENTS' EQUALS;

dataElementDefinition
    : complexDataElementDefinition | dateDataElementDefinition | enumDataElementDefinition | textDataElementDefinition;

// COMPLEX Data Element

complexDataElementDefinition
    : complexDataElementHeader complexDataElementContents;

complexDataElementHeader
    : DASHES ALPHNUMERICWORD 'complex' DASHES;

complexDataElementContents
    : (titleProperty | descriptionProperty | containsProperty | akaProperty | createdProperty)+;

// DATE Data Element

dateDataElementDefinition
    : dateDataElementHeader dateDataElementContents;

dateDataElementHeader
    : DASHES ALPHNUMERICWORD 'date' DASHES;

dateDataElementContents
    : (titleProperty | descriptionProperty | akaProperty | createdProperty)+;

// ENUM Data Element

enumDataElementDefinition
    : enumDataElementHeader enumDataElementContents;

enumDataElementHeader
    : DASHES ALPHNUMERICWORD 'enum' DASHES;

enumDataElementContents
    : (titleProperty | descriptionProperty | valuesProperty | akaProperty | createdProperty)+;

// TEXT Data Element

textDataElementDefinition
    : textDataElementHeader textDataElementContents;

textDataElementHeader
    : DASHES ALPHNUMERICWORD 'text' DASHES;

textDataElementContents
    : (titleProperty | descriptionProperty | akaProperty | createdProperty)+;

entrySection
    : entrySectionHeader entryDefinition*;

entrySectionHeader
    : EQUALS 'ENTRIES' EQUALS;

entryDefinition
    : entryHeader entryContents;

entryHeader
    : DASHES ALPHNUMERICWORD DASHES;

entryContents
    : (titleProperty | descriptionProperty | containsProperty | akaProperty | constraintsProperty | createdProperty)+;

akaProperty
    : 'aka' (ALPHNUMERICWORD CODE ','?)+;

titleProperty
    : 'title' STRING;

descriptionProperty
    : 'description' STRING;

valuesProperty
    : 'values' (CODE ('displayed as' STRING)? ','?)+;

containsProperty
    : 'contains' (CARDINALITY ALPHNUMERICWORD)+;

createdProperty
    : 'created' DATE;

constraintsProperty
    : 'constraints' constraint+;

constraint
    : 'multiples not allowed';

/*
 * Lexer Rules
 */

CARDINALITY
    : [0-9]+ ('+' | '-*' | ('-' [1-9][0-9]*))?;

POSITIVEINTEGER
    : [1-9]([0-9]*);

NONNEGATIVEINTEGER
    : [0]|[1-9]([0-9]*);

DATE
    : [0-9][0-9][0-9][0-9]'-'(('0'[1-9])|('1'[1-2]))'-'(('0'[1-9])|([1-2][0-9])|'3'[0-1]);

DATETIME
    // TODO: What variability do we want to allow in date?
    : DATE 'T' (([0-1][0-9])|('2'[0-3])) ':' [0-5][0-9] ':' [0-5][0-9] ('Z'|(('+' | '-') (('0'[0-9]|'1'[0-3])':'[0-5][0-9]|'14:00')));

TIME
    : '@T' [0-9][0-9] (':'[0-9][0-9] (':'[0-9][0-9] ('.'[0-9]+)?)?)? ('Z' | (('+' | '-') [0-9][0-9]':'[0-9][0-9]))?;

HASHES
    : '###' '#'*;

EQUALS
    : '===' '='*;

DASHES
    : '---' '-'*;

ALPHNUMERICWORD
    : [0-9a-zA-z\\-]+;

DOTSEPARATEDWORDS
    : [0-9a-zA-z\\-]+('.'[0-9a-zA-z\\-]+)+;

STRING
    : '"' (~[\\"])* '"';

CODESYSTEM
    : 'LOINC' | 'SNOMED';

CODE
    : '#' [0-9a-zA-z\\-]+;

WS
    : (' ' | '\r' | '\t') -> channel(HIDDEN);

NEWLINE
    : ('\n') -> channel(HIDDEN);

COMMENT
    : '/*' .*? '*/' -> skip;

LINE_COMMENT
    :   '//' ~[\r\n]* -> skip;
