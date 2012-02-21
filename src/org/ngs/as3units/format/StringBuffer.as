package org.ngs.as3units.format
{
    public class StringBuffer 
    {
        private var m_buffer:String;
        
        public function StringBuffer () {
            m_buffer = "";
        }
        
        public function toString () : String {
            return m_buffer;
        }
        
        public function indexOf (value:String) : int {
            return m_buffer.indexOf(value);
        }
        
        public function prepend (value:String) : void {
            m_buffer = value + m_buffer;
        }
        
        public function append (value:String) : void {
            m_buffer += value;
        }
    }
}
