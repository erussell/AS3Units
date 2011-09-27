package org.ngs.as3units.converter
{   
    import org.ngs.as3units.UnitConverter;
    
    /**
     * <p> This class represents a converter multiplying numeric values by an
     *     exact scaling factor (represented as the quotient of two 
     *     <code>long</code> numbers).</p>
     *  
     * <p> Instances of this class are immutable.</p>
     */
    public class RationalConverter extends UnitConverterBase implements UnitConverter
    {
        private static function gcd (m:int, n:int) : int {
            if (n == 0) {
                return m;
            } else {
                return gcd(n, m % n);
            }
        }
        
        private var m_dividend:int;
        
        private var m_divisor:int;
        
        public function RationalConverter (dividend:int, divisor:int) {
            if (divisor < 0) {
                throw new ArgumentError("Negative divisor");
            }
            if (dividend == divisor) { 
                throw new ArgumentError("Identity converter not allowed");
            }
            m_dividend = dividend;
            m_divisor = divisor;
        }
        
        public function getDividend() : int{
            return m_dividend;
        }
        
        public function getDivisor() : int {
            return m_divisor;
        }
        
        override public function concatenate (converter:UnitConverter) : UnitConverter {
            if (converter is RationalConverter) {
                var that:RationalConverter = converter as RationalConverter;
                var dividend:int = this.m_dividend * that.m_dividend;
                var divisor:int = this.m_divisor * that.m_divisor;
                var dividendF:Number = Number(this.m_dividend) * Number(that.m_dividend);
                var divisorF:Number = Number(this.m_divisor) * Number(that.m_divisor);
                if ((dividend != dividendF) || (divisor != divisorF)) {
                    // int overflows.
                    var factor:Number = dividendF / divisorF;
                    if (factor == 1) {
                        return IDENTITY;
                    } else {
                        return new MultiplyConverter(factor);
                    }
                }
                var gcd:int = gcd(dividend, divisor);
                dividend /= gcd;
                divisor /= gcd;
                if (dividend == divisor) {
                    return IDENTITY;
                } else {
                    return new RationalConverter(dividend, divisor);
                }
            } else if (converter is MultiplyConverter) {
                return converter.concatenate(this);
            } else {
                return super.concatenate(converter);
            }
        }
        
        public function convert (value:Number) : Number {
            return value * m_dividend  / m_divisor;
        }
        
        public function inverse () : UnitConverter {
            if (m_dividend < 0) {
                return new RationalConverter(-m_divisor, -m_dividend);
            } else {
                return new RationalConverter(m_divisor, m_dividend);
            }
        }
        
        public function get hash () : String {
            return "*" + m_dividend + "/" + m_divisor;
        }
    }
}