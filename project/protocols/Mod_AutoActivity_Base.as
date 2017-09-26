package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_AutoActivity_Base extends Object
    {
        public static const CAMP_WAR:int = 0;
        public static const WORLD_BOSS:int = 1;
        public static const CAMP_WAR_INSPIRE:int = 2;
        public static const WORLD_BOSS_INSPIRE:int = 3;
        public static const ST_WORLD_BOSS:int = 4;
        public static const SUCCESS:int = 5;
        public static const FAILED:int = 6;
        public static const NOT_LOGIN:int = 7;
        public static const NOT_GET:int = 8;
        public static const HAD_GET:int = 9;
        public static const FUN_NOT_OPEN:int = 10;
        public static const NOT_BIND:int = 11;
        public static const auto_activity_info:Object = {module:121, action:0, request:[], response:[[Utils.UByteUtil, Utils.ByteUtil]]};
        public static const set_auto_activity:Object = {module:121, action:1, request:[Utils.UByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const all_select:Object = {module:121, action:2, request:[], response:[Utils.UByteUtil]};
        public static const all_cancel:Object = {module:121, action:3, request:[], response:[Utils.UByteUtil]};
        public static const is_get_mobile_assistant_bind_award:Object = {module:121, action:4, request:[], response:[Utils.UByteUtil, Utils.UByteUtil]};
        public static const get_mobile_assistant_bind_award:Object = {module:121, action:5, request:[], response:[Utils.UByteUtil]};
        public static const get_phone_number_bind_award:Object = {module:121, action:6, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["auto_activity_info", "set_auto_activity", "all_select", "all_cancel", "is_get_mobile_assistant_bind_award", "get_mobile_assistant_bind_award", "get_phone_number_bind_award"];

        public function Mod_AutoActivity_Base()
        {
            return;
        }// end function

    }
}
