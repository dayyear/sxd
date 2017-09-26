package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_TwoCardMeet_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const SUCCEED:int = 2;
        public static const NON_ACTIVITY_TIME:int = 3;
        public static const NOT_DAY_TIMES:int = 4;
        public static const NOT_SINGLE_TIMES:int = 5;
        public static const ONE:int = 6;
        public static const FAILED:int = 7;
        public static const NOT_RANDOM_CARD:int = 8;
        public static const TIMES_OVER:int = 9;
        public static const OVER:int = 10;
        public static const get_info:Object = {module:283, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.ShortUtil, Utils.ShortUtil]]};
        public static const start:Object = {module:283, action:1, request:[], response:[Utils.UByteUtil]};
        public static const open_crad:Object = {module:283, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const notify_result:Object = {module:283, action:4, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_all_player:Object = {module:283, action:5, request:[], response:[Utils.ByteUtil]};
        public static const Actions:Array = ["get_info", "start", "open_crad", "notify_result", "notify_all_player"];

        public function Mod_TwoCardMeet_Base()
        {
            return;
        }// end function

    }
}
