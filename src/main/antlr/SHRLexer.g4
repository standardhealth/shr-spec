lexer grammar SHRLexer;

// KEYWORDS for SHR
KW_DATA_DEFINITIONS:'DataDefinitions:';
KW_USES:            'Uses:';
KW_VOCABULARY:      'Vocabulary:';
KW_ELEMENT:         'Element:';
KW_ENTRY:           'Entry:';
KW_VALUESET_DEFINITIONS: 'ValueSetDefinitions:';
KW_VALUESET:        'ValueSet:';
KW_CONCEPT:         'Concept:';
KW_DESCRIPTION:     'Description:';
KW_REF:             'ref';
KW_DESCENDING_FROM: 'descending from';
KW_FROM:            'from';
KW_OR:              'or';
KW_TBD:             'TBD';

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
EQUAL:              '=';
COMMA:              ',';
STAR:               '*';
OPEN_PAREN:         '(';
CLOSE_PAREN:        ')';
RANGE:              '..';

// PATTERNS
URL:                [a-z]+ '://' [a-zA-Z][0-9a-zA-z\\-\\.\\/]*;
CODE:               '#' [0-9a-zA-z\\-]+;
WHOLE_NUMBER:       [0-9]+;
ALL_CAPS:           [A-Z][A-Z0-9]*;
UPPER_WORD:         [A-Z][0-9a-zA-Z\\-]*;
LOWER_WORD:         [a-z][0-9a-zA-Z\\-]*;
DOT_SEPARATED_LW:   [a-z][0-9a-zA-Z\\-]* ('.' [a-z][0-9a-zA-z\\-]*)+;
DOT_SEPARATED_UW:   [a-z][0-9a-zA-Z\\-]* ('.' [A-Z][0-9a-zA-z\\-]*)+;
STRING:             '"' (~[\\"])* '"';
EXTRA_INFO:         '[' (~[\\\]])* ']';

// THINGS WE GENERALLY IGNORE
WS:                 (' ' | '\r' | '\t') -> channel(HIDDEN);
NEWLINE:            ('\n') -> channel(HIDDEN);
COMMENT:            '/*' .*? '*/' -> skip;
LINE_COMMENT:       '//' ~[\r\n]* -> skip;

