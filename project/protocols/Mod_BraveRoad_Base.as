package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_BraveRoad_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const HAD_GET:int = 1;
        public static const UNFINSHED:int = 2;
        public static const ITEM_PACK_FULL:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const NO_ACTIVITY_TIME:int = 5;
        public static const FAILURE:int = 6;
        public static const NOT_ENOUGH_INGOT:int = 7;
        public static const HAD_UNLOCK:int = 8;
        public static const get_brave_road_info:Object = {module:352, action:0, request:[], response:[[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil], Utils.IntUtil]]};
        public static const get_award:Object = {module:352, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const unlock:Object = {module:352, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_brave_road_info", "get_award", "unlock"];

        public function Mod_BraveRoad_Base()
        {
            return;
        }// end function

    }
}
