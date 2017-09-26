package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ScoreGame_Base extends Object
    {
        public static const GOLDEN_EGGS:int = 0;
        public static const LUCKY_NUMBER:int = 1;
        public static const ROLL_CAKE:int = 2;
        public static const SUCCESS:int = 3;
        public static const NOT_ENOUGH_TIMES:int = 4;
        public static const NO_GAME:int = 5;
        public static const GRID_ALREADY_PLAYED:int = 6;
        public static const NON_ACTIVITY_TIME:int = 7;
        public static const NO_ENOUGH_SCORE:int = 8;
        public static const NO_REMAIN_NUMBER:int = 9;
        public static const PACK_FULL:int = 10;
        public static const get_activity_time:Object = {module:192, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const open_score_game:Object = {module:192, action:1, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const play_golden_eggs_game:Object = {module:192, action:2, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.ByteUtil]};
        public static const play_roll_cake:Object = {module:192, action:3, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const open_lucky_magic_box:Object = {module:192, action:4, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const play_lucky_magic_box:Object = {module:192, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const player_score_exchange_info:Object = {module:192, action:6, request:[], response:[Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const exchange_award:Object = {module:192, action:7, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_activity_time", "open_score_game", "play_golden_eggs_game", "play_roll_cake", "open_lucky_magic_box", "play_lucky_magic_box", "player_score_exchange_info", "exchange_award"];

        public function Mod_ScoreGame_Base()
        {
            return;
        }// end function

    }
}
