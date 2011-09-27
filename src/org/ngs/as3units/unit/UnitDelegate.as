package org.ngs.as3units.unit
{   
    import org.ngs.as3units.Unit;
    import org.ngs.as3units.UnitConverter;

    /** */
    public interface UnitDelegate 
    {
        function get ONE () : Unit;
        
        function putSymbol (unit:Unit, symbol:String) : void;
        
        function compatible (a:Unit, b:Unit) : Boolean;
        
        function alternate (unit:Unit, symbol:String) : Unit;
        
        function annotate (unit:Unit, annotation:String) : Unit;
        
        function transform (unit:Unit, operation:UnitConverter) : Unit;
        
        function multiply (a:Unit, b:Unit) : Unit;
        
        function divide (a:Unit, b:Unit) : Unit;
        
        function pow (unit:Unit, exponent:int) : Unit;
        
        function root (unit:Unit, root:int) : Unit;
        
        function getConverter (from:Unit, to:Unit) : UnitConverter;
    }
}