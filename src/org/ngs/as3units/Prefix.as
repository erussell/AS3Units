package org.ngs.as3units
{
    import org.ngs.as3units.converter.MultiplyConverter;
    import org.ngs.as3units.converter.RationalConverter;

    /** */
    public class Prefix 
    {
        public static const YOTTA:Prefix = new Prefix(new MultiplyConverter(1e24));
        public static const ZETTA:Prefix = new Prefix(new MultiplyConverter(1e21));
        public static const EXA:Prefix = new Prefix(new RationalConverter(1e18, 1));
        public static const PETA:Prefix = new Prefix(new RationalConverter(1e15, 1));
        public static const TERA:Prefix = new Prefix(new RationalConverter(1e12, 1));
        public static const GIGA:Prefix = new Prefix(new RationalConverter(1000000000, 1));
        public static const MEGA:Prefix = new Prefix(new RationalConverter(1000000, 1));
        public static const KILO:Prefix = new Prefix(new RationalConverter(1000, 1));
        public static const HECTO:Prefix = new Prefix(new RationalConverter(100, 1));
        public static const DEKA:Prefix = new Prefix(new RationalConverter(10, 1));
        public static const DECI:Prefix = new Prefix(new RationalConverter(1, 10));
        public static const CENTI:Prefix = new Prefix(new RationalConverter(1, 100));
        public static const MILLI:Prefix = new Prefix(new RationalConverter(1, 1000));
        public static const MICRO:Prefix = new Prefix(new RationalConverter(1, 1000000));
        public static const NANO:Prefix = new Prefix(new RationalConverter(1, 1000000000));
        public static const PICO:Prefix = new Prefix(new RationalConverter(1, 1e-12));
        public static const FEMTO:Prefix = new Prefix(new RationalConverter(1, 1e-15));
        public static const ATTO:Prefix = new Prefix(new RationalConverter(1, 1e-18));
        public static const ZEPTO:Prefix = new Prefix(new MultiplyConverter(1E-21));
        public static const YOCTO:Prefix = new Prefix(new MultiplyConverter(1E-24));
    
        private var m_converter:UnitConverter;
        
        public function get converter () : UnitConverter {
            return m_converter;
        }
        
        public function Prefix (converter:UnitConverter) {
            m_converter = converter;
        }
        
        public function transform (unit:Unit) : Unit{
            return unit.transform(converter);
        }
    }
}
