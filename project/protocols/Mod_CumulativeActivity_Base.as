package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CumulativeActivity_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const HAD_GET:int = 3;
        public static const NO_ENOUGH_DAY:int = 4;
        public static const PACK_FULL:int = 5;
        public static const DRAGONBALL_PACK_FULL:int = 6;
        public static const FATE_PACK_FULL:int = 7;
        public static const FIVE_ELEMENTS_PACK_FULL:int = 8;
        public static const FUN_OPEN:int = 9;
        public static const FUN_NOT_OPEN:int = 10;
        public static const get_cumulative_login_info:Object = {module:180, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_cumulative_login:Object = {module:180, action:1, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const get_cumulative_login_award:Object = {module:180, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_next_round_award_info:Object = {module:180, action:3, request:[], response:[[Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const get_mobile_cumulative_login_info:Object = {module:180, action:10, request:[], response:[Utils.UByteUtil]};
        public static const get_player_mobile_cumulative_login:Object = {module:180, action:11, request:[], response:[Utils.ShortUtil, [Utils.IntUtil, Utils.UByteUtil], [Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const get_mobile_cumulative_login_award:Object = {module:180, action:12, request:[Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const Actions:Array = ["get_cumulative_login_info", "get_player_cumulative_login", "get_cumulative_login_award", "get_next_round_award_info", "get_mobile_cumulative_login_info", "get_player_mobile_cumulative_login", "get_mobile_cumulative_login_award"];

        public function Mod_CumulativeActivity_Base()
        {
            return;
        }// end function

    }
}
