package org.ngs.as3units.converter
{   
    import org.ngs.as3units.UnitConverter;

    /**
     * <p> This class represents a converter multiplying numeric values by a 
     *     constant scaling factor (approximated as a <code>double</code>). 
     *     For exact scaling conversions {@link RationalConverter} is preferred.</p>
     *      
     * <p> Instances of this class are immutable.</p>
     */
    public final class MultiplyConverter extends UnitConverterBase implements UnitConverter
    {
        private var m_factor:Number;
        
        public function MultiplyConverter (factor:Number) {
            if (factor == 1)
                throw new ArgumentError("Identity converter not allowed");
            m_factor = factor;
        }
        
        public function getFactor() : Number {
            return m_factor;
        }
        
        override public function concatenate (converter:UnitConverter) : UnitConverter {
            if (converter is MultiplyConverter) {
                var factor:Number = m_factor * MultiplyConverter(converter).m_factor;
                if (factor == 1) {
                    return IDENTITY;
                } else {
                    return new MultiplyConverter(factor);
                }
            } else if (converter is RationalConverter) {
                factor = m_factor
                    * RationalConverter(converter).getDividend()
                    / RationalConverter(converter).getDivisor();
                if (factor == 1) {
                    return IDENTITY;
                } else {
                    return new MultiplyConverter(factor);
                }
            } else {
                return super.concatenate(converter);
            }
        }
        
        public function convert (value:Number) : Number {
            return value * m_factor;
        }
        
        public function inverse () : UnitConverter {
            return new MultiplyConverter(1 / m_factor);
        }
        
        public function get hash () : String {
            return "*" + m_factor;
        }
    }
}