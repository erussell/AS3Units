// $ANTLR 3.3 Nov 30, 2010 12:50:56 src/org/ngs/as3units/format/UCUM.g 2012-02-22 01:05:52
package  org.ngs.as3units.format  {

    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UCUM;

    import org.antlr.runtime.*;
        

    public class UCUMParser extends Parser {
        public static const tokenNames:Array = [
            "<invalid>", "<EOR>", "<DOWN>", "<UP>", "DIVIDE", "TIMES", "ANN", "LPAREN", "RPAREN", "SIGN", "DIGITS", "ATOM", "DIGIT", "ATOM_CHAR", "LBRACKET", "NOTE", "ATOM_ELT"
        ];
        public static const EOF:int=-1;
        public static const DIVIDE:int=4;
        public static const TIMES:int=5;
        public static const ANN:int=6;
        public static const LPAREN:int=7;
        public static const RPAREN:int=8;
        public static const SIGN:int=9;
        public static const DIGITS:int=10;
        public static const ATOM:int=11;
        public static const DIGIT:int=12;
        public static const ATOM_CHAR:int=13;
        public static const LBRACKET:int=14;
        public static const NOTE:int=15;
        public static const ATOM_ELT:int=16;

        // delegates
        // delegators


            public function UCUMParser(input:TokenStream, state:RecognizerSharedState = null) {
                super(input, state);
            }
            

        public override function get tokenNames():Array { return UCUMParser.tokenNames; }
        public override function get grammarFileName():String { return "src/org/ngs/as3units/format/UCUM.g"; }


        public var symbols:SymbolMap;


        // $ANTLR start unit
        // src/org/ngs/as3units/format/UCUM.g:19:1: unit returns [Unit value] : ucumExpr EOF ;
        public final function unit():Unit {
            var value:Unit = null;

            var ucumExpr1:Unit = null;


            try {
                // src/org/ngs/as3units/format/UCUM.g:20:5: ( ucumExpr EOF )
                // src/org/ngs/as3units/format/UCUM.g:20:10: ucumExpr EOF
                {
                pushFollow(FOLLOW_ucumExpr_in_unit70);
                ucumExpr1=ucumExpr();

                state._fsp = state._fsp - 1;

                matchStream(input,EOF,FOLLOW_EOF_in_unit72); 
                 value = ucumExpr1; 

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

        // $ANTLR start ucumExpr
        // src/org/ngs/as3units/format/UCUM.g:22:1: ucumExpr returns [Unit value] : ( DIVIDE expr | expr );
        public final function ucumExpr():Unit {
            var value:Unit = null;

            var expr2:Unit = null;

            var expr3:Unit = null;


            try {
                // src/org/ngs/as3units/format/UCUM.g:23:5: ( DIVIDE expr | expr )
                var alt1:int=2;
                var LA1_0:int = input.LA(1);

                if ( (LA1_0==4) ) {
                    alt1=1;
                }
                else if ( ((LA1_0>=6 && LA1_0<=7)||(LA1_0>=10 && LA1_0<=11)) ) {
                    alt1=2;
                }
                else {
                    throw new NoViableAltException("", 1, 0, input);

                }
                switch (alt1) {
                    case 1 :
                        // src/org/ngs/as3units/format/UCUM.g:23:10: DIVIDE expr
                        {
                        matchStream(input,DIVIDE,FOLLOW_DIVIDE_in_ucumExpr93); 
                        pushFollow(FOLLOW_expr_in_ucumExpr95);
                        expr2=expr();

                        state._fsp = state._fsp - 1;

                         value = UCUM.ONE.divide(expr2); 

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/UCUM.g:24:10: expr
                        {
                        pushFollow(FOLLOW_expr_in_ucumExpr108);
                        expr3=expr();

                        state._fsp = state._fsp - 1;

                         value = expr3; 

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
        // $ANTLR end ucumExpr

        // $ANTLR start multiply
        // src/org/ngs/as3units/format/UCUM.g:26:1: multiply[Unit a] returns [Unit value] : ( TIMES term | DIVIDE term );
        public final function multiply(a:Unit):Unit {
            var value:Unit = null;

            var term4:Unit = null;

            var term5:Unit = null;


            try {
                // src/org/ngs/as3units/format/UCUM.g:27:5: ( TIMES term | DIVIDE term )
                var alt2:int=2;
                var LA2_0:int = input.LA(1);

                if ( (LA2_0==5) ) {
                    alt2=1;
                }
                else if ( (LA2_0==4) ) {
                    alt2=2;
                }
                else {
                    throw new NoViableAltException("", 2, 0, input);

                }
                switch (alt2) {
                    case 1 :
                        // src/org/ngs/as3units/format/UCUM.g:27:10: TIMES term
                        {
                        matchStream(input,TIMES,FOLLOW_TIMES_in_multiply131); 
                        pushFollow(FOLLOW_term_in_multiply133);
                        term4=term();

                        state._fsp = state._fsp - 1;

                         value = a.multiply(term4); 

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/UCUM.g:28:10: DIVIDE term
                        {
                        matchStream(input,DIVIDE,FOLLOW_DIVIDE_in_multiply146); 
                        pushFollow(FOLLOW_term_in_multiply148);
                        term5=term();

                        state._fsp = state._fsp - 1;

                         value = a.divide(term5); 

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
        // $ANTLR end multiply

        // $ANTLR start expr
        // src/org/ngs/as3units/format/UCUM.g:30:1: expr returns [Unit value] : v= term (v= multiply[v] )* ;
        public final function expr():Unit {
            var value:Unit = null;

            var v:Unit = null;


            try {
                // src/org/ngs/as3units/format/UCUM.g:31:5: (v= term (v= multiply[v] )* )
                // src/org/ngs/as3units/format/UCUM.g:31:10: v= term (v= multiply[v] )*
                {
                pushFollow(FOLLOW_term_in_expr181);
                v=term();

                state._fsp = state._fsp - 1;

                // src/org/ngs/as3units/format/UCUM.g:31:17: (v= multiply[v] )*
                loop3:
                do {
                    var alt3:int=2;
                    var LA3_0:int = input.LA(1);

                    if ( ((LA3_0>=4 && LA3_0<=5)) ) {
                        alt3=1;
                    }


                    switch (alt3) {
                	case 1 :
                	    // src/org/ngs/as3units/format/UCUM.g:31:18: v= multiply[v]
                	    {
                	    pushFollow(FOLLOW_multiply_in_expr186);
                	    v=multiply(v);

                	    state._fsp = state._fsp - 1;


                	    }
                	    break;

                	default :
                	    break loop3;
                    }
                } while (true);

                 value = v; 

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
        // $ANTLR end expr

        // $ANTLR start term
        // src/org/ngs/as3units/format/UCUM.g:33:1: term returns [Unit value] : element ( exponent )? ( ANN )* ;
        public final function term():Unit {
            var value:Unit = null;

            var ANN8:Token=null;
            var element6:Unit = null;

            var exponent7:int = 0;


            try {
                // src/org/ngs/as3units/format/UCUM.g:34:5: ( element ( exponent )? ( ANN )* )
                // src/org/ngs/as3units/format/UCUM.g:34:9: element ( exponent )? ( ANN )*
                {
                pushFollow(FOLLOW_element_in_term210);
                element6=element();

                state._fsp = state._fsp - 1;

                // src/org/ngs/as3units/format/UCUM.g:34:17: ( exponent )?
                var alt4:int=2;
                var LA4_0:int = input.LA(1);

                if ( ((LA4_0>=9 && LA4_0<=10)) ) {
                    alt4=1;
                }
                switch (alt4) {
                    case 1 :
                        // src/org/ngs/as3units/format/UCUM.g:34:18: exponent
                        {
                        pushFollow(FOLLOW_exponent_in_term213);
                        exponent7=exponent();

                        state._fsp = state._fsp - 1;


                        }
                        break;

                }

                // src/org/ngs/as3units/format/UCUM.g:34:29: ( ANN )*
                loop5:
                do {
                    var alt5:int=2;
                    var LA5_0:int = input.LA(1);

                    if ( (LA5_0==6) ) {
                        alt5=1;
                    }


                    switch (alt5) {
                	case 1 :
                	    // src/org/ngs/as3units/format/UCUM.g:34:30: ANN
                	    {
                	    ANN8=Token(matchStream(input,ANN,FOLLOW_ANN_in_term218)); 

                	    }
                	    break;

                	default :
                	    break loop5;
                    }
                } while (true);

                 
                            value = element6;
                            if (exponent7 != 0) {
                                value = value.pow(exponent7);
                            }
                            if (ANN8 != null) {
                                value = value.annotate((ANN8!=null?ANN8.text:null).substr(1, (ANN8!=null?ANN8.text:null).length-2));
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
        // $ANTLR end term

        // $ANTLR start element
        // src/org/ngs/as3units/format/UCUM.g:45:1: element returns [Unit value] : ( simpleUnit | LPAREN expr RPAREN | ANN );
        public final function element():Unit {
            var value:Unit = null;

            var ANN11:Token=null;
            var simpleUnit9:Unit = null;

            var expr10:Unit = null;


            try {
                // src/org/ngs/as3units/format/UCUM.g:46:5: ( simpleUnit | LPAREN expr RPAREN | ANN )
                var alt6:int=3;
                switch ( input.LA(1) ) {
                case DIGITS:
                case ATOM:
                    {
                    alt6=1;
                    }
                    break;
                case LPAREN:
                    {
                    alt6=2;
                    }
                    break;
                case ANN:
                    {
                    alt6=3;
                    }
                    break;
                default:
                    throw new NoViableAltException("", 6, 0, input);

                }

                switch (alt6) {
                    case 1 :
                        // src/org/ngs/as3units/format/UCUM.g:46:10: simpleUnit
                        {
                        pushFollow(FOLLOW_simpleUnit_in_element250);
                        simpleUnit9=simpleUnit();

                        state._fsp = state._fsp - 1;

                         value = simpleUnit9; 

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/UCUM.g:47:10: LPAREN expr RPAREN
                        {
                        matchStream(input,LPAREN,FOLLOW_LPAREN_in_element263); 
                        pushFollow(FOLLOW_expr_in_element265);
                        expr10=expr();

                        state._fsp = state._fsp - 1;

                        matchStream(input,RPAREN,FOLLOW_RPAREN_in_element267); 
                         value = expr10; 

                        }
                        break;
                    case 3 :
                        // src/org/ngs/as3units/format/UCUM.g:48:10: ANN
                        {
                        ANN11=Token(matchStream(input,ANN,FOLLOW_ANN_in_element280)); 
                         value =UCUM.ONE.annotate((ANN11!=null?ANN11.text:null)); 

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
        // $ANTLR end element

        // $ANTLR start exponent
        // src/org/ngs/as3units/format/UCUM.g:50:1: exponent returns [int value] : ( SIGN )? DIGITS ;
        public final function exponent():int {
            var value:int = 0;

            var DIGITS12:Token=null;
            var SIGN13:Token=null;

            try {
                // src/org/ngs/as3units/format/UCUM.g:51:5: ( ( SIGN )? DIGITS )
                // src/org/ngs/as3units/format/UCUM.g:51:9: ( SIGN )? DIGITS
                {
                // src/org/ngs/as3units/format/UCUM.g:51:9: ( SIGN )?
                var alt7:int=2;
                var LA7_0:int = input.LA(1);

                if ( (LA7_0==9) ) {
                    alt7=1;
                }
                switch (alt7) {
                    case 1 :
                        // src/org/ngs/as3units/format/UCUM.g:51:10: SIGN
                        {
                        SIGN13=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_exponent301)); 

                        }
                        break;

                }

                DIGITS12=Token(matchStream(input,DIGITS,FOLLOW_DIGITS_in_exponent305)); 

                            value = parseInt((DIGITS12!=null?DIGITS12.text:null));
                            if ((SIGN13 != null) && ((SIGN13!=null?SIGN13.text:null) == '-')) {
                                value = -value;
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
        // $ANTLR end exponent

        // $ANTLR start simpleUnit
        // src/org/ngs/as3units/format/UCUM.g:59:1: simpleUnit returns [Unit value] : ( ATOM | DIGITS );
        public final function simpleUnit():Unit {
            var value:Unit = null;

            var ATOM14:Token=null;
            var DIGITS15:Token=null;

            try {
                // src/org/ngs/as3units/format/UCUM.g:60:5: ( ATOM | DIGITS )
                var alt8:int=2;
                var LA8_0:int = input.LA(1);

                if ( (LA8_0==11) ) {
                    alt8=1;
                }
                else if ( (LA8_0==10) ) {
                    alt8=2;
                }
                else {
                    throw new NoViableAltException("", 8, 0, input);

                }
                switch (alt8) {
                    case 1 :
                        // src/org/ngs/as3units/format/UCUM.g:60:9: ATOM
                        {
                        ATOM14=Token(matchStream(input,ATOM,FOLLOW_ATOM_in_simpleUnit334)); 

                                    var symbol:String = (ATOM14!=null?ATOM14.text:null);
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
                    case 2 :
                        // src/org/ngs/as3units/format/UCUM.g:72:9: DIGITS
                        {
                        DIGITS15=Token(matchStream(input,DIGITS,FOLLOW_DIGITS_in_simpleUnit354)); 
                         value = UCUM.ONE.scale(parseInt((DIGITS15!=null?DIGITS15.text:null))); 

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
        // $ANTLR end simpleUnit


           // Delegated rules


     

        public static const FOLLOW_ucumExpr_in_unit70:BitSet = new BitSet([0x00000000, 0x00000000]);
        public static const FOLLOW_EOF_in_unit72:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DIVIDE_in_ucumExpr93:BitSet = new BitSet([0x00000CC0, 0x00000000]);
        public static const FOLLOW_expr_in_ucumExpr95:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_expr_in_ucumExpr108:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_TIMES_in_multiply131:BitSet = new BitSet([0x00000CC0, 0x00000000]);
        public static const FOLLOW_term_in_multiply133:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DIVIDE_in_multiply146:BitSet = new BitSet([0x00000CC0, 0x00000000]);
        public static const FOLLOW_term_in_multiply148:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_term_in_expr181:BitSet = new BitSet([0x00000032, 0x00000000]);
        public static const FOLLOW_multiply_in_expr186:BitSet = new BitSet([0x00000032, 0x00000000]);
        public static const FOLLOW_element_in_term210:BitSet = new BitSet([0x00000642, 0x00000000]);
        public static const FOLLOW_exponent_in_term213:BitSet = new BitSet([0x00000042, 0x00000000]);
        public static const FOLLOW_ANN_in_term218:BitSet = new BitSet([0x00000042, 0x00000000]);
        public static const FOLLOW_simpleUnit_in_element250:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LPAREN_in_element263:BitSet = new BitSet([0x00000CC0, 0x00000000]);
        public static const FOLLOW_expr_in_element265:BitSet = new BitSet([0x00000100, 0x00000000]);
        public static const FOLLOW_RPAREN_in_element267:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ANN_in_element280:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SIGN_in_exponent301:BitSet = new BitSet([0x00000400, 0x00000000]);
        public static const FOLLOW_DIGITS_in_exponent305:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ATOM_in_simpleUnit334:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DIGITS_in_simpleUnit354:BitSet = new BitSet([0x00000002, 0x00000000]);

    }
}