package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MonthCard_Base extends Object
    {
        public static const MONTH_CARD_API:int = 0;
        public static const HALF_YEAR_CARD_API:int = 1;
        public static const YEAR_CARD_API:int = 2;
        public static const NULL:int = 3;
        public static const YES:int = 4;
        public static const NO:int = 5;
        public static const SUCCESS:int = 6;
        public static const NOT_ENOUGH_INGOT:int = 7;
        public static const ALREADY_BUY:int = 8;
        public static const PACK_FULL:int = 9;
        public static const ALREADY_DRAWED:int = 10;
        public static const NOT_ENOUGH_GIFT:int = 11;
        public static const IS_YEAR_CARD:int = 12;
        public static const ALREADY_GET:int = 13;
        public static const NOT_ENOUGH_DAYS:int = 14;
        public static const ITEM_PACK_FULL:int = 15;
        public static const SELECT:int = 16;
        public static const CANCEL:int = 17;
        public static const ALL:int = 18;
        public static const SINGLE:int = 19;
        public static const FUNCTION_NO_OPEN:int = 20;
        public static const FAILURE:int = 21;
        public static const FORBIDDEN:int = 22;
        public static const TOOLONG:int = 23;
        public static const month_card_info:Object = {module:182, action:0, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const buy_month_card:Object = {module:182, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const draw_info:Object = {module:182, action:2, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const draw:Object = {module:182, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_gift:Object = {module:182, action:4, request:[], response:[Utils.UByteUtil]};
        public static const month_card_simple_info:Object = {module:182, action:5, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil]};
        public static const upgrade_card:Object = {module:182, action:6, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const month_gift_data:Object = {module:182, action:10, request:[], response:[[Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const get_month_gift:Object = {module:182, action:11, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const rebuy:Object = {module:182, action:12, request:[], response:[Utils.UByteUtil]};
        public static const get_card_spirit_info:Object = {module:182, action:13, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ShortUtil], Utils.UByteUtil, Utils.StringUtil]};
        public static const select_function:Object = {module:182, action:14, request:[Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.ShortUtil]]};
        public static const set_follow:Object = {module:182, action:15, request:[], response:[Utils.UByteUtil]};
        public static const get_history_record:Object = {module:182, action:16, request:[], response:[[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const set_nickname:Object = {module:182, action:17, request:[Utils.StringUtil], response:[Utils.UByteUtil, Utils.StringUtil]};
        public static const Actions:Array = ["month_card_info", "buy_month_card", "draw_info", "draw", "get_gift", "month_card_simple_info", "upgrade_card", "month_gift_data", "get_month_gift", "rebuy", "get_card_spirit_info", "select_function", "set_follow", "get_history_record", "set_nickname"];

        public function Mod_MonthCard_Base()
        {
            return;
        }// end function

    }
}
