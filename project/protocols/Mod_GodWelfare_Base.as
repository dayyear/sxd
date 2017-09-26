package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_GodWelfare_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const HAD_GET:int = 3;
        public static const LEVEL_LIMIT:int = 4;
        public static const ITEM_PACK_FULL:int = 5;
        public static const FAILURE:int = 6;
        public static const get_god_welfare_info:Object = {module:328, action:0, request:[], response:[Utils.ShortUtil, Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_level_award_info:Object = {module:328, action:1, request:[], response:[[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const get_award:Object = {module:328, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_god_welfare_info", "get_level_award_info", "get_award"];

        public function Mod_GodWelfare_Base()
        {
            return;
        }// end function

    }
}
