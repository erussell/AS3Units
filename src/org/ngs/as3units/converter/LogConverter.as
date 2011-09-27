package org.ngs.as3units.converter
{
    import org.ngs.as3units.UnitConverter;

    public class LogConverter extends LogConverterBase implements UnitConverter 
    {
        public function LogConverter (base:Number) {
            super(base);
        }
        
        public function inverse () : UnitConverter {
            return new ExpConverter(m_base);
        }
        
        public function convert (value:Number) : Number {
            return Math.log(value) / m_logOfBase;
        }
        
        public function get hash () : String {
            return "log" + m_base;
        }
    }
}