package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StSixOneShopping_Base extends Object
    {
        public static const COIN:int = 0;
        public static const INGOT:int = 1;
        public static const SUCCEED:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const ITEM_PACK_FULL:int = 4;
        public static const NOT_BUY_COUNT:int = 5;
        public static const NOT_ENOUGH_COIN:int = 6;
        public static const NOT_ENOUGH_INGOT:int = 7;
        public static const FAILED:int = 8;
        public static const ITEM_NULL:int = 9;
        public static const OLD_ITEM:int = 10;
        public static const NOT_TIMES:int = 11;
        public static const NOT_TOWN:int = 12;
        public static const get_info:Object = {module:292, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil]]};
        public static const bug_item:Object = {module:292, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const pick_item:Object = {module:292, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_lolly_info:Object = {module:292, action:3, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil]]};
        public static const notify_lolly:Object = {module:292, action:4, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_all_player_lolly:Object = {module:292, action:5, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_six_one_shopping:Object = {module:292, action:6, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_info", "bug_item", "pick_item", "get_lolly_info", "notify_lolly", "notify_all_player_lolly", "notify_six_one_shopping"];

        public function Mod_StSixOneShopping_Base()
        {
            return;
        }// end function

    }
}
