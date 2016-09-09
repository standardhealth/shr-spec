lexer grammar SHRLexer;

DATA_ELEMENTS:      'DATA ELEMENTS';
ENTRIES:            'ENTRIES';

COMPOSITION_TYPE:   'composition';
DATE_TYPE:          'date';
ENUM_TYPE:          'enum';
PERIOD_TYPE:        'period';
PROFILES_TYPE:      'profiles';
TEXT_TYPE:          'text';

AKA_PROP:           'aka';
CHOICE_PROP:        'choice';
CONSTRAINS_PROP:    'constraints';
CONTAINS_PROP:      'contains';
DESCRIPTION_PROP:   'description';
SOURCES_PROP:       'sources';
TITLE_PROP:         'title';
VALUE_PROP:         'values';
VALUESET_PROP:      'valueset';

DISPLAYED_AS:       'displayed as';
AT_MOST_ONE:        'at most one';

HASHES:             '###' '#'*;
EQUALS:             '===' '='*;
DASHES:             '---' '-'*;
COMMA:              ',';

URL:                [a-z]+ '://' [a-zA-Z][0-9a-zA-z\\-\\.\\/]*;
CODESYSTEM:         'LOINC' | 'SNOMED';
CODE:               '#' [0-9a-zA-z\\-]+;

OPTION_MARKER:      '('[a-y]')';
LAST_OPTION_MARKER: '(z)';

CARDINALITY:        [0-9]+ ('+' | '-*' | ('-' [1-9][0-9]*))?;
CARDINALITY_PHRASE  : 'no' | 'optional' | 'many' | 'one' | 'at least one';

POSITIVEINTEGER:    [1-9]([0-9]*);
NONNEGATIVEINTEGER: [0]|[1-9]([0-9]*);

DATE:               [0-9][0-9][0-9][0-9]'-'(('0'[1-9])|('1'[1-2]))'-'(('0'[1-9])|([1-2][0-9])|'3'[0-1]);
// TODO: What variability do we want to allow in date?
DATETIME:           DATE 'T' (([0-1][0-9])|('2'[0-3])) ':' [0-5][0-9] ':' [0-5][0-9] ('Z'|(('+' | '-') (('0'[0-9]|'1'[0-3])':'[0-5][0-9]|'14:00')));

ALPHNUMERICWORD:    [0-9a-zA-z\\-]+;
DOTSEPARATEDWORDS:  [0-9a-zA-z\\-]+('.'[0-9a-zA-z\\-]+)+;
STRING:             '"' (~[\\"])* '"';

WS
    : (' ' | '\r' | '\t') -> channel(HIDDEN);

NEWLINE
    : ('\n') -> channel(HIDDEN);

COMMENT
    : '/*' .*? '*/' -> skip;

LINE_COMMENT
    :   '//' ~[\r\n]* -> skip;
