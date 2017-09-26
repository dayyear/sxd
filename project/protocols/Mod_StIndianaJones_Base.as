package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StIndianaJones_Base extends Object
    {
        public static const ACTIVITY_START:int = 0;
        public static const ACTIVITY_END:int = 1;
        public static const SUCCESS:int = 2;
        public static const ERROE_EXCHANGE_ID:int = 3;
        public static const TODAY_LIMIT:int = 4;
        public static const NOT_ENOUGH_SCORE:int = 5;
        public static const NON_ACTIVITY_TIME:int = 6;
        public static const HAD_MATCH:int = 7;
        public static const NON_START_MATCH:int = 8;
        public static const HAD_MATCHED_TEAM:int = 9;
        public static const NOT_ENOUGH_EVENTS:int = 10;
        public static const CD_TIME:int = 11;
        public static const NOT_ENOUGH_MONSTER:int = 12;
        public static const HAD_ANOTHER_BOX:int = 13;
        public static const HIGH:int = 14;
        public static const MEDIUM:int = 15;
        public static const LOW:int = 16;
        public static const HAD_NORMAT_MONSTER:int = 17;
        public static const NOT_ENOUGH_BOSS:int = 18;
        public static const HAD_BOSS:int = 19;
        public static const MAX_LAYER:int = 20;
        public static const NOT_ENOUGH_KEY:int = 21;
        public static const ERROR_KEY_QUALITY:int = 22;
        public static const NOT_ENOUGH_BOX:int = 23;
        public static const TRUE:int = 24;
        public static const FALSE:int = 25;
        public static const HAD_SHAKE:int = 26;
        public static const OPEN_BOX:int = 27;
        public static const SHAKE_POINT_MAX:int = 28;
        public static const KILL_BOSS:int = 29;
        public static const EXIT_TEAM:int = 30;
        public static const NEW_MATCHED_NUMBER:int = 31;
        public static const FINISH_MATCH:int = 32;
        public static const MATCH_TIME_OUT:int = 33;
        public static const NEW_RANDOM_EVENTS:int = 34;
        public static const RANDOM_EVENTS_USED:int = 35;
        public static const NEW_ENERGY_SYMBOL:int = 36;
        public static const ENERGY_SYMBOL_USED:int = 37;
        public static const NEW_NORMAL_MONSTER:int = 38;
        public static const NORMAL_MONSTER_KILLED:int = 39;
        public static const NEW_BOX_OPEN:int = 40;
        public static const NEW_POINT:int = 41;
        public static const SHAKE_POINT_END:int = 42;
        public static const FIGHT_BOSS:int = 43;
        public static const BOSS_HEALTH_CHANGE:int = 44;
        public static const NEW_LAYER:int = 45;
        public static const get_activity_indiana_jones_info:Object = {module:236, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const get_player_indiana_jones_info:Object = {module:236, action:1, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.ShortUtil]]};
        public static const score_exchange:Object = {module:236, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const start_match:Object = {module:236, action:3, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const cancel_match:Object = {module:236, action:4, request:[], response:[Utils.UByteUtil]};
        public static const get_player_score_exchange_info:Object = {module:236, action:5, request:[], response:[[Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const get_st_indiana_jones_member_info:Object = {module:236, action:6, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ShortUtil]]]};
        public static const get_player_events_info:Object = {module:236, action:7, request:[], response:[[Utils.ShortUtil]]};
        public static const get_layer_indiana_jones_info:Object = {module:236, action:10, request:[], response:[Utils.ByteUtil, [Utils.IntUtil], [Utils.IntUtil, Utils.ShortUtil], [Utils.ByteUtil, Utils.IntUtil], [Utils.ShortUtil, Utils.ByteUtil], Utils.ByteUtil]};
        public static const get_layer_boss_info:Object = {module:236, action:11, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const trigger_random_events:Object = {module:236, action:12, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const trigger_energy_symbol:Object = {module:236, action:13, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const fight_normal_monster:Object = {module:236, action:14, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const fight_boss:Object = {module:236, action:15, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const enter_next_layer:Object = {module:236, action:16, request:[], response:[Utils.UByteUtil]};
        public static const get_boss_hurt_rank:Object = {module:236, action:17, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const open_box:Object = {module:236, action:20, request:[Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ShortUtil]]};
        public static const get_player_box_award_info:Object = {module:236, action:21, request:[], response:[Utils.ShortUtil, [Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_box_shake_point_info:Object = {module:236, action:22, request:[], response:[Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil]]]};
        public static const shake_point:Object = {module:236, action:23, request:[], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const get_box_shake_point_info_end:Object = {module:236, action:24, request:[], response:[Utils.ShortUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil]]]};
        public static const little_notice:Object = {module:236, action:30, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.ShortUtil], [Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.IntUtil]]};
        public static const activity_notify:Object = {module:236, action:31, request:[], response:[Utils.UByteUtil]};
        public static const match_notify:Object = {module:236, action:32, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const map_notify:Object = {module:236, action:33, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_activity_indiana_jones_info", "get_player_indiana_jones_info", "score_exchange", "start_match", "cancel_match", "get_player_score_exchange_info", "get_st_indiana_jones_member_info", "get_player_events_info", "get_layer_indiana_jones_info", "get_layer_boss_info", "trigger_random_events", "trigger_energy_symbol", "fight_normal_monster", "fight_boss", "enter_next_layer", "get_boss_hurt_rank", "open_box", "get_player_box_award_info", "get_box_shake_point_info", "shake_point", "get_box_shake_point_info_end", "little_notice", "activity_notify", "match_notify", "map_notify"];

        public function Mod_StIndianaJones_Base()
        {
            return;
        }// end function

    }
}
