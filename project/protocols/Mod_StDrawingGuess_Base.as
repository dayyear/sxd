package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StDrawingGuess_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const ALREADY_IN_GAME:int = 2;
        public static const REJOIN_MATCH:int = 3;
        public static const CLOSE:int = 4;
        public static const FAILURE:int = 5;
        public static const DRAW:int = 6;
        public static const GUESS:int = 7;
        public static const FLOWER:int = 8;
        public static const EGG:int = 9;
        public static const TIMES_LIMIT:int = 10;
        public static const RIGHT:int = 11;
        public static const MISTAKE:int = 12;
        public static const NORMAL:int = 13;
        public static const TIME:int = 14;
        public static const HINT:int = 15;
        public static const NO_ACTIVITY_TIME:int = 16;
        public static const NOT_ENOUGH_SCORE:int = 17;
        public static const ITEM_PACK_FULL:int = 18;
        public static const EMPTY:int = 19;
        public static const REVOKE:int = 20;
        public static const OPEN:int = 21;
        public static const get_drawing_guess_info:Object = {module:363, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const begin_match:Object = {module:363, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const cancel_match:Object = {module:363, action:2, request:[], response:[Utils.UByteUtil]};
        public static const notify_match_num_change:Object = {module:363, action:3, request:[], response:[Utils.IntUtil]};
        public static const notify_match_result:Object = {module:363, action:4, request:[], response:[Utils.UByteUtil]};
        public static const notify_player_info:Object = {module:363, action:5, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil], Utils.IntUtil]};
        public static const notify_start:Object = {module:363, action:6, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]};
        public static const notify_end:Object = {module:363, action:7, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const use_prop:Object = {module:363, action:8, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const draw:Object = {module:363, action:9, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const receive_picture:Object = {module:363, action:10, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const send_message:Object = {module:363, action:11, request:[Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const receive_message:Object = {module:363, action:12, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const get_exchange_info:Object = {module:363, action:13, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const exchange:Object = {module:363, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const revoke:Object = {module:363, action:15, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const notify_revoke:Object = {module:363, action:16, request:[], response:[Utils.UByteUtil]};
        public static const notify_open_close:Object = {module:363, action:17, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_drawing_guess_info", "begin_match", "cancel_match", "notify_match_num_change", "notify_match_result", "notify_player_info", "notify_start", "notify_end", "use_prop", "draw", "receive_picture", "send_message", "receive_message", "get_exchange_info", "exchange", "revoke", "notify_revoke", "notify_open_close"];

        public function Mod_StDrawingGuess_Base()
        {
            return;
        }// end function

    }
}
