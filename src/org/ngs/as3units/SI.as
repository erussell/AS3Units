package org.ngs.as3units
{
    import org.ngs.as3units.unit.BaseUnit;

    /**
     * This class contains SI (Système International d'Unités) base units,
     * and derived units.
     * <p> 
     * It also defines the 20 SI prefixes used to form decimal multiples and
     * submultiples of SI units. For example:
     * [code]
     * import static org.jscience.physics.units.SI.*; // Static import.
     * ...
     * Unit HECTO_PASCAL = HECTO(PASCAL);
     * Unit KILO_METER = KILO(METER);
     * [/code]
     */
    public class SI extends SystemOfUnits
    {
        ////////////////
        // BASE UNITS //
        ////////////////
        
        /**
         * The base unit for electric current quantities (<code>A</code>).
         * The Ampere is that constant current which, if maintained in two straight
         * parallel conductors of infinite length, of negligible circular
         * cross-section, and placed 1 metre apart in vacuum, would produce between
         * these conductors a force equal to 2 × 10-7 newton per metre of length.
         * It is named after the French physicist Andre Ampere (1775-1836).
         */
        public static const AMPERE:Unit = new BaseUnit(DELEGATE, "A");
        
        /**
         * The base unit for luminous intensity quantities (<code>cd</code>).
         * The candela is the luminous intensity, in a given direction,
         * of a source that emits monochromatic radiation of frequency
         * 540 × 1012 hertz and that has a radiant intensity in that
         * direction of 1/683 watt per steradian
         * @see <a href="http://en.wikipedia.org/wiki/Candela"> 
         *      Wikipedia: Candela</a>
         */
        public static const CANDELA:Unit = new BaseUnit(DELEGATE, "cd");
        
        /**
         * The base unit for thermodynamic temperature quantities (<code>K</code>).
         * The kelvin is the 1/273.16th of the thermodynamic temperature of the
         * triple point of water. It is named after the Scottish mathematician and
         * physicist William Thomson 1st Lord Kelvin (1824-1907)
         */
        public static const KELVIN:Unit = new BaseUnit(DELEGATE, "K");
        
        /**
         * The base unit for mass quantities (<code>kg</code>).
         * It is the only SI:Unit unit with a prefix as part of its name and symbol.
         * The kilogram is equal to the mass of an international prototype in the
         * form of a platinum-iridium cylinder kept at Sevres in France.
         * @see   #GRAM
         */
        public static const KILOGRAM:Unit = new BaseUnit(DELEGATE, "kg");
        
        /**
         * The base unit for length quantities (<code>m</code>).
         * One meter was redefined in 1983 as the distance traveled by light in
         * a vacuum in 1/299,792,458 of a second.
         */
        public static const METRE:Unit = new BaseUnit(DELEGATE, "m");
        
        /**
         * Equivalent to {@link #METRE} (American spelling).
         */
        public static const METER:Unit = METRE;
        
        /**
         * The base unit for amount of substance quantities (<code>mol</code>).
         * The mole is the amount of substance of a system which contains as many
         * elementary entities as there are atoms in 0.012 kilogram of carbon 12.
         */
        public static const MOLE:Unit = new BaseUnit(DELEGATE, "mol");
        
        /**
         * The base unit for duration quantities (<code>s</code>).
         * It is defined as the duration of 9,192,631,770 cycles of radiation
         * corresponding to the transition between two hyperfine levels of
         * the ground state of cesium (1967 Standard).
         */
        public static const SECOND:Unit = new BaseUnit(DELEGATE, "s");
        
        ////////////////////////////////
        // SI DERIVED ALTERNATE UNITS //
        ////////////////////////////////
        
        /**
         * The derived unit for mass quantities (<code>g</code>).
         * The base unit for mass quantity is {@link #KILOGRAM}.
         */
        public static const GRAM:Unit = KILOGRAM.scale(1, 1000);
        
        /**
         * The unit for plane angle quantities (<code>rad</code>).
         * One radian is the angle between two radii of a circle such that the
         * length of the arc between them is equal to the radius.
         */
        public static const RADIAN:Unit = DELEGATE.ONE.alternate("rad");
        
        /**
         * The unit for solid angle quantities (<code>sr</code>).
         * One steradian is the solid angle subtended at the center of a sphere by
         * an area on the surface of the sphere that is equal to the radius squared.
         * The total solid angle of a sphere is 4*Pi steradians.
         */
        public static const STERADIAN:Unit = DELEGATE.ONE.alternate("sr");
        
        /**
         * The unit for binary information (<code>bit</code>).
         */
        public static const BIT:Unit = DELEGATE.ONE.alternate("bit");
        
        /**
         * The derived unit for frequency (<code>Hz</code>).
         * A unit of frequency equal to one cycle per second.
         * After Heinrich Rudolf Hertz (1857-1894), German physicist who was the
         * first to produce radio waves artificially.
         */
        public static const HERTZ:Unit = DELEGATE.ONE.divide(SECOND).alternate("Hz");
        
        /**
         * The derived unit for force (<code>N</code>).
         * One newton is the force required to give a mass of 1 kilogram an Force
         * of 1 metre per second per second. It is named after the English
         * mathematician and physicist Sir Isaac Newton (1642-1727).
         */
        public static const NEWTON:Unit = METRE.multiply(KILOGRAM).divide(SECOND.pow(2)).alternate("N");
        
        /**
         * The derived unit for pressure, stress (<code>Pa</code>).
         * One pascal is equal to one newton per square meter. It is named after
         * the French philosopher and mathematician Blaise Pascal (1623-1662).
         */
        public static const PASCAL:Unit = NEWTON.divide(METRE.pow(2)).alternate("Pa");
        
        /**
         * The derived unit for energy, work, quantity of heat (<code>J</code>).
         * One joule is the amount of work done when an applied force of 1 newton
         * moves through a distance of 1 metre in the direction of the force.
         * It is named after the English physicist James Prescott Joule (1818-1889).
         */
        public static const JOULE:Unit = NEWTON.multiply(METRE).alternate("J");
        
        /**
         * The derived unit for power, radiant, flux (<code>W</code>).
         * One watt is equal to one joule per second. It is named after the British
         * scientist James Watt (1736-1819).
         */
        public static const WATT:Unit = JOULE.divide(SECOND).alternate("W");
        
        /**
         * The derived unit for electric charge, quantity of electricity
         * (<code>C</code>).
         * One Coulomb is equal to the quantity of charge transferred in one second
         * by a steady current of one ampere. It is named after the French physicist
         * Charles Augustin de Coulomb (1736-1806).
         */
        public static const COULOMB:Unit = SECOND.multiply(AMPERE).alternate("C");
        
        /**
         * The derived unit for electric potential difference, electromotive force
         * (<code>V</code>).
         * One Volt is equal to the difference of electric potential between two
         * points on a conducting wire carrying a constant current of one ampere
         * when the power dissipated between the points is one watt. It is named
         * after the Italian physicist Count Alessandro Volta (1745-1827).
         */
        public static const VOLT:Unit = WATT.divide(AMPERE).alternate("V");
        
        /**
         * The derived unit for capacitance (<code>F</code>).
         * One Farad is equal to the capacitance of a capacitor having an equal
         * and opposite charge of 1 coulomb on each plate and a potential difference
         * of 1 volt between the plates. It is named after the British physicist
         * and chemist Michael Faraday (1791-1867).
         */
        public static const FARAD:Unit = COULOMB.divide(VOLT).alternate("F");
        
        /**
         * The derived unit for electric resistance (<code>Ω</code> or 
         * <code>Ohm</code>).
         * One Ohm is equal to the resistance of a conductor in which a current of
         * one ampere is produced by a potential of one volt across its terminals.
         * It is named after the German physicist Georg Simon Ohm (1789-1854).
         */
        public static const OHM:Unit = VOLT.divide(AMPERE).alternate("Ω");
        
        /**
         * The derived unit for electric conductance (<code>S</code>).
         * One Siemens is equal to one ampere per volt. It is named after
         * the German engineer Ernst Werner von Siemens (1816-1892).
         */
        public static const SIEMENS:Unit = AMPERE.divide(VOLT).alternate("S");
        
        /**
         * The derived unit for magnetic flux (<code>Wb</code>).
         * One Weber is equal to the magnetic flux that in linking a circuit of one
         * turn produces in it an electromotive force of one volt as it is uniformly
         * reduced to zero within one second. It is named after the German physicist
         * Wilhelm Eduard Weber (1804-1891).
         */
        public static const WEBER:Unit = VOLT.multiply(SECOND).alternate("Wb");
        
        /**
         * The derived unit for magnetic flux density (<code>T</code>).
         * One Tesla is equal equal to one weber per square meter. It is named
         * after the Serbian-born American electrical engineer and physicist
         * Nikola Tesla (1856-1943).
         */
        public static const TESLA:Unit = WEBER.divide(METRE.pow(2)).alternate("T");
        
        /**
         * The derived unit for inductance (<code>H</code>).
         * One Henry is equal to the inductance for which an induced electromotive
         * force of one volt is produced when the current is varied at the rate of
         * one ampere per second. It is named after the American physicist
         * Joseph Henry (1791-1878).
         */
        public static const HENRY:Unit = WEBER.divide(AMPERE).alternate("H");
        
        /**
         * The derived unit for Celsius temperature (<code>℃</code>).
         * This is a unit of temperature such as the freezing point of water
         * (at one atmosphere of pressure) is 0 ℃, while the boiling point is
         * 100 ℃.
         */
        public static const CELSIUS:Unit = KELVIN.add(273.15);
        
        /**
         * The derived unit for luminous flux (<code>lm</code>).
         * One Lumen is equal to the amount of light given out through a solid angle
         * by a source of one candela intensity radiating equally in all directions.
         */
        public static const LUMEN:Unit = CANDELA.multiply(STERADIAN).alternate("lm");
        
        /**
         * The derived unit for illuminance (<code>lx</code>).
         * One Lux is equal to one lumen per square meter.
         */
        public static const LUX:Unit = LUMEN.divide(METRE.pow(2)).alternate("lx");
        
        /**
         * The derived unit for activity of a radionuclide (<code>Bq</code>).
         * One becquerel is the radiation caused by one disintegration per second.
         * It is named after the French physicist, Antoine-Henri Becquerel
         * (1852-1908).
         */
        public static const BECQUEREL:Unit = DELEGATE.ONE.divide(SECOND).alternate("Bq");
        
        /**
         * The derived unit for absorbed dose, specific energy (imparted), kerma
         * (<code>Gy</code>).
         * One gray is equal to the dose of one joule of energy absorbed per one
         * kilogram of matter. It is named after the British physician
         * L. H. Gray (1905-1965).
         */
        public static const GRAY:Unit = JOULE.divide(KILOGRAM).alternate("Gy");
        
        /**
         * The derived unit for dose equivalent (<code>Sv</code>).
         * One Sievert is equal  is equal to the actual dose, in grays, multiplied
         * by a "quality factor" which is larger for more dangerous forms of
         * radiation. It is named after the Swedish physicist Rolf Sievert
         * (1898-1966).
         */
        public static const SIEVERT:Unit = JOULE.divide(KILOGRAM).alternate("Sv");
        
        /**
         * The derived unit for catalytic activity (<code>kat</code>).
         */
        public static const KATAL:Unit = MOLE.divide(SECOND).alternate("kat");
        
        //////////////////////////////
        // SI DERIVED PRODUCT UNITS //
        //////////////////////////////
        
        /**
         * The metric unit for velocity quantities (<code>m/s</code>).
         */
        public static const METRES_PER_SECOND:Unit = METRE.divide(SECOND);
        
        /**
         * Equivalent to {@link #METRES_PER_SECOND}.
         */
        public static const METERS_PER_SECOND:Unit = METRES_PER_SECOND;
        
        /**
         * The metric unit for acceleration quantities (<code>m/s²</code>).
         */
        public static const METRES_PER_SQUARE_SECOND:Unit = METRES_PER_SECOND.divide(SECOND);
        
        /**
         * Equivalent to {@link #METRES_PER_SQUARE_SECOND}.
         */
        public static const METERS_PER_SQUARE_SECOND:Unit = METRES_PER_SQUARE_SECOND;
        
        /**
         * The metric unit for area quantities (<code>m²</code>).
         */
        public static const SQUARE_METRE:Unit = METRE.multiply(METRE);
        
        /**
         * Equivalent to <code>SQUARE_METRE</code>.
         */
        public static const SQUARE_METER:Unit = SQUARE_METRE;
        
        /**
         * The metric unit for volume quantities (<code>m³</code>).
         */
        public static const CUBIC_METRE:Unit = SQUARE_METRE.multiply(METRE);
        
        /**
         * Equivalent to <code>KILO(METRE)</code>.
         */
        public static const KILOMETRE:Unit = METER.scale(1000);
        
        /**
         * Equivalent to {@link #KILOMETRE}.
         */
        public static const KILOMETER:Unit = KILOMETRE;
        
        /**
         * Equivalent to <code>CENTI(METRE)</code>.
         */
        public static const CENTIMETRE:Unit = METRE.scale(1, 100);
        
        /**
         * Equivalent to {@link #CENTIMETRE}.
         */
        public static const CENTIMETER:Unit = CENTIMETRE;
        
        /**
         * Equivalent to <code>MILLI(METRE)</code>.
         */
        public static const MILLIMETRE:Unit = METRE.scale(1, 1000);
        
        /**
         * Equivalent to {@link #MILLIMETRE}.
         */
        public static const MILLIMETER:Unit = MILLIMETRE;
    }
}