package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NewYearSmallActivity_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const HAD_GET:int = 1;
        public static const PACK_FULL:int = 2;
        public static const NOT_ACTIVITY_TIME:int = 3;
        public static const FAILURE:int = 4;
        public static const get_player_ying_fu_login_state:Object = {module:340, action:0, request:[], response:[Utils.ByteUtil, Utils.ByteUtil]};
        public static const get_ying_fu_award:Object = {module:340, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_player_open_year_login_state:Object = {module:340, action:2, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil]]};
        public static const get_open_year_award:Object = {module:340, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const Actions:Array = ["get_player_ying_fu_login_state", "get_ying_fu_award", "get_player_open_year_login_state", "get_open_year_award"];

        public function Mod_NewYearSmallActivity_Base()
        {
            return;
        }// end function

    }
}
