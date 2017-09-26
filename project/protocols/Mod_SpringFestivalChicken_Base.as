package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SpringFestivalChicken_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const TIMES_LIMIT:int = 1;
        public static const TIME_IS_OVER:int = 2;
        public static const NOT_ACTIVITY_TIME:int = 3;
        public static const FAILURE:int = 4;
        public static const OPEN:int = 5;
        public static const CLOSE:int = 6;
        public static const NOT_ENOUGH_ACTIVE:int = 7;
        public static const NOT_RIGHT_TIME:int = 8;
        public static const CD:int = 9;
        public static const NOT_ENOUGH_CHARGE:int = 10;
        public static const NOT_ENOUGH_BI:int = 11;
        public static const NOT_BET_TIME:int = 12;
        public static const GAME_OVER:int = 13;
        public static const BET_NUM_ERROR:int = 14;
        public static const get_red_bag_rain_info:Object = {module:339, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const red_bag_rain_notify:Object = {module:339, action:1, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const pick_red_bag:Object = {module:339, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const toll_notify:Object = {module:339, action:3, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]};
        public static const toll_state_notify:Object = {module:339, action:4, request:[], response:[Utils.UByteUtil]};
        public static const get_toll_info:Object = {module:339, action:5, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const toll:Object = {module:339, action:6, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const charge_info:Object = {module:339, action:7, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, [Utils.StringUtil, Utils.StringUtil, Utils.StringUtil], Utils.ByteUtil]};
        public static const get_charge_award:Object = {module:339, action:8, request:[], response:[Utils.UByteUtil]};
        public static const charge_lottery_notify:Object = {module:339, action:9, request:[], response:[[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const running_info:Object = {module:339, action:10, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.LongUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const bet:Object = {module:339, action:11, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const running_result_notify:Object = {module:339, action:12, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.LongUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const Actions:Array = ["get_red_bag_rain_info", "red_bag_rain_notify", "pick_red_bag", "toll_notify", "toll_state_notify", "get_toll_info", "toll", "charge_info", "get_charge_award", "charge_lottery_notify", "running_info", "bet", "running_result_notify"];

        public function Mod_SpringFestivalChicken_Base()
        {
            return;
        }// end function

    }
}
