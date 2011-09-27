package org.ngs.as3units.converter
{   
    import org.ngs.as3units.UnitConverter;
    
    public class UnitConverterBase
    {
        private static var s_identity:UnitConverter = null;
        
        public static function get IDENTITY () : UnitConverter {
            if (s_identity == null) {
                s_identity = new IdentityConverter();
            }
            return s_identity;
        }
        
        public function isIdentity () : Boolean {
            return false;
        }
        
        public function isLinear () : Boolean {
            return true;
        }
        
        public function concatenate (converter:UnitConverter) : UnitConverter {
            return converter.isIdentity() ? (this as UnitConverter) : new CompoundConverter(converter, this as UnitConverter);
        }
        
        public function getCompoundConverters () : Vector.<UnitConverter> {
            return null;
        }
        
        public function equals (cvtr:Object) : Boolean {
            if (!(cvtr is UnitConverter)) return false;
            return this.concatenate(UnitConverter(cvtr).inverse()) == IDENTITY;        
        }
    }
}