package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_DayFunds_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGH_INGOT:int = 1;
        public static const CAN_NOT_BUY_FUND:int = 2;
        public static const HAD_BUY:int = 3;
        public static const NOT_ENOUGH_TODAY_CHARGE_INGOT:int = 4;
        public static const FAILURE:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const FUNCTION_NOT_OPEN:int = 7;
        public static const NOT_ENOUGH_DAY:int = 8;
        public static const HAD_GET:int = 9;
        public static const NOT_BUY:int = 10;
        public static const is_can_buy_day_funds:Object = {module:360, action:0, request:[], response:[Utils.ByteUtil]};
        public static const get_day_funds_info:Object = {module:360, action:1, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil]]};
        public static const buy_day_funds:Object = {module:360, action:2, request:[], response:[Utils.UByteUtil]};
        public static const get_day_award:Object = {module:360, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const mark_first_open:Object = {module:360, action:4, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["is_can_buy_day_funds", "get_day_funds_info", "buy_day_funds", "get_day_award", "mark_first_open"];

        public function Mod_DayFunds_Base()
        {
            return;
        }// end function

    }
}
