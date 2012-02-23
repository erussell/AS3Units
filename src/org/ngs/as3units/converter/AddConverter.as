package org.ngs.as3units.converter
{   
    import org.ngs.as3units.UnitConverter;
    
    public final class AddConverter extends UnitConverterBase implements UnitConverter {
        
        /**
         * Holds the offset.
         */
        private var m_offset:Number;
        
        /**
         * Creates an add converter with the specified offset.
         *
         * @param  offset the offset value.
         * @throws IllegalArgumentException if offset is zero (or close to zero).
         */
        public function AddConverter (offset:Number) {
            if (offset == 0) {
                throw new ArgumentError("Identity converter not allowed");
            }
            m_offset = offset;
        }
        
        public function getOffset () : Number {
            return m_offset;
        }
        
        override public function isLinear () : Boolean {
            return false;
        }
        
        override public function concatenate (converter:UnitConverter) : UnitConverter {
            if (converter is AddConverter) {
                var offset:Number = m_offset + AddConverter(converter).m_offset;
                if (offset == 0) {
                    return IDENTITY;
                } else {
                    return new AddConverter(offset);
                }
            } else {
                return super.concatenate(converter);
            }
        }
        
        public function convert (value:Number) : Number {
            return value + m_offset;
        }
        
        public function inverse () : UnitConverter {
            return new AddConverter(-m_offset);
        }
        
        public function get hash () : String {
            return "+" + m_offset;
        }   
    }
}