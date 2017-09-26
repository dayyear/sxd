package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LendRole_Base extends Object
    {
        public static const ERROR:int = 0;
        public static const SUCCESS:int = 1;
        public static const NOT_FRIEND:int = 2;
        public static const NOT_ONLINE:int = 3;
        public static const CAN_NOT_LEND:int = 4;
        public static const CAN_NOT_BE_LEND:int = 5;
        public static const NO_IN_TEAM:int = 6;
        public static const REQUEST_NOT_EXIT:int = 7;
        public static const CAN_NO_LEND:int = 8;
        public static const get_activity_info:Object = {module:146, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const friend_list:Object = {module:146, action:1, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const friend_role_list:Object = {module:146, action:2, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const lend_role:Object = {module:146, action:3, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const agree_lend_role:Object = {module:146, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const set_use_lend_role:Object = {module:146, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const set_server_war_use_lend_role:Object = {module:146, action:6, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_lend_role_info:Object = {module:146, action:7, request:[Utils.ByteUtil], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const cancel_request:Object = {module:146, action:8, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_request_lend_role:Object = {module:146, action:9, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_apply_lend_role:Object = {module:146, action:10, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_activity_info", "friend_list", "friend_role_list", "lend_role", "agree_lend_role", "set_use_lend_role", "set_server_war_use_lend_role", "get_lend_role_info", "cancel_request", "notify_request_lend_role", "notify_apply_lend_role"];

        public function Mod_LendRole_Base()
        {
            return;
        }// end function

    }
}
