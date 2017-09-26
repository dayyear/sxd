package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_PassScoreGame_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const YES:int = 2;
        public static const NO:int = 3;
        public static const SUCCESS:int = 4;
        public static const NO_AWARD:int = 5;
        public static const FAILURE:int = 6;
        public static const get_player_info:Object = {module:209, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const get_award:Object = {module:209, action:1, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_game_result:Object = {module:209, action:2, request:[], response:[Utils.ByteUtil, Utils.UByteUtil]};
        public static const rank_list:Object = {module:209, action:3, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_player_info", "get_award", "notify_game_result", "rank_list"];

        public function Mod_PassScoreGame_Base()
        {
            return;
        }// end function

    }
}
