// $ANTLR 3.3 Nov 30, 2010 12:50:56 src/org/ngs/as3units/format/Units.g 2012-02-21 12:20:11
package  org.ngs.as3units.format  {

    import org.ngs.as3units.Unit;
    import org.ngs.as3units.SI;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.converter.LogConverter;

    import org.antlr.runtime.*;
        

    public class UnitsParser extends Parser {
        public static const tokenNames:Array = [
            "<invalid>", "<EOR>", "<DOWN>", "<UP>", "INTEGER", "FLOAT", "SIGN", "IDENTIFIER", "SUPERSCIRIPT_DIGIT", "DIGIT", "INITIAL_CHAR", "'*'", "'á'", "'/'", "'log'", "'ln'", "'('", "')'", "'^'", "'^('"
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
        // src/org/ngs/as3units/format/Units.g:22:1: unit returns [Unit value] : addExpr EOF ;
        public final function unit():Unit {
            var value:Unit = null;

            var addExpr1:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:23:5: ( addExpr EOF )
                // src/org/ngs/as3units/format/Units.g:23:7: addExpr EOF
                {
                pushFollow(FOLLOW_addExpr_in_unit77);
                addExpr1=addExpr();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return value;
                matchStream(input,EOF,FOLLOW_EOF_in_unit79); if (this.state.failed) return value;
                if ( this.state.backtracking==0 ) {
                   value = addExpr1; 
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
                // src/org/ngs/as3units/format/Units.g:26:7: (n1= ( INTEGER | FLOAT ) s1= SIGN )? mulExpr (s2= SIGN n2= ( INTEGER | FLOAT ) )?
                {
                // src/org/ngs/as3units/format/Units.g:26:7: (n1= ( INTEGER | FLOAT ) s1= SIGN )?
                var alt1:int=2;
                var LA1_0:int = input.LA(1);

                if ( ((LA1_0>=4 && LA1_0<=5)) ) {
                    var LA1_1:int = input.LA(2);

                    if ( (LA1_1==6) ) {
                        var LA1_3:int = input.LA(3);

                        if ( ((LA1_3>=4 && LA1_3<=5)) ) {
                            var LA1_4:int = input.LA(4);

                            if ( (synpred2_Units()) ) {
                                alt1=1;
                            }
                        }
                        else if ( (LA1_3==7||(LA1_3>=14 && LA1_3<=16)) ) {
                            alt1=1;
                        }
                    }
                }
                switch (alt1) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:26:9: n1= ( INTEGER | FLOAT ) s1= SIGN
                        {
                        n1=Token(input.LT(1));
                        if ( (input.LA(1)>=4 && input.LA(1)<=5) ) {
                            input.consume();
                            this.state.errorRecovery=false;this.state.failed=false;
                        }
                        else {
                            if (this.state.backtracking>0) {this.state.failed=true; return value;}
                            throw new MismatchedSetException(null,input);
                        }

                        s1=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_addExpr117)); if (this.state.failed) return value;

                        }
                        break;

                }

                pushFollow(FOLLOW_mulExpr_in_addExpr122);
                mulExpr2=mulExpr();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return value;
                // src/org/ngs/as3units/format/Units.g:26:51: (s2= SIGN n2= ( INTEGER | FLOAT ) )?
                var alt2:int=2;
                var LA2_0:int = input.LA(1);

                if ( (LA2_0==6) ) {
                    alt2=1;
                }
                switch (alt2) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:26:53: s2= SIGN n2= ( INTEGER | FLOAT )
                        {
                        s2=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_addExpr128)); if (this.state.failed) return value;
                        n2=Token(input.LT(1));
                        if ( (input.LA(1)>=4 && input.LA(1)<=5) ) {
                            input.consume();
                            this.state.errorRecovery=false;this.state.failed=false;
                        }
                        else {
                            if (this.state.backtracking>0) {this.state.failed=true; return value;}
                            throw new MismatchedSetException(null,input);
                        }


                        }
                        break;

                }

                if ( this.state.backtracking==0 ) {
                   
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
        // src/org/ngs/as3units/format/Units.g:44:1: mulExpr returns [Unit value] : v1= exponentExpr ( ( ( '*' | 'á' ) v2= exponentExpr ) | ( '/' v3= exponentExpr ) )* ;
        public final function mulExpr():Unit {
            var value:Unit = null;

            var v1:Unit = null;

            var v2:Unit = null;

            var v3:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:45:5: (v1= exponentExpr ( ( ( '*' | 'á' ) v2= exponentExpr ) | ( '/' v3= exponentExpr ) )* )
                // src/org/ngs/as3units/format/Units.g:45:7: v1= exponentExpr ( ( ( '*' | 'á' ) v2= exponentExpr ) | ( '/' v3= exponentExpr ) )*
                {
                pushFollow(FOLLOW_exponentExpr_in_mulExpr167);
                v1=exponentExpr();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return value;
                // src/org/ngs/as3units/format/Units.g:45:23: ( ( ( '*' | 'á' ) v2= exponentExpr ) | ( '/' v3= exponentExpr ) )*
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
                	    // src/org/ngs/as3units/format/Units.g:45:25: ( ( '*' | 'á' ) v2= exponentExpr )
                	    {
                	    // src/org/ngs/as3units/format/Units.g:45:25: ( ( '*' | 'á' ) v2= exponentExpr )
                	    // src/org/ngs/as3units/format/Units.g:45:27: ( '*' | 'á' ) v2= exponentExpr
                	    {
                	    if ( (input.LA(1)>=11 && input.LA(1)<=12) ) {
                	        input.consume();
                	        this.state.errorRecovery=false;this.state.failed=false;
                	    }
                	    else {
                	        if (this.state.backtracking>0) {this.state.failed=true; return value;}
                	        throw new MismatchedSetException(null,input);
                	    }

                	    pushFollow(FOLLOW_exponentExpr_in_mulExpr185);
                	    v2=exponentExpr();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return value;

                	    }


                	    }
                	    break;
                	case 2 :
                	    // src/org/ngs/as3units/format/Units.g:45:61: ( '/' v3= exponentExpr )
                	    {
                	    // src/org/ngs/as3units/format/Units.g:45:61: ( '/' v3= exponentExpr )
                	    // src/org/ngs/as3units/format/Units.g:45:63: '/' v3= exponentExpr
                	    {
                	    matchStream(input,13,FOLLOW_13_in_mulExpr193); if (this.state.failed) return value;
                	    pushFollow(FOLLOW_exponentExpr_in_mulExpr197);
                	    v3=exponentExpr();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return value;

                	    }


                	    }
                	    break;

                	default :
                	    break loop3;
                    }
                } while (true);

                if ( this.state.backtracking==0 ) {

                      	    value = v1;
                      	    if (v2 != null) {
                      	        value = value.multiply(v2);
                      	    }
                      	    if (v3 != null) {
                      	    	value = value.divide(v3);
                      	    }
                      	
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
        // src/org/ngs/as3units/format/Units.g:55:1: exponentExpr returns [Unit value] : ( ( atomicExpr ( exponent )? ) | (l= ( 'log' ( INTEGER )? ) | 'ln' ) '(' addExpr ')' );
        public final function exponentExpr():Unit {
            var value:Unit = null;

            var l:Token=null;
            var INTEGER6:Token=null;
            var atomicExpr3:Unit = null;

            var exponent4:Object = null;

            var addExpr5:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:56:5: ( ( atomicExpr ( exponent )? ) | (l= ( 'log' ( INTEGER )? ) | 'ln' ) '(' addExpr ')' )
                var alt7:int=2;
                var LA7_0:int = input.LA(1);

                if ( ((LA7_0>=4 && LA7_0<=5)||LA7_0==7||LA7_0==16) ) {
                    alt7=1;
                }
                else if ( ((LA7_0>=14 && LA7_0<=15)) ) {
                    alt7=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return value;}
                    throw new NoViableAltException("", 7, 0, input);

                }
                switch (alt7) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:56:7: ( atomicExpr ( exponent )? )
                        {
                        // src/org/ngs/as3units/format/Units.g:56:7: ( atomicExpr ( exponent )? )
                        // src/org/ngs/as3units/format/Units.g:56:9: atomicExpr ( exponent )?
                        {
                        pushFollow(FOLLOW_atomicExpr_in_exponentExpr226);
                        atomicExpr3=atomicExpr();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return value;
                        // src/org/ngs/as3units/format/Units.g:56:20: ( exponent )?
                        var alt4:int=2;
                        var LA4_0:int = input.LA(1);

                        if ( (LA4_0==8||(LA4_0>=18 && LA4_0<=19)) ) {
                            alt4=1;
                        }
                        switch (alt4) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:56:22: exponent
                                {
                                pushFollow(FOLLOW_exponent_in_exponentExpr230);
                                exponent4=exponent();

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return value;

                                }
                                break;

                        }


                        }

                        if ( this.state.backtracking==0 ) {

                                      value = atomicExpr3;
                                      if (exponent4.pow && (exponent4.pow != 1)) {
                                          value = value.pow(exponent4.pow);
                                      }
                                      if (exponent4.root && (exponent4.root != 1)) {
                                      	value = value.root(exponent4.root);
                                      }
                                  
                        }

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/Units.g:66:7: (l= ( 'log' ( INTEGER )? ) | 'ln' ) '(' addExpr ')'
                        {
                        // src/org/ngs/as3units/format/Units.g:66:7: (l= ( 'log' ( INTEGER )? ) | 'ln' )
                        var alt6:int=2;
                        var LA6_0:int = input.LA(1);

                        if ( (LA6_0==14) ) {
                            alt6=1;
                        }
                        else if ( (LA6_0==15) ) {
                            alt6=2;
                        }
                        else {
                            if (this.state.backtracking>0) {this.state.failed=true; return value;}
                            throw new NoViableAltException("", 6, 0, input);

                        }
                        switch (alt6) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:66:9: l= ( 'log' ( INTEGER )? )
                                {
                                // src/org/ngs/as3units/format/Units.g:66:11: ( 'log' ( INTEGER )? )
                                // src/org/ngs/as3units/format/Units.g:66:13: 'log' ( INTEGER )?
                                {
                                matchStream(input,14,FOLLOW_14_in_exponentExpr260); if (this.state.failed) return value;
                                // src/org/ngs/as3units/format/Units.g:66:19: ( INTEGER )?
                                var alt5:int=2;
                                var LA5_0:int = input.LA(1);

                                if ( (LA5_0==4) ) {
                                    alt5=1;
                                }
                                switch (alt5) {
                                    case 1 :
                                        // src/org/ngs/as3units/format/Units.g:66:21: INTEGER
                                        {
                                        INTEGER6=Token(matchStream(input,INTEGER,FOLLOW_INTEGER_in_exponentExpr264)); if (this.state.failed) return value;

                                        }
                                        break;

                                }


                                }


                                }
                                break;
                            case 2 :
                                // src/org/ngs/as3units/format/Units.g:66:36: 'ln'
                                {
                                matchStream(input,15,FOLLOW_15_in_exponentExpr273); if (this.state.failed) return value;

                                }
                                break;

                        }

                        matchStream(input,16,FOLLOW_16_in_exponentExpr277); if (this.state.failed) return value;
                        pushFollow(FOLLOW_addExpr_in_exponentExpr279);
                        addExpr5=addExpr();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return value;
                        matchStream(input,17,FOLLOW_17_in_exponentExpr281); if (this.state.failed) return value;
                        if ( this.state.backtracking==0 ) {

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
        // src/org/ngs/as3units/format/Units.g:81:1: atomicExpr returns [Unit value] : (n1= ( INTEGER | FLOAT ) | IDENTIFIER | ( '(' addExpr ')' ) );
        public final function atomicExpr():Unit {
            var value:Unit = null;

            var n1:Token=null;
            var IDENTIFIER7:Token=null;
            var addExpr8:Unit = null;


            try {
                // src/org/ngs/as3units/format/Units.g:82:5: (n1= ( INTEGER | FLOAT ) | IDENTIFIER | ( '(' addExpr ')' ) )
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
                    if (this.state.backtracking>0) {this.state.failed=true; return value;}
                    throw new NoViableAltException("", 8, 0, input);

                }

                switch (alt8) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:82:7: n1= ( INTEGER | FLOAT )
                        {
                        n1=Token(input.LT(1));
                        if ( (input.LA(1)>=4 && input.LA(1)<=5) ) {
                            input.consume();
                            this.state.errorRecovery=false;this.state.failed=false;
                        }
                        else {
                            if (this.state.backtracking>0) {this.state.failed=true; return value;}
                            throw new MismatchedSetException(null,input);
                        }

                        if ( this.state.backtracking==0 ) {

                                      value = SI.ONE.scale(parseFloat((n1!=null?n1.text:null)));
                                  
                        }

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/Units.g:86:7: IDENTIFIER
                        {
                        IDENTIFIER7=Token(matchStream(input,IDENTIFIER,FOLLOW_IDENTIFIER_in_atomicExpr336)); if (this.state.failed) return value;
                        if ( this.state.backtracking==0 ) {

                                      var symbol:String = (IDENTIFIER7!=null?IDENTIFIER7.text:null);
                                      var entry:SymbolMapEntry = symbols.lookup(symbol);
                                      if (entry == null) {
                                          throw new Error("symbol not found " + symbol);
                                      } else if (entry.prefix != null) {
                                          value = entry.unit.transform(entry.prefix.converter);
                                      } else {
                                          value = entry.unit;
                                      }
                                  
                        }

                        }
                        break;
                    case 3 :
                        // src/org/ngs/as3units/format/Units.g:98:7: ( '(' addExpr ')' )
                        {
                        // src/org/ngs/as3units/format/Units.g:98:7: ( '(' addExpr ')' )
                        // src/org/ngs/as3units/format/Units.g:98:9: '(' addExpr ')'
                        {
                        matchStream(input,16,FOLLOW_16_in_atomicExpr357); if (this.state.failed) return value;
                        pushFollow(FOLLOW_addExpr_in_atomicExpr359);
                        addExpr8=addExpr();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return value;
                        matchStream(input,17,FOLLOW_17_in_atomicExpr361); if (this.state.failed) return value;

                        }

                        if ( this.state.backtracking==0 ) {

                                      value = addExpr8;
                                  
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
        // $ANTLR end atomicExpr

        // $ANTLR start exponent
        // src/org/ngs/as3units/format/Units.g:102:1: exponent returns [Object value] : ( ( '^' ( SIGN )? INTEGER ) | ( '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')' ) | ( SUPERSCIRIPT_DIGIT )+ );
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
                // src/org/ngs/as3units/format/Units.g:103:5: ( ( '^' ( SIGN )? INTEGER ) | ( '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')' ) | ( SUPERSCIRIPT_DIGIT )+ )
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
                    if (this.state.backtracking>0) {this.state.failed=true; return value;}
                    throw new NoViableAltException("", 14, 0, input);

                }

                switch (alt14) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:103:7: ( '^' ( SIGN )? INTEGER )
                        {
                        // src/org/ngs/as3units/format/Units.g:103:7: ( '^' ( SIGN )? INTEGER )
                        // src/org/ngs/as3units/format/Units.g:103:9: '^' ( SIGN )? INTEGER
                        {
                        matchStream(input,18,FOLLOW_18_in_exponent390); if (this.state.failed) return value;
                        // src/org/ngs/as3units/format/Units.g:103:13: ( SIGN )?
                        var alt9:int=2;
                        var LA9_0:int = input.LA(1);

                        if ( (LA9_0==6) ) {
                            alt9=1;
                        }
                        switch (alt9) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:103:15: SIGN
                                {
                                SIGN10=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_exponent394)); if (this.state.failed) return value;

                                }
                                break;

                        }

                        INTEGER9=Token(matchStream(input,INTEGER,FOLLOW_INTEGER_in_exponent399)); if (this.state.failed) return value;

                        }

                        if ( this.state.backtracking==0 ) {
                           
                                      value = { 'pow': parseInt((INTEGER9!=null?INTEGER9.text:null)), 'root': 1 };
                                      if ((SIGN10 != null) && ((SIGN10!=null?SIGN10.text:null) == '-')) {
                                          value['pow'] = -value['pow'];
                                      }
                                  
                        }

                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/Units.g:110:7: ( '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')' )
                        {
                        // src/org/ngs/as3units/format/Units.g:110:7: ( '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')' )
                        // src/org/ngs/as3units/format/Units.g:110:9: '^(' (s1= SIGN )? n1= INTEGER ( '/' (s2= SIGN )? n2= INTEGER )? ')'
                        {
                        matchStream(input,19,FOLLOW_19_in_exponent421); if (this.state.failed) return value;
                        // src/org/ngs/as3units/format/Units.g:110:14: (s1= SIGN )?
                        var alt10:int=2;
                        var LA10_0:int = input.LA(1);

                        if ( (LA10_0==6) ) {
                            alt10=1;
                        }
                        switch (alt10) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:110:15: s1= SIGN
                                {
                                s1=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_exponent426)); if (this.state.failed) return value;

                                }
                                break;

                        }

                        n1=Token(matchStream(input,INTEGER,FOLLOW_INTEGER_in_exponent432)); if (this.state.failed) return value;
                        // src/org/ngs/as3units/format/Units.g:110:36: ( '/' (s2= SIGN )? n2= INTEGER )?
                        var alt12:int=2;
                        var LA12_0:int = input.LA(1);

                        if ( (LA12_0==13) ) {
                            alt12=1;
                        }
                        switch (alt12) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:110:38: '/' (s2= SIGN )? n2= INTEGER
                                {
                                matchStream(input,13,FOLLOW_13_in_exponent436); if (this.state.failed) return value;
                                // src/org/ngs/as3units/format/Units.g:110:42: (s2= SIGN )?
                                var alt11:int=2;
                                var LA11_0:int = input.LA(1);

                                if ( (LA11_0==6) ) {
                                    alt11=1;
                                }
                                switch (alt11) {
                                    case 1 :
                                        // src/org/ngs/as3units/format/Units.g:110:43: s2= SIGN
                                        {
                                        s2=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_exponent441)); if (this.state.failed) return value;

                                        }
                                        break;

                                }

                                n2=Token(matchStream(input,INTEGER,FOLLOW_INTEGER_in_exponent447)); if (this.state.failed) return value;

                                }
                                break;

                        }

                        matchStream(input,17,FOLLOW_17_in_exponent452); if (this.state.failed) return value;

                        }

                        if ( this.state.backtracking==0 ) {

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

                        }
                        break;
                    case 3 :
                        // src/org/ngs/as3units/format/Units.g:123:7: ( SUPERSCIRIPT_DIGIT )+
                        {
                        // src/org/ngs/as3units/format/Units.g:123:7: ( SUPERSCIRIPT_DIGIT )+
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
                        	    // src/org/ngs/as3units/format/Units.g:123:9: SUPERSCIRIPT_DIGIT
                        	    {
                        	    SUPERSCIRIPT_DIGIT11=Token(matchStream(input,SUPERSCIRIPT_DIGIT,FOLLOW_SUPERSCIRIPT_DIGIT_in_exponent477)); if (this.state.failed) return value;

                        	    }
                        	    break;

                        	default :
                        	    if ( cnt13 >= 1 ) break loop13;
                        	    if (this.state.backtracking>0) {this.state.failed=true; return value;}
                                    throw new EarlyExitException(13, input);

                            }
                            cnt13++;
                        } while (true);

                        if ( this.state.backtracking==0 ) {

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

        // $ANTLR start synpred2_Units
        public final function synpred2_Units_fragment():void {
            var n1:Token=null;
            var s1:Token=null;

            // src/org/ngs/as3units/format/Units.g:26:9: (n1= ( INTEGER | FLOAT ) s1= SIGN )
            // src/org/ngs/as3units/format/Units.g:26:9: n1= ( INTEGER | FLOAT ) s1= SIGN
            {
            n1=Token(input.LT(1));
            if ( (input.LA(1)>=4 && input.LA(1)<=5) ) {
                input.consume();
                this.state.errorRecovery=false;this.state.failed=false;
            }
            else {
                if (this.state.backtracking>0) {this.state.failed=true; return ;}
                throw new MismatchedSetException(null,input);
            }

            s1=Token(matchStream(input,SIGN,FOLLOW_SIGN_in_synpred2_Units117)); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred2_Units


           // Delegated rules

        public final function synpred2_Units():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred2_Units_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }


     

        public static const FOLLOW_addExpr_in_unit77:BitSet = new BitSet([0x00000000, 0x00000000]);
        public static const FOLLOW_EOF_in_unit79:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_addExpr105:BitSet = new BitSet([0x00000040, 0x00000000]);
        public static const FOLLOW_SIGN_in_addExpr117:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_mulExpr_in_addExpr122:BitSet = new BitSet([0x00000042, 0x00000000]);
        public static const FOLLOW_SIGN_in_addExpr128:BitSet = new BitSet([0x00000030, 0x00000000]);
        public static const FOLLOW_set_in_addExpr132:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_exponentExpr_in_mulExpr167:BitSet = new BitSet([0x00003802, 0x00000000]);
        public static const FOLLOW_set_in_mulExpr173:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_exponentExpr_in_mulExpr185:BitSet = new BitSet([0x00003802, 0x00000000]);
        public static const FOLLOW_13_in_mulExpr193:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_exponentExpr_in_mulExpr197:BitSet = new BitSet([0x00003802, 0x00000000]);
        public static const FOLLOW_atomicExpr_in_exponentExpr226:BitSet = new BitSet([0x000C0102, 0x00000000]);
        public static const FOLLOW_exponent_in_exponentExpr230:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_14_in_exponentExpr260:BitSet = new BitSet([0x00010010, 0x00000000]);
        public static const FOLLOW_INTEGER_in_exponentExpr264:BitSet = new BitSet([0x00010000, 0x00000000]);
        public static const FOLLOW_15_in_exponentExpr273:BitSet = new BitSet([0x00010000, 0x00000000]);
        public static const FOLLOW_16_in_exponentExpr277:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_addExpr_in_exponentExpr279:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_17_in_exponentExpr281:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_atomicExpr310:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IDENTIFIER_in_atomicExpr336:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_16_in_atomicExpr357:BitSet = new BitSet([0x0001C0B0, 0x00000000]);
        public static const FOLLOW_addExpr_in_atomicExpr359:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_17_in_atomicExpr361:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_18_in_exponent390:BitSet = new BitSet([0x00000050, 0x00000000]);
        public static const FOLLOW_SIGN_in_exponent394:BitSet = new BitSet([0x00000010, 0x00000000]);
        public static const FOLLOW_INTEGER_in_exponent399:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_19_in_exponent421:BitSet = new BitSet([0x00000050, 0x00000000]);
        public static const FOLLOW_SIGN_in_exponent426:BitSet = new BitSet([0x00000010, 0x00000000]);
        public static const FOLLOW_INTEGER_in_exponent432:BitSet = new BitSet([0x00022000, 0x00000000]);
        public static const FOLLOW_13_in_exponent436:BitSet = new BitSet([0x00000050, 0x00000000]);
        public static const FOLLOW_SIGN_in_exponent441:BitSet = new BitSet([0x00000010, 0x00000000]);
        public static const FOLLOW_INTEGER_in_exponent447:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_17_in_exponent452:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SUPERSCIRIPT_DIGIT_in_exponent477:BitSet = new BitSet([0x00000102, 0x00000000]);
        public static const FOLLOW_set_in_synpred2_Units105:BitSet = new BitSet([0x00000040, 0x00000000]);
        public static const FOLLOW_SIGN_in_synpred2_Units117:BitSet = new BitSet([0x00000002, 0x00000000]);

    }
}