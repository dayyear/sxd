package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SaintAreaLogin_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FAILED:int = 1;
        public static const OPEN:int = 2;
        public static const MAINTAINCE:int = 3;
        public static const CLOSE:int = 4;
        public static const HE_FU:int = 5;
        public static const GENG_XIN:int = 6;
        public static const WEI_HU:int = 7;
        public static const login:Object = {module:293, action:0, request:[Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_login_info:Object = {module:293, action:1, request:[], response:[Utils.StringUtil, Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const get_status:Object = {module:293, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const notify_change_status:Object = {module:293, action:3, request:[], response:[Utils.UByteUtil]};
        public static const get_saint_area_server_host:Object = {module:293, action:4, request:[], response:[Utils.StringUtil, Utils.StringUtil]};
        public static const Actions:Array = ["login", "get_login_info", "get_status", "notify_change_status", "get_saint_area_server_host"];

        public function Mod_SaintAreaLogin_Base()
        {
            return;
        }// end function

    }
}
