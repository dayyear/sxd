package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FoolsDay_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ITEM_PACK_FULL:int = 1;
        public static const ERROR:int = 2;
        public static const fools_day_info:Object = {module:222, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const dig:Object = {module:222, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["fools_day_info", "dig"];

        public function Mod_FoolsDay_Base()
        {
            return;
        }// end function

    }
}
