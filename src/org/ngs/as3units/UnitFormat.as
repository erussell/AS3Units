package org.ngs.as3units
{
    import org.ngs.as3units.format.SymbolMap;

    public interface UnitFormat 
    {
        function format (unit:Unit) : String;
        
        function parse (source:String) : Unit;
        
        function get symbols () : SymbolMap;
    }
}