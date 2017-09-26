package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Practice_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGH_INGOT:int = 1;
        public static const NOT_ENOUGH_TIMES:int = 2;
        public static const quickly:Object = {module:45, action:0, request:[], response:[Utils.UByteUtil]};
        public static const quickly_all:Object = {module:45, action:1, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["quickly", "quickly_all"];

        public function Mod_Practice_Base()
        {
            return;
        }// end function

    }
}
