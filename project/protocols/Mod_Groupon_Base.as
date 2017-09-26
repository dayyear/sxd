package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Groupon_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const READY_TIME:int = 1;
        public static const CLEAR_TIME:int = 2;
        public static const CLOSE:int = 3;
        public static const CAN_BUY:int = 4;
        public static const CAN_CLEAR:int = 5;
        public static const CAN_NOT_CLEAR:int = 6;
        public static const ALREADY_BUY:int = 7;
        public static const YES:int = 8;
        public static const NO:int = 9;
        public static const SUCCESS:int = 10;
        public static const FULL_BUY:int = 11;
        public static const NOT_ENOUGH_BUY_TIME:int = 12;
        public static const NOT_ENOUGH_INGOT:int = 13;
        public static const PACK_FULL:int = 14;
        public static const FUNCTION_NOT_OPEN:int = 15;
        public static const ERROR_GROUPON_ID:int = 16;
        public static const NOT_ENOUGH_ITEM:int = 17;
        public static const ALREADY_CLEAR:int = 18;
        public static const NOT_BUY:int = 19;
        public static const NOT_CLEAR_TIME:int = 20;
        public static const get_groupon_status:Object = {module:154, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_groupon_info:Object = {module:154, action:1, request:[], response:[[Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_player_groupon_info:Object = {module:154, action:2, request:[], response:[[Utils.ShortUtil, Utils.UByteUtil, Utils.IntUtil]]};
        public static const buy:Object = {module:154, action:3, request:[Utils.ShortUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const clear:Object = {module:154, action:4, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_player_have_cha_ye_dan:Object = {module:154, action:5, request:[], response:[Utils.IntUtil]};
        public static const notify_player_have_cha_ye_dan_hua_lun:Object = {module:154, action:6, request:[], response:[Utils.IntUtil]};
        public static const get_player_is_sage:Object = {module:154, action:7, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_groupon_status", "get_groupon_info", "get_player_groupon_info", "buy", "clear", "notify_player_have_cha_ye_dan", "notify_player_have_cha_ye_dan_hua_lun", "get_player_is_sage"];

        public function Mod_Groupon_Base()
        {
            return;
        }// end function

    }
}
