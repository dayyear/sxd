package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FlopGame_Base extends Object
    {
        public static const ACTIVITY_OPEN:int = 0;
        public static const ACTIVITY_CLOSE:int = 1;
        public static const YES:int = 2;
        public static const NO:int = 3;
        public static const FIRST_FLOP:int = 4;
        public static const SECOND_FLOP_MATCH:int = 5;
        public static const SECOND_FLOP_NO_MATCH:int = 6;
        public static const TIMES_USE_UP:int = 7;
        public static const RE_FLOP:int = 8;
        public static const FUNCTION_NO_OPEN:int = 9;
        public static const SUCCESS:int = 10;
        public static const EXCHANGED:int = 11;
        public static const NO_ENOUGH_SCORE:int = 12;
        public static const NO_ENOUGH_INGOT:int = 13;
        public static const TIMES_UP:int = 14;
        public static const get_activity_state:Object = {module:170, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify:Object = {module:170, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_player_flop_info:Object = {module:170, action:2, request:[], response:[Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.UByteUtil]]};
        public static const flop:Object = {module:170, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange:Object = {module:170, action:4, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const buy_flop_times:Object = {module:170, action:5, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil]};
        public static const get_flops:Object = {module:170, action:6, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const get_flops_info:Object = {module:170, action:7, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil]]};
        public static const Actions:Array = ["get_activity_state", "notify", "get_player_flop_info", "flop", "exchange", "buy_flop_times", "get_flops", "get_flops_info"];

        public function Mod_FlopGame_Base()
        {
            return;
        }// end function

    }
}
