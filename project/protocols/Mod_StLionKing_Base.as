package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StLionKing_Base extends Object
    {
        public static const BOARD_CLOSE:int = 0;
        public static const PREPARE:int = 1;
        public static const OPEN:int = 2;
        public static const CLOSE:int = 3;
        public static const FREE:int = 4;
        public static const MATCH:int = 5;
        public static const RACE:int = 6;
        public static const NULL:int = 7;
        public static const LEFT:int = 8;
        public static const RIGHT:int = 9;
        public static const DEAD:int = 10;
        public static const GATHER:int = 11;
        public static const SUCCESS:int = 12;
        public static const NO_OPEN:int = 13;
        public static const NO_ENOUGH_LEVEL:int = 14;
        public static const IN_MATCH:int = 15;
        public static const IN_RACE:int = 16;
        public static const ERROR:int = 17;
        public static const NO_MATCH:int = 18;
        public static const NO_ENTER_RACE:int = 19;
        public static const RACE_NO_OPEN:int = 20;
        public static const SAME_CAMP:int = 21;
        public static const IN_WAR:int = 22;
        public static const HAVE_GOLD:int = 23;
        public static const NO_HAVE_GOLD:int = 24;
        public static const NOT_ENOUGHT_INGOT:int = 25;
        public static const lion_king_status:Object = {module:137, action:0, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const join_match:Object = {module:137, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const quit_match:Object = {module:137, action:2, request:[], response:[Utils.UByteUtil]};
        public static const enter_race:Object = {module:137, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil]};
        public static const quit_race:Object = {module:137, action:4, request:[], response:[Utils.UByteUtil]};
        public static const get_race_info:Object = {module:137, action:5, request:[], response:[Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const move_to:Object = {module:137, action:6, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const fight:Object = {module:137, action:7, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const gathering:Object = {module:137, action:8, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_lion_king_status:Object = {module:137, action:9, request:[], response:[Utils.UByteUtil]};
        public static const notify_lion_king_race_status:Object = {module:137, action:10, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_enter_race:Object = {module:137, action:11, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const notify_quit_race:Object = {module:137, action:12, request:[], response:[Utils.IntUtil]};
        public static const get_race_players:Object = {module:137, action:13, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const notify_move_to:Object = {module:137, action:14, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_player_race_status:Object = {module:137, action:15, request:[], response:[Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const notify_war_info:Object = {module:137, action:16, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_lion_health_score:Object = {module:137, action:17, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const recy:Object = {module:137, action:18, request:[], response:[Utils.UByteUtil]};
        public static const notify:Object = {module:137, action:19, request:[], response:[Utils.IntUtil]};
        public static const score_rank:Object = {module:137, action:20, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_quick_move_to:Object = {module:137, action:21, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const war_report:Object = {module:137, action:22, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil], [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const notify_recy:Object = {module:137, action:23, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const clean_dead_cd:Object = {module:137, action:24, request:[], response:[Utils.UByteUtil]};
        public static const notfy_match_count:Object = {module:137, action:25, request:[], response:[Utils.IntUtil]};
        public static const open_st_lion_king_gift_notify:Object = {module:137, action:26, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil]};
        public static const set_use_war_buff:Object = {module:137, action:27, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["lion_king_status", "join_match", "quit_match", "enter_race", "quit_race", "get_race_info", "move_to", "fight", "gathering", "notify_lion_king_status", "notify_lion_king_race_status", "notify_enter_race", "notify_quit_race", "get_race_players", "notify_move_to", "notify_player_race_status", "notify_war_info", "notify_lion_health_score", "recy", "notify", "score_rank", "notify_quick_move_to", "war_report", "notify_recy", "clean_dead_cd", "notfy_match_count", "open_st_lion_king_gift_notify", "set_use_war_buff"];

        public function Mod_StLionKing_Base()
        {
            return;
        }// end function

    }
}
