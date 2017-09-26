package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FindSingleDog_Base extends Object
    {
        public static const SUCCEED:int = 0;
        public static const FAILED:int = 1;
        public static const FINAL_END:int = 2;
        public static const NON_ACTIVITY_TIME:int = 3;
        public static const FINAL:int = 4;
        public static const NEXT_LAYER:int = 5;
        public static const NOT_IN_ACTIVITY:int = 6;
        public static const FUNCTION_NO_OPEN:int = 7;
        public static const ITEM_PACK_FULL:int = 8;
        public static const NOT_ENOUGHT_SCORE:int = 9;
        public static const TIMES_LIMIT:int = 10;
        public static const get_info:Object = {module:271, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const start_find:Object = {module:271, action:1, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const find_point:Object = {module:271, action:2, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_result:Object = {module:271, action:3, request:[], response:[Utils.UByteUtil]};
        public static const notify_all_player:Object = {module:271, action:4, request:[], response:[Utils.ByteUtil]};
        public static const get_exchange_info:Object = {module:271, action:5, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const exchange_award:Object = {module:271, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "start_find", "find_point", "notify_result", "notify_all_player", "get_exchange_info", "exchange_award"];

        public function Mod_FindSingleDog_Base()
        {
            return;
        }// end function

    }
}
