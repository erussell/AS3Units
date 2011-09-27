/**
 * Unit-API - Units of Measurement API for Java (http://unitsofmeasurement.org)
 * Copyright (c) 2005-2010, Unit-API contributors, JScience and others
 * All rights reserved.
 *
 * See LICENSE.txt for details.
 */
package org.ngs.as3units {
    
    import org.ngs.as3units.unit.ProductUnitEntry;
    
    /** */
    public interface Unit 
    {
        function equals (that:Object) : Boolean;
        
        function get hash () : String;
        
        /**
         * Returns the symbol (if any) of this unit.
         *
         * @return this unit symbol or <code>null</code> if this unit has not
         *         specific symbol associated with (e.g. product of units).
         */
        function get symbol () : String;
        
        /**
         * Returns the unscaled system unit from which this unit is derived.
         *
         * <p> System units are either base units, {@link #alternate alternate
         *     units} or product of rational powers of system units.</p>
         *
         * <p> Because the system unit is unique by quantity type, it can be
         *     be used to identify the quantity given the unit. For example:[code]
         *     static boolean isAngularVelocity(Unit unit) {
         *         return unit.systemUnit.equals(RADIAN.divide(SECOND));
         *     }
         *     assert(REVOLUTION.divide(MINUTE).isAngularVelocity()); // Returns true.
         * [/code]
         *
         * @return the system unit this unit is derived from or <code>this</code>
         *         if this unit is a system unit.
         */
        function get systemUnit () : Unit;
        
        /**
         * 
         */
        function toSystemUnit () : UnitConverter;
        
        /**
         * Returns the simple units and their exponent whose product is
         * this unit or <code>null</code> if this unit is a simple unit (not a
         * product of existing units).
         *
         * @return the simple units and their exponent making up this unit.
         */
        function get productUnits () : Vector.<ProductUnitEntry>;
        
        /**
         * Indicates if this unit is compatible with the unit specified. Units don't
         * need to be equals to be compatible. For example:[code]
         *     RADIAN.equals(ONE) == false
         *     RADIAN.isCompatible(ONE) == true
         * [/code]
         *
         * @param that the other unit.
         * @return <code>this.getDimension().equals(that.getDimension())</code>
         * @see #getDimension()
         */
        function isCompatible (that:Unit) : Boolean;
        
        /**
         * Returns a converter of numeric values from this unit to another unit of
         * same type (convenience method not raising checked exception).
         *
         * @param that the unit of same type to which to convert the numeric values.
         * @return the converter from this unit to <code>that</code> unit.
         * @throws UnconvertibleException if a converter cannot be constructed.
         */
        function getConverterTo (that:Unit) : UnitConverter;
        
        /**********************/
        /** Units Operations **/
        /**********************/
        
        /**
         * Returns a system unit equivalent to this unscaled standard unit but used
         * in expressions to distinguish between quantities of a different nature
         * but of the same dimensions.
         *
         * <p> Examples of alternate units:[code]
         *     Unit<Angle> RADIAN = ONE.alternate("rad").asType(Angle.class);
         *     Unit<Force> NEWTON = METRE.times(KILOGRAM).divide(SECOND.pow(2)).alternate("N").asType(Force.class);
         *     Unit<Pressure> PASCAL = NEWTON.divide(METRE.pow(2)).alternate("Pa").asType(Pressure.class);
         * [/code]
         * </p>
         *
         * @param symbol the new symbol for the alternate unit.
         * @return the alternate unit.
         * @throws UnsupportedOperationException if this unit is not an unscaled standard unit.
         * @throws IllegalArgumentException if the specified symbol is already
         *         associated to a different unit.
         */
        function alternate (symbol:String) : Unit;
        
        
        /**
         * Returns a blah blah blah
         * @param annotation the annotation
         * @return the annotated unit.
         */
        function annotate (annotation:String) : Unit;
        
        /**
         * Returns the unit derived from this unit using the specified converter.
         * The converter does not need to be linear. For example:[code]
         *     Unit<Dimensionless> DECIBEL = Unit.ONE.transform(
         *         new LogConverter(10).inverse().concatenate(
         *             new RationalConverter(1, 10)));
         * [/code]
         *
         * @param operation the converter from the transformed unit to this unit.
         * @return the unit after the specified transformation.
         */
        function transform (operation:UnitConverter) : Unit;
        
        /**
         * Returns the result of adding an offset to this unit. The returned unit is
         * convertible with all units that are convertible with this unit.
         *
         * @param offset the offset added (expressed in this unit, e.g.
         * <code>CELSIUS = KELVIN.add(273.15)</code>).
         * @return this unit offset by the specified value.
         */
        function add (offset:Number) : Unit;
        
        /**
         * Returns the result of multiplying this unit by the specified factor.
         * If the factor is an integer value, the multiplication is exact
         * (recommended). For example:<pre><code>
         *    FOOT = METRE.multiply(3048).divide(10000); // Exact definition.
         *    ELECTRON_MASS = KILOGRAM.multiply(9.10938188e-31); // Approximation.
         * </code></pre>
         *
         * @param factor the factor
         * @return this unit scaled by the specified factor.
         */
        function scale (factor:Number, divisor:Number=1) : Unit;
        
        /**
         * Returns the product of this unit with the one specified.
         *
         * @param that the unit multiplicand.
         * @return <code>this * that</code>
         */
        function multiply (that:Unit) : Unit;
        
        /**
         * Returns the inverse of this unit.
         *
         * @return <code>1 / this</code>
         */
        function inverse () : Unit;
        
        /**
         * Returns the quotient of this unit with the one specified.
         *
         * @param that the unit divisor.
         * @return <code>this / that</code>
         */
        function divide (that:Unit) : Unit;
        
        /**
         * Returns a unit equals to the given root of this unit.
         *
         * @param n the root's order.
         * @return the result of taking the given root of this unit.
         * @throws ArithmeticException if <code>n == 0</code> or if this operation
         *         would result in an unit with a fractional exponent.
         */
        function root (n:int) : Unit;
        
        /**
         * Returns a unit equals to this unit raised to an exponent.
         *
         * @param n the exponent.
         * @return the result of raising this unit to the exponent.
         */
        function pow (n:int) : Unit;
    }
}