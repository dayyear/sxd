package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RopeGame_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_START:int = 1;
        public static const NOT_ACTIVITY_TIME:int = 2;
        public static const FAILURE:int = 3;
        public static const get_rope_game_info:Object = {module:310, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const game_over:Object = {module:310, action:1, request:[Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_rope_game_info", "game_over"];

        public function Mod_RopeGame_Base()
        {
            return;
        }// end function

    }
}
