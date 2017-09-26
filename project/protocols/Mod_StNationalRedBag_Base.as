package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StNationalRedBag_Base extends Object
    {
        public static const ST:int = 0;
        public static const GLOBAL:int = 1;
        public static const TRUE:int = 2;
        public static const FALSE:int = 3;
        public static const SUCCESS:int = 4;
        public static const FUNCTION_NO_OPEN:int = 5;
        public static const ACTIVITY_CLOSE:int = 6;
        public static const DAY_COINS_LIMIT:int = 7;
        public static const SNATCH_UP:int = 8;
        public static const BAG_NO_AVALIABLE:int = 9;
        public static const DUPLICATE_SNATCH:int = 10;
        public static const MSG_TOO_LONG:int = 11;
        public static const COIN_ERROR:int = 12;
        public static const BAG_COUNT_ERROR:int = 13;
        public static const TIMES_USE_UP:int = 14;
        public static const NO_ENOUGH_COINS:int = 15;
        public static const NO_ENOUGH_ACTIVITY:int = 16;
        public static const get_info:Object = {module:284, action:0, request:[], response:[Utils.IntUtil, Utils.LongUtil, Utils.IntUtil, Utils.LongUtil, [Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil], [Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.LongUtil, Utils.LongUtil, Utils.LongUtil, Utils.LongUtil]};
        public static const snatch:Object = {module:284, action:1, request:[Utils.UByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.LongUtil]};
        public static const get_snatch_history:Object = {module:284, action:2, request:[Utils.UByteUtil, Utils.IntUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]};
        public static const push:Object = {module:284, action:3, request:[Utils.UByteUtil, Utils.LongUtil, Utils.ShortUtil, Utils.StringUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const notify_new_bag:Object = {module:284, action:4, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const notify_snatch_bag:Object = {module:284, action:5, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]]};
        public static const notify_complete_bag:Object = {module:284, action:6, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_info", "snatch", "get_snatch_history", "push", "notify_new_bag", "notify_snatch_bag", "notify_complete_bag"];

        public function Mod_StNationalRedBag_Base()
        {
            return;
        }// end function

    }
}
