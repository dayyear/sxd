package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StYiZhanDaoDiPointRace_Base extends Object
    {
        public static const YIZHAN_TIMEOUT:int = 0;
        public static const YIZHAN_ANSWER_A:int = 1;
        public static const YIZHAN_ANSWER_B:int = 2;
        public static const YIZHAN_ANSWER_C:int = 3;
        public static const YIZHAN_ANSWER_D:int = 4;
        public static const YIZHAN_ANSWER_NO:int = 5;
        public static const YIZHAN_USENO_CARD:int = 6;
        public static const YIZHAN_MIANDA_CARD:int = 7;
        public static const YIZHAN_YUANFANG_CARD:int = 8;
        public static const YES:int = 9;
        public static const NO:int = 10;
        public static const ST_YI_ZHAN_DAO_DI_CLOSE:int = 11;
        public static const ST_YI_ZHAN_DAO_DI_JI_FEN:int = 12;
        public static const ST_YI_ZHAN_DAO_DI_PREPARE:int = 13;
        public static const ST_YI_ZHAN_DAO_DI_4:int = 14;
        public static const ST_YI_ZHAN_DAO_DI_4_COMPLETE:int = 15;
        public static const ST_YI_ZHAN_DAO_DI_2:int = 16;
        public static const ST_YI_ZHAN_DAO_DI_2_COMPLETE:int = 17;
        public static const ST_YI_ZHAN_DAO_DI_1:int = 18;
        public static const ST_YI_ZHAN_DAO_DI_1_COMPLETE:int = 19;
        public static const ST_YI_ZHAN_DAO_DI_TODAY_OPEN:int = 20;
        public static const YIZHAN_SUCCESS:int = 21;
        public static const YIZHAN_NO_ENOUGH_LEVEL:int = 22;
        public static const YIZHAN_WIN_LOSE:int = 23;
        public static const YIZHAN_TIE:int = 24;
        public static const YIZHAN_OPEN:int = 25;
        public static const YIZHAN_CLOSE:int = 26;
        public static const YIZHAN_YES:int = 27;
        public static const YIZHAN_NO:int = 28;
        public static const YIZHAN_FAILURE:int = 29;
        public static const YIZHAN_NOTSTART:int = 30;
        public static const YIZHAN_NOT_JOIN:int = 31;
        public static const SUCCESS:int = 32;
        public static const REBET:int = 33;
        public static const INVALID_RACE:int = 34;
        public static const NOT_COMPITITOR:int = 35;
        public static const ERROR:int = 36;
        public static const ONLINE:int = 37;
        public static const OFF_LINE:int = 38;
        public static const START:int = 39;
        public static const END:int = 40;
        public static const TWO_MINUTES:int = 41;
        public static const HALF_MINUTES:int = 42;
        public static const join_yizhan:Object = {module:91, action:0, request:[], response:[Utils.UByteUtil]};
        public static const get_compititor:Object = {module:91, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.ByteUtil], [Utils.UByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const answer_question:Object = {module:91, action:2, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const get_top_100_of_score:Object = {module:91, action:3, request:[], response:[[Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_player_battle_info:Object = {module:91, action:4, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const battle_result:Object = {module:91, action:5, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const get_status:Object = {module:91, action:6, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_ji_and_ma:Object = {module:91, action:7, request:[], response:[[Utils.StringUtil, Utils.UByteUtil]]};
        public static const quit_yizhan:Object = {module:91, action:8, request:[], response:[Utils.UByteUtil]};
        public static const notify:Object = {module:91, action:9, request:[], response:[Utils.UByteUtil]};
        public static const compititor_dead:Object = {module:91, action:10, request:[], response:[Utils.UByteUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const get_joinable_flag:Object = {module:91, action:11, request:[], response:[Utils.UByteUtil]};
        public static const get_sup_player_list:Object = {module:91, action:12, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil]]};
        public static const bet:Object = {module:91, action:13, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const look_up_race:Object = {module:91, action:14, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const notify_war_race:Object = {module:91, action:15, request:[], response:[Utils.UByteUtil]};
        public static const end_look_up:Object = {module:91, action:16, request:[], response:[Utils.UByteUtil]};
        public static const get_race:Object = {module:91, action:17, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_have_game_over:Object = {module:91, action:18, request:[], response:[Utils.UByteUtil]};
        public static const notify_race:Object = {module:91, action:19, request:[], response:[Utils.UByteUtil]};
        public static const notify_server_race_open:Object = {module:91, action:20, request:[], response:[Utils.UByteUtil]};
        public static const notify_player_enter_game:Object = {module:91, action:21, request:[], response:[Utils.UByteUtil]};
        public static const notify_player_online_status:Object = {module:91, action:22, request:[], response:[Utils.IntUtil, Utils.UByteUtil]};
        public static const notify_number_1_change:Object = {module:91, action:23, request:[], response:[Utils.StringUtil, Utils.StringUtil]};
        public static const notify_number_1:Object = {module:91, action:24, request:[], response:[Utils.StringUtil]};
        public static const Actions:Array = ["join_yizhan", "get_compititor", "answer_question", "get_top_100_of_score", "get_player_battle_info", "battle_result", "get_status", "get_ji_and_ma", "quit_yizhan", "notify", "compititor_dead", "get_joinable_flag", "get_sup_player_list", "bet", "look_up_race", "notify_war_race", "end_look_up", "get_race", "notify_have_game_over", "notify_race", "notify_server_race_open", "notify_player_enter_game", "notify_player_online_status", "notify_number_1_change", "notify_number_1"];

        public function Mod_StYiZhanDaoDiPointRace_Base()
        {
            return;
        }// end function

    }
}
