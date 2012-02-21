package org.ngs.as3units
{
    import org.ngs.as3units.unit.DefaultUnitDelegate;
    import org.ngs.as3units.unit.UnitDelegate;

    public class SystemOfUnits
    {   
        protected static function get DELEGATE () : UnitDelegate {
            return DefaultUnitDelegate.INSTANCE;
        }
        
        public static function forEachUnit (fn:Function, thisObject:Object=null) : void {
            s_allUnits.forEach(fn, thisObject);
        }
        
        private static var s_allUnits:Array = [];
        
        protected static function u (unit:Unit) : Unit {
            s_allUnits.push(unit);
            return unit;
        }
    }
}