package org.ngs.as3units.format {
    
    import org.ngs.as3units.Prefix;
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    
    public class SymbolMap {
        
        private var m_symbolToUnit:Object = {};
        private var m_unitToSymbol:Object = {};
        private var m_symbolToPrefix:Object = {};
        private var m_prefixToSymbol:Object = {};
        private var m_converterToPrefix:Object = {};
        
        public function lu (unit:Unit, symbol:String) : void {
            m_symbolToUnit[symbol] = unit;
            var unitHash:String = unit.hash;
            if (!m_unitToSymbol.hasOwnProperty(unitHash)) {
                m_unitToSymbol[unitHash] = symbol;
            }
        }
        
        public function au (unit:Unit, symbol:String) : void { 
            m_symbolToUnit[symbol] = unit;
        }
        
        public function lp (prefix:Prefix, symbol:String) : void {
            m_symbolToPrefix[symbol] = prefix;
            m_prefixToSymbol[prefix.converter.hash] = symbol;
            m_converterToPrefix[prefix.converter.hash] = prefix;
        }
        
        public function lookup (symbol:String) : SymbolMapEntry {
            var u:Unit = m_symbolToUnit[symbol];
            if (u != null) {
                return new SymbolMapEntry(null, u);
            }
            for (var prefix:String in m_symbolToPrefix) {
                if (symbol.indexOf(prefix) == 0) {
                    u = m_symbolToUnit[symbol.substr(prefix.length)];
                    if (u != null) {
                        return new SymbolMapEntry(m_symbolToPrefix[prefix], u);
                    }
                }
            }
            return null;
        }
        
        public function getUnitSymbol (unit:Unit) : String {
            return m_unitToSymbol[unit.hash] || null;
        }
        
        public function getPrefix (converter:UnitConverter) : Prefix {
            return m_converterToPrefix[converter.hash] || null;
        }
        
        public function getPrefixSymbol (prefix:Prefix) : String {
            return m_prefixToSymbol[prefix.converter.hash] || null;
        }
    }
}