package org.ngs.as3units
{
    import org.ngs.as3units.unit.DefaultUnitDelegate;
    import org.ngs.as3units.unit.UnitDelegate;

    internal class SystemOfUnits
    {   
        protected static function get DELEGATE () : UnitDelegate {
            return DefaultUnitDelegate.INSTANCE;
        }
    }
}