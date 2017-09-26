package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SageQuicken_Base extends Object
    {
        public static const BUY:int = 0;
        public static const NOT_BUY:int = 1;
        public static const SUCCESS:int = 2;
        public static const NON_ACTIVITY_TIME:int = 3;
        public static const NOT_ENOUGH_BUY_TIMES:int = 4;
        public static const NOT_ENOUGH_DAOYUAN:int = 5;
        public static const NOT_ENOUGH_INGOT:int = 6;
        public static const PACK_FULL:int = 7;
        public static const NOT_OPEN_OPEN:int = 8;
        public static const FAILED:int = 9;
        public static const get_info:Object = {module:270, action:0, request:[], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil]]};
        public static const buy_item:Object = {module:270, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "buy_item"];

        public function Mod_SageQuicken_Base()
        {
            return;
        }// end function

    }
}
