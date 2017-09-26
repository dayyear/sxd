package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Gamable_Base extends Object
    {
        public static const GAMABLE_LEVEL_1:int = 0;
        public static const GAMABLE_LEVEL_2:int = 1;
        public static const GAMABLE_LEVEL_3:int = 2;
        public static const GAMABLE_LEVEL_4:int = 3;
        public static const GAMABLE_SUCCESS:int = 4;
        public static const GAMABLE_ALREADY_BET:int = 5;
        public static const GAMABLE_NO_OPEN:int = 6;
        public static const GAMABLE_FAILURE:int = 7;
        public static const GAMABLE_IN_VALID:int = 8;
        public static const GAMABLE_FINISHED:int = 9;
        public static const GAMABLE_UNPLAYABLE:int = 10;
        public static const GAMABLE_NO_BET:int = 11;
        public static const GAMABLE_ALREADY_GET:int = 12;
        public static const GAMABLE_NO_BINGO:int = 13;
        public static const GAMABLE_YES:int = 14;
        public static const GAMABLE_NO:int = 15;
        public static const get_gamable_info:Object = {module:112, action:0, request:[], response:[[Utils.IntUtil], [Utils.IntUtil], Utils.UByteUtil, Utils.ShortUtil]};
        public static const bet:Object = {module:112, action:1, request:[[Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const notify_gamable_live:Object = {module:112, action:2, request:[], response:[[Utils.IntUtil], Utils.UByteUtil]};
        public static const player_gamable_offline:Object = {module:112, action:3, request:[], response:[Utils.UByteUtil]};
        public static const player_gamable_online:Object = {module:112, action:4, request:[], response:[Utils.UByteUtil]};
        public static const get_award:Object = {module:112, action:5, request:[], response:[Utils.UByteUtil, Utils.UByteUtil]};
        public static const notify_player_have_yutu:Object = {module:112, action:6, request:[], response:[Utils.IntUtil]};
        public static const get_player_award_flag:Object = {module:112, action:7, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_gamable_info", "bet", "notify_gamable_live", "player_gamable_offline", "player_gamable_online", "get_award", "notify_player_have_yutu", "get_player_award_flag"];

        public function Mod_Gamable_Base()
        {
            return;
        }// end function

    }
}
