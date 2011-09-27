package org.ngs.as3units.format
{
    import org.antlr.runtime.ANTLRStringStream;
    import org.antlr.runtime.CommonTokenStream;
    import org.ngs.as3units.Prefix;
    import org.ngs.as3units.SI;
    import org.ngs.as3units.UCUM;
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.UnitFormat;
    import org.ngs.as3units.converter.MultiplyConverter;
    import org.ngs.as3units.converter.RationalConverter;
    import org.ngs.as3units.converter.UnitConverterBase;
    import org.ngs.as3units.unit.AnnotatedUnit;
    import org.ngs.as3units.unit.ProductUnit;
    import org.ngs.as3units.unit.ProductUnitEntry;
    import org.ngs.as3units.unit.TransformedUnit;

    public class UCUMFormat implements UnitFormat
    {
        public static function parseBaseUnit (name:String) : Unit {
            return null;
        }
        
        /** Instance for formatting using "print" symbols */
        private static var PRINT_INSTANCE:UCUMFormat = new UCUMFormat(new UCUMPrintSymbols(), false);
        
        /** Instance for formatting and parsing using "c/s" symbols */
        private static var CS_INSTANCE:UCUMFormat = new UCUMFormat(new UCUMCaseSensitiveSymbols(), true, true);
        
        /** Instance for formatting and parsing using "c/i" symbols */
        private static var CI_INSTANCE:UCUMFormat = new UCUMFormat(new UCUMCaseInsensitiveSymbols(), true, false);
        
        /** Returns the instance for formatting using "print" symbols */
        public static function getPrintInstance () : UCUMFormat {
            return PRINT_INSTANCE;
        }
        
        /** Returns the instance for formatting and parsing using "c/s" symbols */
        public static function getCaseSensitiveInstance () : UCUMFormat {
            return CS_INSTANCE;
        }
        
        /** Returns the instance for formatting and parsing using "c/i" symbols */
        public static function getCaseInsensitiveInstance () : UCUMFormat {
            return CI_INSTANCE;
        }
            
        ////////////////////////
        // Instance variables //
        ////////////////////////
        
        private var m_symbolMap:SymbolMap;
        private var m_parsingEnabled:Boolean;
        private var m_caseSensitive:Boolean;
        
        public function get symbols () : SymbolMap {
            return m_symbolMap;
        }
        
        //////////////////
        // Constructors //
        //////////////////
        
        /**
         * Base constructor.
         */
        public function UCUMFormat (symbolMap:SymbolMap, 
                                       parsingEnabled:Boolean=false, 
                                       caseSensitive:Boolean=false) {
            m_symbolMap = symbolMap;
            m_parsingEnabled = parsingEnabled;
            m_caseSensitive = caseSensitive;
        }
        
        ////////////////
        // Formatting //
        ////////////////
        
        public function format (unit:Unit) : String {
            var buffer:StringBuffer = new StringBuffer();
            formatInternal(unit, buffer);
            return buffer.toString();
        }
        
        private function formatInternal (unit:Unit, buffer:StringBuffer) : void {
            var symbol:String = m_symbolMap.getUnitSymbol(unit);
            if (symbol != null) {
                buffer.append(symbol);
            } else if (unit is ProductUnit) {
                var components:Vector.<ProductUnitEntry> = unit.productUnits;
                var negativeExponentCount:int = 0;
                var start:Boolean = true;
                // Write positive exponents first...
                for each (var entry:ProductUnitEntry in components) {
                    if (entry.exponent < 0) {
                        negativeExponentCount += 1;
                    } else {
                        formatExponent(entry.unit, entry.exponent, !start, buffer);
                        start = false;
                    }
                }
                // ..then write negative exponents (if any).
                if (negativeExponentCount > 0) {
                    for each (entry in components) {
                        if (entry.exponent < 0) {
                            formatExponent(entry.unit, entry.exponent, !start, buffer);
                            start = false;
                        }
                    }
                }
            } else if ((unit is TransformedUnit) || unit.equals(SI.KILOGRAM)) {
                var temp:StringBuffer = new StringBuffer();
                var converter:UnitConverter;
                var printSeparator:Boolean;
                if (unit.equals(SI.KILOGRAM)) {
                    // A special case because KILOGRAM is a BaseUnit instead of 
                    // a transformed unit, for compatability with existing SI 
                    // unit system.
                    temp.append(format(UCUM.GRAM));
                    converter = Prefix.KILO.converter;
                    printSeparator = true;
                } else {
                    var transformedUnit:TransformedUnit = unit as TransformedUnit;
                    var parentUnit:Unit = transformedUnit.parent;
                    converter = transformedUnit.toParent();
                    if (parentUnit.equals(SI.KILOGRAM)) {
                        // More special-case hackery to work around gram/kilogram incosistency
                        parentUnit = UCUM.GRAM;
                        converter = converter.concatenate(Prefix.KILO.converter);
                    }
                    temp.append(format(parentUnit));
                    printSeparator = !parentUnit.equals(UCUM.ONE);
                }
                formatConverter(converter, printSeparator, temp);
                buffer.append(temp.toString());
            } else if (unit is AnnotatedUnit) {
                var au:AnnotatedUnit = unit as AnnotatedUnit;
                formatInternal(au.parent, buffer);
                buffer.append('{');
                buffer.append(au.getAnnotation());
                buffer.append('}');
            } else {
                throw new Error("Cannot format the given Object as UCUM units (unsupported unit type "+unit.hash+")");
            } 
        }
        
        protected function formatExponent (unit:Unit, pow:int, continued:Boolean, buffer:StringBuffer) : void {
            if (pow < 0) {
                buffer.append('/');
            } else if (continued) {
                buffer.append('.');
            }
            var temp:StringBuffer = new StringBuffer();
            formatInternal(unit, temp);
            if ((temp.indexOf(".") >= 0) || (temp.indexOf("/") >= 0)) {
                temp.prepend('(');
                temp.append(')');
            }
            buffer.append(temp.toString());
            if (Math.abs(pow) != 1) {
                buffer.append(Math.abs(pow).toString());
            }
        }
        
        /**
         * Formats the given converter to the given StringBuffer. This is similar
         * to what {@link ConverterFormat} does, but there's no need to worry about
         * operator precedence here, since UCUM only supports multiplication, 
         * division, and exponentiation and expressions are always evaluated left-
         * to-right.
         * @param converter the converter to be formatted
         * @param continued <code>true</code> if the converter expression should 
         *    begin with an operator, otherwise <code>false</code>. This will always 
         *    be true unless the unit being modified is equal to Unit.ONE.
         * @param buffer the <code>StringBuffer</code> to append to. Contains the
         *    already-formatted unit being modified by the given converter.
         */
        protected function formatConverter (converter:UnitConverter, continued:Boolean, buffer:StringBuffer) : void {
            var unitIsExpression:Boolean = ((buffer.indexOf(".") >= 0) || (buffer.indexOf("/") >= 0));
            var prefix:Prefix = m_symbolMap.getPrefix(converter);
            if ((prefix != null) && (!unitIsExpression)) {
                buffer.prepend(m_symbolMap.getPrefixSymbol(prefix));
            } else if (converter == UnitConverterBase.IDENTITY) {
                // do nothing
            } else if (converter is MultiplyConverter) {
                if (unitIsExpression) {
                    buffer.prepend('(');
                    buffer.append(')');
                }
                var multiplyConverter:MultiplyConverter = converter as MultiplyConverter;
                var factor:Number = multiplyConverter.getFactor();
                var iFactor:int = int(factor);
                if ((iFactor != factor) || (factor < -9007199254740992) || (factor > 9007199254740992)) {
                    throw new Error("Only integer factors are supported in UCUM");
                }
                if (continued) {
                    buffer.append('.');
                }
                buffer.append(iFactor.toString());
            } else if (converter is RationalConverter) {
                if (unitIsExpression) {
                    buffer.prepend('(');
                    buffer.append(')');
                }
                var rationalConverter:RationalConverter = converter as RationalConverter;
                if (rationalConverter.getDividend() != 1) {
                    if (continued) {
                        buffer.append('.');
                    }
                    buffer.append(rationalConverter.getDividend().toString());
                }
                if (rationalConverter.getDivisor() != 1) {
                    buffer.append('/');
                    buffer.append(rationalConverter.getDivisor().toString());
                }
            } else {
                throw new Error("Unable to format units in UCUM (unsupported UnitConverter "+converter+")");
            }
        }
        
        ////////////////
        // Parsing //
        ////////////////
        
        public function parse (source:String) : Unit {
            if (!m_parsingEnabled) {
                throw new Error("Parsing not enabled for this formatter");
            }
            if (!m_caseSensitive) {
                source = source.toUpperCase();
            }
            if ((source == null) || (source.length == 0)) {
                throw new Error("empty units");
            }
            var lexer:UCUMLexer = new UCUMLexer(new ANTLRStringStream(source));
            var tokens:CommonTokenStream = new CommonTokenStream(lexer);
            var parser:UCUMParser = new UCUMParser(tokens);
            parser.symbols = m_symbolMap;
            return parser.unit();
        }
        
        /////////////
        // Testing //
        /////////////
        
        /** */
        private static function test (input:String) : void {
            var formats:Boolean = false;
            var formatted:String = "";
            var u:Unit = CS_INSTANCE.parse(input);
            formatted = CS_INSTANCE.format(u);
            formats = formatted == input;
            trace(input + " " + formats + (formats ? "" : " ("+formatted+")"));
        }
        
        public static function main (args:Array) : void {
            
            var foo:Unit = UCUM.FOOT_INTERNATIONAL.scale(3);
            
            // A bunch of definition units from the UCUM standard to use for testing 
            var strs:Array = [ "rad2", "s-1", "kg.m/s2", "N/m2", "N.m", "J/s", "C/s", 
                "J/C", "C/V", "V/A", "Ohm-1", "V.s", "Wb/m2", "Wb/A", 
                "cd.sr", "lm/m2", "s-1", "J/kg", "J/kg", "deg", 
                "[pi].rad/360", "deg/60", "'/60", "dm3", "m2", 
                "a_j/12", "a_g/12", "kg", "[e].V", "Mm", "m/s", "J.s", 
                "J/K", "F/m", "m3.kg-1/s2", "m/s2", "[c].a_j", 
                "g.[g]", "[lb_av].[g]", "cm-1{salt}", "cm/s2", "g.cm/s2", 
                "dyn.cm", "dyn.s/cm2", "cm2/s", "/[pi].A/m", "Oe.cm", 
                "cd/cm2", "cd/cm2/[pi]", "lx", "Bq", "C/kg", "erg/g", 
                "RAD", "cm", "[nmi_i]/h", "[in_i]2", "[ft_i]2", 
                "[yd_i]2", "[in_i]3", "[ft_i]3", "[yd_i]3", "[in_i]3", 
                "[ft_i]3", "[pi]/4.[mil_i]2", "m/3937", "[ft_us]/12", 
                "[ch_us]/100", "[rch_us]/100", "[rd_us]2", "[rd_us]2", 
                "[mi_us]2", "[mi_us]2", "cm", "[ch_br]/100", 
                "[nmi_br]/h", "[yd_br]2", "[in_i]3", "[gal_us]/4", 
                "[qt_us]/2", "[pt_us]/4", "[gil_us]/4", "[foz_us]/8", 
                "[fdr_us]/60", "[ft_i]3", "[in_i]3", "[bu_us]/8", 
                "[bu_us]/4", "[pk_us]/8", "[dqt_us]/2", "[foz_us]/2", 
                "[tbs_us]/3", "[gal_br]/4", "[qt_br]/2", "[pt_br]/4", 
                "[gil_br]/5", "[foz_br]/8", "[fdr_br]/60", "mg", 
                "[lb_av]/16", "[oz_av]/16", "[in_i]/12", "[lne]/6", 
                "[pied]/12", "[pouce]/12", "[ligne]/6", "[didot]", 
                "[Btu_th]", "[ft_i].[lbf_av]/s", "kPa", "kPa", "/m", 
                "/[in_i]", "mm/[pi]","ml/12", "mL/min/kg", "g/dl", 
                "mol/s", "umol/min", "m3", "nm", "fm2", "kgf/cm2", 
                "S", "[lbf_av]/[in_i]2", "[pi].rad", "[pi].sr", "/24", 
                "/s", "1/s", "" ];
            for (var i:int = 0; i < strs.length; i += 1) {
                test(strs[i]);
                //test("cm-1{salt}");
                //System.out.println(CS_INSTANCE.format(CS_INSTANCE.parseObject(test[i])));
            }
        }
    }
}

internal class StringBuffer 
{
    private var m_buffer:String;
    
    public function StringBuffer () {
        m_buffer = "";
    }
    
    public function toString () : String {
        return m_buffer;
    }
    
    public function indexOf (value:String) : int {
        return m_buffer.indexOf(value);
    }
    
    public function prepend (value:String) : void {
        m_buffer = value + m_buffer;
    }
    
    public function append (value:String) : void {
        m_buffer += value;
    }
}
    
    