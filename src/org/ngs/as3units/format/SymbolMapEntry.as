package org.ngs.as3units.format
{
    import org.ngs.as3units.Prefix;
    import org.ngs.as3units.Unit;

    public class SymbolMapEntry {
        
        private var m_prefix:Prefix;
        private var m_unit:Unit;
        
        public function SymbolMapEntry (prefix:Prefix, unit:Unit) {
            m_prefix = prefix;
            m_unit = unit;
        }
        
        public function get prefix () : Prefix {
            return m_prefix;
        }
        
        public function get unit () : Unit {
            return m_unit;
        }
    }
}