// $ANTLR 3.3 Nov 30, 2010 12:50:56 src/org/ngs/as3units/format/Units.g 2012-02-22 01:05:53
package  org.ngs.as3units.format  {

    import org.ngs.as3units.Unit;
    import org.ngs.as3units.SI;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.converter.LogConverter;

    import org.antlr.runtime.*;
        

    public class UnitsParser extends Parser {
        public static const tokenNames:Array = [
            "<invalid>", "<EOR>", "<DOWN>", "<UP>", "INTEGER", "FLOAT", "SIGN", "IDENTIFIER", "SUPERSCIRIPT_DIGIT", "DIGIT", "INITIAL_CHAR", "'*'", "'\\u00B7'", "'/'", "'log'", "'ln'", "'('", "')'", "'^'", "'^('"
        ];
        public static const EOF:int=-1;
        public static const T__11:int=11;
        public static const T__12:int=12;
        public static const T__13:int=13;
        public static const T__14:int=14;
        public static const T__15:int=15;
        public static const T__16:int=16;
        public static const T__17:int=17;
        public static const T__18:int=18;
        public static const T__19:int=19;
        public static const INTEGER:int=4;
        public static const FLOAT:int=5;
        public static const SIGN:int=6;
        public static const IDENTIFIER:int=7;
        public static const SUPERSCIRIPT_DIGIT:int=8;
        public static const DIGIT:int=9;
        public static const INITIAL_CHAR:int=10;

        // delegates
        // delegators


            public function UnitsParser(input:TokenStream, state:RecognizerSharedState = null) {
                super(input, state);
            }
            

        public override function get tokenNames():Array { return UnitsParser.tokenNames; }
        public override function get grammarFileName():String { return "src/org/ngs/as3units/format/Units.g"; }


        public var symbols:SymbolMap;


        // $ANTLR start unit
        // src/org/ngs/as3units/format/Units.g:21:1: unit returns [Unit value] : addExpr EOF ;
        public final function unit():Unit {
            var value:Unit = null;

            var addExpr1:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:22:5: ( addExpr EOF )
                // src/org/ngs/as3units/format/Units.g:22:9: addExpr EOF
                {
                pushFollow(FOLLOW_addExpr_in_unit69);
                addExpr1=addExpr();

                state._fsp = state._fsp - 1;

                matchStream(input,EOF,FOLLOW_EOF_in_unit71); 
                 value = addExpr1; 

                }

            }
            catch (re:RecognitionException) {
                reportError(re);
                recoverStream(input,re);
            }
            finally {
            }
            return value;
        }
        // $ANTLR end unit

        // $ANTLR start addExpr
        // src/org/ngs/as3units/format/Units.g:25:1: addExpr returns [Unit value] : (n1= ( INTEGER | FLOAT ) s1= SIGN )? mulExpr (s2= SIGN n2= ( INTEGER | FLOAT ) )? ;
        public final function addExpr():Unit {
            var value:Unit = null;

            var n1:Token=null;
            var s1:Token=null;
            var s2:Token=null;
            var n2:Token=null;
            var mulExpr2:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:26:5: ( (n1= ( INTEGER | FLOAT ) s1= SIGN )? mulExpr (s2= SIGN n2= ( INTEGER | FLOAT ) )? )
                // src/org/ngs/as3units/format/Units.g:26:9: (n1= ( INTEGER | FLOAT ) s1= SIGN )? mulExpr (s2= SIGN n2= ( INTEGER | FLOAT ) )?
                {
                // src/org/ngs/as3units/format/Units.g:26:9: (n1= ( INTEGER | FLOAT ) s1= SIGN )?
                var alt1:int=2;
                var LA1_0:int = input.LA(1);

                if ( ((LA1_0>=4 && LA1_0<=5)) ) {
                    var LA1_1:int = input.LA(2);

                    if ( (LA1_1==6) ) {
                        var LA1_3:int = input.LA(3);

                        if ( ((LA1_3>=4 && LA1_3<=5)||LA1_3==7||(LA1_3>=14 && LA1_3<=16)) ) {
                            alt1=1;
                        }
                    }
                }
                switch (alt1) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:26:11: n1= ( INTEGER | FLOAT ) s1= SIGN
                        {
                        n1=Token(input.LT(1));
                        if ( (input.LA(1)>=4 && input.LA(1)<=5) ) {
                            input.consume();
                            this.state.errorRecovery=false;
                        }
                        else {
                            throw new MismatchedSetException(null,input);
                        }

                        s1=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_addExpr115)); 

                        }
                        break;

                }

                pushFollow(FOLLOW_mulExpr_in_addExpr120);
                mulExpr2=mulExpr();

                state._fsp = state._fsp - 1;

                // src/org/ngs/as3units/format/Units.g:26:53: (s2= SIGN n2= ( INTEGER | FLOAT ) )?
                var alt2:int=2;
                var LA2_0:int = input.LA(1);

                if ( (LA2_0==6) ) {
                    alt2=1;
                }
                switch (alt2) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:26:55: s2= SIGN n2= ( INTEGER | FLOAT )
                        {
                        s2=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_addExpr126)); 
                        n2=Token(input.LT(1));
                        if ( (input.LA(1)>=4 && input.LA(1)<=5) ) {
                            input.consume();
                            this.state.errorRecovery=false;
                        }
                        else {
                            throw new MismatchedSetException(null,input);
                        }


                        }
                        break;

                }

                 
                            value = mulExpr2;
                            if (n1 != null) {
                                var v1:Number = parseFloat((n1!=null?n1.text:null));
                                if ((s1!=null?s1.text:null) == '-') {
                                    value = value.scale(-1);
                                }
                                value = value.add(v1);
                            }
                            if (n2 != null) {
                                var v2:Number = parseFloat((n2!=null?n2.text:null));
                                if ((s2!=null?s2.text:null) == '-') {
                                    v2 = -v2;
                                }
                                value = value.add(v2);
                            }
                        

                }

            }
            catch (re:RecognitionException) {
                reportError(re);
                recoverStream(input,re);
            }
            finally {
            }
            return value;
        }
        // $ANTLR end addExpr

        // $ANTLR start mulExpr
        // src/org/ngs/as3units/format/Units.g:45:1: mulExpr returns [Unit value] : v1= exponentExpr ( ( ( '*' | '\\u00B7' ) v2= exponentExpr ) | ( '/' v3= exponentExpr ) )* ;
        public final function mulExpr():Unit {
            var value:Unit = null;

            var v1:Unit = null;

            var v2:Unit = null;

            var v3:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:46:5: (v1= exponentExpr ( ( ( '*' | '\\u00B7' ) v2= exponentExpr ) | ( '/' v3= exponentExpr ) )* )
                // src/org/ngs/as3units/format/Units.g:46:9: v1= exponentExpr ( ( ( '*' | '\\u00B7' ) v2= exponentExpr ) | ( '/' v3= exponentExpr ) )*
                {
                pushFollow(FOLLOW_exponentExpr_in_mulExpr171);
                v1=exponentExpr();

                state._fsp = state._fsp - 1;

                // src/org/ngs/as3units/format/Units.g:46:25: ( ( ( '*' | '\\u00B7' ) v2= exponentExpr ) | ( '/' v3= exponentExpr ) )*
                loop3:
                do {
                    var alt3:int=3;
                    var LA3_0:int = input.LA(1);

                    if ( ((LA3_0>=11 && LA3_0<=12)) ) {
                        alt3=1;
                    }
                    else if ( (LA3_0==13) ) {
                        alt3=2;
                    }


                    switch (alt3) {
                	case 1 :
                	    // src/org/ngs/as3units/format/Units.g:46:27: ( ( '*' | '\\u00B7' ) v2= exponentExpr )
                	    {
                	    // src/org/ngs/as3units/format/Units.g:46:27: ( ( '*' | '\\u00B7' ) v2= exponentExpr )
                	    // src/org/ngs/as3units/format/Units.g:46:29: ( '*' | '\\u00B7' ) v2= exponentExpr
                	    {
                	    if ( (input.LA(1)>=11 && input.LA(1)<=12) ) {
                	        input.consume();
                	        this.state.errorRecovery=false;
                	    }
                	    else {
                	        throw new MismatchedSetException(null,input);
                	    }

                	    pushFollow(FOLLOW_exponentExpr_in_mulExpr189);
                	    v2=exponentExpr();

                	    state._fsp = state._fsp - 1;


                	    }


                	    }
                	    break;
                	case 2 :
                	    // src/org/ngs/as3units/format/Units.g:46:68: ( '/' v3= exponentExpr )
                	    {
                	    // src/org/ngs/as3units/format/Units.g:46:68: ( '/' v3= exponentExpr )
                	    // src/org/ngs/as3units/format/Units.g:46:70: '/' v3= exponentExpr
                	    {
                	    matchStream(input,13,FOLLOW_13_in_mulExpr197); 
                	    pushFollow(FOLLOW_exponentExpr_in_mulExpr201);
                	    v3=exponentExpr();

                	    state._fsp = state._fsp - 1;


                	    }


                	    }
                	    break;

                	default :
                	    break loop3;
                    }
                } while (true);


                            value = v1;
                            if (v2 != null) {
                                value = value.multiply(v2);
                            }
                            if (v3 != null) {
                                value = value.divide(v3);
                            }
                        

                }

            }
            catch (re:RecognitionException) {
                reportError(re);
                recoverStream(input,re);
            }
            finally {
            }
            return value;
        }
        // $ANTLR end mulExpr

        // $ANTLR start exponentExpr
        // src/org/ngs/as3units/format/Units.g:57:1: exponentExpr returns [Unit value] : ( ( atomicExpr ( exponent )? ) | (l= ( 'log' ( INTEGER )? ) | 'ln' ) '(' addExpr ')' );
        public final function exponentExpr():Unit {
            var value:Unit = null;

            var l:Token=null;
            var INTEGER6:Token=null;
            var atomicExpr3:Unit = null;

            var exponent4:Object = null;

            var addExpr5:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:58:5: ( ( atomicExpr ( exponent )? ) | (l= ( 'log' ( INTEGER )? ) | 'ln' ) '(' addExpr ')' )
                var alt7:int=2;
                var LA7_0:int = input.LA(1);

                if ( ((LA7_0>=4 && LA7_0<=5)||LA7_0==7||LA7_0==16) ) {
                    alt7=1;
                }
                else if ( ((LA7_0>=14 && LA7_0<=15)) ) {
                    alt7=2;
                }
                else {
                    throw new NoViableAltException("", 7, 0, input);

                }
                switch (alt7) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:58:9: ( atomicExpr ( exponent )? )
                        {
                        // src/org/ngs/as3units/format/Units.g:58:9: ( atomicExpr ( exponent )? )
                        // src/org/ngs/as3units/format/Units.g:58:11: atomicExpr ( exponent )?
                        {
                        pushFollow(FOLLOW_atomicExpr_in_exponentExpr236);
                        atomicExpr3=atomicExpr();

                        state._fsp = state._fsp - 1;

                        // src/org/ngs/as3units/format/Units.g:58:22: ( exponent )?
                        var alt4:int=2;
                        var LA4_0:int = input.LA(1);

                        if ( (LA4_0==8||(LA4_0>=18 && LA4_0<=19)) ) {
                            alt4=1;
                        }
                        switch (alt4) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:58:24: exponent
                                {
                                pushFollow(FOLLOW_exponent_in_exponentExpr240);
                                exponent4=exponent();

                                state._fsp = state._fsp - 1;


                                }
                                break;

                        }


                        }


                                    value = atomicExpr3;
                                    if (exponent4 && exponent4.pow && (exponent4.pow != 1)) {
                                        value = value.pow(exponent4.pow);
                                    }
                                    if (exponent4 && exponent4.root && (exponent4.root != 1)) {
                                        value = value.root(exponent4.root);
                                    }
                                

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/Units.g:68:9: (l= ( 'log' ( INTEGER )? ) | 'ln' ) '(' addExpr ')'
                        {
                        // src/org/ngs/as3units/format/Units.g:68:9: (l= ( 'log' ( INTEGER )? ) | 'ln' )
                        var alt6:int=2;
                        var LA6_0:int = input.LA(1);

                        if ( (LA6_0==14) ) {
                            alt6=1;
                        }
                        else if ( (LA6_0==15) ) {
                            alt6=2;
                        }
                        else {
                            throw new NoViableAltException("", 6, 0, input);

                        }
                        switch (alt6) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:68:11: l= ( 'log' ( INTEGER )? )
                                {
                                // src/org/ngs/as3units/format/Units.g:68:13: ( 'log' ( INTEGER )? )
                                // src/org/ngs/as3units/format/Units.g:68:15: 'log' ( INTEGER )?
                                {
                                matchStream(input,14,FOLLOW_14_in_exponentExpr272); 
                                // src/org/ngs/as3units/format/Units.g:68:21: ( INTEGER )?
                                var alt5:int=2;
                                var LA5_0:int = input.LA(1);

                                if ( (LA5_0==4) ) {
                                    alt5=1;
                                }
                                switch (alt5) {
                                    case 1 :
                                        // src/org/ngs/as3units/format/Units.g:68:23: INTEGER
                                        {
                                        INTEGER6=Token(matchStream(input,INTEGER,FOLLOW_INTEGER_in_exponentExpr276)); 

                                        }
                                        break;

                                }


                                }


                                }
                                break;
                            case 2 :
                                // src/org/ngs/as3units/format/Units.g:68:38: 'ln'
                                {
                                matchStream(input,15,FOLLOW_15_in_exponentExpr285); 

                                }
                                break;

                        }

                        matchStream(input,16,FOLLOW_16_in_exponentExpr289); 
                        pushFollow(FOLLOW_addExpr_in_exponentExpr291);
                        addExpr5=addExpr();

                        state._fsp = state._fsp - 1;

                        matchStream(input,17,FOLLOW_17_in_exponentExpr293); 

                                    value = addExpr5;
                                    var converter:UnitConverter;
                                    if ((l!=null?l.text:null).indexOf('og') >= 0) {
                                        var base:int = 10;
                                        if (INTEGER6 != null) {
                                            base = parseInt((INTEGER6!=null?INTEGER6.text:null));
                                        }
                                        converter = new LogConverter(base);
                                    } else {
                                        converter = new LogConverter(Math.E);
                                    }
                                    value = value.transform(converter);
                                

                        }
                        break;

                }
            }
            catch (re:RecognitionException) {
                reportError(re);
                recoverStream(input,re);
            }
            finally {
            }
            return value;
        }
        // $ANTLR end exponentExpr

        // $ANTLR start atomicExpr
        // src/org/ngs/as3units/format/Units.g:84:1: atomicExpr returns [Unit value] : (n1= ( INTEGER | FLOAT ) | IDENTIFIER | ( '(' addExpr ')' ) );
        public final function atomicExpr():Unit {
            var value:Unit = null;

            var n1:Token=null;
            var IDENTIFIER7:Token=null;
            var addExpr8:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:85:5: (n1= ( INTEGER | FLOAT ) | IDENTIFIER | ( '(' addExpr ')' ) )
                var alt8:int=3;
                switch ( input.LA(1) ) {
                case INTEGER:
                case FLOAT:
                    {
                    alt8=1;
                    }
                    break;
                case IDENTIFIER:
                    {
                    alt8=2;
                    }
                    break;
                case 16:
                    {
                    alt8=3;
                    }
                    break;
                default:
                    throw new NoViableAltException("", 8, 0, input);

                }

                switch (alt8) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:85:9: n1= ( INTEGER | FLOAT )
                        {
                        n1=Token(input.LT(1));
                        if ( (input.LA(1)>=4 && input.LA(1)<=5) ) {
                            input.consume();
                            this.state.errorRecovery=false;
                        }
                        else {
                            throw new MismatchedSetException(null,input);
                        }


                                    value = SI.ONE.scale(parseFloat((n1!=null?n1.text:null)));
                                

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/Units.g:89:9: IDENTIFIER
                        {
                        IDENTIFIER7=Token(matchStream(input,IDENTIFIER,FOLLOW_IDENTIFIER_in_atomicExpr353)); 

                                    var symbol:String = (IDENTIFIER7!=null?IDENTIFIER7.text:null);
                                    var entry:SymbolMapEntry = symbols.lookup(symbol);
                                    if (entry == null) {
                                        throw new SymbolNotFound(symbol);
                                    } else if (entry.prefix != null) {
                                        value = entry.unit.transform(entry.prefix.converter);
                                    } else {
                                        value = entry.unit;
                                    }
                                

                        }
                        break;
                    case 3 :
                        // src/org/ngs/as3units/format/Units.g:101:9: ( '(' addExpr ')' )
                        {
                        // src/org/ngs/as3units/format/Units.g:101:9: ( '(' addExpr ')' )
                        // src/org/ngs/as3units/format/Units.g:101:11: '(' addExpr ')'
                        {
                        matchStream(input,16,FOLLOW_16_in_atomicExpr376); 
                        pushFollow(FOLLOW_addExpr_in_atomicExpr378);
                        addExpr8=addExpr();

                        state._fsp = state._fsp - 1;

                        matchStream(input,17,FOLLOW_17_in_atomicExpr380); 

                        }


                                    value = addExpr8;
                                

                        }
                        break;

                }
            }
            catch (re:RecognitionException) {
                reportError(re);
                recoverStream(input,re);
            }
            finally {
            }
            return value;
        }
        // $ANTLR end atomicExpr

        // $ANTLR start exponent
        // src/org/ngs/as3units/format/Units.g:106:1: exponent returns [Object value] : ( ( '^' ( SIGN )? INTEGER ) | ( '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')' ) | ( SUPERSCIRIPT_DIGIT )+ );
        public final function exponent():Object {
            var value:Object = null;

            var s1:Token=null;
            var n1:Token=null;
            var s2:Token=null;
            var n2:Token=null;
            var INTEGER9:Token=null;
            var SIGN10:Token=null;
            var SUPERSCIRIPT_DIGIT11:Token=null;

            try {
                // src/org/ngs/as3units/format/Units.g:107:5: ( ( '^' ( SIGN )? INTEGER ) | ( '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')' ) | ( SUPERSCIRIPT_DIGIT )+ )
                var alt14:int=3;
                switch ( input.LA(1) ) {
                case 18:
                    {
                    alt14=1;
                    }
                    break;
                case 19:
                    {
                    alt14=2;
                    }
                    break;
                case SUPERSCIRIPT_DIGIT:
                    {
                    alt14=3;
                    }
                    break;
                default:
                    throw new NoViableAltException("", 14, 0, input);

                }

                switch (alt14) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:107:9: ( '^' ( SIGN )? INTEGER )
                        {
                        // src/org/ngs/as3units/format/Units.g:107:9: ( '^' ( SIGN )? INTEGER )
                        // src/org/ngs/as3units/format/Units.g:107:11: '^' ( SIGN )? INTEGER
                        {
                        matchStream(input,18,FOLLOW_18_in_exponent412); 
                        // src/org/ngs/as3units/format/Units.g:107:15: ( SIGN )?
                        var alt9:int=2;
                        var LA9_0:int = input.LA(1);

                        if ( (LA9_0==6) ) {
                            alt9=1;
                        }
                        switch (alt9) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:107:17: SIGN
                                {
                                SIGN10=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_exponent416)); 

                                }
                                break;

                        }

                        INTEGER9=Token(matchStream(input,INTEGER,FOLLOW_INTEGER_in_exponent421)); 

                        }

                         
                                    value = { 'pow': parseInt((INTEGER9!=null?INTEGER9.text:null)), 'root': 1 };
                                    if ((SIGN10 != null) && ((SIGN10!=null?SIGN10.text:null) == '-')) {
                                        value['pow'] = -value['pow'];
                                    }
                                

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/Units.g:114:9: ( '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')' )
                        {
                        // src/org/ngs/as3units/format/Units.g:114:9: ( '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')' )
                        // src/org/ngs/as3units/format/Units.g:114:11: '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')'
                        {
                        matchStream(input,19,FOLLOW_19_in_exponent445); 
                        // src/org/ngs/as3units/format/Units.g:114:16: (s1= SIGN )?
                        var alt10:int=2;
                        var LA10_0:int = input.LA(1);

                        if ( (LA10_0==6) ) {
                            alt10=1;
                        }
                        switch (alt10) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:114:17: s1= SIGN
                                {
                                s1=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_exponent450)); 

                                }
                                break;

                        }

                        n1=Token(matchStream(input,INTEGER,FOLLOW_INTEGER_in_exponent456)); 
                        // src/org/ngs/as3units/format/Units.g:114:38: ( '/' (s2= SIGN )? n2= INTEGER )?
                        var alt12:int=2;
                        var LA12_0:int = input.LA(1);

                        if ( (LA12_0==13) ) {
                            alt12=1;
                        }
                        switch (alt12) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:114:40: '/' (s2= SIGN )? n2= INTEGER
                                {
                                matchStream(input,13,FOLLOW_13_in_exponent460); 
                                // src/org/ngs/as3units/format/Units.g:114:44: (s2= SIGN )?
                                var alt11:int=2;
                                var LA11_0:int = input.LA(1);

                                if ( (LA11_0==6) ) {
                                    alt11=1;
                                }
                                switch (alt11) {
                                    case 1 :
                                        // src/org/ngs/as3units/format/Units.g:114:45: s2= SIGN
                                        {
                                        s2=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_exponent465)); 

                                        }
                                        break;

                                }

                                n2=Token(matchStream(input,INTEGER,FOLLOW_INTEGER_in_exponent471)); 

                                }
                                break;

                        }

                        matchStream(input,17,FOLLOW_17_in_exponent476); 

                        }


                                    value = { 'pow': parseInt((n1!=null?n1.text:null)), 'root': 1 };
                                    if ((s1 != null) && ((s1!=null?s1.text:null) == '-')) {
                                        value['pow'] = -value['pow'];
                                    }
                                    if (n2 != null) {
                                        value['root'] = parseInt((n2!=null?n2.text:null));
                                    }
                                    if ((s2 != null) && ((s2!=null?s2.text:null) == '-')) {
                                        value['root'] = -value['root'];
                                    }
                                

                        }
                        break;
                    case 3 :
                        // src/org/ngs/as3units/format/Units.g:127:9: ( SUPERSCIRIPT_DIGIT )+
                        {
                        // src/org/ngs/as3units/format/Units.g:127:9: ( SUPERSCIRIPT_DIGIT )+
                        var cnt13:int=0;
                        loop13:
                        do {
                            var alt13:int=2;
                            var LA13_0:int = input.LA(1);

                            if ( (LA13_0==8) ) {
                                alt13=1;
                            }


                            switch (alt13) {
                        	case 1 :
                        	    // src/org/ngs/as3units/format/Units.g:127:11: SUPERSCIRIPT_DIGIT
                        	    {
                        	    SUPERSCIRIPT_DIGIT11=Token(matchStream(input,SUPERSCIRIPT_DIGIT,FOLLOW_SUPERSCIRIPT_DIGIT_in_exponent503)); 

                        	    }
                        	    break;

                        	default :
                        	    if ( cnt13 >= 1 ) break loop13;
                                    throw new EarlyExitException(13, input);

                            }
                            cnt13++;
                        } while (true);


                                    value = { 'pow': parseInt((n1!=null?n1.text:null)), 'root': 1 };
                                    for (var i:int = 0; i < (SUPERSCIRIPT_DIGIT11!=null?SUPERSCIRIPT_DIGIT11.text:null).length; i += 1) {
                                        value['pow'] *= 10;
                                        switch ((SUPERSCIRIPT_DIGIT11!=null?SUPERSCIRIPT_DIGIT11.text:null).charAt(i)) {
                                            case '\u00B9': value['pow'] += 1; break;
                                            case '\u00B2': value['pow'] += 2; break;
                                            case '\u00B3': value['pow'] += 3; break;
                                            case '\u2074': value['pow'] += 4; break;
                                            case '\u2075': value['pow'] += 5; break;
                                            case '\u2076': value['pow'] += 6; break;
                                            case '\u2077': value['pow'] += 7; break;
                                            case '\u2078': value['pow'] += 8; break;
                                            case '\u2079': value['pow'] += 9; break;
                                        }
                                    }
                                

                        }
                        break;

                }
            }
            catch (re:RecognitionException) {
                reportError(re);
                recoverStream(input,re);
            }
            finally {
            }
            return value;
        }
        // $ANTLR end exponent


           // Delegated rules


     

        public static const FOLLOW_addExpr_in_unit69:BitSet = new BitSet([0x00000000, 0x00000000]);
        public static const FOLLOW_EOF_in_unit71:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_addExpr103:BitSet = new BitSet([0x00000040, 0x00000000]);
        public static const FOLLOW_SIGN_in_addExpr115:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_mulExpr_in_addExpr120:BitSet = new BitSet([0x00000042, 0x00000000]);
        public static const FOLLOW_SIGN_in_addExpr126:BitSet = new BitSet([0x00000030, 0x00000000]);
        public static const FOLLOW_set_in_addExpr130:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_exponentExpr_in_mulExpr171:BitSet = new BitSet([0x00003802, 0x00000000]);
        public static const FOLLOW_set_in_mulExpr177:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_exponentExpr_in_mulExpr189:BitSet = new BitSet([0x00003802, 0x00000000]);
        public static const FOLLOW_13_in_mulExpr197:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_exponentExpr_in_mulExpr201:BitSet = new BitSet([0x00003802, 0x00000000]);
        public static const FOLLOW_atomicExpr_in_exponentExpr236:BitSet = new BitSet([0x000C0102, 0x00000000]);
        public static const FOLLOW_exponent_in_exponentExpr240:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_14_in_exponentExpr272:BitSet = new BitSet([0x00010010, 0x00000000]);
        public static const FOLLOW_INTEGER_in_exponentExpr276:BitSet = new BitSet([0x00010000, 0x00000000]);
        public static const FOLLOW_15_in_exponentExpr285:BitSet = new BitSet([0x00010000, 0x00000000]);
        public static const FOLLOW_16_in_exponentExpr289:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_addExpr_in_exponentExpr291:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_17_in_exponentExpr293:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_atomicExpr325:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IDENTIFIER_in_atomicExpr353:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_16_in_atomicExpr376:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_addExpr_in_atomicExpr378:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_17_in_atomicExpr380:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_18_in_exponent412:BitSet = new BitSet([0x00000050, 0x00000000]);
        public static const FOLLOW_SIGN_in_exponent416:BitSet = new BitSet([0x00000010, 0x00000000]);
        public static const FOLLOW_INTEGER_in_exponent421:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_19_in_exponent445:BitSet = new BitSet([0x00000050, 0x00000000]);
        public static const FOLLOW_SIGN_in_exponent450:BitSet = new BitSet([0x00000010, 0x00000000]);
        public static const FOLLOW_INTEGER_in_exponent456:BitSet = new BitSet([0x00022000, 0x00000000]);
        public static const FOLLOW_13_in_exponent460:BitSet = new BitSet([0x00000050, 0x00000000]);
        public static const FOLLOW_SIGN_in_exponent465:BitSet = new BitSet([0x00000010, 0x00000000]);
        public static const FOLLOW_INTEGER_in_exponent471:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_17_in_exponent476:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SUPERSCIRIPT_DIGIT_in_exponent503:BitSet = new BitSet([0x00000102, 0x00000000]);

    }
}