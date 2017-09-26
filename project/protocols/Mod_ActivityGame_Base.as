package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ActivityGame_Base extends Object
    {
        public static const CRAZY_RABBIT:int = 0;
        public static const BEAT_RABBIT:int = 1;
        public static const SAVE_FANGZIQING:int = 2;
        public static const CUT_FRUIT:int = 3;
        public static const SHOOT_PLANE:int = 4;
        public static const POP_STAR:int = 5;
        public static const RECT_HERO:int = 6;
        public static const CLEAR_COLOR:int = 7;
        public static const JIGSAW:int = 8;
        public static const HUANG_JIN_KUANG_GONG:int = 9;
        public static const SUCCESS:int = 10;
        public static const NOT_ENOUGH_TIMES:int = 11;
        public static const NO_GAME:int = 12;
        public static const NON_ACTIVITY_TIME:int = 13;
        public static const IN_GAME:int = 14;
        public static const NOT_IN_GAME:int = 15;
        public static const TOO_FAST:int = 16;
        public static const NULL:int = 17;
        public static const PLAY_SUCCESS:int = 18;
        public static const PLAY_FAILED:int = 19;
        public static const FAILED:int = 20;
        public static const NO_ENOUGH_SCORE:int = 21;
        public static const NO_REMAIN_NUMBER:int = 22;
        public static const PACK_FULL:int = 23;
        public static const FAILURE:int = 24;
        public static const NO_START_GAME:int = 25;
        public static const FRUIT:int = 26;
        public static const BOMB:int = 27;
        public static const GREEN:int = 28;
        public static const BLUE:int = 29;
        public static const YELLOW:int = 30;
        public static const RED:int = 31;
        public static const PURPLE:int = 32;
        public static const WHITE:int = 33;
        public static const INVALID_ELEMENT:int = 34;
        public static const UNPOPABLE:int = 35;
        public static const TRUE:int = 36;
        public static const FALSE:int = 37;
        public static const STOP:int = 38;
        public static const THREE_ROW:int = 39;
        public static const NO_EXISTS:int = 40;
        public static const get_activity_time:Object = {module:194, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const open_activity_game:Object = {module:194, action:1, request:[], response:[[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const start_play_beat_rabbit:Object = {module:194, action:2, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const play_beat_rabbit:Object = {module:194, action:3, request:[], response:[Utils.UByteUtil]};
        public static const start_play_crazy_rabbit:Object = {module:194, action:4, request:[], response:[Utils.UByteUtil, [Utils.ShortUtil, Utils.ShortUtil]]};
        public static const get_player_crazy_rabbit_info:Object = {module:194, action:5, request:[], response:[Utils.UByteUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const play_crazy_rabbit:Object = {module:194, action:6, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const player_score_exchange_info:Object = {module:194, action:7, request:[], response:[Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const exchange_award:Object = {module:194, action:8, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const start_save_fangziqing:Object = {module:194, action:9, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const guess:Object = {module:194, action:10, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const start_play_cut_fruit:Object = {module:194, action:11, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const cut_fruit:Object = {module:194, action:12, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const notify_cut_fruit_game_over:Object = {module:194, action:13, request:[], response:[Utils.IntUtil]};
        public static const triple_cut:Object = {module:194, action:14, request:[], response:[Utils.ShortUtil]};
        public static const start_play_shoot_plane:Object = {module:194, action:15, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const shoot_plane_game_over:Object = {module:194, action:16, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const start_play_pop_star:Object = {module:194, action:17, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil], Utils.ShortUtil]};
        public static const pop:Object = {module:194, action:18, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.ShortUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil], Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const start_play_rect_hero:Object = {module:194, action:19, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const rect_hero_game_over:Object = {module:194, action:20, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const start_play_clear_color:Object = {module:194, action:21, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil], Utils.ShortUtil, [Utils.UByteUtil], Utils.ShortUtil]};
        public static const clear:Object = {module:194, action:22, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [[Utils.ByteUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil]], [Utils.UByteUtil], Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const use_props:Object = {module:194, action:23, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, [[Utils.ByteUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil]], Utils.ShortUtil]};
        public static const complete_jigsaw:Object = {module:194, action:24, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const start_play_kuang_gong:Object = {module:194, action:25, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const kuang_gong_game_over:Object = {module:194, action:26, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_activity_time", "open_activity_game", "start_play_beat_rabbit", "play_beat_rabbit", "start_play_crazy_rabbit", "get_player_crazy_rabbit_info", "play_crazy_rabbit", "player_score_exchange_info", "exchange_award", "start_save_fangziqing", "guess", "start_play_cut_fruit", "cut_fruit", "notify_cut_fruit_game_over", "triple_cut", "start_play_shoot_plane", "shoot_plane_game_over", "start_play_pop_star", "pop", "start_play_rect_hero", "rect_hero_game_over", "start_play_clear_color", "clear", "use_props", "complete_jigsaw", "start_play_kuang_gong", "kuang_gong_game_over"];

        public function Mod_ActivityGame_Base()
        {
            return;
        }// end function

    }
}
