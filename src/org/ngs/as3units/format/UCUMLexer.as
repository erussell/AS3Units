// $ANTLR 3.3 Nov 30, 2010 12:50:56 src/org/ngs/as3units/format/UCUM.g 2012-02-22 01:05:52
package  org.ngs.as3units.format  {
    import org.antlr.runtime.*;
        

    public class UCUMLexer extends Lexer {
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

        public function UCUMLexer(input:CharStream = null, state:RecognizerSharedState = null) {
            super(input, state);

        }
        public override function get grammarFileName():String { return "src/org/ngs/as3units/format/UCUM.g"; }

        // $ANTLR start DIGIT
        public final function mDIGIT():void {
            try {
                // src/org/ngs/as3units/format/UCUM.g:75:5: ( '0' .. '9' )
                // src/org/ngs/as3units/format/UCUM.g:75:9: '0' .. '9'
                {
                matchRange(48,57); 

                }

            }
            finally {
            }
        }
        // $ANTLR end DIGIT

        // $ANTLR start ATOM_CHAR
        public final function mATOM_CHAR():void {
            try {
                // src/org/ngs/as3units/format/UCUM.g:77:5: ( '!' | '#' .. '\\'' | '*' | ',' | ':' .. 'Z' | '\\\\' | '^' .. 'z' | '|' | '~' )
                // src/org/ngs/as3units/format/UCUM.g:
                {
                if ( input.LA(1)==33||(input.LA(1)>=35 && input.LA(1)<=39)||input.LA(1)==42||input.LA(1)==44||(input.LA(1)>=58 && input.LA(1)<=90)||input.LA(1)==92||(input.LA(1)>=94 && input.LA(1)<=122)||input.LA(1)==124||input.LA(1)==126 ) {
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
        // $ANTLR end ATOM_CHAR

        // $ANTLR start DIGITS
        public final function mDIGITS():void {
            try {
                var _type:int = DIGITS;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:87:5: ( ( DIGIT )+ )
                // src/org/ngs/as3units/format/UCUM.g:87:9: ( DIGIT )+
                {
                // src/org/ngs/as3units/format/UCUM.g:87:9: ( DIGIT )+
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
                	    // src/org/ngs/as3units/format/UCUM.g:87:9: DIGIT
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
        // $ANTLR end DIGITS

        // $ANTLR start SIGN
        public final function mSIGN():void {
            try {
                var _type:int = SIGN;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:89:5: ( ( '+' | '-' ) )
                // src/org/ngs/as3units/format/UCUM.g:89:9: ( '+' | '-' )
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

        // $ANTLR start DIVIDE
        public final function mDIVIDE():void {
            try {
                var _type:int = DIVIDE;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:91:5: ( '/' )
                // src/org/ngs/as3units/format/UCUM.g:91:9: '/'
                {
                match(47); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end DIVIDE

        // $ANTLR start TIMES
        public final function mTIMES():void {
            try {
                var _type:int = TIMES;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:93:5: ( '.' )
                // src/org/ngs/as3units/format/UCUM.g:93:9: '.'
                {
                match(46); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end TIMES

        // $ANTLR start LPAREN
        public final function mLPAREN():void {
            try {
                var _type:int = LPAREN;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:95:5: ( '(' )
                // src/org/ngs/as3units/format/UCUM.g:95:9: '('
                {
                match(40); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end LPAREN

        // $ANTLR start RPAREN
        public final function mRPAREN():void {
            try {
                var _type:int = RPAREN;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:97:5: ( ')' )
                // src/org/ngs/as3units/format/UCUM.g:97:9: ')'
                {
                match(41); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end RPAREN

        // $ANTLR start LBRACKET
        public final function mLBRACKET():void {
            try {
                var _type:int = LBRACKET;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:99:5: ( ']' )
                // src/org/ngs/as3units/format/UCUM.g:99:9: ']'
                {
                match(93); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end LBRACKET

        // $ANTLR start ANN
        public final function mANN():void {
            try {
                var _type:int = ANN;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:101:5: ( '{' ( ATOM_CHAR | DIGIT | SIGN | DIVIDE | TIMES )* '}' )
                // src/org/ngs/as3units/format/UCUM.g:101:9: '{' ( ATOM_CHAR | DIGIT | SIGN | DIVIDE | TIMES )* '}'
                {
                match(123); 
                // src/org/ngs/as3units/format/UCUM.g:101:13: ( ATOM_CHAR | DIGIT | SIGN | DIVIDE | TIMES )*
                loop2:
                do {
                    var alt2:int=2;
                    var LA2_0:int = input.LA(1);

                    if ( (LA2_0==33||(LA2_0>=35 && LA2_0<=39)||(LA2_0>=42 && LA2_0<=90)||LA2_0==92||(LA2_0>=94 && LA2_0<=122)||LA2_0==124||LA2_0==126) ) {
                        alt2=1;
                    }


                    switch (alt2) {
                	case 1 :
                	    // src/org/ngs/as3units/format/UCUM.g:
                	    {
                	    if ( input.LA(1)==33||(input.LA(1)>=35 && input.LA(1)<=39)||(input.LA(1)>=42 && input.LA(1)<=90)||input.LA(1)==92||(input.LA(1)>=94 && input.LA(1)<=122)||input.LA(1)==124||input.LA(1)==126 ) {
                	        input.consume();

                	    }
                	    else {
                	        throw recover(new MismatchedSetException(null,input));
                	    }


                	    }
                	    break;

                	default :
                	    break loop2;
                    }
                } while (true);

                match(125); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end ANN

        // $ANTLR start NOTE
        public final function mNOTE():void {
            try {
                // src/org/ngs/as3units/format/UCUM.g:103:5: ( '[' ( ATOM_CHAR | DIGIT | SIGN | DIVIDE | TIMES )* ']' )
                // src/org/ngs/as3units/format/UCUM.g:103:9: '[' ( ATOM_CHAR | DIGIT | SIGN | DIVIDE | TIMES )* ']'
                {
                match(91); 
                // src/org/ngs/as3units/format/UCUM.g:103:13: ( ATOM_CHAR | DIGIT | SIGN | DIVIDE | TIMES )*
                loop3:
                do {
                    var alt3:int=2;
                    var LA3_0:int = input.LA(1);

                    if ( (LA3_0==33||(LA3_0>=35 && LA3_0<=39)||(LA3_0>=42 && LA3_0<=90)||LA3_0==92||(LA3_0>=94 && LA3_0<=122)||LA3_0==124||LA3_0==126) ) {
                        alt3=1;
                    }


                    switch (alt3) {
                	case 1 :
                	    // src/org/ngs/as3units/format/UCUM.g:
                	    {
                	    if ( input.LA(1)==33||(input.LA(1)>=35 && input.LA(1)<=39)||(input.LA(1)>=42 && input.LA(1)<=90)||input.LA(1)==92||(input.LA(1)>=94 && input.LA(1)<=122)||input.LA(1)==124||input.LA(1)==126 ) {
                	        input.consume();

                	    }
                	    else {
                	        throw recover(new MismatchedSetException(null,input));
                	    }


                	    }
                	    break;

                	default :
                	    break loop3;
                    }
                } while (true);

                match(93); 

                }

            }
            finally {
            }
        }
        // $ANTLR end NOTE

        // $ANTLR start ATOM_ELT
        public final function mATOM_ELT():void {
            try {
                // src/org/ngs/as3units/format/UCUM.g:105:5: ( ( ATOM_CHAR )+ | NOTE )
                var alt5:int=2;
                var LA5_0:int = input.LA(1);

                if ( (LA5_0==33||(LA5_0>=35 && LA5_0<=39)||LA5_0==42||LA5_0==44||(LA5_0>=58 && LA5_0<=90)||LA5_0==92||(LA5_0>=94 && LA5_0<=122)||LA5_0==124||LA5_0==126) ) {
                    alt5=1;
                }
                else if ( (LA5_0==91) ) {
                    alt5=2;
                }
                else {
                    throw new NoViableAltException("", 5, 0, input);

                }
                switch (alt5) {
                    case 1 :
                        // src/org/ngs/as3units/format/UCUM.g:105:9: ( ATOM_CHAR )+
                        {
                        // src/org/ngs/as3units/format/UCUM.g:105:9: ( ATOM_CHAR )+
                        var cnt4:int=0;
                        loop4:
                        do {
                            var alt4:int=2;
                            var LA4_0:int = input.LA(1);

                            if ( (LA4_0==33||(LA4_0>=35 && LA4_0<=39)||LA4_0==42||LA4_0==44||(LA4_0>=58 && LA4_0<=90)||LA4_0==92||(LA4_0>=94 && LA4_0<=122)||LA4_0==124||LA4_0==126) ) {
                                alt4=1;
                            }


                            switch (alt4) {
                        	case 1 :
                        	    // src/org/ngs/as3units/format/UCUM.g:105:10: ATOM_CHAR
                        	    {
                        	    mATOM_CHAR(); 

                        	    }
                        	    break;

                        	default :
                        	    if ( cnt4 >= 1 ) break loop4;
                                    throw new EarlyExitException(4, input);

                            }
                            cnt4++;
                        } while (true);


                        }
                        break;
                    case 2 :
                        // src/org/ngs/as3units/format/UCUM.g:106:9: NOTE
                        {
                        mNOTE(); 

                        }
                        break;

                }
            }
            finally {
            }
        }
        // $ANTLR end ATOM_ELT

        // $ANTLR start ATOM
        public final function mATOM():void {
            try {
                var _type:int = ATOM;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // src/org/ngs/as3units/format/UCUM.g:108:5: ( ( ATOM_ELT )+ )
                // src/org/ngs/as3units/format/UCUM.g:108:9: ( ATOM_ELT )+
                {
                // src/org/ngs/as3units/format/UCUM.g:108:9: ( ATOM_ELT )+
                var cnt6:int=0;
                loop6:
                do {
                    var alt6:int=2;
                    var LA6_0:int = input.LA(1);

                    if ( (LA6_0==33||(LA6_0>=35 && LA6_0<=39)||LA6_0==42||LA6_0==44||(LA6_0>=58 && LA6_0<=92)||(LA6_0>=94 && LA6_0<=122)||LA6_0==124||LA6_0==126) ) {
                        alt6=1;
                    }


                    switch (alt6) {
                	case 1 :
                	    // src/org/ngs/as3units/format/UCUM.g:108:10: ATOM_ELT
                	    {
                	    mATOM_ELT(); 

                	    }
                	    break;

                	default :
                	    if ( cnt6 >= 1 ) break loop6;
                            throw new EarlyExitException(6, input);

                    }
                    cnt6++;
                } while (true);


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end ATOM

        public override function mTokens():void {
            // src/org/ngs/as3units/format/UCUM.g:1:8: ( DIGITS | SIGN | DIVIDE | TIMES | LPAREN | RPAREN | LBRACKET | ANN | ATOM )
            var alt7:int=9;
            switch ( input.LA(1) ) {
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
                {
                alt7=1;
                }
                break;
            case 43:
            case 45:
                {
                alt7=2;
                }
                break;
            case 47:
                {
                alt7=3;
                }
                break;
            case 46:
                {
                alt7=4;
                }
                break;
            case 40:
                {
                alt7=5;
                }
                break;
            case 41:
                {
                alt7=6;
                }
                break;
            case 93:
                {
                alt7=7;
                }
                break;
            case 123:
                {
                alt7=8;
                }
                break;
            case 33:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 42:
            case 44:
            case 58:
            case 59:
            case 60:
            case 61:
            case 62:
            case 63:
            case 64:
            case 65:
            case 66:
            case 67:
            case 68:
            case 69:
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
            case 75:
            case 76:
            case 77:
            case 78:
            case 79:
            case 80:
            case 81:
            case 82:
            case 83:
            case 84:
            case 85:
            case 86:
            case 87:
            case 88:
            case 89:
            case 90:
            case 91:
            case 92:
            case 94:
            case 95:
            case 96:
            case 97:
            case 98:
            case 99:
            case 100:
            case 101:
            case 102:
            case 103:
            case 104:
            case 105:
            case 106:
            case 107:
            case 108:
            case 109:
            case 110:
            case 111:
            case 112:
            case 113:
            case 114:
            case 115:
            case 116:
            case 117:
            case 118:
            case 119:
            case 120:
            case 121:
            case 122:
            case 124:
            case 126:
                {
                alt7=9;
                }
                break;
            default:
                throw new NoViableAltException("", 7, 0, input);

            }

            switch (alt7) {
                case 1 :
                    // src/org/ngs/as3units/format/UCUM.g:1:10: DIGITS
                    {
                    mDIGITS(); 

                    }
                    break;
                case 2 :
                    // src/org/ngs/as3units/format/UCUM.g:1:17: SIGN
                    {
                    mSIGN(); 

                    }
                    break;
                case 3 :
                    // src/org/ngs/as3units/format/UCUM.g:1:22: DIVIDE
                    {
                    mDIVIDE(); 

                    }
                    break;
                case 4 :
                    // src/org/ngs/as3units/format/UCUM.g:1:29: TIMES
                    {
                    mTIMES(); 

                    }
                    break;
                case 5 :
                    // src/org/ngs/as3units/format/UCUM.g:1:35: LPAREN
                    {
                    mLPAREN(); 

                    }
                    break;
                case 6 :
                    // src/org/ngs/as3units/format/UCUM.g:1:42: RPAREN
                    {
                    mRPAREN(); 

                    }
                    break;
                case 7 :
                    // src/org/ngs/as3units/format/UCUM.g:1:49: LBRACKET
                    {
                    mLBRACKET(); 

                    }
                    break;
                case 8 :
                    // src/org/ngs/as3units/format/UCUM.g:1:58: ANN
                    {
                    mANN(); 

                    }
                    break;
                case 9 :
                    // src/org/ngs/as3units/format/UCUM.g:1:62: ATOM
                    {
                    mATOM(); 

                    }
                    break;

            }

        }


     

    }
}