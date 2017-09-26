package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StSharptimeGift_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const FAILURE:int = 3;
        public static const CD:int = 4;
        public static const ACTIVITY_CLOSE:int = 5;
        public static const AWARD_GOTTEN_UP:int = 6;
        public static const FUNCTION_NO_OPEN:int = 7;
        public static const PACK_FULL:int = 8;
        public static const get_info:Object = {module:279, action:0, request:[], response:[Utils.UByteUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil]};
        public static const get_award:Object = {module:279, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.LongUtil]};
        public static const global_notify:Object = {module:279, action:2, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify:Object = {module:279, action:3, request:[], response:[Utils.UByteUtil]};
        public static const coins_change:Object = {module:279, action:4, request:[], response:[Utils.LongUtil]};
        public static const Actions:Array = ["get_info", "get_award", "global_notify", "notify", "coins_change"];

        public function Mod_StSharptimeGift_Base()
        {
            return;
        }// end function

    }
}
