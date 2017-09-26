package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StMarriageTape_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const NO_ACTIVITY_TIME:int = 2;
        public static const HAD_DIVINE:int = 3;
        public static const FAILURE:int = 4;
        public static const NO_DIVINE:int = 5;
        public static const ON_WALL:int = 6;
        public static const NOT_MATCH:int = 7;
        public static const HAD_MATCH:int = 8;
        public static const get_tape_info:Object = {module:321, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil]};
        public static const get_wall_info:Object = {module:321, action:1, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil]]};
        public static const divine:Object = {module:321, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const up_to_wall:Object = {module:321, action:3, request:[], response:[Utils.UByteUtil]};
        public static const match:Object = {module:321, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_tape_info", "get_wall_info", "divine", "up_to_wall", "match"];

        public function Mod_StMarriageTape_Base()
        {
            return;
        }// end function

    }
}
