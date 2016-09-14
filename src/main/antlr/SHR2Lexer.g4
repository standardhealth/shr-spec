lexer grammar SHR2Lexer;

// KEYWORDS for SHR
KW_NAMESPACE:       'Namespace';
KW_VOCABULARY:      'Vocabulary';
KW_DATA_ELEMENT:    'DataElement';
KW_COMPOSITION:     'Composition';
KW_ENTRY:           'Entry';
KW_CONCEPT:         'Concept';
KW_DESCRIPTION:     'Description';
KW_ANSWER:          'Answer';
KW_VALUESET:        'ValueSet';
KW_BINDING:         'Binding';
KW_HAS:             'Has';
KW_REQUIRED:        'Required';

// KEYWORDS for FHIR Primitives
KW_BOOLEAN:         'boolean';
KW_INTEGER:         'integer';
KW_STRING:          'string';
KW_DECIMAL:         'decimal';
KW_URI:             'uri';
KW_BASE64_BINARY:   'base64Binary';
KW_INSTANT:         'instant';
KW_DATE:            'date';
KW_DATE_TIME:       'dateTime';
KW_TIME:            'time';
KW_CODE:            'code';
KW_OID:             'oid';
KW_ID:              'id';
KW_MARKDOWN:        'markdown';
KW_UNSIGNED_INT:    'unsignedInt';
KW_POSITIVE_INT:    'positiveInt';

// SYMBOLS
COLON:              ':';
EQUAL:              '=';
COMMA:              ',';
STAR:               '*';
RANGE:              '..';

// PATTERNS
URL:                [a-z]+ '://' [a-zA-Z][0-9a-zA-z\\-\\.\\/]*;
CODE:               '#' [0-9a-zA-z\\-]+;
WHOLE_NUMBER:       [0-9]+;
ALL_CAPS:           [A-Z][A-Z0-9]*;
UPPER_WORD:         [A-Z][0-9a-zA-Z\\-]*;
LOWER_WORD:         [a-z][0-9a-zA-z\\-]*;
DOT_SEPARATED_LW:   [a-z][0-9a-zA-z\\-]* ('.' [a-z][0-9a-zA-z\\-]*)+;
STRING:             '"' (~[\\"])* '"';

// THINGS WE GENERALLY IGNORE
WS:                 (' ' | '\r' | '\t') -> channel(HIDDEN);
NEWLINE:            ('\n') -> channel(HIDDEN);
COMMENT:            '/*' .*? '*/' -> skip;
LINE_COMMENT:       '//' ~[\r\n]* -> skip;

