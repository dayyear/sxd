package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Matual_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ME_NOT_IN_LEVEL_SCOPE:int = 1;
        public static const ME_MATUAL:int = 2;
        public static const ME_CD:int = 3;
        public static const ME_GAME_FUN:int = 4;
        public static const YOU_NOT_IN_LEVEL_SCOPE:int = 5;
        public static const YOU_MATUAL:int = 6;
        public static const YOU_CD:int = 7;
        public static const YOU_GAME_FUN:int = 8;
        public static const LEVEL_DIFF:int = 9;
        public static const ERROR:int = 10;
        public static const CD:int = 11;
        public static const SELF:int = 12;
        public static const PACK_FULL:int = 13;
        public static const friend_list:Object = {module:197, action:0, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const matual_info:Object = {module:197, action:1, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const invite_matual:Object = {module:197, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const invite_info_notify:Object = {module:197, action:3, request:[], response:[Utils.IntUtil, Utils.StringUtil]};
        public static const accept_invite:Object = {module:197, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const send_world_invite:Object = {module:197, action:5, request:[], response:[Utils.UByteUtil]};
        public static const world_invite_notify:Object = {module:197, action:6, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil]};
        public static const accept_world_invite:Object = {module:197, action:7, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const cancel_matual:Object = {module:197, action:8, request:[], response:[Utils.UByteUtil]};
        public static const get_active_award:Object = {module:197, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_level_award:Object = {module:197, action:10, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_Refresh:Object = {module:197, action:11, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["friend_list", "matual_info", "invite_matual", "invite_info_notify", "accept_invite", "send_world_invite", "world_invite_notify", "accept_world_invite", "cancel_matual", "get_active_award", "get_level_award", "notify_Refresh"];

        public function Mod_Matual_Base()
        {
            return;
        }// end function

    }
}
