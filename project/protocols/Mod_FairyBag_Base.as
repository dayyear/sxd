package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FairyBag_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const NO_ENOUGH_INGOT:int = 3;
        public static const NO_ACTIVITY_TIME:int = 4;
        public static const GOTTEN:int = 5;
        public static const FUNCTION_NO_OPEN:int = 6;
        public static const get_fairy_bag_info:Object = {module:354, action:0, request:[], response:[Utils.LongUtil, Utils.UByteUtil]};
        public static const get_coins:Object = {module:354, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.LongUtil]};
        public static const Actions:Array = ["get_fairy_bag_info", "get_coins"];

        public function Mod_FairyBag_Base()
        {
            return;
        }// end function

    }
}
