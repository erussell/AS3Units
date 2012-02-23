package org.ngs.as3units
{
    public class UCUM extends SystemOfUnits
    {
        public static function get ONE () : Unit {
            return DELEGATE.ONE;
        }
        
        private static var s_metricUnits:Array = [];
        
        private static function ucum (unit:Unit, isMetric:Boolean=false) : Unit {
            if (isMetric) {
                s_metricUnits.push(unit);
            }
            return u(unit);
        }
        
        //////////////////////////////
        // BASE UNITS: UCUM 4.2 §25 //
        //////////////////////////////
        
        public static const METER:Unit = ucum(SI.METRE, true);
        public static const SECOND:Unit = ucum(SI.SECOND, true);
        
        /**
         * We deviate slightly from the standard here, to maintain compatibility
         * with the existing SI units. In UCUM, the gram is the base unit of mass,
         * rather than the kilogram. This doesn't have much effect on the units
         * themselves, but it does make formatting the units a challenge.
         */
        public static const GRAM:Unit = ucum(SI.GRAM, true);
        public static const KILOGRAM:Unit = SI.KILOGRAM;
        public static const RADIAN:Unit = ucum(SI.RADIAN, true);
        public static const KELVIN:Unit = ucum(SI.KELVIN, true);
        public static const COULOMB:Unit = ucum(SI.COULOMB, true);
        public static const CANDELA:Unit = ucum(SI.CANDELA, true);
        
        ///////////////////////////////////////////////
        // DIMENSIONLESS DERIVED UNITS: UCUM 4.3 §26 //
        ///////////////////////////////////////////////
        
        public static const TRIILLIONS:Unit = ucum(DELEGATE.ONE.scale(1000000000000), false);
        public static const BILLIONS:Unit = ucum(DELEGATE.ONE.scale(1000000000), false);
        public static const MILLIONS:Unit = ucum(DELEGATE.ONE.scale(1000000), false);
        public static const THOUSANDS:Unit = ucum(DELEGATE.ONE.scale(1000), false);
        public static const HUNDREDS:Unit = ucum(DELEGATE.ONE.scale(100), false);
        public static const PI:Unit = ucum(DELEGATE.ONE.scale(Math.PI), false);
        public static const PERCENT:Unit = ucum(DELEGATE.ONE.scale(1, 100), false);
        public static const PER_THOUSAND:Unit = ucum(DELEGATE.ONE.scale(1, 1000), false);
        public static const PER_MILLION:Unit = ucum(DELEGATE.ONE.scale(1, 1000000), false);
        public static const PER_BILLION:Unit = ucum(DELEGATE.ONE.scale(1, 1000000000), false);
        public static const PER_TRILLION:Unit = ucum(DELEGATE.ONE.scale(1, 1000000000000), false);
        
        ////////////////////////////
        // SI UNITS: UCUM 4.3 §27 //
        ////////////////////////////
        
        /**
         * We deviate slightly from the standard here, to maintain compatibility
         * with the existing SI units. In UCUM, the mole is no longer a base unit,
         * but is defined as <code>DELEGATE.ONE.multiply(6.0221367E23)</code>.
         */
        public static const MOLE:Unit = ucum(SI.MOLE, true);
        
        /**
         * We deviate slightly from the standard here, to maintain compatibility
         * with the existing SI units. In UCUM, the steradian is defined as 
         * <code>RADIAN.pow(2)</code>.
         */
        public static const STERADIAN:Unit = ucum(SI.STERADIAN, true);
        public static const HERTZ:Unit = ucum(DELEGATE.ONE.divide(SECOND), true);
        public static const NEWTON:Unit = ucum(SI.NEWTON, true);
        public static const PASCAL:Unit = ucum(SI.PASCAL, true);
        public static const JOULE:Unit = ucum(SI.JOULE, true);
        public static const WATT:Unit = ucum(SI.WATT, true);
        
        /** 
         * We deviate slightly from the standard here, to maintain compatibility
         * with the existing SI units. In UCUM, the ampere is defined as 
         * <code>COULOMB.divide(SECOND)</code>.
         */
        public static const AMPERE:Unit = ucum(SI.AMPERE, true);
        
        /** 
         * We deviate slightly from the standard here, to maintain compatibility
         * with the existing SI units. In UCUM, the volt is defined as 
         * <code>JOULE.divide(COULOMB)</code>.
         */
        public static const VOLT:Unit = ucum(SI.VOLT, true);
        public static const FARAD:Unit = ucum(SI.FARAD, true);
        public static const OHM:Unit = ucum(SI.OHM, true);
        
        /** 
         * We deviate slightly from the standard here, to maintain compatibility
         * with the existing SI units. In UCUM, the volt is defined as 
         * <code>DELEGATE.ONE.divide(OHM)</code>.
         */
        public static const SIEMENS:Unit = ucum(SI.SIEMENS, true);
        public static const WEBER:Unit = ucum(SI.WEBER, true);
        public static const CELSIUS:Unit = ucum(SI.CELSIUS, true);
        public static const TESLA:Unit = ucum(SI.TESLA, true);
        public static const HENRY:Unit = ucum(SI.HENRY, true);
        public static const LUMEN:Unit = ucum(SI.LUMEN, true);
        public static const LUX:Unit = ucum(SI.LUX, true);
        public static const BECQUEREL:Unit = ucum(SI.BECQUEREL, true);
        public static const GRAY:Unit = ucum(SI.GRAY, true);
        public static const SIEVERT:Unit = ucum(SI.SIEVERT, true);
        
        ///////////////////////////////////////////////////////////////////////
        // OTHER UNITS FROM ISO 1000, ISO 2955, AND ANSI X3.50: UCUM 4.3 §28 //
        ///////////////////////////////////////////////////////////////////////
        
        // The order of GON and DEGREE has been inverted because GON is defined in terms of DEGREE
        
        /** 
         * We deviate slightly from the standard here, to maintain compatibility
         * with the existing NonSI units. In UCUM, the degree is defined as 
         * <code>PI.multiply(RADIAN.scale(1, 180))</code>.
         */
        public static const DEGREE:Unit = ucum(NonSI.DEGREE_ANGLE, false);
        
        /** 
         * We deviate slightly from the standard here, to maintain compatibility
         * with the existing NonSI units. In UCUM, the grade is defined as 
         * <code>DEGREE.scale(0.9)</code>.
         */
        public static const GRADE:Unit = ucum(NonSI.GRADE, false);
        public static const GON:Unit = GRADE;
        public static const MINUTE_ANGLE:Unit = ucum(NonSI.MINUTE_ANGLE, false);
        public static const SECOND_ANGLE:Unit = ucum(NonSI.SECOND_ANGLE, false);
        public static const LITER:Unit = ucum(NonSI.LITRE, true);
        public static const ARE:Unit = ucum(NonSI.ARE, true);
        public static const MINUTE:Unit = ucum(NonSI.MINUTE, false);
        public static const HOUR:Unit = ucum(NonSI.HOUR, false);
        public static const DAY:Unit = ucum(NonSI.DAY, false);
        public static const YEAR_TROPICAL:Unit = ucum(DAY.scale(365.24219), false);
        public static const YEAR_JULIAN:Unit = ucum(DAY.scale(365.25), false);
        public static const YEAR_GREGORIAN:Unit = ucum(DAY.scale(365.2425), false);
        public static const YEAR:Unit = ucum(DAY.scale(365.25), false);
        public static const WEEK:Unit = ucum(NonSI.WEEK, false);
        public static const MONTH_SYNODAL:Unit = ucum(DAY.scale(29.53059), false);
        public static const MONTH_JULIAN:Unit = ucum(YEAR_JULIAN.scale(1, 12), false);
        public static const MONTH_GREGORIAN:Unit = ucum(YEAR_GREGORIAN.scale(1, 12), false);
        public static const MONTH:Unit = ucum(YEAR_JULIAN.scale(1, 12), false);
        public static const TONNE:Unit = ucum(NonSI.METRIC_TON, true);
        public static const BAR:Unit = ucum(NonSI.BAR, true);
        public static const ATOMIC_MASS_UNIT:Unit = ucum(NonSI.ATOMIC_MASS, true);
        public static const ELECTRON_VOLT:Unit = ucum(NonSI.ELECTRON_VOLT, true);
        public static const ASTRONOMIC_UNIT:Unit = ucum(NonSI.ASTRONOMICAL_UNIT, false);
        public static const PARSEC:Unit = ucum(NonSI.PARSEC, true);
        
        /////////////////////////////////
        // NATURAL UNITS: UCUM 4.3 §29 //
        /////////////////////////////////
        
        public static const C:Unit = ucum(NonSI.C, true);
        public static const PLANCK:Unit = ucum(JOULE.multiply(SECOND).scale(6.6260755E-24), true);
        public static const BOLTZMAN:Unit = ucum(JOULE.divide(KELVIN).scale(1.380658E-23), true);
        public static const PERMITTIVITY_OF_VACUUM:Unit = ucum(FARAD.divide(METER).scale(8.854187817E-12), true);
        public static const PERMEABILITY_OF_VACUUM:Unit = ucum(NEWTON.scale(4E-7 * Math.PI).divide(AMPERE.pow(2)), true);
        public static const ELEMENTARY_CHARGE:Unit = ucum(NonSI.E, true);
        public static const ELECTRON_MASS:Unit = ucum(NonSI.ELECTRON_MASS, true);
        public static const PROTON_MASS:Unit = ucum(GRAM.scale(1.6726231E-24), true);
        public static const NEWTON_CONSTANT_OF_GRAVITY:Unit = ucum(METER.pow(3).multiply(KILOGRAM.pow(-1)).multiply(SECOND.pow(-2)).scale(6.67259E-11), true);
        public static const ACCELLERATION_OF_FREEFALL:Unit = ucum(NonSI.G, true);
        public static const ATMOSPHERE:Unit = ucum(NonSI.ATMOSPHERE, false);
        public static const LIGHT_YEAR:Unit = ucum(NonSI.LIGHT_YEAR, true);
        public static const GRAM_FORCE:Unit = ucum(GRAM.multiply(ACCELLERATION_OF_FREEFALL), true);
        
        // POUND_FORCE contains a forward reference to avoirdupois pound weight, so it has been moved after section §36 below
        
        /////////////////////////////
        // CGS UNITS: UCUM 4.3 §30 //
        /////////////////////////////
        
        public static const KAYSER:Unit = ucum(DELEGATE.ONE.divide(Prefix.CENTI.transform(METER)), true);
        public static const GAL:Unit = ucum(Prefix.CENTI.transform(METER).divide(SECOND.pow(2)), true);
        public static const DYNE:Unit = ucum(NonSI.DYNE, true);
        public static const ERG:Unit = ucum(NonSI.ERG, true);
        public static const POISE:Unit = ucum(NonSI.POISE, true);
        public static const BIOT:Unit = ucum(AMPERE.scale(10), true);
        public static const STOKES:Unit = ucum(NonSI.STOKE, true);
        public static const MAXWELL:Unit = ucum(NonSI.MAXWELL, true);
        public static const GAUSS:Unit = ucum(NonSI.GAUSS, true);
        public static const OERSTED:Unit = ucum(DELEGATE.ONE.divide(PI).multiply(AMPERE).divide(METER).scale(250), true);
        public static const GILBERT:Unit = ucum(OERSTED.multiply(Prefix.CENTI.transform(METER)), true);
        public static const STILB:Unit = ucum(CANDELA.divide(Prefix.CENTI.transform(METER).pow(2)), true);
        public static const LAMBERT:Unit = ucum(NonSI.LAMBERT, true);
        public static const PHOT:Unit = ucum(LUX.scale(1, 10000), true);
        public static const CURIE:Unit = ucum(NonSI.CURIE, true);
        public static const ROENTGEN:Unit = ucum(NonSI.ROENTGEN, true);
        public static const RAD:Unit = ucum(NonSI.RAD, true);
        public static const REM:Unit = ucum(NonSI.REM, true);
        
        /////////////////////////////////////////////////
        // INTERNATIONAL CUSTOMARY UNITS: UCUM 4.4 §31 //
        /////////////////////////////////////////////////
        
        public static const INCH_INTERNATIONAL:Unit = ucum(Prefix.CENTI.transform(METER).scale(254, 100), false);
        public static const FOOT_INTERNATIONAL:Unit = ucum(INCH_INTERNATIONAL.scale(12), false);
        public static const YARD_INTERNATIONAL:Unit = ucum(FOOT_INTERNATIONAL.scale(3), false);
        public static const MILE_INTERNATIONAL:Unit = ucum(FOOT_INTERNATIONAL.scale(5280), false);
        public static const FATHOM_INTERNATIONAL:Unit = ucum(FOOT_INTERNATIONAL.scale(6), false);
        public static const NAUTICAL_MILE_INTERNATIONAL:Unit = ucum(METER.scale(1852), false);
        public static const KNOT_INTERNATIONAL:Unit = ucum(NAUTICAL_MILE_INTERNATIONAL.divide(HOUR), false);
        public static const SQUARE_INCH_INTERNATIONAL:Unit = ucum(INCH_INTERNATIONAL.pow(2), false);
        public static const SQUARE_FOOT_INTERNATIONAL:Unit = ucum(FOOT_INTERNATIONAL.pow(2), false);
        public static const SQUARE_YARD_INTERNATIONAL:Unit = ucum(YARD_INTERNATIONAL.pow(2), false);
        public static const CUBIC_INCH_INTERNATIONAL:Unit = ucum(INCH_INTERNATIONAL.pow(3), false);
        public static const CUBIC_FOOT_INTERNATIONAL:Unit = ucum(FOOT_INTERNATIONAL.pow(3), false);
        public static const CUBIC_YARD_INTERNATIONAL:Unit = ucum(YARD_INTERNATIONAL.pow(3), false);
        public static const BOARD_FOOT_INTERNATIONAL:Unit = ucum(CUBIC_INCH_INTERNATIONAL.scale(144), false);
        public static const CORD_INTERNATIONAL:Unit = ucum(CUBIC_FOOT_INTERNATIONAL.scale(128), false);
        public static const MIL_INTERNATIONAL:Unit = ucum(INCH_INTERNATIONAL.scale(1, 1000), false);
        public static const CIRCULAR_MIL_INTERNATIONAL:Unit = ucum(MIL_INTERNATIONAL.multiply(PI).scale(1, 4), false);
        public static const HAND_INTERNATIONAL:Unit = ucum(INCH_INTERNATIONAL.scale(4), false);
        
        //////////////////////////////////////////
        // US SURVEY LENGTH UNITS: UCUM 4.4 §32 //
        //////////////////////////////////////////
        
        public static const FOOT_US_SURVEY:Unit = ucum(METER.scale(1200, 3937), false);
        public static const YARD_US_SURVEY:Unit = ucum(FOOT_US_SURVEY.scale(3), false);
        public static const INCH_US_SURVEY:Unit = ucum(FOOT_US_SURVEY.scale(1, 12), false);
        public static const ROD_US_SURVEY:Unit = ucum(FOOT_US_SURVEY.scale(33, 2), false);
        public static const CHAIN_US_SURVEY:Unit = ucum(ROD_US_SURVEY.scale(4), false);
        public static const LINK_US_SURVEY:Unit = ucum(CHAIN_US_SURVEY.scale(1, 100), false);
        public static const RAMDEN_CHAIN_US_SURVEY:Unit = ucum(FOOT_US_SURVEY.scale(100), false);
        public static const RAMDEN_LINK_US_SURVEY:Unit = ucum(CHAIN_US_SURVEY.scale(1, 100), false);
        public static const FATHOM_US_SURVEY:Unit = ucum(FOOT_US_SURVEY.scale(6), false);
        public static const FURLONG_US_SURVEY:Unit = ucum(ROD_US_SURVEY.scale(40), false);
        public static const MILE_US_SURVEY:Unit = ucum(FURLONG_US_SURVEY.scale(8), false);
        public static const ACRE_US_SURVEY:Unit = ucum(ROD_US_SURVEY.pow(2).scale(160), false);
        public static const SQUARE_ROD_US_SURVEY:Unit = ucum(ROD_US_SURVEY.pow(2), false);
        public static const SQUARE_MILE_US_SURVEY:Unit = ucum(MILE_US_SURVEY.pow(2), false);
        public static const SECTION_US_SURVEY:Unit = ucum(MILE_US_SURVEY.pow(2), false);
        public static const TOWNSHP_US_SURVEY:Unit = ucum(SECTION_US_SURVEY.scale(36), false);
        public static const MIL_US_SURVEY:Unit = ucum(INCH_US_SURVEY.scale(1, 1000), false);
        
        /////////////////////////////////////////////////
        // BRITISH IMPERIAL LENGTH UNITS: UCUM 4.4 §33 //
        /////////////////////////////////////////////////
        
        public static const INCH_BRITISH:Unit = ucum(Prefix.CENTI.transform(METER).scale(2539998, 1000000), false);
        public static const FOOT_BRITISH:Unit = ucum(INCH_BRITISH.scale(12), false);
        public static const ROD_BRITISH:Unit = ucum(FOOT_BRITISH.scale(33, 2), false);
        public static const CHAIN_BRITISH:Unit = ucum(ROD_BRITISH.scale(4), false);
        public static const LINK_BRITISH:Unit = ucum(CHAIN_BRITISH.scale(1, 100), false);
        public static const FATHOM_BRITISH:Unit = ucum(FOOT_BRITISH.scale(6), false);
        public static const PACE_BRITISH:Unit = ucum(FOOT_BRITISH.scale(5, 20), false);
        public static const YARD_BRITISH:Unit = ucum(FOOT_BRITISH.scale(3), false);
        public static const MILE_BRITISH:Unit = ucum(FOOT_BRITISH.scale(5280), false);
        public static const NAUTICAL_MILE_BRITISH:Unit = ucum(FOOT_BRITISH.scale(6080), false);
        public static const KNOT_BRITISH:Unit = ucum(NAUTICAL_MILE_BRITISH.divide(HOUR), false);
        public static const ACRE_BRITISH:Unit = ucum(YARD_BRITISH.pow(2).scale(4840), false);
        
        ///////////////////////////////////
        // US VOLUME UNITS: UCUM 4.4 §34 //
        ///////////////////////////////////
        
        public static const GALLON_US:Unit = ucum(CUBIC_INCH_INTERNATIONAL.scale(231), false);
        public static const BARREL_US:Unit = ucum(GALLON_US.scale(42), false);
        public static const QUART_US:Unit = ucum(GALLON_US.scale(1, 4), false);
        public static const PINT_US:Unit = ucum(QUART_US.scale(1, 2), false);
        public static const GILL_US:Unit = ucum(PINT_US.scale(1, 4), false);
        public static const FLUID_OUNCE_US:Unit = ucum(GILL_US.scale(1, 4), false);
        public static const FLUID_DRAM_US:Unit = ucum(FLUID_OUNCE_US.scale(1, 8), false);
        public static const MINIM_US:Unit = ucum(FLUID_DRAM_US.scale(1, 60), false);
        public static const CORD_US:Unit = ucum(CUBIC_FOOT_INTERNATIONAL.scale(128), false);
        public static const BUSHEL_US:Unit = ucum(CUBIC_INCH_INTERNATIONAL.scale(215042, 100), false);
        public static const GALLON_WINCHESTER:Unit = ucum(BUSHEL_US.scale(1, 8), false);
        public static const PECK_US:Unit = ucum(BUSHEL_US.scale(1, 4), false);
        public static const DRY_QUART_US:Unit = ucum(PECK_US.scale(1, 8), false);
        public static const DRY_PINT_US:Unit = ucum(DRY_QUART_US.scale(1, 2), false);
        public static const TABLESPOON_US:Unit = ucum(FLUID_OUNCE_US.scale(1, 2), false);
        public static const TEASPOON_US:Unit = ucum(TABLESPOON_US.scale(1, 3), false);
        public static const CUP_US:Unit = ucum(TABLESPOON_US.scale(16), false);
        
        /////////////////////////////////////////////////
        // BRITISH IMPERIAL VOLUME UNITS: UCUM 4.4 §35 //
        /////////////////////////////////////////////////
        
        public static const GALLON_BRITISH:Unit = ucum(LITER.scale(454609, 100000), false);
        public static const PECK_BRITISH:Unit = ucum(GALLON_BRITISH.scale(2), false);
        public static const BUSHEL_BRITISH:Unit = ucum(PECK_BRITISH.scale(4), false);
        public static const QUART_BRITISH:Unit = ucum(GALLON_BRITISH.scale(1, 4), false);
        public static const PINT_BRITISH:Unit = ucum(QUART_BRITISH.scale(1, 2), false);
        public static const GILL_BRITISH:Unit = ucum(PINT_BRITISH.scale(1, 4), false);
        public static const FLUID_OUNCE_BRITISH:Unit = ucum(GILL_BRITISH.scale(1, 5), false);
        public static const FLUID_DRAM_BRITISH:Unit = ucum(FLUID_OUNCE_BRITISH.scale(1, 8), false);
        public static const MINIM_BRITISH:Unit = ucum(FLUID_DRAM_BRITISH.scale(1, 60), false);
        
        ////////////////////////////////////////////
        // AVOIRDUPOIS WIEGHT UNITS: UCUM 4.4 §36 //
        ////////////////////////////////////////////
        
        public static const GRAIN:Unit = ucum(Prefix.MILLI.transform(GRAM).scale(6479891, 100000), false);
        public static const POUND:Unit = ucum(GRAM.scale(7000), false);
        public static const OUNCE:Unit = ucum(POUND.scale(1, 16), false);
        public static const DRAM:Unit = ucum(OUNCE.scale(1, 16), false);
        public static const SHORT_HUNDREDWEIGHT:Unit = ucum(POUND.scale(100), false);
        public static const LONG_HUNDREDWEIGHT:Unit = ucum(POUND.scale(112), false);
        public static const SHORT_TON:Unit = ucum(SHORT_HUNDREDWEIGHT.scale(20), false);
        public static const LONG_TON:Unit = ucum(LONG_HUNDREDWEIGHT.scale(20), false);
        public static const STONE:Unit = ucum(POUND.scale(14), false);
        
        // CONTINUED FROM SECTION §29
        // contains a forward reference to POUND, so we had to move it here, below section §36
        public static const POUND_FORCE:Unit = ucum(POUND.multiply(ACCELLERATION_OF_FREEFALL), false);
        
        /////////////////////////////////////
        // TROY WIEGHT UNITS: UCUM 4.4 §37 //
        /////////////////////////////////////
        
        public static const PENNYWEIGHT_TROY:Unit = ucum(GRAIN.scale(24), false);
        public static const OUNCE_TROY:Unit = ucum(PENNYWEIGHT_TROY.scale(24), false);
        public static const POUND_TROY:Unit = ucum(OUNCE_TROY.scale(12), false);
        
        /////////////////////////////////////////////
        // APOTECARIES' WEIGHT UNITS: UCUM 4.4 §38 //
        /////////////////////////////////////////////
        
        public static const SCRUPLE_APOTHECARY:Unit = ucum(GRAIN.scale(20), false);
        public static const DRAM_APOTHECARY:Unit = ucum(SCRUPLE_APOTHECARY.scale(3), false);
        public static const OUNCE_APOTHECARY:Unit = ucum(DRAM_APOTHECARY.scale(8), false);
        public static const POUND_APOTHECARY:Unit = ucum(OUNCE_APOTHECARY.scale(12), false);
        
        /////////////////////////////////////////////
        // TYPESETTER'S LENGTH UNITS: UCUM 4.4 §39 //
        /////////////////////////////////////////////
        
        public static const LINE:Unit = ucum(INCH_INTERNATIONAL.scale(1, 12), false);
        public static const POINT:Unit = ucum(LINE.scale(1, 6), false);
        public static const PICA:Unit = ucum(POINT.scale(12), false);
        public static const POINT_PRINTER:Unit = ucum(INCH_INTERNATIONAL.scale(13837, 1000000), false);
        public static const PICA_PRINTER:Unit = ucum(POINT_PRINTER.scale(12), false);
        public static const PIED:Unit = ucum(Prefix.CENTI.transform(METER).scale(3248, 100), false);
        public static const POUCE:Unit = ucum(PIED.scale(1, 12), false);
        public static const LINGE:Unit = ucum(POUCE.scale(1, 12), false);
        public static const DIDOT:Unit = ucum(LINGE.scale(1, 6), false);
        public static const CICERO:Unit = ucum(DIDOT.scale(12), false);
        
        //////////////////////////////////////
        // OTHER LEGACY UNITS: UCUM 4.5 §40 //
        //////////////////////////////////////
        
        public static const FAHRENHEIT:Unit = ucum(KELVIN.scale(5, 9).add(459.67), false);
        public static const CALORIE_AT_15C:Unit = ucum(JOULE.scale(41858, 10000), true);
        public static const CALORIE_AT_20C:Unit = ucum(JOULE.scale(41819, 10000), true);
        public static const CALORIE_MEAN:Unit = ucum(JOULE.scale(419002, 100000), true);
        public static const CALORIE_INTERNATIONAL_TABLE:Unit = ucum(JOULE.scale(41868, 10000), true);
        public static const CALORIE_THERMOCHEMICAL:Unit = ucum(JOULE.scale(4184, 1000), true);
        public static const CALORIE:Unit = ucum(CALORIE_THERMOCHEMICAL, true);
        public static const CALORIE_FOOD:Unit = ucum(Prefix.KILO.transform(CALORIE_THERMOCHEMICAL), false);
        public static const BTU_AT_39F:Unit = ucum(Prefix.KILO.transform(JOULE).scale(105967, 100000), false);
        public static const BTU_AT_59F:Unit = ucum(Prefix.KILO.transform(JOULE).scale(105480, 100000), false);
        public static const BTU_AT_60F:Unit = ucum(Prefix.KILO.transform(JOULE).scale(105468, 100000), false);
        public static const BTU_MEAN:Unit = ucum(Prefix.KILO.transform(JOULE).scale(105587, 100000), false);
        public static const BTU_INTERNATIONAL_TABLE:Unit = ucum(Prefix.KILO.transform(JOULE).scale(105505585262).scale(1, 100000000000), false);
        public static const BTU_THERMOCHEMICAL:Unit = ucum(Prefix.KILO.transform(JOULE).scale(105735, 100000), false);
        public static const BTU:Unit = ucum(BTU_THERMOCHEMICAL, false);
        public static const HORSEPOWER:Unit = ucum(FOOT_INTERNATIONAL.multiply(POUND_FORCE).divide(SECOND), false);
        
        /////////////////////////////////////////////////////////
        // SECTIONS §41-§43 skipped; implement later if needed //
        /////////////////////////////////////////////////////////
        
        ///////////////////////////////////////
        // MISCELLANEOUS UNITS: UCUM 4.5 §44 //
        ///////////////////////////////////////
        
        public static const STERE:Unit = ucum(METER.pow(3), true);
        public static const ANGSTROM:Unit = ucum(Prefix.NANO.transform(METER).scale(1, 10), false);
        public static const BARN:Unit = ucum(Prefix.FEMTO.transform(METER).pow(2).scale(100), false);
        public static const ATMOSPHERE_TECHNICAL:Unit = ucum(Prefix.KILO.transform(GRAM_FORCE).divide(Prefix.CENTI.transform(METER).pow(2)), false);
        public static const MHO:Unit = ucum(SIEMENS.alternate("mho"), true);
        public static const POUND_PER_SQUARE_INCH:Unit = ucum(POUND_FORCE.divide(INCH_INTERNATIONAL.pow(2)), false);
        public static const CIRCLE:Unit = ucum(PI.multiply(RADIAN).scale(2), false);
        public static const SPHERE:Unit = ucum(PI.multiply(STERADIAN).scale(4), false);
        public static const CARAT_METRIC:Unit = ucum(GRAM.scale(1, 5), false);
        public static const CARAT_GOLD:Unit = ucum(DELEGATE.ONE.scale(1, 24), false);
        
        ////////////////////////////////////////////////
        // INFORMATION TECHNOLOGY UNITS: UCUM 4.6 §45 //
        ////////////////////////////////////////////////
        
        public static const BIT:Unit = ucum(SI.BIT, true);
        public static const BYTE:Unit = ucum(NonSI.BYTE, true);
        public static const BAUD:Unit = ucum(DELEGATE.ONE.divide(SECOND), true);    
    }
}