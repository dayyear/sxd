package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FunctionEnd_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_INGOT:int = 1;
        public static const NO_VIP_LEVEL:int = 2;
        public static const is_game_function_end:Object = {module:127, action:0, request:[], response:[[Utils.ShortUtil, Utils.ByteUtil]]};
        public static const game_function_end_gift:Object = {module:127, action:1, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const get_game_function_end_gift:Object = {module:127, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil]};
        public static const random_award:Object = {module:127, action:3, request:[Utils.ShortUtil], response:[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_function_end:Object = {module:127, action:4, request:[], response:[Utils.ShortUtil]};
        public static const Actions:Array = ["is_game_function_end", "game_function_end_gift", "get_game_function_end_gift", "random_award", "notify_function_end"];

        public function Mod_FunctionEnd_Base()
        {
            return;
        }// end function

    }
}
