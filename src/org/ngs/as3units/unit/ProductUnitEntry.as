package org.ngs.as3units.unit
{   
    import org.ngs.as3units.Unit;
    
    /** */
    public class ProductUnitEntry 
    {
        private var m_unit:Unit;
        private var m_exponent:int;
        
        public function get unit () : Unit {
            return m_unit;
        }
        
        public function get exponent () : int {
            return m_exponent;
        }
        
        public function ProductUnitEntry (unit:Unit, exponent:int=1) {
            m_unit = unit;
            m_exponent = exponent;
        }       
    }
}