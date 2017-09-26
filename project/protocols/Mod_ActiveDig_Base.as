package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ActiveDig_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ITEM_PACK_FULL:int = 1;
        public static const NOT_ENOUGTH_FATE_GRID:int = 2;
        public static const ERROR:int = 3;
        public static const active_dig_info:Object = {module:229, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const dig:Object = {module:229, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["active_dig_info", "dig"];

        public function Mod_ActiveDig_Base()
        {
            return;
        }// end function

    }
}
