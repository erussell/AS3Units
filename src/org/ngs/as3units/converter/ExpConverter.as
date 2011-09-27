package org.ngs.as3units.converter
{
    import org.ngs.as3units.UnitConverter;
    
    public class ExpConverter extends LogConverterBase implements UnitConverter 
    {
        public function ExpConverter (base:Number) {
            super(base);
        }
        
        public function inverse () : UnitConverter {
            return new LogConverter(m_base);
        }
        
        public function convert (value:Number) : Number {
            return Math.exp(value * m_logOfBase);
        }
        
        public function get hash () : String {
            return "exp" + m_base;
        }
    }
}