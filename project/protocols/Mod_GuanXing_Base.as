package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_GuanXing_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const NORMAL:int = 2;
        public static const HIGH_LEVEL:int = 3;
        public static const SUCCESS:int = 4;
        public static const ACTIVITY_CLOSE:int = 5;
        public static const TIME_USED_UP:int = 6;
        public static const FUNCTION_NO_OPEN:int = 7;
        public static const NO_ENOUGH_SCORE:int = 8;
        public static const PACKAGE_FULL:int = 9;
        public static const LIMIT:int = 10;
        public static const FATE_PACKAGE_FULL:int = 11;
        public static const get_info:Object = {module:244, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const explore:Object = {module:244, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil], Utils.IntUtil]};
        public static const get_exchange_info:Object = {module:244, action:2, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange:Object = {module:244, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_info", "explore", "get_exchange_info", "exchange"];

        public function Mod_GuanXing_Base()
        {
            return;
        }// end function

    }
}
