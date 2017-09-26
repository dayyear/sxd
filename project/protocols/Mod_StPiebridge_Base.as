package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StPiebridge_Base extends Object
    {
        public static const FREE:int = 0;
        public static const JOIN_MATCH:int = 1;
        public static const RACE:int = 2;
        public static const ACTIVITY_OPEN:int = 3;
        public static const ACTIVITY_CLOSE:int = 4;
        public static const FUNCTION_NO_OPEN:int = 5;
        public static const ALREADY_IN_GAME:int = 6;
        public static const REJOIN_MATCH:int = 7;
        public static const SUCCESS:int = 8;
        public static const CLOSE:int = 9;
        public static const NO_MATCH:int = 10;
        public static const FAILURE:int = 11;
        public static const WRONG_TURN:int = 12;
        public static const NO_IN_RACE:int = 13;
        public static const TRUE:int = 14;
        public static const FALSE:int = 15;
        public static const QUIT:int = 16;
        public static const NO_ENOUGH_SCORE:int = 17;
        public static const PACKAGE_FULL:int = 18;
        public static const LIMIT:int = 19;
        public static const FATE_PACKAGE_FULL:int = 20;
        public static const get_player_info:Object = {module:245, action:0, request:[], response:[Utils.UByteUtil]};
        public static const notify:Object = {module:245, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_activity_state:Object = {module:245, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const join_match:Object = {module:245, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const quit_match:Object = {module:245, action:4, request:[], response:[Utils.UByteUtil]};
        public static const notify_game_start:Object = {module:245, action:5, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const notify_count_change:Object = {module:245, action:6, request:[], response:[Utils.ByteUtil]};
        public static const throw_dice:Object = {module:245, action:7, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const notify_throw_dice:Object = {module:245, action:8, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const notify_game_over:Object = {module:245, action:9, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.UByteUtil, Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const enter_game_map:Object = {module:245, action:10, request:[], response:[Utils.UByteUtil]};
        public static const exit_game_map:Object = {module:245, action:11, request:[], response:[Utils.UByteUtil]};
        public static const get_exchange_info:Object = {module:245, action:12, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange:Object = {module:245, action:13, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const complete_play_animation:Object = {module:245, action:14, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_player_info", "notify", "get_activity_state", "join_match", "quit_match", "notify_game_start", "notify_count_change", "throw_dice", "notify_throw_dice", "notify_game_over", "enter_game_map", "exit_game_map", "get_exchange_info", "exchange", "complete_play_animation"];

        public function Mod_StPiebridge_Base()
        {
            return;
        }// end function

    }
}
