package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MoonlightBox_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_ENOUGH_TIMES:int = 1;
        public static const NO_ENOUGH_INGOT:int = 2;
        public static const ITEM_PACK_FULL:int = 3;
        public static const ALL_FULL:int = 4;
        public static const NOT_ACTIVITY_TIME:int = 5;
        public static const FUNCTION_ON_OPEN:int = 6;
        public static const LINK_PACK_FULL:int = 7;
        public static const FAILURE:int = 8;
        public static const NO_SCORE:int = 9;
        public static const NO_ENOUGH_SCORE:int = 10;
        public static const FATE_PACK_FULL:int = 11;
        public static const HAD_GET:int = 12;
        public static const get_moonlight_box_info:Object = {module:348, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const rock:Object = {module:348, action:1, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, [Utils.IntUtil], Utils.ByteUtil]};
        public static const get_score:Object = {module:348, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_score_award:Object = {module:348, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_moonlight_box_info", "rock", "get_score", "get_score_award"];

        public function Mod_MoonlightBox_Base()
        {
            return;
        }// end function

    }
}
