package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Gm_Base extends Object
    {
        public static const BUG:int = 0;
        public static const COMPLAINTS:int = 1;
        public static const SUGGEST:int = 2;
        public static const OTHER:int = 3;
        public static const SUCCESS:int = 4;
        public static const TOO_MANY_CHARACTER:int = 5;
        public static const TOO_MANY_NEW_BUG:int = 6;
        public static const get_remain_submit_times:Object = {module:27, action:0, request:[], response:[Utils.ByteUtil]};
        public static const submit_bug:Object = {module:27, action:1, request:[Utils.UByteUtil, Utils.StringUtil], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const get_bug_list:Object = {module:27, action:2, request:[], response:[[Utils.StringUtil, Utils.StringUtil]]};
        public static const Actions:Array = ["get_remain_submit_times", "submit_bug", "get_bug_list"];

        public function Mod_Gm_Base()
        {
            return;
        }// end function

    }
}
