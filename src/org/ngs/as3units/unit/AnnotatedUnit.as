package org.ngs.as3units.unit
{   
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;

    /** */
    public class AnnotatedUnit extends UnitBase implements Unit 
    {
        private var m_parent:Unit;
        
        private var m_annotation:String;
        
        public function AnnotatedUnit (delegate:UnitDelegate, parent:Unit, annotation:String) {
            super(delegate);
            m_parent = parent;
            m_annotation = annotation;
        }
        
        public function get parent () : Unit {
            return m_parent;
        }
        
        public function getAnnotation () : String {
            return m_annotation;
        }
        
        public function get systemUnit () : Unit {
            return m_parent.systemUnit;
        }
        
        public function toSystemUnit () : UnitConverter {
            return m_parent.toSystemUnit();
        }
        
        override public function get symbol() : String {
            return m_parent.symbol;
        }
        
        public function equals (that:Object) : Boolean {
            return (this == that) ||
                ((that is AnnotatedUnit) && AnnotatedUnit(that).m_parent.equals(this.m_parent)) ||
                (m_parent.equals(that));
        }
        
        public function get hash () : String {
            return m_parent.hash + "{" + m_annotation + "}";
        }
    }
}