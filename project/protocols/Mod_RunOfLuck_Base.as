package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RunOfLuck_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ACTIVITY_CLOSE:int = 1;
        public static const FUNCTION_NO_OPEN:int = 2;
        public static const FAILURE:int = 3;
        public static const ERROR:int = 4;
        public static const get_run_of_luck_info:Object = {module:355, action:0, request:[], response:[Utils.ByteUtil, Utils.ByteUtil]};
        public static const start:Object = {module:355, action:1, request:[], response:[Utils.UByteUtil]};
        public static const game_over:Object = {module:355, action:2, request:[Utils.UByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_top_list:Object = {module:355, action:3, request:[], response:[[Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_run_of_luck_info", "start", "game_over", "get_top_list"];

        public function Mod_RunOfLuck_Base()
        {
            return;
        }// end function

    }
}
