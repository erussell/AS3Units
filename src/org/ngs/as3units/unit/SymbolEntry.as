package org.ngs.as3units.unit
{   
    import org.ngs.as3units.Unit;
    
    /** */
    public class SymbolEntry 
    {
        private var m_unit:Unit;
        private var m_symbol:String;
        
        public function get unit () : Unit {
            return m_unit;
        }
        
        public function get symbol () : String {
            return m_symbol;
        }
        
        public function SymbolEntry (unit:Unit, symbol:String) {
            m_unit = unit;
            m_symbol = symbol;
        }
    }
}