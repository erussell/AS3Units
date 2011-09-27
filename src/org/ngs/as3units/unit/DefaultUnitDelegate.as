package org.ngs.as3units.unit
{
    import flash.errors.IllegalOperationError;
    
    import org.ngs.as3units.UnconvertibleError;
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.converter.UnitConverterBase;
    
    /** */
    public class DefaultUnitDelegate implements UnitDelegate
    {
        private static var s_instance:DefaultUnitDelegate = null;
        private static var s_one:Unit = null;
        
        public static function get INSTANCE () : UnitDelegate {
            if (s_instance == null) {
                s_instance = new DefaultUnitDelegate();
                s_one = new ProductUnit(s_instance, new Vector.<ProductUnitEntry>());
            }
            return s_instance;
        }
        
        private const m_symbols:Object = {};
        
        public function get ONE () : Unit {
            return s_one;
        }
        
        public function putSymbol (unit:Unit, symbol:String) : void {
            if (m_symbols.hasOwnProperty(symbol)) {
                var unit1:Unit = m_symbols[symbol] as Unit;
                if ((!(unit is AlternateUnit)) ||
                    (!(unit1 is AlternateUnit)) ||
                    (!AlternateUnit(unit).parent.equals(AlternateUnit(unit1).parent))) {
                    new ArgumentError("Symbol " + symbol + " is already associated with a different unit");
                }
            }
            m_symbols[symbol] = unit;
        }
        
        public function get symbols () : Vector.<SymbolEntry> {
            var result:Vector.<SymbolEntry> = new Vector.<SymbolEntry>();
            for (var symbol:String in m_symbols) {
                result.push(new SymbolEntry(m_symbols[symbol] as Unit, symbol));
            }
            return result;
        }
        
        public function compatible (a:Unit, b:Unit) : Boolean {
            try {
                return getBaseUnit(a).equals(getBaseUnit(b));
            } catch (e:BaseUnitError) { }
            return false;
        }  
        
        public function annotate (unit:Unit, annotation:String) : Unit {
            return new AnnotatedUnit(this, unit, annotation);
        }
        
        public function alternate (unit:Unit, symbol:String) : Unit {
            return new AlternateUnit(this, unit, symbol);
        }
        
        public function transform (unit:Unit, operation:UnitConverter) : Unit {
            if (unit is TransformedUnit) {
                operation = TransformedUnit(unit).toParent().concatenate(operation);
                unit = TransformedUnit(unit).parent;
            }
            if (operation.isIdentity()) {
                return unit;
            } else {
                return new TransformedUnit(this, unit, operation);
            }
        }
        
        public function multiply (a:Unit, b:Unit) : Unit {
            return getProductInstance(productEntries(a), productEntries(b));
        }
        
        public function divide (a:Unit, b:Unit) : Unit {
            var quotientEntries:Vector.<ProductUnitEntry> = new Vector.<ProductUnitEntry>();
            for each (var entry:ProductUnitEntry in productEntries(b)) {
                quotientEntries.push(new ProductUnitEntry(entry.unit, -entry.exponent));
            }
            return getProductInstance(productEntries(a), quotientEntries);
        }
        
        public function pow (unit:Unit, exponent:int) : Unit {
            var entries:Vector.<ProductUnitEntry> = new Vector.<ProductUnitEntry>();
            var products:Vector.<ProductUnitEntry> = unit.productUnits;
            if (products != null) {
                for each (var entry:ProductUnitEntry in products) {
                    entries.push(new ProductUnitEntry(entry.unit, entry.exponent * exponent));
                }
            } else {
                entries.push(new ProductUnitEntry(unit, exponent));
            }
            return new ProductUnit(this, entries);
        }
        
        public function root (unit:Unit, root:int) : Unit {
            var products:Vector.<ProductUnitEntry> = unit.productUnits;
            if (products != null) {
                var entries:Vector.<ProductUnitEntry> = new Vector.<ProductUnitEntry>();
                for each (var entry:ProductUnitEntry in products) {
                    if ((entry.exponent % root) != 0) {
                        throw new IllegalOperationError("fractional powers not supported");
                    }
                    entries.push(new ProductUnitEntry(entry.unit, entry.exponent / root));
                }
                return new ProductUnit(this, entries);
            } else {
                throw new IllegalOperationError("fractional powers not supported");
            }
        }
        
        public function getConverter (from:Unit, to:Unit) : UnitConverter {
            if (from.equals(to)) {
                return UnitConverterBase.IDENTITY;
            }
            var fromSystemUnit:Unit = from.systemUnit;
            var toSystemUnit:Unit = to.systemUnit;
            if (fromSystemUnit.equals(toSystemUnit)) {
                return to.toSystemUnit().inverse().concatenate(from.toSystemUnit());
            }
            try {
                var fromBaseUnit:Unit = getBaseUnit(from);
                var toBaseUnit:Unit = getBaseUnit(to);
                if (fromBaseUnit.equals(toBaseUnit)) {
                    var fromConverter:UnitConverter = from.toSystemUnit().concatenate(getBaseConverter(fromSystemUnit));
                    var toConverter:UnitConverter = to.toSystemUnit().concatenate(getBaseConverter(toSystemUnit));
                    return toConverter.inverse().concatenate(fromConverter);
                }

            } catch (e:BaseUnitError) { }
            throw new UnconvertibleError("unable to convert", from, to);
        }
        
        private function getBaseUnit (unit:Unit) : Unit {
            if (unit is BaseUnit) {
                return unit;
            } else if (unit is AlternateUnit) {
                return getBaseUnit(AlternateUnit(unit).parent);
            } else if (unit is TransformedUnit) {
                return getBaseUnit(TransformedUnit(unit).parent);
            } else if (unit is ProductUnit) {
                var result:Unit = ONE;
                for each (var entry:ProductUnitEntry in unit.productUnits) {
                    result = result.multiply(getBaseUnit(entry.unit).pow(entry.exponent));
                }
                return result;
            } else {
                throw new BaseUnitError();
            }
        }
        
        private function getBaseConverter (baseUnit:Unit) : UnitConverter {
            var result:UnitConverter = UnitConverterBase.IDENTITY;
            var entries:Vector.<ProductUnitEntry> = baseUnit.productUnits;
            if (entries != null) {
                for each (var entry:ProductUnitEntry in entries) {
                    var converter:UnitConverter = getBaseConverter(entry.unit);
                    if (!converter.isLinear()) {
                        throw new BaseUnitError();
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
            }
            return result;
        }
        
        private function productEntries (unit:Unit) : Vector.<ProductUnitEntry> {
            var result:Vector.<ProductUnitEntry> = unit.productUnits;
            if (result == null) {
                result = new Vector.<ProductUnitEntry>();
                result.push(new ProductUnitEntry(unit));
            }
            return result;
        }
        
        private function getProductInstance (a:Vector.<ProductUnitEntry>, b:Vector.<ProductUnitEntry>) : Unit {
            var entries:Vector.<ProductUnitEntry> = new Vector.<ProductUnitEntry>();
            for each (var aEntry:ProductUnitEntry in a) {
                var bEntry:ProductUnitEntry = null;
                for each (var entry:ProductUnitEntry in b) {
                    if (entry.unit.equals(aEntry.unit)) {
                        bEntry = entry;
                        break;
                    }
                }
                if (bEntry != null) {
                    var exponent:int = aEntry.exponent + bEntry.exponent;
                    if (exponent != 0) {
                        entries.push(new ProductUnitEntry(aEntry.unit, exponent));
                    }
                } else {
                    entries.push(aEntry);
                }
            }
            for each (bEntry in b) {
                aEntry = null;
                for each (entry in a) {
                    if (entry.unit.equals(bEntry.unit)) {
                        aEntry = entry;
                        break;
                    }
                }
                if (aEntry == null) {
                    entries.push(bEntry);
                }
            }
            if (entries.length == 0) {
                return ONE;
            } else if ((entries.length == 1) && (entries[0].exponent == 1)) {
                return entries[0].unit;
            } else {
                return new ProductUnit(this, entries);
            }
        }
        
        private function getSimpleConverter (u:Unit) : UnitConverter {
            if (u is TransformedUnit) {
                var tu:TransformedUnit = u as TransformedUnit;
                if (tu.parent == ONE) {
                    return tu.toParent();
                }
            }
            return null;
        }   
    }
}

class BaseUnitError extends Error {
    
    public function BaseUnitError () {
        super();
    }
}