package org.ngs.as3units.format
{
    public class SymbolNotFound extends Error
    {
        private var m_symbol:String;
        
        public function SymbolNotFound (symbol:String) {
            super("symbol not found " + symbol);
            m_symbol = symbol;
        }
        
        public function get symbol () : String {
            return m_symbol;
        }
    }
}
