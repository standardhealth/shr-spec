lexer grammar SHRLexer;

// KEYWORDS for SHR
KW_DATA_DEFINITIONS:'DataDefinitions:';
KW_USES:            'Uses:';
KW_PATH:            'Path:';
KW_VOCABULARY:      'Vocabulary:';
KW_ELEMENT:         'Element:';
KW_ENTRY_ELEMENT:   'EntryElement:';
KW_BASED_ON:        'BasedOn:';
KW_VALUE:           'Value:';
KW_VALUESET_DEFINITIONS: 'ValueSetDefinitions:';
KW_VALUESET:        'ValueSet:';
KW_INCLUDES_CODES_FROM: 'Includes codes from';
KW_INCLUDES_CODES_DESCENDING_FROM: 'Includes codes descending from';
KW_AND_NOT_DESCENDING_FROM: 'and not descending from';
KW_CONCEPT:         'Concept:';
KW_DESCRIPTION:     'Description:';
KW_REF:             'ref';
KW_OR:              'or';
KW_WITH:            'with';
KW_IS:              'is';
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

// KEYWORDS for types w/ qualifiers
KW_CODE_FROM:   'code from';
KW_CODING_FROM: 'Coding from';
KW_UNITS:       'units';

// SYMBOLS
DOT:                '.';
EQUAL:              '=';
COMMA:              ',';
STAR:               '*';
OPEN_PAREN:         '(';
CLOSE_PAREN:        ')';
RANGE:              '..';

// PATTERNS
URL:                [a-z]+ '://' [a-zA-Z][0-9a-zA-Z_%#=\\?\\-\\.\\/]*;
PATH_URL:           [A-Z][A-Z0-9]* '/' [0-9a-zA-Z][0-9a-zA-Z_%#=\\?\\-\\.\\/]*;
URN_OID:            'urn:oid:' [0-2]'.'[0-9]+('.'[0-9]+)*;
CODE:               '#' [0-9a-zA-z\\-]+;
WHOLE_NUMBER:       [0-9]+;
ALL_CAPS:           [A-Z][A-Z0-9]*;
UPPER_WORD:         [A-Z][0-9a-zA-Z\\-]*;
LOWER_WORD:         [a-z][0-9a-zA-Z\\-]*;
DOT_SEPARATED_LW:   [a-z][0-9a-zA-Z\\-]* ('.' [a-z][0-9a-zA-z\\-]*)+;
DOT_SEPARATED_UW:   [a-z][0-9a-zA-Z\\-]* ('.' [a-z][0-9a-zA-z\\-]*)* ('.' [A-Z][0-9a-zA-z\\-]*);
STRING:             '"' (~[\\"])* '"';

// THINGS WE GENERALLY IGNORE
WS:                 (' ' | '\r' | '\t') -> channel(HIDDEN);
NEWLINE:            ('\n') -> channel(HIDDEN);
COMMENT:            '/*' .*? '*/' -> skip;
LINE_COMMENT:       '//' ~[\r\n]* -> skip;