package org.ngs.as3units
{
    public class UnconvertibleError extends Error
    {
        private var m_fromUnit:Unit;
        
        /** */
        private var m_toUnit:Unit;
        
        /**
         * Constructs a <code>UnconvertibleException</code> with the specified
         * detail message.
         *
         * @param message the detail message.
         */
        public function UnconvertibleError (message:String, from:Unit, to:Unit) {
            super(message);
            m_fromUnit = from;
            m_toUnit = to;
        }
        
        /** */
        public function getFromUnit () : Unit {
            return m_fromUnit;
        }
        
        /** */
        public function getToUnit () : Unit {
            return m_toUnit;
        }
    }
}