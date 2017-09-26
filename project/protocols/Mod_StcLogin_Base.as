package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StcLogin_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const MAINTAINCE:int = 1;
        public static const CLOSE:int = 2;
        public static const HE_FU:int = 3;
        public static const GENG_XIN:int = 4;
        public static const WEI_HU:int = 5;
        public static const ST_BOSS:int = 6;
        public static const ST_SUP_WAR:int = 7;
        public static const ST_ACTIVITY_AWARD:int = 8;
        public static const ST_LION_KING:int = 9;
        public static const ST_YI_ZHAN_DAO_DI:int = 10;
        public static const ST_RICH_MAN:int = 11;
        public static const ST_ZHAO_CHA:int = 12;
        public static const ST_TOWER:int = 13;
        public static const ST_TRIALS:int = 14;
        public static const ST_SNATCH_TREASURE:int = 15;
        public static const ST_UNION_BESIEGE:int = 16;
        public static const ST_PAN_TAO_CALL:int = 17;
        public static const ST_PAN_TAO_FIGHT:int = 18;
        public static const get_login_info:Object = {module:96, action:0, request:[], response:[Utils.StringUtil, Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const get_status:Object = {module:96, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const notify_change_status:Object = {module:96, action:2, request:[], response:[Utils.UByteUtil]};
        public static const get_st_server_host:Object = {module:96, action:3, request:[], response:[Utils.StringUtil, Utils.StringUtil]};
        public static const get_st_bulletin_info:Object = {module:96, action:4, request:[], response:[Utils.ByteUtil, Utils.ByteUtil]};
        public static const st_bulletin_info:Object = {module:96, action:5, request:[], response:[Utils.StringUtil]};
        public static const get_activity_info:Object = {module:96, action:6, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_login_info", "get_status", "notify_change_status", "get_st_server_host", "get_st_bulletin_info", "st_bulletin_info", "get_activity_info"];

        public function Mod_StcLogin_Base()
        {
            return;
        }// end function

    }
}
