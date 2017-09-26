package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Email_Base extends Object
    {
        public static const READ:int = 0;
        public static const UNREAD:int = 1;
        public static const COMMON:int = 2;
        public static const ATTACHMENT:int = 3;
        public static const GET:int = 4;
        public static const UNGET:int = 5;
        public static const YES:int = 6;
        public static const NO:int = 7;
        public static const SUCCESS:int = 8;
        public static const ID_ERROR:int = 9;
        public static const NOT_THIS_PLAYER:int = 10;
        public static const FAILURE:int = 11;
        public static const HAD_GET:int = 12;
        public static const ITEM_PACKAGE_FULL:int = 13;
        public static const ONE:int = 14;
        public static const ALL:int = 15;
        public static const HAVE_ATTACHMENT:int = 16;
        public static const CAN_NOT_DELETE:int = 17;
        public static const NEW_EMAIL:int = 18;
        public static const NO_AWARD:int = 19;
        public static const get_email_info:Object = {module:345, action:0, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil, Utils.LongUtil, Utils.UByteUtil, Utils.ByteUtil]]};
        public static const read_email:Object = {module:345, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_attachment_award:Object = {module:345, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const delete_email:Object = {module:345, action:3, request:[Utils.UByteUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_new_email:Object = {module:345, action:4, request:[], response:[Utils.UByteUtil]};
        public static const is_have_new_email:Object = {module:345, action:5, request:[], response:[Utils.UByteUtil]};
        public static const one_key_get_award:Object = {module:345, action:6, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_email_info", "read_email", "get_attachment_award", "delete_email", "notify_new_email", "is_have_new_email", "one_key_get_award"];

        public function Mod_Email_Base()
        {
            return;
        }// end function

    }
}
