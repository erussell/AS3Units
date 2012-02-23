grammar Units;

options {
    language=ActionScript;
}

@lexer::package { org.ngs.as3units.format }
@parser::package { org.ngs.as3units.format }

@parser::header {
import org.ngs.as3units.Unit;
import org.ngs.as3units.SI;
import org.ngs.as3units.UnitConverter;
import org.ngs.as3units.converter.LogConverter;
}

@parser::members {
public var symbols:SymbolMap;
}

unit returns [Unit value]
    :   addExpr EOF
        { $value = $addExpr.value; };

addExpr returns [Unit value]
    :   ( n1=( INTEGER | FLOAT ) s1=SIGN )? mulExpr ( s2=SIGN n2=( INTEGER | FLOAT ) )?
        { 
            $value = $mulExpr.value;
            if ($n1 != null) {
                var v1:Number = parseFloat($n1.text);
                if ($s1.text == '-') {
                    $value = $value.scale(-1);
                }
                $value = $value.add(v1);
            }
            if ($n2 != null) {
                var v2:Number = parseFloat($n2.text);
                if ($s2.text == '-') {
                    v2 = -v2;
                }
                $value = $value.add(v2);
            }
        };

mulExpr returns [Unit value]
    :   v1=exponentExpr ( ( ( '*' | '\u00B7' ) v2=exponentExpr ) | ( '/' v3=exponentExpr ) )*
        {
            $value = $v1.value;
            if ($v2.value != null) {
                $value = $value.multiply($v2.value);
            }
            if ($v3.value != null) {
                $value = $value.divide($v3.value);
            }
        };

exponentExpr returns [Unit value]
    :   ( atomicExpr ( exponent )? ) 
        {
            $value = $atomicExpr.value;
            if ($exponent.value && $exponent.value.pow && ($exponent.value.pow != 1)) {
                $value = $value.pow($exponent.value.pow);
            }
            if ($exponent.value && $exponent.value.root && ($exponent.value.root != 1)) {
                $value = $value.root($exponent.value.root);
            }
        }
    |   ( l=( 'log' ( INTEGER )? ) | 'ln' ) '(' addExpr ')'
        {
            $value = $addExpr.value;
            var converter:UnitConverter;
            if ($l.text.indexOf('og') >= 0) {
                var base:int = 10;
                if ($INTEGER != null) {
                    base = parseInt($INTEGER.text);
                }
                converter = new LogConverter(base);
            } else {
                converter = new LogConverter(Math.E);
            }
            $value = $value.transform(converter);
        };  

atomicExpr returns [Unit value]
    :   n1=( INTEGER | FLOAT )
        {
            $value = SI.ONE.scale(parseFloat($n1.text));
        }
    |   IDENTIFIER 
        {
            var symbol:String = $IDENTIFIER.text;
            var entry:SymbolMapEntry = symbols.lookup(symbol);
            if (entry == null) {
                throw new SymbolNotFound(symbol);
            } else if (entry.prefix != null) {
                $value = entry.unit.transform(entry.prefix.converter);
            } else {
                $value = entry.unit;
            }
        }
    |   ( '(' addExpr ')' )
        {
            $value = $addExpr.value;
        };

exponent returns [Object value]
    :   ( '^' ( SIGN )? INTEGER) 
        { 
            $value = { 'pow': parseInt($INTEGER.text), 'root': 1 };
            if (($SIGN != null) && ($SIGN.text == '-')) {
                $value['pow'] = -$value['pow'];
            }
        }
    |   ( '^(' (s1=SIGN)? n1=INTEGER ( '/' (s2=SIGN)? n2=INTEGER )? ')' )
        {
            $value = { 'pow': parseInt($n1.text), 'root': 1 };
            if (($s1 != null) && ($s1.text == '-')) {
                $value['pow'] = -$value['pow'];
            }
            if ($n2 != null) {
                $value['root'] = parseInt($n2.text);
            }
            if (($s2 != null) && ($s2.text == '-')) {
                $value['root'] = -$value['root'];
            }
        }   
    |   ( SUPERSCIRIPT_DIGIT )+ 
        {
            $value = { 'pow': parseInt($n1.text), 'root': 1 };
            for (var i:int = 0; i < $SUPERSCIRIPT_DIGIT.text.length; i += 1) {
                $value['pow'] *= 10;
                switch ($SUPERSCIRIPT_DIGIT.text.charAt(i)) {
                    case '\u00B9': $value['pow'] += 1; break;
                    case '\u00B2': $value['pow'] += 2; break;
                    case '\u00B3': $value['pow'] += 3; break;
                    case '\u2074': $value['pow'] += 4; break;
                    case '\u2075': $value['pow'] += 5; break;
                    case '\u2076': $value['pow'] += 6; break;
                    case '\u2077': $value['pow'] += 7; break;
                    case '\u2078': $value['pow'] += 8; break;
                    case '\u2079': $value['pow'] += 9; break;
                }
            }
        };

fragment DIGIT
    :   ( '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' );
fragment SUPERSCIRIPT_DIGIT
    :   ( '\u2070' | '\u00B9' | '\u00B2' | '\u00B3' | '\u2074' | '\u2075' | '\u2076' | '\u2077' | '\u2078' | '\u2079' );
fragment INITIAL_CHAR
    :   ~('\u0000'..'\u0020' | '(' | ')' | '*' | '+' | '-' | '.' | '/' | '0'..'9' | ':' | '^' | '\u00B2' | '\u00B3' | '\u00B7' | '\u00B9' | '\u2070' | '\u2074' | '\u2075' | '\u2076' | '\u2077' | '\u2078' | '\u2079' );

SIGN
    :   '+' | '-';
INTEGER
    :   (DIGIT)+;
FLOAT
    :   (SIGN)? (DIGIT)* '.' (DIGIT)+ (('e' | 'E') (SIGN)? (DIGIT)+)?;
IDENTIFIER
    :   INITIAL_CHAR (INITIAL_CHAR | DIGIT)*;
