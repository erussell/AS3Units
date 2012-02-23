package org.ngs.as3units
{
    import org.ngs.as3units.converter.ExpConverter;
    import org.ngs.as3units.converter.RationalConverter;

    /**
     * This class contains units that are not part of the International
     * System of Units, that is, they are outside the SI, but are important
     * and widely used.
     */
    public final class NonSI extends SystemOfUnits
    {
        /**
         * Holds the standard gravity constant: 9.80665 m/s² exact.
         */
        private static const STANDARD_GRAVITY_DIVIDEND:int = 980665;
        private static const STANDARD_GRAVITY_DIVISOR:int  = 100000;
        
        /**
         * Holds the international foot: 0.3048 m exact.
         */
        private static const INTERNATIONAL_FOOT_DIVIDEND:int =  3048;
        private static const INTERNATIONAL_FOOT_DIViSOR:int  = 10000;
        
        /**
         * Holds the avoirdupois pound: 0.45359237 kg exact
         */
        private static const AVOIRDUPOIS_POUND_DIVIDEND:int =  45359237; 
        private static const AVOIRDUPOIS_POUND_DIVISOR:int  = 100000000; 
        
        /**
         * Holds the Avogadro constant.
         */
        private static const AVOGADRO_CONSTANT:Number = 6.02214199e23; // (1/mol).
        
        /**
         * Holds the electric charge of one electron.
         */
        private static const ELEMENTARY_CHARGE:Number = 1.602176462e-19; // (C).
        
        ///////////////////
        // Dimensionless //
        ///////////////////
        
        /**
         * A dimensionless unit equals to <code>0.01</code> 
         * (standard name <code>%</code>).
         */
        public static const PERCENT:Unit = u(DELEGATE.ONE.scale(1, 100));
        
        /** */
        public static const PER_MIL:Unit = u(PERCENT.scale(1, 10));
        
        /**
         * A logarithmic unit used to describe a ratio
         * (standard name <code>dB</code>).
         */
        public static const DECIBEL:Unit = u(DELEGATE.ONE.transform(new ExpConverter(10).concatenate(new RationalConverter(1, 10))));
        
        /////////////////////////
        // Amount of substance //
        /////////////////////////
        
        /**
         * A unit of amount of substance equals to one atom
         * (standard name <code>atom</code>).
         */
        public static const ATOM:Unit = SI.MOLE.scale(1, AVOGADRO_CONSTANT);
        
        ////////////
        // Length //
        ////////////
        
        /**
         * A unit of length equal to <code>0.3048 m</code> 
         * (standard name <code>ft</code>).
         */
        public static const FOOT:Unit = u(SI.METRE.scale(INTERNATIONAL_FOOT_DIVIDEND, INTERNATIONAL_FOOT_DIViSOR));
        
        /**
         * A unit of length equal to <code>1200/3937 m</code> 
         * (standard name <code>foot_survey_us</code>).
         * See also: <a href="http://www.sizes.com/units/foot.htm">foot</a>
         */
        public static const FOOT_SURVEY_US:Unit = u(SI.METRE.scale(1200, 3937));
        
        /**
         * A unit of length equal to <code>0.9144 m</code>
         * (standard name <code>yd</code>).
         */
        public static const YARD:Unit = u(FOOT.scale(3));
        
        /**
         * A unit of length equal to <code>0.0254 m</code> 
         * (standard name <code>in</code>).
         */
        public static const INCH:Unit = u(FOOT.scale(1, 12));
        
        /**
         * A unit of length equal to <code>1609.344 m</code>
         * (standard name <code>mi</code>).
         */
        public static const MILE:Unit = u(SI.METRE.scale(1609344, 1000));
        
        /**
         * A unit of length equal to <code>1852.0 m</code>
         * (standard name <code>nmi</code>).
         */
        public static const NAUTICAL_MILE:Unit = u(SI.METRE.scale(1852));
        
        /**
         * A unit of length equal to <code>1E-10 m</code>
         * (standard name <code>Å</code>).
         */
        public static const ANGSTROM:Unit = u(SI.METRE.scale(1, 10000000000));
        
        /**
         * A unit of length equal to the average distance from the center of the
         * Earth to the center of the Sun (standard name <code>ua</code>).
         */
        public static const ASTRONOMICAL_UNIT:Unit = u(SI.METRE.scale(149597870691.0));
        
        /**
         * A unit of length equal to the distance that light travels in one year
         * through a vacuum (standard name <code>ly</code>).
         */
        public static const LIGHT_YEAR:Unit = u(SI.METRE.scale(9.460528405e15));
        
        /**
         * A unit of length equal to the distance at which a star would appear to
         * shift its position by one arcsecond over the course the time
         * (about 3 months) in which the Earth moves a distance of
         * {@link #ASTRONOMICAL_UNIT} in the direction perpendicular to the
         * direction to the star (standard name <code>pc</code>).
         */
        public static const PARSEC:Unit = u(SI.METRE.scale(30856770e9));
        
        /**
         * A unit of length equal to <code>0.013837 {@link #INCH}</code> exactly
         * (standard name <code>pt</code>).
         * @see     #PIXEL
         */
        public static const POINT:Unit = u(INCH.scale(13837, 1000000));
        
        /**
         * A unit of length equal to <code>1/72 {@link #INCH}</code>
         * (standard name <code>pixel</code>).
         * It is the American point rounded to an even 1/72 inch.
         * @see     #POINT
         */
        public static const PIXEL:Unit = u(INCH.scale(1, 72));
        
        /**
         * Equivalent {@link #PIXEL}
         */
        public static const COMPUTER_POINT:Unit = PIXEL;
        
        
        /** */
        public static const FOOT_MODIFIED_AMERICAN:Unit = u(SI.METRE.scale(12.0004584, 39.37));
        
        /** */
        public static const FOOT_CLARKE:Unit = u(SI.METRE.scale(12.0, 39.370432));
        
        /** */
        public static const FOOT_INDIAN:Unit = u(SI.METRE.scale(12.0, 39.370141));
        
        /** */
        public static const LINK:Unit = u(SI.METRE.scale(7.92, 39.370432));
        
        /** */
        public static const LINK_BENOIT:Unit = u(SI.METRE.scale(7.92, 39.370113));
        
        /** */
        public static const LINK_SEARS:Unit = u(SI.METRE.scale(7.92, 39.370147));
        
        /** */
        public static const CHAIN_BENOIT:Unit = u(LINK_BENOIT.scale(100));
        
        /** */
        public static const CHAIN_SEARS:Unit = u(LINK_SEARS.scale(100));
        
        /** */
        public static const YARD_SEARS:Unit = u(SI.METRE.scale(36, 39.370147));
        
        /** */
        public static const YARD_INDIAN:Unit = u(FOOT_INDIAN.scale(3));
        
        /** */
        public static const FATHOM:Unit = u(YARD.scale(2));
        
        //////////////
        // Duration //
        //////////////
        
        /**
         * A unit of duration equal to <code>60 s</code>
         * (standard name <code>min</code>).
         */
        public static const MINUTE:Unit = u(SI.SECOND.scale(60));
        
        /**
         * A unit of duration equal to <code>60 {@link #MINUTE}</code>
         * (standard name <code>h</code>).
         */
        public static const HOUR:Unit = u(MINUTE.scale(60));
        
        /**
         * A unit of duration equal to <code>24 {@link #HOUR}</code>
         * (standard name <code>d</code>).
         */
        public static const DAY:Unit = u(HOUR.scale(24));
        
        /**
         * A unit of duration equal to <code>7 {@link #DAY}</code>
         * (standard name <code>week</code>).
         */
        public static const WEEK:Unit = u(DAY.scale(7));
        
        /**
         * A unit of duration equal to 365 days, 5 hours, 49 minutes,
         * and 12 seconds (standard name <code>year</code>).
         */
        public static const YEAR:Unit = u(SI.SECOND.scale(31556952));
        
        /**
         * A unit of duration equal to one twelfth of a year
         * (standard name <code>month</code>).
         */
        public static const MONTH:Unit = u(YEAR.scale(1, 12));
        
        /**
         * A unit of duration equal to the time required for a complete rotation of
         * the earth in reference to any star or to the vernal equinox at the
         * meridian, equal to 23 hours, 56 minutes, 4.09 seconds
         * (standard name <code>day_sidereal</code>).
         */
        public static const DAY_SIDEREAL:Unit = u(SI.SECOND.scale(86164.09));
        
        /**
         * A unit of duration equal to one complete revolution of the
         * earth about the sun, relative to the fixed stars, or 365 days, 6 hours,
         * 9 minutes, 9.54 seconds (standard name <code>year_sidereal</code>).
         */
        public static const YEAR_SIDEREAL:Unit = u(SI.SECOND.scale(31558149.54));
        
        /**
         * A unit of duration equal to <code>365 {@link #DAY}</code>
         * (standard name <code>year_calendar</code>).
         */
        public static const YEAR_CALENDAR:Unit = u(DAY.scale(365));
        
        /** */
        public static const MILLISECOND:Unit = u(SI.SECOND.scale(1, 1000));
        
        //////////
        // Mass //
        //////////
        
        /**
         * A unit of mass equal to 1/12 the mass of the carbon-12 atom
         * (standard name <code>u</code>).
         */
        public static const ATOMIC_MASS:Unit = u(SI.KILOGRAM.scale(1e-3, AVOGADRO_CONSTANT));
        
        /**
         * A unit of mass equal to the mass of the electron
         * (standard name <code>me</code>).
         */
        public static const ELECTRON_MASS:Unit = u(SI.KILOGRAM.scale(9.10938188e-31));
        
        /**
         * A unit of mass equal to <code>453.59237 grams</code> (avoirdupois pound,
         * standard name <code>lb</code>).
         */
        public static const POUND:Unit = u(SI.KILOGRAM.scale(AVOIRDUPOIS_POUND_DIVIDEND, AVOIRDUPOIS_POUND_DIVISOR));
        
        /**
         * A unit of mass equal to <code>1 / 16 {@link #POUND}</code>
         * (standard name <code>oz</code>).
         */
        public static const OUNCE:Unit = u(POUND.scale(1, 16));
        
        /**
         * A unit of mass equal to <code>2000 {@link #POUND}</code> (short ton, 
         * standard name <code>ton_us</code>).
         */
        public static const TON_US:Unit = u(POUND.scale(2000));
        
        /**
         * A unit of mass equal to <code>2240 {@link #POUND}</code> (long ton,
         * standard name <code>ton_uk</code>).
         */
        public static const TON_UK:Unit = u(POUND.scale(2240));
        
        /**
         * A unit of mass equal to <code>1000 kg</code> (metric ton,
         * standard name <code>t</code>).
         */
        public static const METRIC_TON:Unit = u(SI.KILOGRAM.scale(1000));
        
        /////////////////////
        // Electric charge //
        /////////////////////
        
        /**
         * A unit of electric charge equal to the charge on one electron
         * (standard name <code>e</code>).
         */
        public static const E:Unit = u(SI.COULOMB.scale(ELEMENTARY_CHARGE));
        
        /**
         * A unit of electric charge equal to equal to the product of Avogadro's
         * number (see {@link SI#MOLE}) and the charge (1 e) on a single electron
         * (standard name <code>Fd</code>).
         */
        public static const FARADAY:Unit = u(SI.COULOMB.scale(ELEMENTARY_CHARGE * AVOGADRO_CONSTANT)); // e/mol
        
        /**
         * A unit of electric charge which exerts a force of one dyne on an equal
         * charge at a distance of one centimeter
         * (standard name <code>Fr</code>).
         */
        public static const FRANKLIN:Unit = u(SI.COULOMB.scale(3.3356e-10));
        
        /////////////////
        // Temperature //
        /////////////////
        
        /**
         * A unit of temperature equal to <code>5/9 °K</code>
         * (standard name <code>°R</code>).
         */
        public static const RANKINE:Unit = u(SI.KELVIN.scale(5, 9));
        
        /**
         * A unit of temperature equal to degree Rankine minus 
         * <code>459.67 °R</code> (standard name <code>°F</code>).
         * @see    #RANKINE
         */
        public static const FAHRENHEIT:Unit = u(RANKINE.add(459.67));
        
        ///////////
        // Angle //
        ///////////
        
        /**
         * A unit of angle equal to a full circle or <code>2<i>&pi;</i> 
         * {@link SI#RADIAN}</code> (standard name <code>rev</code>).
         */
        public static const REVOLUTION:Unit = u(SI.RADIAN.scale(2.0 * Math.PI));
        
        /**
         * A unit of angle equal to <code>1/360 {@link #REVOLUTION}</code>
         * (standard name <code>°</code>).
         */
        public static const DEGREE_ANGLE:Unit = u(REVOLUTION.scale(1, 360));
        
        /**
         * A unit of angle equal to <code>1/60 {@link #DEGREE_ANGLE}</code>
         * (standard name <code>′</code>).
         */
        public static const MINUTE_ANGLE:Unit = u(DEGREE_ANGLE.scale(1, 60));
        
        /**
         *  A unit of angle equal to <code>1/60 {@link #MINUTE_ANGLE}</code>
         * (standard name <code>"</code>).
         */
        public static const SECOND_ANGLE:Unit = u(MINUTE_ANGLE.scale(1, 60));
        
        /**
         * A unit of angle equal to <code>0.01 {@link SI#RADIAN}</code>
         * (standard name <code>centiradian</code>).
         */
        public static const CENTIRADIAN:Unit = u(SI.RADIAN.scale(1, 100));
        
        /**
         * A unit of angle measure equal to <code>1/400 {@link #REVOLUTION}</code>
         * (standard name <code>grade</code>).
         */
        public static const GRADE:Unit = u(REVOLUTION.scale(1, 400));
        
        //////////////
        // Velocity //
        //////////////
        
        /**
         * A unit of velocity expressing the number of international {@link 
         * #MILE miles} per {@link #HOUR hour} (abbreviation <code>mph</code>).
         */
        public static const MILES_PER_HOUR:Unit = u(MILE.divide(HOUR));
        
        /**
         * A unit of velocity expressing the number of {@link SI#KILOMETRE} per 
         * {@link #HOUR hour}.
         */
        public static const KILOMETRES_PER_HOUR:Unit = u(SI.KILOMETRE.divide(HOUR));
        
        /**
         * Equivalent to {@link #KILOMETRES_PER_HOUR}.
         */
        public static const KILOMETERS_PER_HOUR:Unit = KILOMETRES_PER_HOUR;
        
        /**
         * A unit of velocity expressing the number of  {@link #NAUTICAL_MILE
         * nautical miles} per {@link #HOUR hour} (abbreviation <code>kn</code>).
         */
        public static const KNOT:Unit = u(NAUTICAL_MILE.divide(HOUR));
        
        /**
         * A unit of velocity to express the speed of an aircraft relative to
         * the speed of sound (standard name <code>Mach</code>).
         */
        public static const MACH:Unit = u(SI.METRES_PER_SECOND.scale(331.6));
        
        /**
         * A unit of velocity relative to the speed of light
         * (standard name <code>c</code>).
         */
        public static const C:Unit = u(SI.METRES_PER_SECOND.scale(299792458));
        
        //////////////////
        // Acceleration //
        //////////////////
        
        /**
         * A unit of acceleration equal to the gravity at the earth's surface
         * (standard name <code>grav</code>).
         */
        public static const G:Unit = u(SI.METRES_PER_SQUARE_SECOND.scale(STANDARD_GRAVITY_DIVIDEND, STANDARD_GRAVITY_DIVISOR));
        
        //////////
        // Area //
        //////////
        
        /**
         * A unit of area equal to <code>100 m²</code>
         * (standard name <code>a</code>).
         */
        public static const ARE:Unit = u(SI.SQUARE_METRE.scale(100));
        
        /**
         * A unit of area equal to <code>100 {@link #ARE}</code>
         * (standard name <code>ha</code>).
         */
        public static const HECTARE:Unit = u(ARE.scale(100)); // Exact.
        
        /** */
        public static const SQUARE_KILOMETER:Unit = u(SI.KILOMETER.pow(2));
        
        /** */
        public static const SQUARE_FOOT:Unit = u(FOOT.pow(2));
        
        /** */
        public static const ACRE:Unit = u(SQUARE_FOOT.scale(43560));
        
        /////////////////
        // Data Amount //
        /////////////////
        
        /**
         * A unit of data amount equal to <code>8 {@link SI#BIT}</code>
         * (BinarY TErm, standard name <code>byte</code>).
         */
        public static const BYTE:Unit = u(SI.BIT.scale(8));
        
        /**
         * Equivalent {@link #BYTE}
         */
        public static const OCTET:Unit = BYTE;
        
        
        //////////////////////
        // Electric current //
        //////////////////////
        
        /**
         * A unit of electric charge equal to the centimeter-gram-second
         * electromagnetic unit of magnetomotive force, equal to <code>10/4
         * &pi;ampere-turn</code> (standard name <code>Gi</code>).
         */
        public static const GILBERT:Unit = u(SI.AMPERE.scale(10.0, (4.0 * Math.PI)));
        
        ////////////
        // Energy //
        ////////////
        
        /**
         * A unit of energy equal to <code>1E-7 J</code>
         * (standard name <code>erg</code>).
         */
        public static const ERG:Unit = u(SI.JOULE.scale(1, 10000000));
        
        /**
         * A unit of energy equal to one electron-volt (standard name 
         * <code>eV</code>, also recognized <code>keV, MeV, GeV</code>).
         */
        public static const ELECTRON_VOLT:Unit = u(SI.JOULE.scale(ELEMENTARY_CHARGE));
        
        /////////////////
        // Illuminance //
        /////////////////
        
        /**
         * A unit of illuminance equal to <code>1E4 Lx</code>
         * (standard name <code>La</code>).
         */
        public static const LAMBERT:Unit = u(SI.LUX.scale(10000));
        
        ///////////////////
        // Magnetic Flux //
        ///////////////////
        
        /**
         * A unit of magnetic flux equal <code>1E-8 Wb</code>
         * (standard name <code>Mx</code>).
         */
        public static const MAXWELL:Unit = u(SI.WEBER.scale(1, 100000000));
        
        ///////////////////////////
        // Magnetic Flux Density //
        ///////////////////////////
        
        /**
         * A unit of magnetic flux density equal <code>1000 A/m</code>
         * (standard name <code>G</code>).
         */
        public static const GAUSS:Unit = u(SI.TESLA.scale(1, 10000));
        
        ///////////
        // Force //
        ///////////
        
        /**
         * A unit of force equal to <code>1E-5 N</code>
         * (standard name <code>dyn</code>).
         */
        public static const DYNE:Unit = u(SI.NEWTON.scale(1, 100000));
        
        /**
         * A unit of force equal to <code>9.80665 N</code>
         * (standard name <code>kgf</code>).
         */
        public static const KILOGRAM_FORCE:Unit = u(SI.NEWTON.scale(STANDARD_GRAVITY_DIVIDEND, STANDARD_GRAVITY_DIVISOR));
        
        /**
         * A unit of force equal to <code>{@link #POUND}·{@link #G}</code>
         * (standard name <code>lbf</code>).
         */
        public static const POUND_FORCE:Unit = u(SI.NEWTON.scale((AVOIRDUPOIS_POUND_DIVIDEND * STANDARD_GRAVITY_DIVIDEND), (AVOIRDUPOIS_POUND_DIVISOR * STANDARD_GRAVITY_DIVISOR)));
        
        ///////////
        // Power //
        ///////////
        
        /**
         * A unit of power equal to the power required to raise a mass of 75
         * kilograms at a velocity of 1 meter per second (metric,
         * standard name <code>hp</code>).
         */
        public static const HORSEPOWER:Unit = u(SI.WATT.scale(735.499));
        
        //////////////
        // Pressure //
        //////////////
        
        /**
         * A unit of pressure equal to the average pressure of the Earth's
         * atmosphere at sea level (standard name <code>atm</code>).
         */
        public static const ATMOSPHERE:Unit = u(SI.PASCAL.scale(101325));
        
        /**
         * A unit of pressure equal to <code>100 kPa</code>
         * (standard name <code>bar</code>).
         */
        public static const BAR:Unit = u(SI.PASCAL.scale(100000));
        
        /**
         * A unit of pressure equal to the pressure exerted at the Earth's
         * surface by a column of mercury 1 millimeter high
         * (standard name <code>mmHg</code>).
         */
        public static const MILLIMETER_OF_MERCURY:Unit =u(SI.PASCAL.scale(133.322));
        
        /**
         * A unit of pressure equal to the pressure exerted at the Earth's
         * surface by a column of mercury 1 inch high
         * (standard name <code>inHg</code>).
         */
        public static const INCH_OF_MERCURY:Unit = u(SI.PASCAL.scale(3386.388));
        
        /////////////////////////////
        // Radiation dose absorbed //
        /////////////////////////////
        
        /**
         * A unit of radiation dose absorbed equal to a dose of 0.01 joule of
         * energy per kilogram of mass (J/kg) (standard name <code>rd</code>).
         */
        public static const RAD:Unit = u(SI.GRAY.scale(1, 100));
        
        /**
         * A unit of radiation dose effective equal to <code>0.01 Sv</code>
         * (standard name <code>rem</code>).
         */
        public static const REM:Unit = u(SI.SIEVERT.scale(1, 100));
        
        //////////////////////////
        // Radioactive activity //
        //////////////////////////
        
        /**
         * A unit of radioactive activity equal to the activity of a gram of radium
         * (standard name <code>Ci</code>).
         */
        public static const CURIE:Unit = u(SI.BECQUEREL.scale(37000000000));
        
        /**
         * A unit of radioactive activity equal to 1 million radioactive
         * disintegrations per second (standard name <code>Rd</code>).
         */
        public static const RUTHERFORD:Unit = u(SI.BECQUEREL.scale(1000000));
        
        /////////////////
        // Solid angle //
        /////////////////
        
        /**
         * A unit of solid angle equal to <code>4 <i>&pi;</i> steradians</code>
         * (standard name <code>sphere</code>).
         */
        public static const SPHERE:Unit = u(SI.STERADIAN.scale(4.0 * Math.PI));
        
        ////////////
        // Volume //
        ////////////
        
        /**
         * A unit of volume equal to one cubic decimeter (default label
         * <code>L</code>, also recognized <code>µL, mL, cL, dL</code>).
         */
        public static const LITRE:Unit = u(SI.CUBIC_METRE.scale(1, 1000));
        
        /**
         * Equivalent to {@link #LITRE} (American spelling).
         */
        public static const LITER:Unit = LITRE;
        
        /**
         * A unit of volume equal to one cubic inch (<code>in³</code>).
         */
        public static const CUBIC_INCH:Unit = u(INCH.pow(3));
        
        /**
         * A unit of volume equal to one US gallon, Liquid Unit. The U.S. liquid
         * gallon is based on the Queen Anne or Wine gallon occupying 231 cubic
         * inches (standard name <code>gal</code>).
         */
        public static const GALLON_LIQUID_US:Unit = u(CUBIC_INCH.scale(231));
        
        /**
         * A unit of volume equal to <code>1 / 128 {@link #GALLON_LIQUID_US}</code>
         * (standard name <code>oz_fl</code>).
         */
        public static const OUNCE_LIQUID_US:Unit = u(GALLON_LIQUID_US.scale(1, 128));
        
        /**
         * A unit of volume equal to one US dry gallon.
         * (standard name <code>gallon_dry_us</code>).
         */
        public static const GALLON_DRY_US:Unit = u(CUBIC_INCH.scale(2688025, 10000));
        
        /**
         * A unit of volume equal to <code>4.546 09 {@link #LITRE}</code>
         * (standard name <code>gal_uk</code>).
         */
        public static const GALLON_UK:Unit = u(LITRE.scale(454609, 100000));
        
        /**
         * A unit of volume equal to <code>1 / 160 {@link #GALLON_UK}</code>
         * (standard name <code>oz_fl_uk</code>).
         */
        public static const OUNCE_LIQUID_UK:Unit = u(GALLON_UK.scale(1, 160));
        
        ///////////////
        // Viscosity //
        ///////////////
        
        /**
         * A unit of dynamic viscosity equal to <code>1 g/(cm·s)</code>
         * (cgs unit).
         */
        public static const POISE:Unit = u(SI.GRAM.divide(Prefix.CENTI.transform(SI.METRE).multiply(SI.SECOND)));
        
        /**
         * A unit of kinematic viscosity equal to <code>1 cm²/s</code>
         * (cgs unit).
         */
        public static const STOKE:Unit = u(Prefix.CENTI.transform(SI.METRE).pow(2).divide(SI.SECOND));
        
        ////////////////////////
        // VolumetricFlowRate //
        ////////////////////////
        
        /** */
        public static const CFS:Unit = u(FOOT.pow(3).divide(SI.SECOND));
        
        
        ////////////
        // Others //
        ////////////
        
        /**
         * A unit used to measure the ionizing ability of radiation
         * (standard name <code>Roentgen</code>).
         */
        public static const ROENTGEN:Unit = u(SI.COULOMB.divide(SI.KILOGRAM).scale(2.58e-4));
    }
}