package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StHirePartner_Base extends Object
    {
        public static const SPECIAL:int = 0;
        public static const NORMAL:int = 1;
        public static const NOT_HIRED:int = 2;
        public static const HIRED:int = 3;
        public static const FIRED:int = 4;
        public static const COMPLETED:int = 5;
        public static const LOCK:int = 6;
        public static const UNLOCK:int = 7;
        public static const YES:int = 8;
        public static const NO:int = 9;
        public static const CANNT:int = 10;
        public static const CAN:int = 11;
        public static const SUCCESS:int = 12;
        public static const FAILED:int = 13;
        public static const OWNER_PARTNER:int = 14;
        public static const HIRED_TIMES_LIMIT:int = 15;
        public static const LACK_OF_COINS:int = 16;
        public static const LACK_OF_INGOT:int = 17;
        public static const get_info:Object = {module:329, action:0, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const open_panel:Object = {module:329, action:1, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const close_panel:Object = {module:329, action:2, request:[], response:[Utils.UByteUtil]};
        public static const set_hire_flag:Object = {module:329, action:3, request:[], response:[Utils.UByteUtil]};
        public static const get_award:Object = {module:329, action:4, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const hire_partner:Object = {module:329, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const fire_partner:Object = {module:329, action:6, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const notify_be_hired_times_change:Object = {module:329, action:7, request:[], response:[Utils.ByteUtil, Utils.IntUtil]};
        public static const notify_refresh:Object = {module:329, action:8, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const notify_player_be_hired_change:Object = {module:329, action:9, request:[], response:[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_function_open:Object = {module:329, action:10, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const Actions:Array = ["get_info", "open_panel", "close_panel", "set_hire_flag", "get_award", "hire_partner", "fire_partner", "notify_be_hired_times_change", "notify_refresh", "notify_player_be_hired_change", "notify_function_open"];

        public function Mod_StHirePartner_Base()
        {
            return;
        }// end function

    }
}
