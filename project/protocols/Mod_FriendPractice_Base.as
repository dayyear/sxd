package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FriendPractice_Base extends Object
    {
        public static const STATE_NOT_INVITE:int = 0;
        public static const STATE_INVITE:int = 1;
        public static const STATE_AGREE:int = 2;
        public static const SUCCESS:int = 3;
        public static const NOT_ONLINE:int = 4;
        public static const NOT_FRIEND:int = 5;
        public static const NOT_COUNT:int = 6;
        public static const FAILED:int = 7;
        public static const REVOKE:int = 8;
        public static const OLD_INVITE:int = 9;
        public static const FUN_OVER:int = 10;
        public static const FUN_OPEN:int = 11;
        public static const INVITE:int = 12;
        public static const AGREE_INVITE:int = 13;
        public static const REFUSE_INVITE:int = 14;
        public static const PRACTICE:int = 15;
        public static const get_info:Object = {module:296, action:0, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil]};
        public static const invite_friend:Object = {module:296, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const revoke_invite:Object = {module:296, action:2, request:[], response:[Utils.UByteUtil]};
        public static const refuse_invite:Object = {module:296, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const agree_invite:Object = {module:296, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const start_practice:Object = {module:296, action:5, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_mailer:Object = {module:296, action:6, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_info", "invite_friend", "revoke_invite", "refuse_invite", "agree_invite", "start_practice", "notify_mailer"];

        public function Mod_FriendPractice_Base()
        {
            return;
        }// end function

    }
}
