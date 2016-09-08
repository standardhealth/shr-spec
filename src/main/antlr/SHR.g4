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
    : compositionDataElementDefinition
    | dateDataElementDefinition
    | enumDataElementDefinition
    | periodDataElementDefinition
    | profilesDataElementDefinition
    | textDataElementDefinition;

// COMPOSITION Data Element

compositionDataElementDefinition
    : compositionDataElementHeader compositionDataElementContents;

compositionDataElementHeader
    : DASHES ALPHNUMERICWORD 'composition' DASHES;

compositionDataElementContents
    : (titleProperty | descriptionProperty | choiceProperty | containsProperty | akaProperty | sourcesProperty)+;

// DATE Data Element

dateDataElementDefinition
    : dateDataElementHeader dateDataElementContents;

dateDataElementHeader
    : DASHES ALPHNUMERICWORD 'date' DASHES;

dateDataElementContents
    : (titleProperty | descriptionProperty | akaProperty | sourcesProperty)+;

// ENUM Data Element

enumDataElementDefinition
    : enumDataElementHeader enumDataElementContents;

enumDataElementHeader
    : DASHES ALPHNUMERICWORD 'enum' DASHES;

enumDataElementContents
    : (titleProperty | descriptionProperty | valuesProperty | akaProperty | sourcesProperty)+;

// PERIOD Data Element

periodDataElementDefinition
    : periodDataElementHeader periodDataElementContents;

periodDataElementHeader
    : DASHES ALPHNUMERICWORD 'period' DASHES;

periodDataElementContents
    : (titleProperty | descriptionProperty | akaProperty | sourcesProperty)+;

// PROFILES Data Element

profilesDataElementDefinition
    : profilesDataElementHeader profilesDataElementContents;

profilesDataElementHeader
    : DASHES ALPHNUMERICWORD 'profiles' ALPHNUMERICWORD DASHES;

profilesDataElementContents
    : (titleProperty | descriptionProperty | choiceProperty | containsProperty | valuesProperty | akaProperty | sourcesProperty)+;

// TEXT Data Element

textDataElementDefinition
    : textDataElementHeader textDataElementContents;

textDataElementHeader
    : DASHES ALPHNUMERICWORD 'text' DASHES;

textDataElementContents
    : (titleProperty | descriptionProperty | akaProperty | sourcesProperty)+;

// ENTRY

entrySection
    : entrySectionHeader entryDefinition*;

entrySectionHeader
    : EQUALS 'ENTRIES' EQUALS;

entryDefinition
    : entryHeader entryContents;

entryHeader
    : DASHES ALPHNUMERICWORD DASHES;

entryContents
    : (titleProperty | descriptionProperty | containsProperty | akaProperty | constraintsProperty | sourcesProperty)+;

akaProperty
    : 'aka' (ALPHNUMERICWORD CODE ','?)+;

titleProperty
    : 'title' STRING;

descriptionProperty
    : 'description' STRING;

valuesProperty
    : 'values' (CODE ('displayed as' STRING)? ','?)+;

sourcesProperty
    : 'sources' (STRING ','?)+;

containsProperty
    : 'contains' (cardinality? ALPHNUMERICWORD ','?)+;

choiceProperty
    : 'choice' (CHOICE_MARKER choice)+ LAST_CHOICE_MARKER choice;

choice
    : choiceProperty | containsProperty;

constraintsProperty
    : 'constraints' constraint+;

constraint
    : 'at most one';

cardinality
    : CARDINALITY
    | CARDINALITY_PHRASE;

/*
 * Lexer Rules
 */

CARDINALITY
    : [0-9]+ ('+' | '-*' | ('-' [1-9][0-9]*))?;

CARDINALITY_PHRASE
    : 'no'
    | 'optional'
    | 'many'
    | 'one'
    | 'at least one';

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

LAST_CHOICE_MARKER
    : '(z)';

CHOICE_MARKER
    : '('[a-z]')';

WS
    : (' ' | '\r' | '\t') -> channel(HIDDEN);

NEWLINE
    : ('\n') -> channel(HIDDEN);

COMMENT
    : '/*' .*? '*/' -> skip;

LINE_COMMENT
    :   '//' ~[\r\n]* -> skip;
