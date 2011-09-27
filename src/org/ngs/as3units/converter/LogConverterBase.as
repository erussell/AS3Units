package org.ngs.as3units.converter
{   
    import org.ngs.as3units.UnitConverter;
    
    /**
     * <p> This class represents a exponential converter of limited precision.
     *     Such converter  is typically used to create inverse of logarithmic unit.
     *
     * <p> Instances of this class are immutable.</p>
     */
    internal class LogConverterBase extends UnitConverterBase 
    {
        protected var m_base:Number;
        
        protected var m_logOfBase:Number;
        
        public function LogConverterBase (base:Number) {
            m_base = base;
            m_logOfBase = Math.log(base);
        }
        
        public function getBase () : Number {
            return m_base;
        }
        
        override public function isLinear () : Boolean {
            return false;
        }
        
    }
}