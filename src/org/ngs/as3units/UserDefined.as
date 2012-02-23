package org.ngs.as3units
{
    import org.ngs.as3units.format.UnitsFormat;

    public class UserDefined extends SystemOfUnits
    {
        private static var s_format:UnitFormat = null;
        
        public static function get FORMAT () : UnitFormat {
            if (s_format == null) {
                s_format = new UnitsFormat(new UserSymbolMap());
            }
            return s_format;
        } 
        
        public static function get ONE () : Unit {
            return DELEGATE.ONE;
        }
        
        public static function isDefinitionEnabled () : Boolean { 
            return UserSymbolMap(FORMAT.symbols).definitionEnabled;
        }
        
        public static function setDefinitionEnabled (newValue:Boolean) : void {
            UserSymbolMap(FORMAT.symbols).definitionEnabled = newValue;
        }
    }
}

import mx.utils.RPCStringUtil;

import org.ngs.as3units.Unit;
import org.ngs.as3units.UserDefined;
import org.ngs.as3units.format.DefaultUnitSymbols;
import org.ngs.as3units.format.SymbolMapEntry;

internal class UserSymbolMap extends DefaultUnitSymbols 
{
    private static const RESERVED_CHARS:RegExp = /[\u0000-\u001F\(\)\*\+\-\.\/0-9:\\^\u00B2\u00B3\u00B7\u00B9\u2070\u2074-\u2079]/
    
    private var m_symbolToUnit:Object = {};
    private var m_unitToSymbol:Object = {};
    public var definitionEnabled:Boolean = true;
    
    public function UserSymbolMap () {
        super();
    }
    
    override public function lookup (symbol:String) : SymbolMapEntry {
        var result:SymbolMapEntry = super.lookup(symbol);
        if (result == null) {
            var validatedSymbol:String = makeValidUnitName(symbol);
            if (validatedSymbol == null) {
                return null;
            } else if (validatedSymbol != symbol) {
                return lookup(validatedSymbol);
            } else {
                var userUnit:Unit = m_symbolToUnit[symbol];
                if ((userUnit == null) && definitionEnabled) {
                    userUnit = UserDefined.ONE.alternate(symbol);
                    m_symbolToUnit[symbol] = userUnit;
                    m_unitToSymbol[userUnit.hash] = symbol;
                }
                if (userUnit != null) {
                    return new SymbolMapEntry(null, userUnit);
                } else {
                    return null;
                }
            }
        } else {
            return result;
        }
    }
    
    override public function getUnitSymbol (unit:Unit) : String {
        var result:String = super.getUnitSymbol(unit);
        if (result != null) {
            return result;
        } else {
            return m_unitToSymbol[unit.hash] || null;
        }
    }
    
    private static function makeValidUnitName (name:String) : String {
        var result:String = "";
        var hasValidNonWhitespaceChar:Boolean = false;
        for (var i:int = 0; i < name.length; i += 1) {
            if (!RESERVED_CHARS.test(name.substring(i,i+1))) {
                var c:String = name.charAt(i);
                if (RPCStringUtil.isWhitespace(c)) {
                    result += '_';
                } else {
                    result += c;
                    hasValidNonWhitespaceChar = true;
                }
            }    
        }
        return hasValidNonWhitespaceChar ? result : null;
    }
}
