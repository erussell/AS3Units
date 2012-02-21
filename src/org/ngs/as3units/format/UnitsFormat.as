package org.ngs.as3units.format
{
    import org.antlr.runtime.ANTLRStringStream;
    import org.antlr.runtime.CommonTokenStream;
    import org.ngs.as3units.Prefix;
    import org.ngs.as3units.SI;
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.UnitFormat;
    import org.ngs.as3units.converter.AddConverter;
    import org.ngs.as3units.converter.ExpConverter;
    import org.ngs.as3units.converter.LogConverter;
    import org.ngs.as3units.converter.MultiplyConverter;
    import org.ngs.as3units.converter.RationalConverter;
    import org.ngs.as3units.unit.AlternateUnit;
    import org.ngs.as3units.unit.BaseUnit;
    import org.ngs.as3units.unit.ProductUnit;
    import org.ngs.as3units.unit.ProductUnitEntry;
    import org.ngs.as3units.unit.TransformedUnit;

    public class UnitsFormat implements UnitFormat
    {
        //////////////////////////////////////////////////////
        // Class variables                                  //
        //////////////////////////////////////////////////////
        
        /** Operator precedence for the addition and subtraction operations */
        public static const ADDITION_PRECEDENCE:int = 0;
        
        /** Operator precedence for the multiplication and division operations */
        public static const PRODUCT_PRECEDENCE:int = ADDITION_PRECEDENCE + 2;
        
        /** Operator precedence for the exponentiation and logarithm operations */
        public static const EXPONENT_PRECEDENCE:int = PRODUCT_PRECEDENCE + 2;
        
        /** 
         * Operator precedence for a unit identifier containing no mathematical 
         * operations (i.e., consisting exclusively of an identifier and possibly
         * a prefix). Defined to be <code>Integer.MAX_VALUE</code> so that no 
         * operator can have a higher precedence. 
         */
        public static const NOOP_PRECEDENCE:int = int.MAX_VALUE;
        
        ////////////////////////
        // Instance variables //
        ////////////////////////
        
        /** 
         * The symbol map used by this instance to map between 
         * {@link org.ngs.ngunits.Unit Unit}s and <code>String</code>s, etc... 
         */
        protected var m_symbolMap:SymbolMap;
        
        /**
         * Flag that determines whether non-ASCII Unicode characters may be used in
         * formatting units. Has no effect on parsing; Unicode characters are always 
         * accepted as input for parsing.
         */
        protected var m_asciiOnly:Boolean;
        
        /**
         * A map that determines what instance of {@link ConverterFormat} will be used 
         * to format instances of each subclass of 
         * {@link org.ngs.ngunits.UnitConverter UnitConverter} <b>other 
         * than those that are already defined by the javax.measure.converter package</b>, 
         * which will always use the default format.
         */
        protected const m_converterFormats:Object = {};
        
        //////////////////
        // Constructors //
        //////////////////
        
        /**
         * Base constructor.
         */
        public function UnitsFormat (symbolMap:SymbolMap) { 
            m_symbolMap = symbolMap;
            m_asciiOnly = false;
            var c:Object;
            c = AddConverter;
            m_converterFormats[c.toString()] = new AddConverterFormat();
            c = LogConverter;
            m_converterFormats[c.toString()] = new LogConverterFormat();
            c = ExpConverter;
            m_converterFormats[c.toString()] = new ExpConverterFormat();
            c = MultiplyConverter;
            m_converterFormats[c.toString()] = new MultiplyConverterFormat();
            c = RationalConverter;
            m_converterFormats[c.toString()] = new RationalConverterFormat();
        }
        
        ////////////////////////
        // Instance methods //
        ////////////////////////
        
        
        /** */
        public function get symbols () : SymbolMap {
            return m_symbolMap;
        }
        
        /** 
         * Get the symbol map used by this instance to map between 
         * {@link org.ngs.ngunits.Unit Unit}s and <code>String</code>s, etc... 
         * @return SymbolMap the current symbol map
         */
        public function getSymbols () : SymbolMap {
            return m_symbolMap;
        }
        
        /**
         * Set the symbol map used by this instance to map between 
         * {@link org.ngs.ngunits.Unit Unit}s and <code>String</code>s, etc... 
         * @param newSymbolMap SymbolMap the new symbol map
         */
        public function setSymbols (newSymbolMap:SymbolMap) : void {
            m_symbolMap = newSymbolMap;
        }
        
        /**
         * Get the value of the setting that determines whether non-ASCII Unicode 
         * characters may be used for formatting units. If the setting is true, only
         * ASCII characters will be used. The setting no effect on parsing; Unicode
         * characters are always accepted as input for parsing.
         * @return boolean
         */
        public function getAsciiOnly () : Boolean {
            return m_asciiOnly;
        }
        
        /**
         * Sets the value of the flag that determines whether non-ASCII Unicode 
         * characters may be used for formatting units. If the flag is set to 
         * </code>true</code>, only ASCII characters will be used. Has no effect
         * on parsing.
         * @param newAsciiOnly boolean the new flag setting
         */
        public function setAsciiOnly (newAsciiOnly:Boolean) : void {
            m_asciiOnly = newAsciiOnly;
        }
        
        /**
         * Designate a {@link ConverterFormat} to be used to format instances of a
         * given subclass of {@link org.ngs.ngunits.UnitConverter UnitConverter}.
         * @param c the subclass of <code>ConverterFormat</code> to be formatted
         * @param format the formatter
         */
        public function addConverterFormat (converterClass:Class, format:ConverterFormat) : void {
            m_converterFormats[Object(converterClass).toString()] = format;
        }
        
        ////////////////
        // Formatting //
        ////////////////
        
        public function format (unit:Unit) : String {
            var buffer:StringBuffer = new StringBuffer();
            formatInternal(unit, buffer);
            return buffer.toString();
        }
        
        /**
         * Format the given unit to the given StringBuffer, then return the operator
         * precedence of the outermost operator in the unit expression that was 
         * formatted. See {@link ConverterFormat} for the constants that define the
         * various precedence values.
         * @param unit the unit to be formatted
         * @param buffer the <code>StringBuffer</code> to be written to
         * @return the operator precedence of the outermost operator in the unit 
         *   expression that was output
         */
        protected function formatInternal (unit:Unit, buffer:StringBuffer) : int {
            var symbol:String = m_symbolMap.getUnitSymbol(unit);
            if (symbol != null) {
                buffer.append(symbol);
                return NOOP_PRECEDENCE;
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
                    if (start) {
                        buffer.append('1');
                    }
                    buffer.append('/');
                    if (negativeExponentCount > 1) {
                        buffer.append('(');
                    }
                    start = true;
                    for each (entry in components) {
                        if (entry.exponent < 0) {
                            formatExponent(entry.unit, -entry.exponent, !start, buffer);
                            start = false;
                        }
                    }
                    if (negativeExponentCount > 1) {
                        buffer.append(')');
                    }
                }
                return PRODUCT_PRECEDENCE;
            } else if ((unit is TransformedUnit) || unit.equals(SI.KILOGRAM)) {
                var converter:UnitConverter = null;
                var printSeparator:Boolean = false;
                var temp:StringBuffer = new StringBuffer();
                var unitPrecedence:int = NOOP_PRECEDENCE;
                if (unit.equals(SI.KILOGRAM)) {
                    // A special case because KILOGRAM is a BaseUnit instead of 
                    // a transformed unit, even though it has a prefix.
                    converter = Prefix.KILO.converter;
                    unitPrecedence = formatInternal(SI.GRAM, temp);
                    printSeparator = true;
                } else {
                    var transformedUnit:TransformedUnit = unit as TransformedUnit;
                    var parentUnit:Unit = transformedUnit.parent;
                    converter = transformedUnit.toParent();
                    if (parentUnit.equals(SI.KILOGRAM)) {
                        // More special-case hackery to work around gram/kilogram inconsistency
                        parentUnit = SI.GRAM;
                        converter = converter.concatenate(Prefix.KILO.converter);
                    }
                    unitPrecedence = formatInternal(parentUnit, temp);
                    printSeparator = !parentUnit.equals(SI.ONE);
                }
                var result:int = formatConverter(converter, printSeparator, unitPrecedence, temp);
                buffer.append(temp.toString());
                return result;
            } else if (unit is AlternateUnit) {
                buffer.append((unit as AlternateUnit).symbol);
                return NOOP_PRECEDENCE;
            } else if (unit is BaseUnit) {
                buffer.append((unit as BaseUnit).symbol);
                return NOOP_PRECEDENCE;
            } else {
                throw new Error("Cannot format the given Object as a Unit (unsupported unit type "+unit+")");
            }
        }
        
        /**
         * Format the given unit raised to the given power to the given <code>StringBuffer</code>.
         * @param unit Unit the unit to be formatted
         * @param pow int the exponent
         * @param continued boolean <code>true</code> if the converter expression 
         *    should begin with an operator, otherwise <code>false</code>. This will 
         *    always be true unless the unit being modified is equal to Unit.ONE.
         * @param buffer StringBuffer the buffer to append to. No assumptions should
         *    be made about its content.
         */
        protected function formatExponent (unit:Unit, pow:int, continued:Boolean, buffer:StringBuffer) : void {
            if (continued) {
                buffer.append(m_asciiOnly ? '*' : '\u00b7');
            }
            var temp:StringBuffer = new StringBuffer();
            var unitPrecedence:int = formatInternal(unit, temp);
            if (unitPrecedence < PRODUCT_PRECEDENCE) {
                temp.prepend('(');
                temp.append(')');
            }
            buffer.append(temp.toString());
            if (pow == 1) {
                // do nothing
            } else if ((pow > 1) && (!m_asciiOnly)) {
                var powStr:String = pow.toString();
                for (var i:int = 0; i < powStr.length; i += 1) {
                    var c:String = powStr.charAt(i);
                    switch (c) {
                        case '0': buffer.append('\u2070'); break;
                        case '1': buffer.append('\u00B9'); break;
                        case '2': buffer.append('\u00B2'); break;
                        case '3': buffer.append('\u00B3'); break;
                        case '4': buffer.append('\u2074'); break;
                        case '5': buffer.append('\u2075'); break;
                        case '6': buffer.append('\u2076'); break;
                        case '7': buffer.append('\u2077'); break;
                        case '8': buffer.append('\u2078'); break;
                        case '9': buffer.append('\u2079'); break;
                    }
                }
            } else {
                buffer.append("^");
                buffer.append(pow.toString());
            }
        }
        
        /**
         * Formats the given converter to the given StringBuffer and returns the
         * operator precedence of the converter's mathematical operation. This is
         * the default implementation, which supports all built-in UnitConverter
         * implementations. Note that it recursively calls itself in the case of 
         * a {@link org.ngs.ngunits.converter.AbstractUnitConverter.Compound Compound} 
         * converter.
         * @param converter the converter to be formatted
         * @param continued <code>true</code> if the converter expression should 
         *    begin with an operator, otherwise <code>false</code>.
         * @param unitPrecedence the operator precedence of the operation expressed
         *    by the unit being modified by the given converter.
         * @param buffer the <code>StringBuffer</code> to append to.
         * @return the operator precedence of the given UnitConverter
         */
        public function formatConverter (converter:UnitConverter, 
                                         continued:Boolean, 
                                         unitPrecedence:int, 
                                         buffer:StringBuffer) : int {
            var prefix:Prefix = m_symbolMap.getPrefix(converter);
            if ((prefix != null) && (unitPrecedence == NOOP_PRECEDENCE)) {
                buffer.prepend(m_symbolMap.getPrefixSymbol(prefix));
                return NOOP_PRECEDENCE;
            }
            var compound:Vector.<UnitConverter> = converter.getCompoundConverters();
            if (compound != null) {
                for each (var entry:UnitConverter in compound.reverse()) {
                    unitPrecedence = formatConverter(entry, continued, unitPrecedence, buffer);
                }
                return unitPrecedence;
            }
            var format:ConverterFormat = m_converterFormats[Object(converter).constructor.toString()];
            if (format != null) {
                return format.formatConverter(converter, continued, unitPrecedence, buffer, m_asciiOnly);
            }
            throw new Error("Unable to format converter: " + converter);
        }
        
        /////////////
        // Parsing //
        /////////////
        
        public function parse (source:String) : Unit {
            if ((source == null) || (source.length == 0)) {
                throw new Error("empty units");
            }
            var lexer:UnitsLexer = new UnitsLexer(new ANTLRStringStream(source));
            var tokens:CommonTokenStream = new CommonTokenStream(lexer);
            var parser:UnitsParser = new UnitsParser(tokens);
            parser.symbols = m_symbolMap;
            return parser.unit();
        }
    }
}

import org.ngs.as3units.UnitConverter;
import org.ngs.as3units.converter.AddConverter;
import org.ngs.as3units.converter.ExpConverter;
import org.ngs.as3units.converter.LogConverter;
import org.ngs.as3units.converter.MultiplyConverter;
import org.ngs.as3units.converter.RationalConverter;
import org.ngs.as3units.format.ConverterFormat;
import org.ngs.as3units.format.StringBuffer;
import org.ngs.as3units.format.UnitsFormat;
        
internal class AddConverterFormat implements ConverterFormat 
{
    public function formatConverter (converter:UnitConverter, 
                                     continued:Boolean, 
                                     unitPrecedence:int, 
                                     buffer:StringBuffer,
                                     ascii:Boolean) : int {
        if (unitPrecedence < UnitsFormat.ADDITION_PRECEDENCE) {
            buffer.prepend('(');
            buffer.append(')');
        }
        var offset:Number = (converter as AddConverter).getOffset();
        if (offset < 0) {
            buffer.append("-");
            offset = -offset;
        } else if (continued) {
            buffer.append("+");
        }
        buffer.append(offset.toString());
        return UnitsFormat.ADDITION_PRECEDENCE;
    }
}

internal class LogConverterFormat implements ConverterFormat 
{
    public function formatConverter (converter:UnitConverter, 
                                     continued:Boolean, 
                                     unitPrecedence:int, 
                                     buffer:StringBuffer,
                                     ascii:Boolean) : int {
        var base:Number = (converter as LogConverter).getBase();
        var expr:StringBuffer = new StringBuffer();
        if (base == Math.E) {
            expr.append("ln");
        } else {
            expr.append("log");
            if (base != 10) {
                expr.append(int(base).toString());
            }
        }
        expr.append("(");
        buffer.prepend(expr.toString());
        buffer.append(")");
        return UnitsFormat.EXPONENT_PRECEDENCE;
    }
}


internal class ExpConverterFormat implements ConverterFormat 
{
    public function formatConverter (converter:UnitConverter, 
                                     continued:Boolean, 
                                     unitPrecedence:int, 
                                     buffer:StringBuffer,
                                     ascii:Boolean) : int {
        if (unitPrecedence < UnitsFormat.EXPONENT_PRECEDENCE) {
            buffer.prepend('(');
            buffer.append(')');
        }
        var base:Number = (converter as ExpConverter).getBase();
        var expr:StringBuffer = new StringBuffer();
        if (base == Math.E) {
            expr.append('e');
        } else {
            expr.append(int(base).toString());
        }
        expr.append('^');
        buffer.prepend(expr.toString());
        return UnitsFormat.EXPONENT_PRECEDENCE;
    }
}



internal class MultiplyConverterFormat implements ConverterFormat 
{
    public function formatConverter (converter:UnitConverter, 
                                     continued:Boolean, 
                                     unitPrecedence:int, 
                                     buffer:StringBuffer,
                                     ascii:Boolean) : int {
            if (unitPrecedence < UnitsFormat.PRODUCT_PRECEDENCE) {
                buffer.prepend('(');
                buffer.append(')');
            }
            if (continued) {
                buffer.append(ascii ? '*' : '\u00b7');
            }
            var factor:Number = (converter as MultiplyConverter).getFactor();
            buffer.append(factor.toString());
            return UnitsFormat.PRODUCT_PRECEDENCE;
        }
}

internal class RationalConverterFormat implements ConverterFormat 
{
    public function formatConverter (converter:UnitConverter, 
                                     continued:Boolean, 
                                     unitPrecedence:int, 
                                     buffer:StringBuffer,
                                     ascii:Boolean) : int {
            if (unitPrecedence < UnitsFormat.PRODUCT_PRECEDENCE) {
                buffer.prepend('(');
                buffer.append(')');
            }
            var rationalConverter:RationalConverter = converter as RationalConverter;
            if (rationalConverter.getDividend() != 1) {
                if (continued) {
                    buffer.append(ascii ? '*' : '\u00b7');
                }
                buffer.append(rationalConverter.getDividend().toString());
            }
            if (rationalConverter.getDivisor() != 1) {
                buffer.append('/');
                buffer.append(rationalConverter.getDivisor().toString());
            }
            return UnitsFormat.PRODUCT_PRECEDENCE;
        }
}