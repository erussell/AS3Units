package org.ngs.as3units.unit
{
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.converter.UnitConverterBase;
    
    /** */
    public class TransformedUnit extends UnitBase implements Unit 
    {
        private var m_parent:Unit;
        
        private var m_toParent:UnitConverter;
        
        public function TransformedUnit (delegate:UnitDelegate, parent:Unit, toParent:UnitConverter) {
            super(delegate);
            if (toParent == UnitConverterBase.IDENTITY) {
                throw new ArgumentError("Identity not allowed");
            }
            m_parent = parent;
            m_toParent = toParent;
        }
        
        public function get parent () : Unit {
            return m_parent;
        }
        
        public function toParent () : UnitConverter {
            return m_toParent;
        }
        
        public function get systemUnit () : Unit {
            return m_parent.systemUnit;
        }
        
        public function toSystemUnit () : UnitConverter {
            return m_parent.toSystemUnit().concatenate(m_toParent);
        }
        
        public function equals (that:Object) : Boolean {
            return (this == that) ||
                ((that is TransformedUnit) &&
                    TransformedUnit(that).m_parent.equals(m_parent) &&
                    TransformedUnit(that).m_toParent.equals(m_toParent));
        }
        
        public function get hash () : String {
            return m_parent.hash +  m_toParent.hash; 
        }
    }
}