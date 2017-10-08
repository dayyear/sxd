package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MidautuGame_Base extends Object
    {
        public static const CAN_PLAY:int = 0;
        public static const NOT_MORE_TIME:int = 1;
        public static const PACKAGE_FULL:int = 2;
        public static const get_midautu_game_info:Object = {module:377, action:0, request:[], response:[Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]], Utils.IntUtil]};
        public static const get_player_rank:Object = {module:377, action:1, request:[], response:[[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const play_games:Object = {module:377, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_midautu_game_info", "get_player_rank", "play_games"];

        public function Mod_MidautuGame_Base()
        {
            return;
        }// end function

    }
}
