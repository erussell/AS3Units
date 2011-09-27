package org.ngs.as3units.unit {
    
    import flash.errors.IllegalOperationError;
    import flash.utils.Dictionary;
    
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;
    import org.ngs.as3units.converter.AddConverter;
    import org.ngs.as3units.converter.MultiplyConverter;
    import org.ngs.as3units.converter.RationalConverter;
    
    
    /** */
    public class UnitBase
    {
        private var m_delegate:UnitDelegate;
        
        public function get delegate () : UnitDelegate {
            return m_delegate;
        }
        
        public function UnitBase (delegate:UnitDelegate) {
            m_delegate = delegate;
        }
        
        public function get symbol () : String {
            return null;
        }
        
        public function get productUnits () : Vector.<ProductUnitEntry> {
            return null;
        }
        
        public function isCompatible (that:Unit) : Boolean {
            return delegate.compatible(Unit(this), that);
        }
        
        public function asType (type:Class) : Unit {
            return Unit(this);
        }
        
        public function getConverterTo (that:Unit) : UnitConverter {
            return getConverterToAny(that);
        }
        
        public function getConverterToAny (that:Unit) : UnitConverter {
            return delegate.getConverter(Unit(this), that);
        }
        
        public function alternate (symbol:String) : Unit {
            return delegate.alternate(Unit(this), symbol);
        }
        
        public function annotate (annotation:String) : Unit {
            return delegate.annotate(Unit(this), annotation);
        }
        
        public function transform (operation:UnitConverter) : Unit {
            return delegate.transform(Unit(this), operation);
        }
        
        public function add (offset:Number) : Unit {
            return transform(new AddConverter(offset));
        }   
        
        public function scale (factor:Number, divisor:Number=1) : Unit {
            if (factor/divisor == 1) {
                return Unit(this);
            } else if (((Math.floor(factor) == factor) && (Math.abs(factor) < int.MAX_VALUE)) &&
                       ((Math.floor(divisor) == divisor) && (Math.abs(divisor) < int.MAX_VALUE))) {
                return transform(new RationalConverter(int(factor), int(divisor)));
            } else {
                return transform(new MultiplyConverter(factor/divisor));
            }
        }
        
        public function multiply (that:Unit) : Unit {
            return delegate.multiply(Unit(this), that);
        }
        
        public function inverse () : Unit {
            return delegate.divide(delegate.ONE, Unit(this));
        }
        
        public function divide (that:Unit) : Unit {
            return delegate.divide(Unit(this), that);
        }
        
        public function root (n:int) : Unit {
            if (n > 0) {
                return delegate.root(Unit(this), n);
            } else if (n == 0) {
                throw new IllegalOperationError("Root's order of zero");
            } else { // n < 0
                return delegate.ONE.divide(this.root(-n));
            }
        }
        
        public function pow (n:int) : Unit {
            if (n > 0) {
                return this.multiply(this.pow(n - 1));
            } else if (n == 0) {
                return delegate.ONE;
            } else { // n < 0
                return delegate.ONE.divide(this.pow(-n));
            }
        }
    }
}