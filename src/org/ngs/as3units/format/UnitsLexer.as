// $ANTLR 3.3 Nov 30, 2010 12:50:56 src/org/ngs/as3units/format/Units.g 2012-02-21 12:20:12
package  org.ngs.as3units.format  {
    import org.antlr.runtime.*;
        

    public class UnitsLexer extends Lexer {
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

        public function UnitsLexer(input:CharStream = null, state:RecognizerSharedState = null) {
            super(input, state);

            dfa9 = new DFA(this, 9,
                        "1:1: Tokens : ( T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | SIGN | INTEGER | FLOAT | IDENTIFIER );",
                        DFA9_eot, DFA9_eof, DFA9_min,
                        DFA9_max, DFA9_accept, DFA9_special,
                        DFA9_transition);


        }
        public override function get grammarFileName():String { return "src/org/ngs/as3units/format/Units.g"; }

        // $ANTLR start T__11
        public final function mT__11():void {
            try {
                var _type:int = T__11;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:9:7: ( '*' )
                // src/org/ngs/as3units/format/Units.g:9:9: '*'
                {
                match(42); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__11

        // $ANTLR start T__12
        public final function mT__12():void {
            try {
                var _type:int = T__12;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:10:7: ( 'á' )
                // src/org/ngs/as3units/format/Units.g:10:9: 'á'
                {
                match(183); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__12

        // $ANTLR start T__13
        public final function mT__13():void {
            try {
                var _type:int = T__13;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:11:7: ( '/' )
                // src/org/ngs/as3units/format/Units.g:11:9: '/'
                {
                match(47); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__13

        // $ANTLR start T__14
        public final function mT__14():void {
            try {
                var _type:int = T__14;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:12:7: ( 'log' )
                // src/org/ngs/as3units/format/Units.g:12:9: 'log'
                {
                matchString("log"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__14

        // $ANTLR start T__15
        public final function mT__15():void {
            try {
                var _type:int = T__15;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:13:7: ( 'ln' )
                // src/org/ngs/as3units/format/Units.g:13:9: 'ln'
                {
                matchString("ln"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__15

        // $ANTLR start T__16
        public final function mT__16():void {
            try {
                var _type:int = T__16;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:14:7: ( '(' )
                // src/org/ngs/as3units/format/Units.g:14:9: '('
                {
                match(40); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__16

        // $ANTLR start T__17
        public final function mT__17():void {
            try {
                var _type:int = T__17;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:15:7: ( ')' )
                // src/org/ngs/as3units/format/Units.g:15:9: ')'
                {
                match(41); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__17

        // $ANTLR start T__18
        public final function mT__18():void {
            try {
                var _type:int = T__18;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:16:7: ( '^' )
                // src/org/ngs/as3units/format/Units.g:16:9: '^'
                {
                match(94); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__18

        // $ANTLR start T__19
        public final function mT__19():void {
            try {
                var _type:int = T__19;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:17:7: ( '^(' )
                // src/org/ngs/as3units/format/Units.g:17:9: '^('
                {
                matchString("^("); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__19

        // $ANTLR start DIGIT
        public final function mDIGIT():void {
            try {
                // src/org/ngs/as3units/format/Units.g:143:5: ( ( '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' ) )
                // src/org/ngs/as3units/format/Units.g:143:7: ( '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' )
                {
                if ( (input.LA(1)>=48 && input.LA(1)<=57) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end DIGIT

        // $ANTLR start SUPERSCIRIPT_DIGIT
        public final function mSUPERSCIRIPT_DIGIT():void {
            try {
                // src/org/ngs/as3units/format/Units.g:145:5: ( ( '\\u2070' | '\\u00B9' | '\\u00B2' | '\\u00B3' | '\\u2074' | '\\u2075' | '\\u2076' | '\\u2077' | '\\u2078' | '\\u2079' ) )
                // src/org/ngs/as3units/format/Units.g:145:7: ( '\\u2070' | '\\u00B9' | '\\u00B2' | '\\u00B3' | '\\u2074' | '\\u2075' | '\\u2076' | '\\u2077' | '\\u2078' | '\\u2079' )
                {
                if ( (input.LA(1)>=178 && input.LA(1)<=179)||input.LA(1)==185||input.LA(1)==8304||(input.LA(1)>=8308 && input.LA(1)<=8313) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end SUPERSCIRIPT_DIGIT

        // $ANTLR start INITIAL_CHAR
        public final function mINITIAL_CHAR():void {
            try {
                // src/org/ngs/as3units/format/Units.g:147:5: (~ ( '\\u0000' .. '\\u0020' | '(' | ')' | '*' | '+' | '-' | '.' | '/' | '0' .. '9' | ':' | '^' | '\\u00B2' | '\\u00B3' | '\\u00B7' | '\\u00B9' | '\\u2070' | '\\u2074' | '\\u2075' | '\\u2076' | '\\u2077' | '\\u2078' | '\\u2079' ) )
                // src/org/ngs/as3units/format/Units.g:147:7: ~ ( '\\u0000' .. '\\u0020' | '(' | ')' | '*' | '+' | '-' | '.' | '/' | '0' .. '9' | ':' | '^' | '\\u00B2' | '\\u00B3' | '\\u00B7' | '\\u00B9' | '\\u2070' | '\\u2074' | '\\u2075' | '\\u2076' | '\\u2077' | '\\u2078' | '\\u2079' )
                {
                if ( (input.LA(1)>=33 && input.LA(1)<=39)||input.LA(1)==44||(input.LA(1)>=59 && input.LA(1)<=93)||(input.LA(1)>=95 && input.LA(1)<=177)||(input.LA(1)>=180 && input.LA(1)<=182)||input.LA(1)==184||(input.LA(1)>=186 && input.LA(1)<=8303)||(input.LA(1)>=8305 && input.LA(1)<=8307)||(input.LA(1)>=8314 && input.LA(1)<=65535) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end INITIAL_CHAR

        // $ANTLR start SIGN
        public final function mSIGN():void {
            try {
                var _type:int = SIGN;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:150:5: ( '+' | '-' )
                // src/org/ngs/as3units/format/Units.g:
                {
                if ( input.LA(1)==43||input.LA(1)==45 ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end SIGN

        // $ANTLR start INTEGER
        public final function mINTEGER():void {
            try {
                var _type:int = INTEGER;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:152:5: ( ( DIGIT )+ )
                // src/org/ngs/as3units/format/Units.g:152:7: ( DIGIT )+
                {
                // src/org/ngs/as3units/format/Units.g:152:7: ( DIGIT )+
                var cnt1:int=0;
                loop1:
                do {
                    var alt1:int=2;
                    var LA1_0:int = input.LA(1);

                    if ( ((LA1_0>=48 && LA1_0<=57)) ) {
                        alt1=1;
                    }


                    switch (alt1) {
                	case 1 :
                	    // src/org/ngs/as3units/format/Units.g:152:8: DIGIT
                	    {
                	    mDIGIT(); 

                	    }
                	    break;

                	default :
                	    if ( cnt1 >= 1 ) break loop1;
                            throw new EarlyExitException(1, input);

                    }
                    cnt1++;
                } while (true);


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end INTEGER

        // $ANTLR start FLOAT
        public final function mFLOAT():void {
            try {
                var _type:int = FLOAT;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:154:5: ( ( SIGN )? ( DIGIT )* '.' ( DIGIT )+ ( ( 'e' | 'E' ) ( SIGN )? ( DIGIT )+ )? )
                // src/org/ngs/as3units/format/Units.g:154:7: ( SIGN )? ( DIGIT )* '.' ( DIGIT )+ ( ( 'e' | 'E' ) ( SIGN )? ( DIGIT )+ )?
                {
                // src/org/ngs/as3units/format/Units.g:154:7: ( SIGN )?
                var alt2:int=2;
                var LA2_0:int = input.LA(1);

                if ( (LA2_0==43||LA2_0==45) ) {
                    alt2=1;
                }
                switch (alt2) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:154:8: SIGN
                        {
                        mSIGN(); 

                        }
                        break;

                }

                // src/org/ngs/as3units/format/Units.g:154:15: ( DIGIT )*
                loop3:
                do {
                    var alt3:int=2;
                    var LA3_0:int = input.LA(1);

                    if ( ((LA3_0>=48 && LA3_0<=57)) ) {
                        alt3=1;
                    }


                    switch (alt3) {
                	case 1 :
                	    // src/org/ngs/as3units/format/Units.g:154:16: DIGIT
                	    {
                	    mDIGIT(); 

                	    }
                	    break;

                	default :
                	    break loop3;
                    }
                } while (true);

                match(46); 
                // src/org/ngs/as3units/format/Units.g:154:28: ( DIGIT )+
                var cnt4:int=0;
                loop4:
                do {
                    var alt4:int=2;
                    var LA4_0:int = input.LA(1);

                    if ( ((LA4_0>=48 && LA4_0<=57)) ) {
                        alt4=1;
                    }


                    switch (alt4) {
                	case 1 :
                	    // src/org/ngs/as3units/format/Units.g:154:29: DIGIT
                	    {
                	    mDIGIT(); 

                	    }
                	    break;

                	default :
                	    if ( cnt4 >= 1 ) break loop4;
                            throw new EarlyExitException(4, input);

                    }
                    cnt4++;
                } while (true);

                // src/org/ngs/as3units/format/Units.g:154:37: ( ( 'e' | 'E' ) ( SIGN )? ( DIGIT )+ )?
                var alt7:int=2;
                var LA7_0:int = input.LA(1);

                if ( (LA7_0==69||LA7_0==101) ) {
                    alt7=1;
                }
                switch (alt7) {
                    case 1 :
                        // src/org/ngs/as3units/format/Units.g:154:38: ( 'e' | 'E' ) ( SIGN )? ( DIGIT )+
                        {
                        if ( input.LA(1)==69||input.LA(1)==101 ) {
                            input.consume();

                        }
                        else {
                            throw recover(new MismatchedSetException(null,input));
                        }

                        // src/org/ngs/as3units/format/Units.g:154:50: ( SIGN )?
                        var alt5:int=2;
                        var LA5_0:int = input.LA(1);

                        if ( (LA5_0==43||LA5_0==45) ) {
                            alt5=1;
                        }
                        switch (alt5) {
                            case 1 :
                                // src/org/ngs/as3units/format/Units.g:154:51: SIGN
                                {
                                mSIGN(); 

                                }
                                break;

                        }

                        // src/org/ngs/as3units/format/Units.g:154:58: ( DIGIT )+
                        var cnt6:int=0;
                        loop6:
                        do {
                            var alt6:int=2;
                            var LA6_0:int = input.LA(1);

                            if ( ((LA6_0>=48 && LA6_0<=57)) ) {
                                alt6=1;
                            }


                            switch (alt6) {
                        	case 1 :
                        	    // src/org/ngs/as3units/format/Units.g:154:59: DIGIT
                        	    {
                        	    mDIGIT(); 

                        	    }
                        	    break;

                        	default :
                        	    if ( cnt6 >= 1 ) break loop6;
                                    throw new EarlyExitException(6, input);

                            }
                            cnt6++;
                        } while (true);


                        }
                        break;

                }


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end FLOAT

        // $ANTLR start IDENTIFIER
        public final function mIDENTIFIER():void {
            try {
                var _type:int = IDENTIFIER;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/Units.g:156:5: ( INITIAL_CHAR ( INITIAL_CHAR | DIGIT )* )
                // src/org/ngs/as3units/format/Units.g:156:7: INITIAL_CHAR ( INITIAL_CHAR | DIGIT )*
                {
                mINITIAL_CHAR(); 
                // src/org/ngs/as3units/format/Units.g:156:20: ( INITIAL_CHAR | DIGIT )*
                loop8:
                do {
                    var alt8:int=2;
                    var LA8_0:int = input.LA(1);

                    if ( ((LA8_0>=33 && LA8_0<=39)||LA8_0==44||(LA8_0>=48 && LA8_0<=57)||(LA8_0>=59 && LA8_0<=93)||(LA8_0>=95 && LA8_0<=177)||(LA8_0>=180 && LA8_0<=182)||LA8_0==184||(LA8_0>=186 && LA8_0<=8303)||(LA8_0>=8305 && LA8_0<=8307)||(LA8_0>=8314 && LA8_0<=65535)) ) {
                        alt8=1;
                    }


                    switch (alt8) {
                	case 1 :
                	    // src/org/ngs/as3units/format/Units.g:
                	    {
                	    if ( (input.LA(1)>=33 && input.LA(1)<=39)||input.LA(1)==44||(input.LA(1)>=48 && input.LA(1)<=57)||(input.LA(1)>=59 && input.LA(1)<=93)||(input.LA(1)>=95 && input.LA(1)<=177)||(input.LA(1)>=180 && input.LA(1)<=182)||input.LA(1)==184||(input.LA(1)>=186 && input.LA(1)<=8303)||(input.LA(1)>=8305 && input.LA(1)<=8307)||(input.LA(1)>=8314 && input.LA(1)<=65535) ) {
                	        input.consume();

                	    }
                	    else {
                	        throw recover(new MismatchedSetException(null,input));
                	    }


                	    }
                	    break;

                	default :
                	    break loop8;
                    }
                } while (true);


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end IDENTIFIER

        public override function mTokens():void {
            // src/org/ngs/as3units/format/Units.g:1:8: ( T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | SIGN | INTEGER | FLOAT | IDENTIFIER )
            var alt9:int=13;
            alt9 = dfa9.predict(input);
            switch (alt9) {
                case 1 :
                    // src/org/ngs/as3units/format/Units.g:1:10: T__11
                    {
                    mT__11(); 

                    }
                    break;
                case 2 :
                    // src/org/ngs/as3units/format/Units.g:1:16: T__12
                    {
                    mT__12(); 

                    }
                    break;
                case 3 :
                    // src/org/ngs/as3units/format/Units.g:1:22: T__13
                    {
                    mT__13(); 

                    }
                    break;
                case 4 :
                    // src/org/ngs/as3units/format/Units.g:1:28: T__14
                    {
                    mT__14(); 

                    }
                    break;
                case 5 :
                    // src/org/ngs/as3units/format/Units.g:1:34: T__15
                    {
                    mT__15(); 

                    }
                    break;
                case 6 :
                    // src/org/ngs/as3units/format/Units.g:1:40: T__16
                    {
                    mT__16(); 

                    }
                    break;
                case 7 :
                    // src/org/ngs/as3units/format/Units.g:1:46: T__17
                    {
                    mT__17(); 

                    }
                    break;
                case 8 :
                    // src/org/ngs/as3units/format/Units.g:1:52: T__18
                    {
                    mT__18(); 

                    }
                    break;
                case 9 :
                    // src/org/ngs/as3units/format/Units.g:1:58: T__19
                    {
                    mT__19(); 

                    }
                    break;
                case 10 :
                    // src/org/ngs/as3units/format/Units.g:1:64: SIGN
                    {
                    mSIGN(); 

                    }
                    break;
                case 11 :
                    // src/org/ngs/as3units/format/Units.g:1:69: INTEGER
                    {
                    mINTEGER(); 

                    }
                    break;
                case 12 :
                    // src/org/ngs/as3units/format/Units.g:1:77: FLOAT
                    {
                    mFLOAT(); 

                    }
                    break;
                case 13 :
                    // src/org/ngs/as3units/format/Units.g:1:83: IDENTIFIER
                    {
                    mIDENTIFIER(); 

                    }
                    break;

            }

        }



        private const DFA9_eot:Array =
            DFA.unpackEncodedString("\x04\u80ff\xff\x01\x0b\x02\u80ff\xff"+
            "\x01\x0f\x01\x10\x01\x11\x02\u80ff\xff\x01\x0b\x01\x13\x04\u80ff\xff"+
            "\x01\x14\x02\u80ff\xff");
        private const DFA9_eof:Array =
            DFA.unpackEncodedString("\x15\u80ff\xff");
        private const DFA9_min:Array =
            DFA.unpackEncodedString("\x01\x21\x03\u80ff\xff\x01\x6e\x02\u80ff\xff"+
            "\x01\x28\x02\x2e\x02\u80ff\xff\x01\x67\x01\x21\x04\u80ff\xff"+
            "\x01\x21\x02\u80ff\xff", true);
        private const DFA9_max:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x03\u80ff\xff\x01\x6f"+
            "\x02\u80ff\xff\x01\x28\x02\x39\x02\u80ff\xff\x01\x67\x01\u80ff\xff"+
            "\x04\u80ff\xff\x01\u80ff\xff\x02\u80ff\xff", true);
        private const DFA9_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x01\x01\x02\x01\x03"+
            "\x01\u80ff\xff\x01\x06\x01\x07\x03\u80ff\xff\x01\x0c\x01\x0d"+
            "\x02\u80ff\xff\x01\x09\x01\x08\x01\x0a\x01\x0b\x01\u80ff\xff"+
            "\x01\x05\x01\x04");
        private const DFA9_special:Array =
            DFA.unpackEncodedString("\x15\u80ff\xff");
        private const DFA9_transition:Array = [
                DFA.unpackEncodedString("\x07\x0b\x01\x05\x01\x06\x01\x01"+
                "\x01\x08\x01\x0b\x01\x08\x01\x0a\x01\x03\x0a\x09\x01\u80ff\xff"+
                "\x23\x0b\x01\x07\x0d\x0b\x01\x04\x45\x0b\x02\u80ff\xff\x03"+
                "\x0b\x01\x02\x01\x0b\x01\u80ff\xff\u1fb6\x0b\x01\u80ff\xff"+
                "\x03\x0b\x06\u80ff\xff\u80df\x86\x0b"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x0d\x01\x0c"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x0e"),
                DFA.unpackEncodedString("\x01\x0a\x01\u80ff\xff\x0a\x0a"),
                DFA.unpackEncodedString("\x01\x0a\x01\u80ff\xff\x0a\x09"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x12"),
                DFA.unpackEncodedString("\x07\x0b\x04\u80ff\xff\x01\x0b"+
                "\x03\u80ff\xff\x0a\x0b\x01\u80ff\xff\x23\x0b\x01\u80ff\xff"+
                "\x53\x0b\x02\u80ff\xff\x03\x0b\x01\u80ff\xff\x01\x0b\x01"+
                "\u80ff\xff\u1fb6\x0b\x01\u80ff\xff\x03\x0b\x06\u80ff\xff"+
                "\u80df\x86\x0b"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x07\x0b\x04\u80ff\xff\x01\x0b"+
                "\x03\u80ff\xff\x0a\x0b\x01\u80ff\xff\x23\x0b\x01\u80ff\xff"+
                "\x53\x0b\x02\u80ff\xff\x03\x0b\x01\u80ff\xff\x01\x0b\x01"+
                "\u80ff\xff\u1fb6\x0b\x01\u80ff\xff\x03\x0b\x06\u80ff\xff"+
                "\u80df\x86\x0b"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
        protected var dfa9:DFA;  // initialized in constructor
     

    }
}