package org.ngs.as3units.converter
{
    import org.ngs.as3units.UnitConverter;

    /**
     * This inner class represents the identity converter (singleton).
     */
    public class IdentityConverter extends UnitConverterBase implements UnitConverter 
    {
        override public function isIdentity () : Boolean {
            return true;
        }
        
        override public function concatenate (converter:UnitConverter) : UnitConverter {
            return converter;
        }
        
        public function inverse () : UnitConverter {
            return this;
        }
        
        public function convert (value:Number) : Number {
            return value;
        }
        
        override public function equals (that:Object) : Boolean {
            return (that is UnitConverter) && UnitConverter(that).isIdentity();
        }
        
        public function get hash () : String {
            return "*1";
        }
    }
}