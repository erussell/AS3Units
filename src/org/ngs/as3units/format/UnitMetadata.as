package org.ngs.as3units.format
{
    import org.ngs.as3units.Unit;
    
    /**
     * The UnitMetadata class provides a set of mappings between 
     * {@link org.ngs.ngunits.Unit Units} and extended descriptions
     * and {@link org.ngs.ngunits.quantity.Quantity Quantities} for those
     * units, so that the descriptions and quantity names may be localized.
     * <p>
     * TODO: Document the individual fields and methods
     */
    public class UnitMetadata {
        
        private var m_metadata:Object;
        
        public function UnitMetadata () {
            m_metadata = {};
        }
        
        public function getProperty (unit:Unit, property:String) : String {
            var unitProperties:Object = m_metadata[unit.hash];
            return unitProperties ? unitProperties[property.toUpperCase()] : null;
        }
        
        /** */
        public function putProperty (unit:Unit, property:String, value:String) : void {
            var unitProperties:Object = m_metadata[unit.hash];
            if (!unitProperties) unitProperties = {};
            unitProperties[property.toUpperCase()] = value;
            m_metadata[unit.hash] = unitProperties;
        }
        
        /** */
        public function getProperties (unit:Unit) : Object {
            var result:Object = {};
            var unitProperties:Object = m_metadata[unit.hash];
            if (unitProperties) {
                for (var property:String in unitProperties) {
                    result[property] = unitProperties[property];
                }
            }
            return result;
        }
    }
}
