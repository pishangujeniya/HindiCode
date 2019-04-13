grammar HindiCode;

/*
 * Parser Rules
 */
hindicode: stmt+ EOF;

stmt: simple_stmt;

simple_stmt: int_stmt | bool_stmt;

int_stmt: ANK NAME ASSIGN REAL_NUMBER SEMI_COLON;

bool_stmt: HANA NAME ASSIGN (TRUE | FALSE) SEMI_COLON;

comp_op:
	LESS_THAN
	| GREATER_THAN
	| EQUALS
	| GT_EQ
	| LT_EQ
	| NOT_EQ_1
	| NOT_EQ_2;



/*
 * lexer rules
 */

WS: [ \t\r\n]+ -> skip;

ANK: 'ank';
HANA: 'hana';
TRUE: 'ha';
FALSE: 'na';

NAME: ID_START ID_CONTIUE*;
FRACTION_DIGITS: DIGITS+ DOT DIGITS+;
REAL_NUMBER: DIGITS+ | FRACTION_DIGITS;


WHITESPACE: (' ' | '\t')+;
NEWLINE: ('\r'? '\n' | '\r')+;
UPPERCASE: [A-Z];
LOWERCASE: [a-z];
DIGITS: [0-9];
DOT: '.';
STAR: '*';
OPEN_PAREN: '(';
CLOSE_PAREN: ')';
COMMA: ',';
COLON: ':';
SEMI_COLON: ';';
ASSIGN: '=';
OPEN_BRACK: '[';
CLOSE_BRACK: ']';
OR_OP: '|';
AND_OP: '&';
ADD: '+';
MINUS: '-';
DIV: '/';
MOD: '%';
NOT_OP: '~';
OPEN_BRACE: '{';
CLOSE_BRACE: '}';
LESS_THAN: '<';
GREATER_THAN: '>';
EQUALS: '==';
GT_EQ: '>=';
LT_EQ: '<=';
NOT_EQ_1: '<>';
NOT_EQ_2: '!=';
AT: '@';

fragment ID_START: '_' | UPPERCASE | LOWERCASE;

fragment ID_CONTIUE: ID_START | DIGITS;

