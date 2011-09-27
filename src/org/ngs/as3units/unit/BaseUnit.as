package org.ngs.as3units.unit
{   
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.converter.UnitConverterBase;
    
    /** */
    public class BaseUnit extends UnitBase implements Unit {
        
        private var m_symbol:String;
        
        public function BaseUnit (delegate:UnitDelegate, symbol:String) {
            super(delegate);
            delegate.putSymbol(this, symbol);
            m_symbol = symbol;
        }
        
        public function get systemUnit () : Unit{
            return this;
        }
        
        public function toSystemUnit () : UnitConverter{
            return UnitConverterBase.IDENTITY;
        }
        
        override public function get symbol() : String {
            return m_symbol;
        }
        
        public function equals (that:Object) : Boolean {
            return (this == that) ||
                ((that is BaseUnit) && (BaseUnit(that).m_symbol == this.m_symbol)); 
        }
        
        public function get hash () : String {
            return m_symbol;
        }
    }
}
