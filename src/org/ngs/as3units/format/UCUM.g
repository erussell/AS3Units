grammar UCUM;

options {
    language=ActionScript;
}

@lexer::package { org.ngs.as3units.format }
@parser::package { org.ngs.as3units.format }

@parser::header {
import org.ngs.as3units.Unit;
import org.ngs.as3units.UCUM;
}

@parser::members {
public var symbols:SymbolMap;
}

unit returns [Unit value]
    :    ucumExpr EOF { $value = $ucumExpr.value; };

ucumExpr returns [Unit value]
    :    DIVIDE expr { $value = UCUM.ONE.divide($expr.value); }
    |    expr { $value = $expr.value; }; 

multiply[Unit a] returns [Unit value]
    :    TIMES term { $value = $a.multiply($term.value); }
    |    DIVIDE term { $value = $a.divide($term.value); };
       
expr returns [Unit value]   
    :    v=term (v=multiply[v])* { $value = $v.value; }; 

term returns [Unit value]
    :   element (exponent)? (ANN)* 
        { 
            $value = $element.value;
            if ($exponent.value != 0) {
                $value = $value.pow($exponent.value);
            }
            if ($ANN != null) {
                $value = $value.annotate($ANN.text.substr(1, $ANN.text.length-2));
            }
        };

element returns [Unit value]
    :    simpleUnit { $value = $simpleUnit.value; }
    |    LPAREN expr RPAREN { $value = $expr.value; }
    |    ANN { $value=UCUM.ONE.annotate($ANN.text); };

exponent returns [int value]
    :   (SIGN)? DIGITS 
        {
            $value = parseInt($DIGITS.text);
            if (($SIGN != null) && ($SIGN.text == '-')) {
                $value = -$value;
            }
        };

simpleUnit returns [Unit value]
    :   ATOM
        {
            var symbol:String = $ATOM.text;
            var entry:SymbolMapEntry = symbols.lookup(symbol);
            if (entry == null) {
                throw new Error("symbol not found " + symbol);
            } else if (entry.prefix != null) {
                $value = entry.unit.transform(entry.prefix.converter);
            } else {
                $value = entry.unit;
            }
        }
    |   DIGITS { $value = UCUM.ONE.scale(parseInt($DIGITS.text)); };    

fragment DIGIT
    :   '0'..'9';
fragment ATOM_CHAR
    :   '!'
    |   '#'..'\''
    |   '*'
    |   ','
    |   ':'..'Z'
    |   '\\'
    |   '^'..'z'
    |   '|'
    |   '~';
DIGITS
    :   DIGIT+;
SIGN
    :   ('+'|'-');
DIVIDE
    :   '/';
TIMES
    :   '.';
LPAREN
    :   '(';
RPAREN
    :   ')';
LBRACKET
    :   ']';
ANN
    :   '{' (ATOM_CHAR | DIGIT | SIGN | DIVIDE | TIMES )* '}';
fragment NOTE
    :   '[' (ATOM_CHAR | DIGIT | SIGN | DIVIDE | TIMES)* ']';
fragment ATOM_ELT
    :   (ATOM_CHAR)+
    |   NOTE;
ATOM
    :   (ATOM_ELT)+;