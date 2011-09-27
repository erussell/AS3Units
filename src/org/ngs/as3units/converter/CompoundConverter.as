package org.ngs.as3units.converter
{
    import org.ngs.as3units.UnitConverter;

    /**
     * This inner class represents a compound converter.
     */
    internal class CompoundConverter extends UnitConverterBase implements UnitConverter
    {   
        private const m_contents:Vector.<UnitConverter> = new Vector.<UnitConverter>();
        
        public function CompoundConverter (first:UnitConverter, second:UnitConverter) {
            m_contents.push(first);
            m_contents.push(second);
        }
        
        override public function isLinear () : Boolean {
            return m_contents[0].isLinear() && m_contents[1].isLinear();
        }
        
        override public function concatenate (converter:UnitConverter) : UnitConverter {
            if (converter is CompoundConverter) {
                var c:CompoundConverter = converter as CompoundConverter;
                if (m_contents[0].equals(c.m_contents[1].inverse()) && 
                    m_contents[1].equals(c.m_contents[0].inverse())) {
                    return IDENTITY;
                }
            }
            return super.concatenate(converter);
        }
        
        override public function getCompoundConverters () : Vector.<UnitConverter> {
            return m_contents.concat();
        }
        
        public function inverse () : UnitConverter {
            return new CompoundConverter(m_contents[1].inverse(), m_contents[0].inverse());
        }
        
        public function convert (value:Number) : Number {
            return m_contents[1].convert(m_contents[0].convert(value));
        }
        
        public function get hash () : String {
            return m_contents[0].hash + m_contents[1].hash;
        }
    }
}