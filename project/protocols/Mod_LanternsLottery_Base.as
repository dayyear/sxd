package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LanternsLottery_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const NO_ACTIVITY_TIME:int = 2;
        public static const TIMES_LIMIT:int = 3;
        public static const NOT_ENOUGH_INGOT:int = 4;
        public static const FAILURE:int = 5;
        public static const NOT_LOTTERY:int = 6;
        public static const ITEM_PACK_FULL:int = 7;
        public static const NOT_ENOUGH_WICK:int = 8;
        public static const get_lanterns_lottery_info:Object = {module:302, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const start_lottery:Object = {module:302, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const refresh_award:Object = {module:302, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const get_award:Object = {module:302, action:3, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil]};
        public static const get_exchange_info:Object = {module:302, action:4, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const exchange:Object = {module:302, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_lanterns_lottery_info", "start_lottery", "refresh_award", "get_award", "get_exchange_info", "exchange"];

        public function Mod_LanternsLottery_Base()
        {
            return;
        }// end function

    }
}
