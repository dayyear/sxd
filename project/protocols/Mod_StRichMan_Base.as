package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StRichMan_Base extends Object
    {
        public static const FREE:int = 0;
        public static const MATCH:int = 1;
        public static const RACE:int = 2;
        public static const SUCCESS:int = 3;
        public static const NOT_OPEN:int = 4;
        public static const IN_MATCH:int = 5;
        public static const IN_GAME:int = 6;
        public static const NOT_ENOUGH_LEVEL:int = 7;
        public static const NO_MATCH:int = 8;
        public static const FAILED:int = 9;
        public static const FORCED_OCCUPY:int = 10;
        public static const THIEF:int = 11;
        public static const CONTROL_DICE:int = 12;
        public static const SET_HINDER:int = 13;
        public static const ROBER:int = 14;
        public static const ROB_RICH:int = 15;
        public static const DO_GOOD:int = 16;
        public static const MAX_AWARD:int = 17;
        public static const PICK_XIAN_YUAN:int = 18;
        public static const MIN_AWARD:int = 19;
        public static const AWARD_200:int = 20;
        public static const AWARD_300:int = 21;
        public static const AWARD_500:int = 22;
        public static const AWARD_CONTROL:int = 23;
        public static const AWARD_HINDER:int = 24;
        public static const AWARD_BOMB:int = 25;
        public static const AWARD_TURN_DIRECTION:int = 26;
        public static const BOMB:int = 27;
        public static const DOG:int = 28;
        public static const XIAN_YUAN_LAND:int = 29;
        public static const FIGHT:int = 30;
        public static const HINDER:int = 31;
        public static const NULL_BIG_LAND:int = 32;
        public static const KE_ZHAN:int = 33;
        public static const QIAN_ZHUANG:int = 34;
        public static const JIU_LOU:int = 35;
        public static const OTHER_PLAYER_LAND:int = 36;
        public static const IN_DA_LAO:int = 37;
        public static const IN_YI_GUAN:int = 38;
        public static const IN_KE_ZHAN:int = 39;
        public static const TOLL_GATE:int = 40;
        public static const CHENG_GUAN:int = 41;
        public static const DAO_BA_TU:int = 42;
        public static const get_st_rich_man_status:Object = {module:147, action:0, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const join_st_rich_man:Object = {module:147, action:1, request:[], response:[Utils.UByteUtil]};
        public static const exit_st_rich_man:Object = {module:147, action:2, request:[], response:[Utils.UByteUtil]};
        public static const start_play:Object = {module:147, action:3, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const roll_dice:Object = {module:147, action:5, request:[], response:[Utils.UByteUtil]};
        public static const confirm_next_player:Object = {module:147, action:6, request:[], response:[]};
        public static const control_dice:Object = {module:147, action:7, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const set_hinder:Object = {module:147, action:8, request:[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_event_result:Object = {module:147, action:9, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil], Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil]};
        public static const notify_game_over:Object = {module:147, action:12, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const notify_st_rich_man_status:Object = {module:147, action:13, request:[], response:[Utils.ByteUtil]};
        public static const notify_player_over:Object = {module:147, action:14, request:[], response:[Utils.IntUtil, [Utils.ByteUtil]]};
        public static const notify_dice_result:Object = {module:147, action:15, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const get_rank_list:Object = {module:147, action:16, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]]};
        public static const notify_box:Object = {module:147, action:18, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const open_match:Object = {module:147, action:19, request:[], response:[Utils.ByteUtil]};
        public static const notify_match_number:Object = {module:147, action:20, request:[], response:[Utils.ByteUtil]};
        public static const close_match:Object = {module:147, action:21, request:[], response:[]};
        public static const notify_use_item:Object = {module:147, action:22, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_other:Object = {module:147, action:23, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil], Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const set_big_land_type:Object = {module:147, action:24, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const notify_big_land_result:Object = {module:147, action:25, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const notify_game_round:Object = {module:147, action:26, request:[], response:[Utils.ByteUtil]};
        public static const notify_stop_status:Object = {module:147, action:27, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const get_st_rich_man_info:Object = {module:147, action:28, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_st_rich_man_item_info:Object = {module:147, action:29, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_st_rich_man_status", "join_st_rich_man", "exit_st_rich_man", "start_play", "roll_dice", "confirm_next_player", "control_dice", "set_hinder", "notify_event_result", "notify_game_over", "notify_st_rich_man_status", "notify_player_over", "notify_dice_result", "get_rank_list", "notify_box", "open_match", "notify_match_number", "close_match", "notify_use_item", "notify_other", "set_big_land_type", "notify_big_land_result", "notify_game_round", "notify_stop_status", "get_st_rich_man_info", "get_st_rich_man_item_info"];

        public function Mod_StRichMan_Base()
        {
            return;
        }// end function

    }
}
