grammar Smarty;

ID  	:   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
	;

INT 	:   '0'..'9'+
    	;

FLOAT
    	:   ('0'..'9')+ '.' ('0'..'9')* EXPONENT?
    	|   '.' ('0'..'9')+ EXPONENT?
    	|   ('0'..'9')+ EXPONENT
    	;

COMMENT
    	:   '{*' ( options {greedy=false;} : . )* '*}' {$channel=HIDDEN;}
    	;

WS  	:   ( ' '
        	| '\t'
        	| '\r'
        	| '\n'
        	) {$channel=HIDDEN;}
    	;

STRING
    	: '\'' .* '\''      /* simple quotes string */
    	| '"' .* '"'        /* double quotes string */
    	;

fragment
EXPONENT 	: ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

fragment
HEX_DIGIT 	: ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    	:   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    	|   UNICODE_ESC
    	|   OCTAL_ESC
    	;

fragment
OCTAL_ESC
   	 :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    	|   '\\' ('0'..'7') ('0'..'7')
    	|   '\\' ('0'..'7')
    	;

fragment
UNICODE_ESC
    	:   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    	;
    
/* https://gist.github.com/tkqubo/2842772 */

compilation_unit
	:	tag*
	;

tag
	:   '<' tag_name attr_list?  '>'    /* includes the autoclosing tag */
	|   '<' tag_name attr_list?  '>' '</' tag_name '>'
	|   '{' smarty_variable '}'		/* This prints the value of variable */
	|   '{' tag_name attr_list? '}'
	|   '{' tag_name attr_list? '}' '{/' tag_name '}'
    	;

member	:  '.' ID
	| '[' ( ID | STRING | smarty_variable ) ']'
	;

smarty_variable
	:  '$' ID member*	/* includes member reference */
	;

tag_name 	:   ID;
attr_list	:   attr+ ;
attr    	:   attr_name ('=' attr_value)?;
attr_name	:   ID;
    
attr_value	:   STRING | INT | FLOAT | ID ;
