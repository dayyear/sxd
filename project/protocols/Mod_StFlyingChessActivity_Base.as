package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StFlyingChessActivity_Base extends Object
    {
        public static const FREE:int = 0;
        public static const JOIN_MATCH:int = 1;
        public static const RACE:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const ALREADY_IN_GAME:int = 4;
        public static const REJOIN_MATCH:int = 5;
        public static const SUCCESS:int = 6;
        public static const CLOSE:int = 7;
        public static const NO_MATCH:int = 8;
        public static const FAILURE:int = 9;
        public static const STAND_BY:int = 10;
        public static const ON_THE_WAY:int = 11;
        public static const COMPLETE:int = 12;
        public static const WRONG_TURN:int = 13;
        public static const HOSTING:int = 14;
        public static const NO_IN_RACE:int = 15;
        public static const ERROR_PLANE:int = 16;
        public static const NOT_HOSTING:int = 17;
        public static const ACTIVITY_OPEN:int = 18;
        public static const ACTIVITY_CLOSE:int = 19;
        public static const TRUE:int = 20;
        public static const FALSE:int = 21;
        public static const get_player_info:Object = {module:190, action:0, request:[], response:[Utils.UByteUtil]};
        public static const join_match:Object = {module:190, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const quit_match:Object = {module:190, action:2, request:[], response:[Utils.UByteUtil]};
        public static const notify_game_start:Object = {module:190, action:3, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.UByteUtil]], [Utils.ByteUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const notify_count_change:Object = {module:190, action:4, request:[], response:[Utils.ByteUtil]};
        public static const throw_dice:Object = {module:190, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const go:Object = {module:190, action:6, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const cancel_hosting:Object = {module:190, action:7, request:[], response:[Utils.UByteUtil]};
        public static const notify_current_round:Object = {module:190, action:8, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.ShortUtil], [Utils.ShortUtil], [Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.ByteUtil, Utils.ShortUtil]]};
        public static const current_round_display_finish:Object = {module:190, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_throw_dice:Object = {module:190, action:10, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const notify:Object = {module:190, action:11, request:[], response:[Utils.UByteUtil]};
        public static const get_activity_state:Object = {module:190, action:12, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_game_over:Object = {module:190, action:13, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.UByteUtil]]};
        public static const enter_game_map:Object = {module:190, action:14, request:[], response:[Utils.UByteUtil]};
        public static const exit_game_map:Object = {module:190, action:15, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_player_info", "join_match", "quit_match", "notify_game_start", "notify_count_change", "throw_dice", "go", "cancel_hosting", "notify_current_round", "current_round_display_finish", "notify_throw_dice", "notify", "get_activity_state", "notify_game_over", "enter_game_map", "exit_game_map"];

        public function Mod_StFlyingChessActivity_Base()
        {
            return;
        }// end function

    }
}
