package org.ngs.as3units.unit
{
    import org.ngs.as3units.UnconvertibleError;
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.converter.UnitConverterBase;
    
    /** */
    public class ProductUnit extends UnitBase implements Unit 
    {
        private var m_entries:Vector.<ProductUnitEntry>;
        
        function ProductUnit (delegate:UnitDelegate, entries:Vector.<ProductUnitEntry>) {
            super(delegate);
            m_entries = entries;
        }
        
        public function get systemUnit () : Unit {
            if (hasOnlySystemUnits()) {
                return this;
            } else {
                var result:Unit = delegate.ONE;
                for each (var entry:ProductUnitEntry in m_entries) {
                    result = result.multiply(entry.unit.systemUnit.pow(entry.exponent));
                }
                return result;
            }
        }
        
        public function toSystemUnit () : UnitConverter {
            if (hasOnlySystemUnits()) {
                return UnitConverterBase.IDENTITY;
            } else {
                var result:UnitConverter = UnitConverterBase.IDENTITY;
                for each (var entry:ProductUnitEntry in m_entries) {
                    var converter:UnitConverter = entry.unit.toSystemUnit();
                    if (!converter.isLinear()) {
                        throw new UnconvertibleError("unit is non-linear, cannot convert", 
                            entry.unit,
                            entry.unit.systemUnit);
                    }
                    var pow:int = entry.exponent;
                    if (pow < 0) {
                        pow = -pow;
                        converter = converter.inverse();
                    }
                    for (var i:int = 0; i < pow; i += 1) {
                        result = result.concatenate(converter);
                    }
                }
                return result;
            }
        }
        
        override public function get productUnits () : Vector.<ProductUnitEntry> {
            return m_entries.concat();
        }
        
        public function equals (that:Object) : Boolean {
            if (this == that) {
                return true;
            } else if (that is ProductUnit) {
                var otherEntries:Vector.<ProductUnitEntry> = ProductUnit(that).m_entries;
                if (otherEntries.length != m_entries.length) {
                    return false;
                }
                for each (var entry1:ProductUnitEntry in m_entries) {
                    var found:Boolean = false;
                    for each (var entry2:ProductUnitEntry in otherEntries) {
                        if (entry1.unit.equals(entry2.unit) && (entry1.exponent == entry2.exponent)) {
                            found = true;
                            break;
                        }
                    }
                    if (!found) {
                        return false;
                    }
                }
                return true;
            } else {
                return false;
            }
        }
        
        private function hasOnlySystemUnits () : Boolean {
            for each (var entry:ProductUnitEntry in m_entries) {
                if (entry.unit != entry.unit.systemUnit) {
                    return false;
                }
            }
            return true;
        }
        
        public function get hash () : String {
            var hashes:Array = [];
            for each (var entry:ProductUnitEntry in m_entries) {
                hashes.push(entry.unit.hash + ((entry.exponent != 1) ? entry.exponent : ""));
            }
            hashes.sort();
            return hashes.join(".");
        }
    }
}