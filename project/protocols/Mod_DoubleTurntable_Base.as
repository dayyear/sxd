package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_DoubleTurntable_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_IN_ACTIVITY:int = 1;
        public static const FUNCTION_UNOPEN:int = 2;
        public static const NOT_ENOUGHT_PACK:int = 3;
        public static const NOT_ENOUGHT_COIN:int = 4;
        public static const NOT_ENOUGHT_INGOT:int = 5;
        public static const TODAY_LIMIT:int = 6;
        public static const FAILURE:int = 7;
        public static const GOLD:int = 8;
        public static const SILVER:int = 9;
        public static const NOT_ENOUGHT_GOLD:int = 10;
        public static const NOT_ENOUGHT_SILVER:int = 11;
        public static const TIMES_LIMIT:int = 12;
        public static const DRAGONBALL_PACK_FULL:int = 13;
        public static const FATE_PACK_FULL:int = 14;
        public static const get_turntable_info:Object = {module:267, action:0, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const turntable:Object = {module:267, action:1, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_exchange_award_info:Object = {module:267, action:2, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const exchange_award:Object = {module:267, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_turntable_info", "turntable", "get_exchange_award_info", "exchange_award"];

        public function Mod_DoubleTurntable_Base()
        {
            return;
        }// end function

    }
}
