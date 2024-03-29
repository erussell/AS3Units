package org.ngs.as3units.format
{
    import org.ngs.as3units.NonSI;
    import org.ngs.as3units.Prefix;
    import org.ngs.as3units.SI;
    import org.ngs.as3units.UCUM;

    public class DefaultUnitSymbols extends SymbolMap
    {
        public function DefaultUnitSymbols () {
            
            // SI Prefixes
            
            lp(Prefix.YOTTA, "Y");
            lp(Prefix.ZETTA, "Z");
            lp(Prefix.EXA, "E");
            lp(Prefix.PETA, "P");
            lp(Prefix.TERA, "T");
            lp(Prefix.GIGA, "G");
            lp(Prefix.MEGA, "M");
            lp(Prefix.KILO, "k");
            lp(Prefix.HECTO, "h");
            lp(Prefix.DEKA, "da");
            lp(Prefix.DECI, "d");
            lp(Prefix.CENTI, "c");
            lp(Prefix.MILLI, "m");
            lp(Prefix.MICRO, "\u00B5");
            lp(Prefix.NANO, "n");
            lp(Prefix.PICO, "p");
            lp(Prefix.FEMTO, "f");
            lp(Prefix.ATTO, "a");
            lp(Prefix.ZEPTO, "z");
            lp(Prefix.YOCTO, "y");

            // SI Units

            lu(SI.AMPERE, "A");
            lu(SI.BECQUEREL, "Bq");
            lu(SI.CANDELA, "cd");
            lu(SI.CELSIUS, "\u00B0C");
            lu(SI.CELSIUS, "\u2103");
            lu(SI.CELSIUS, "CelsiusC");
            lu(SI.CELSIUS, "degC");
            lu(SI.COULOMB, "C");
            lu(SI.FARAD, "F");
            lu(SI.GRAM, "g");
            lu(SI.GRAY, "Gy");
            lu(SI.HENRY, "H");
            lu(SI.HERTZ, "Hz");
            lu(SI.JOULE, "J");
            lu(SI.KATAL, "kat");
            lu(SI.KELVIN, "K");
            lu(SI.LUMEN, "lm");
            lu(SI.LUX, "lx");
            lu(SI.METRE, "m");
            lu(SI.MOLE, "mol");
            lu(SI.NEWTON, "N");
            lu(SI.OHM, "\u03a9");
            lu(SI.PASCAL, "Pa");
            lu(SI.RADIAN, "rad");
            lu(SI.SECOND, "s");
            lu(SI.SIEMENS, "S");
            lu(SI.SIEVERT, "Sv");
            lu(SI.STERADIAN, "sr");
            lu(SI.TESLA, "T");
            lu(SI.VOLT, "V");
            lu(SI.WATT, "W");
            lu(SI.WEBER, "Wb");

            // Non-SI Units

            lu(NonSI.PERCENT, "%");
            lu(NonSI.PERCENT, "Percent");
            lu(NonSI.PER_MIL, "\u2030");
            lu(NonSI.PER_MIL, "Permil");
            lu(NonSI.PER_MIL, "Permille");
            lu(NonSI.DECIBEL, "dB");
            lu(NonSI.G, "grav");
            lu(NonSI.ATOM, "atom");
            lu(NonSI.REVOLUTION, "rev");
            lu(NonSI.DEGREE_ANGLE, "\u00B0");
            lu(NonSI.DEGREE_ANGLE, "deg");
            lu(NonSI.DEGREE_ANGLE, "ddeg");
            lu(NonSI.MINUTE_ANGLE, "'");
            lu(NonSI.SECOND_ANGLE, "\"");
            lu(NonSI.CENTIRADIAN, "centiradian");
            lu(NonSI.GRADE, "grade");
            lu(NonSI.ARE, "a");
            lu(NonSI.HECTARE, "ha");
            lu(NonSI.BYTE, "byte");
            lu(NonSI.ACRE, "acre");
            lu(NonSI.MINUTE, "min");
            lu(NonSI.HOUR, "h");
            lu(NonSI.DAY, "day");
            lu(NonSI.WEEK, "week");
            lu(NonSI.YEAR, "year");
            lu(NonSI.MONTH, "month");
            lu(NonSI.DAY_SIDEREAL, "day_sidereal");
            lu(NonSI.YEAR_SIDEREAL, "year_sidereal");
            lu(NonSI.YEAR_CALENDAR, "year_calendar");
            lu(NonSI.MILLISECOND, "msec");
            lu(NonSI.MILLISECOND, "ms");
            lu(NonSI.E, "e");
            lu(NonSI.FARADAY, "Fd");
            lu(NonSI.FRANKLIN, "Fr");
            lu(NonSI.GILBERT, "Gi");
            lu(NonSI.ERG, "erg");
            lu(NonSI.ELECTRON_VOLT, "eV");
            lu(NonSI.LAMBERT, "La");
            lu(NonSI.FOOT, "ft");
            lu(NonSI.FOOT_SURVEY_US, "foot_survey_us");
            lu(NonSI.YARD, "yd");
            lu(NonSI.INCH, "in");
            lu(NonSI.MILE, "mi");
            lu(NonSI.NAUTICAL_MILE, "nmi");
            lu(NonSI.MILES_PER_HOUR, "mph");
            lu(NonSI.ANGSTROM, "\u00C5");
            lu(NonSI.ASTRONOMICAL_UNIT, "ua");
            lu(NonSI.LIGHT_YEAR, "ly");
            lu(NonSI.PARSEC, "pc");
            lu(NonSI.POINT, "pt");
            lu(NonSI.PIXEL, "pixel");
            lu(NonSI.FOOT_MODIFIED_AMERICAN, "foot_modified_american");
            lu(NonSI.FOOT_CLARKE, "foot_Clarke");
            lu(NonSI.FOOT_INDIAN, "foot_Indian");
            lu(NonSI.LINK, "ln");
            lu(NonSI.LINK_BENOIT, "link_Benoit");
            lu(NonSI.LINK_SEARS, "link_Sears");
            lu(NonSI.CHAIN_BENOIT, "chain_Benoit");
            lu(NonSI.CHAIN_SEARS, "chain_Sears");
            lu(NonSI.YARD, "yd");
            lu(NonSI.YARD_SEARS, "yard_Sears");
            lu(NonSI.YARD_INDIAN, "yard_Indian");
            lu(NonSI.FATHOM, "f");
            lu(NonSI.MAXWELL, "Mx");
            lu(NonSI.GAUSS, "G");
            lu(NonSI.ATOMIC_MASS, "u");
            lu(NonSI.ELECTRON_MASS, "me");
            lu(NonSI.POUND, "lb");
            lu(NonSI.OUNCE, "oz");
            lu(NonSI.TON_US, "ton_us");
            lu(NonSI.TON_UK, "ton_uk");
            lu(NonSI.METRIC_TON, "t");
            lu(NonSI.DYNE, "dyn");
            lu(NonSI.KILOGRAM_FORCE, "kgf");
            lu(NonSI.POUND_FORCE, "lbf");
            lu(NonSI.HORSEPOWER, "hp");
            lu(NonSI.ATMOSPHERE, "atm");
            lu(NonSI.BAR, "bar");
            lu(NonSI.MILLIMETER_OF_MERCURY, "mmHg");
            lu(NonSI.INCH_OF_MERCURY, "inHg");
            lu(NonSI.RAD, "rd");
            lu(NonSI.REM, "rem");
            lu(NonSI.CURIE, "Ci");
            lu(NonSI.RUTHERFORD, "Rd");
            lu(NonSI.SPHERE, "sphere");
            lu(NonSI.RANKINE, "\u00B0R");
            lu(NonSI.FAHRENHEIT, "\u00B0F");
            lu(NonSI.FAHRENHEIT, "\u2109");
            lu(NonSI.FAHRENHEIT, "FahrenheitF");
            lu(NonSI.FAHRENHEIT, "degF");
            lu(NonSI.KNOT, "kn");
            lu(NonSI.MACH, "Mach");
            lu(NonSI.C, "c");
            lu(NonSI.LITRE, "L");
            lu(NonSI.GALLON_LIQUID_US, "gal");
            lu(NonSI.OUNCE_LIQUID_US, "oz");
            lu(NonSI.GALLON_DRY_US, "gallon_dry_us");
            lu(NonSI.GALLON_UK, "gallon_uk");
            lu(NonSI.OUNCE_LIQUID_UK, "oz_uk");
            lu(NonSI.CFS, "cfs");
            lu(NonSI.ROENTGEN, "Roentgen");

            // UCUM units

            lu(UCUM.METER, "m");
            lu(UCUM.SECOND, "s");
            lu(UCUM.GRAM, "g");
            lu(UCUM.RADIAN, "rad");
            lu(UCUM.KELVIN, "K");
            lu(UCUM.COULOMB, "C");
            lu(UCUM.CANDELA, "ca");
            lu(UCUM.TRIILLIONS, "10\u00b9\u00b2");
            lu(UCUM.BILLIONS, "10\u2079");
            lu(UCUM.MILLIONS, "10\u2076");
            lu(UCUM.THOUSANDS, "10\u00b3");
            lu(UCUM.HUNDREDS, "10\u00b2");
            lu(UCUM.PI, "\u03c0");
            lu(UCUM.PERCENT, "%");
            lu(UCUM.PER_THOUSAND, "ppth");
            lu(UCUM.PER_MILLION, "ppm");
            lu(UCUM.PER_BILLION, "ppb");
            lu(UCUM.PER_TRILLION, "pptr");
            lu(UCUM.MOLE, "mol");
            lu(UCUM.STERADIAN, "sr");
            lu(UCUM.HERTZ, "Hz");
            lu(UCUM.NEWTON, "N");
            lu(UCUM.PASCAL, "Pa");
            lu(UCUM.JOULE, "J");
            lu(UCUM.WATT, "W");
            lu(UCUM.AMPERE, "A");
            lu(UCUM.VOLT, "V");
            lu(UCUM.FARAD, "F");
            lu(UCUM.OHM, "\u03a9");
            lu(UCUM.SIEMENS, "S");
            lu(UCUM.WEBER, "Wb");
            lu(UCUM.CELSIUS, "\u00b0C");
            lu(UCUM.TESLA, "T");
            lu(UCUM.HENRY, "H");
            lu(UCUM.LUMEN, "lm");
            lu(UCUM.LUX, "lx");
            lu(UCUM.BECQUEREL, "Bq");
            lu(UCUM.GRAY, "Gy");
            lu(UCUM.SIEVERT, "Sv");
            lu(UCUM.DEGREE, "\u00b0");
            lu(UCUM.GRADE, "\u25a1g");
            lu(UCUM.MINUTE_ANGLE, "'");
            lu(UCUM.SECOND_ANGLE, "\"");
            lu(UCUM.LITER, "l");
            lu(UCUM.ARE, "a");
            lu(UCUM.MINUTE, "min");
            lu(UCUM.HOUR, "h");
            lu(UCUM.DAY, "d");
            lu(UCUM.YEAR_TROPICAL, "a_t");
            lu(UCUM.YEAR_JULIAN, "a_j");
            lu(UCUM.YEAR_GREGORIAN, "a_g");
            lu(UCUM.YEAR, "a");
            lu(UCUM.WEEK, "wk");
            lu(UCUM.MONTH_SYNODAL, "mo_s");
            lu(UCUM.MONTH_JULIAN, "mo_j");
            lu(UCUM.MONTH_GREGORIAN, "mo_g");
            lu(UCUM.MONTH, "mo");
            lu(UCUM.TONNE, "t");
            lu(UCUM.BAR, "bar");
            lu(UCUM.ATOMIC_MASS_UNIT, "u");
            lu(UCUM.ELECTRON_VOLT, "eV");
            lu(UCUM.ASTRONOMIC_UNIT, "AU");
            lu(UCUM.PARSEC, "PC");
            lu(UCUM.C, "c");
            lu(UCUM.PLANCK, "h");
            lu(UCUM.BOLTZMAN, "k");
            lu(UCUM.PERMITTIVITY_OF_VACUUM, "\u03b5\u2080");
            lu(UCUM.PERMEABILITY_OF_VACUUM, "\u03bc\u2080");
            lu(UCUM.ELEMENTARY_CHARGE, "e");
            lu(UCUM.ELECTRON_MASS, "m_e");
            lu(UCUM.PROTON_MASS, "m_p");
            lu(UCUM.NEWTON_CONSTANT_OF_GRAVITY, "G");
            lu(UCUM.ACCELLERATION_OF_FREEFALL, "g_n");
            lu(UCUM.ATMOSPHERE, "atm");
            lu(UCUM.LIGHT_YEAR, "l.y.");
            lu(UCUM.GRAM_FORCE, "gf");
            lu(UCUM.KAYSER, "K");
            lu(UCUM.GAL, "Gal");
            lu(UCUM.DYNE, "dyn");
            lu(UCUM.ERG, "erg");
            lu(UCUM.POISE, "P");
            lu(UCUM.BIOT, "Bi");
            lu(UCUM.STOKES, "St");
            lu(UCUM.MAXWELL, "Mx");
            lu(UCUM.GAUSS, "Gs");
            lu(UCUM.OERSTED, "Oe");
            lu(UCUM.GILBERT, "Gb");
            lu(UCUM.STILB, "sb");
            lu(UCUM.LAMBERT, "La");
            lu(UCUM.PHOT, "ph");
            lu(UCUM.CURIE, "Ci");
            lu(UCUM.ROENTGEN, "R");
            lu(UCUM.RAD, "RAD");
            lu(UCUM.REM, "REM");
            lu(UCUM.INCH_INTERNATIONAL, "in_i");
            lu(UCUM.FOOT_INTERNATIONAL, "ft_i");
            lu(UCUM.YARD_INTERNATIONAL, "yd_i");
            lu(UCUM.MILE_INTERNATIONAL, "mi_i");
            lu(UCUM.FATHOM_INTERNATIONAL, "fth_i");
            lu(UCUM.NAUTICAL_MILE_INTERNATIONAL, "nmi_i");
            lu(UCUM.KNOT_INTERNATIONAL, "kn_i");
            lu(UCUM.SQUARE_INCH_INTERNATIONAL, "sin_i");
            lu(UCUM.SQUARE_FOOT_INTERNATIONAL, "sft_i");
            lu(UCUM.SQUARE_YARD_INTERNATIONAL, "syd_i");
            lu(UCUM.CUBIC_INCH_INTERNATIONAL, "cin_i");
            lu(UCUM.CUBIC_FOOT_INTERNATIONAL, "cft_i");
            lu(UCUM.CUBIC_YARD_INTERNATIONAL, "cyd_i");
            lu(UCUM.BOARD_FOOT_INTERNATIONAL, "bf_i");
            lu(UCUM.CORD_INTERNATIONAL, "cr_i");
            lu(UCUM.MIL_INTERNATIONAL, "mil_i");
            lu(UCUM.CIRCULAR_MIL_INTERNATIONAL, "cml_i");
            lu(UCUM.HAND_INTERNATIONAL, "hd_i");
            lu(UCUM.FOOT_US_SURVEY, "ft_us");
            lu(UCUM.YARD_US_SURVEY, "yd_us");
            lu(UCUM.INCH_US_SURVEY, "in_us");
            lu(UCUM.ROD_US_SURVEY, "rd_us");
            lu(UCUM.CHAIN_US_SURVEY, "ch_us");
            lu(UCUM.LINK_US_SURVEY, "lk_us");
            lu(UCUM.RAMDEN_CHAIN_US_SURVEY, "rch_us");
            lu(UCUM.RAMDEN_LINK_US_SURVEY, "rlk_us");
            lu(UCUM.FATHOM_US_SURVEY, "fth_us");
            lu(UCUM.FURLONG_US_SURVEY, "fur_us");
            lu(UCUM.MILE_US_SURVEY, "mi_us");
            lu(UCUM.ACRE_US_SURVEY, "acr_us");
            lu(UCUM.SQUARE_ROD_US_SURVEY, "src_us");
            lu(UCUM.SQUARE_MILE_US_SURVEY, "smi_us");
            lu(UCUM.SECTION_US_SURVEY, "sct");
            lu(UCUM.TOWNSHP_US_SURVEY, "twp");
            lu(UCUM.MIL_US_SURVEY, "mil_us");
            lu(UCUM.INCH_BRITISH, "in_br");
            lu(UCUM.FOOT_BRITISH, "ft_br");
            lu(UCUM.ROD_BRITISH, "rd_br");
            lu(UCUM.CHAIN_BRITISH, "ch_br");
            lu(UCUM.LINK_BRITISH, "lk_br");
            lu(UCUM.FATHOM_BRITISH, "fth_br");
            lu(UCUM.PACE_BRITISH, "pc_br");
            lu(UCUM.YARD_BRITISH, "yd_br");
            lu(UCUM.MILE_BRITISH, "mi_br");
            lu(UCUM.NAUTICAL_MILE_BRITISH, "nmi_br");
            lu(UCUM.KNOT_BRITISH, "kn_br");
            lu(UCUM.ACRE_BRITISH, "acr_br");
            lu(UCUM.GALLON_US, "gal_us");
            lu(UCUM.BARREL_US, "bbl_us");
            lu(UCUM.QUART_US, "qt_us");
            lu(UCUM.PINT_US, "pt_us");
            lu(UCUM.GILL_US, "gil_us");
            lu(UCUM.FLUID_OUNCE_US, "foz_us");
            lu(UCUM.FLUID_DRAM_US, "fdr_us");
            lu(UCUM.MINIM_US, "min_us");
            lu(UCUM.CORD_US, "crd_us");
            lu(UCUM.BUSHEL_US, "bu_us");
            lu(UCUM.GALLON_WINCHESTER, "gal_wi");
            lu(UCUM.PECK_US, "pk_us");
            lu(UCUM.DRY_QUART_US, "dqt_us");
            lu(UCUM.DRY_PINT_US, "dpt_us");
            lu(UCUM.TABLESPOON_US, "tbs_us");
            lu(UCUM.TEASPOON_US, "tsp_us");
            lu(UCUM.CUP_US, "cup_us");
            lu(UCUM.GALLON_BRITISH, "gal_br");
            lu(UCUM.PECK_BRITISH, "pk_br");
            lu(UCUM.BUSHEL_BRITISH, "bu_br");
            lu(UCUM.QUART_BRITISH, "qt_br");
            lu(UCUM.PINT_BRITISH, "pt_br");
            lu(UCUM.GILL_BRITISH, "gil_br");
            lu(UCUM.FLUID_OUNCE_BRITISH, "foz_br");
            lu(UCUM.FLUID_DRAM_BRITISH, "fdr_br");
            lu(UCUM.MINIM_BRITISH, "min_br");
            lu(UCUM.GRAIN, "gr");
            lu(UCUM.POUND, "lb_av");
            lu(UCUM.OUNCE, "oz_av");
            lu(UCUM.DRAM, "dr_av");
            lu(UCUM.SHORT_HUNDREDWEIGHT, "scwt_av");
            lu(UCUM.LONG_HUNDREDWEIGHT, "lcwt_av");
            lu(UCUM.SHORT_TON, "ston_av");
            lu(UCUM.LONG_TON, "lton_av");
            lu(UCUM.STONE, "stone_av");
            lu(UCUM.POUND_FORCE, "lbf");
            lu(UCUM.PENNYWEIGHT_TROY, "pwt_tr");
            lu(UCUM.OUNCE_TROY, "oz_tr");
            lu(UCUM.POUND_TROY, "lb_tr");
            lu(UCUM.SCRUPLE_APOTHECARY, "sc_ap");
            lu(UCUM.DRAM_APOTHECARY, "dr_ap");
            lu(UCUM.OUNCE_APOTHECARY, "oz_ap");
            lu(UCUM.POUND_APOTHECARY, "lb_ap");
            lu(UCUM.LINE, "lne");
            lu(UCUM.POINT, "pnt");
            lu(UCUM.PICA, "pca");
            lu(UCUM.POINT_PRINTER, "pnt_pr");
            lu(UCUM.PICA_PRINTER, "pca_pr");
            lu(UCUM.PIED, "pied");
            lu(UCUM.POUCE, "pouce");
            lu(UCUM.LINGE, "linge");
            lu(UCUM.DIDOT, "didot");
            lu(UCUM.CICERO, "cicero");
            lu(UCUM.FAHRENHEIT, "\u00b0F");
            lu(UCUM.CALORIE_AT_15C, "cal15\u00b0C");
            lu(UCUM.CALORIE_AT_20C, "cal20\u00b0C");
            lu(UCUM.CALORIE_MEAN, "cal_m");
            lu(UCUM.CALORIE_INTERNATIONAL_TABLE, "cal_IT");
            lu(UCUM.CALORIE_THERMOCHEMICAL, "cal_th");
            lu(UCUM.CALORIE, "cal");
            lu(UCUM.CALORIE_FOOD, "Cal");
            lu(UCUM.BTU_AT_39F, "Btu39\u00b0F");
            lu(UCUM.BTU_AT_59F, "Btu59\u00b0F");
            lu(UCUM.BTU_AT_60F, "Btu60\u00b0F");
            lu(UCUM.BTU_MEAN, "Btu_m");
            lu(UCUM.BTU_INTERNATIONAL_TABLE, "Btu_IT");
            lu(UCUM.BTU_THERMOCHEMICAL, "Btu_th");
            lu(UCUM.BTU, "btu");
            lu(UCUM.HORSEPOWER, "HP");
            lu(UCUM.STERE, "st");
            lu(UCUM.ANGSTROM, "\u00c5");
            lu(UCUM.BARN, "b");
            lu(UCUM.ATMOSPHERE_TECHNICAL, "at");
            lu(UCUM.MHO, "mho");
            lu(UCUM.POUND_PER_SQUARE_INCH, "psi");
            lu(UCUM.CIRCLE, "circ");
            lu(UCUM.SPHERE, "sph");
            lu(UCUM.CARAT_METRIC, "ct_m");
            lu(UCUM.CARAT_GOLD, "ct_Au");
            lu(UCUM.BIT, "bit");
            lu(UCUM.BYTE, "B");
            lu(UCUM.BAUD, "Bd");
        }
    }
}