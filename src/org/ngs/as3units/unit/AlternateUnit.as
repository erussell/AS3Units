package org.ngs.as3units.unit
{
    import flash.errors.IllegalOperationError;
    
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.converter.UnitConverterBase;
    
    /** */
    public class AlternateUnit extends UnitBase implements Unit {
        
        private var m_parent:Unit;
        
        private var m_symbol:String;
        
        public function AlternateUnit (delegate:UnitDelegate, parent:Unit, symbol:String) {
            super(delegate);
            if (parent.systemUnit != parent) {
                throw new IllegalOperationError(parent + " is not a standard unit");
            }
            m_parent = parent;
            m_symbol = symbol;
            delegate.putSymbol(this, symbol);
        }
        
        public function get parent () : Unit {
            return m_parent;
        }
        
        public function get systemUnit () : Unit {
            return this;
        }
        
        public function toSystemUnit () : UnitConverter {
            return UnitConverterBase.IDENTITY;
        }
        
        override public function get symbol () : String {
            return m_symbol;
        }
        
        public function equals (that:Object) : Boolean {
            return (this == that) ||
                ((that is AlternateUnit) && (AlternateUnit(that).m_symbol == this.m_symbol));
        }
        
        public function get hash () : String {
            return m_symbol;
        }
    }
}