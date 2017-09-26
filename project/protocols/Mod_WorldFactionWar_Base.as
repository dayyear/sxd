package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WorldFactionWar_Base extends Object
    {
        public static const RACE_TYPE_CLOSE:int = 0;
        public static const RACE_TYPE_WORLD_SELECT_RACE:int = 1;
        public static const RACE_TYPE_WORLD_RACE:int = 2;
        public static const CLOSE:int = 3;
        public static const WORLD_FACTION_WAR_SIGN_UP:int = 4;
        public static const WORLD_FACTION_WAR_SIGN_UP_COMPLETE:int = 5;
        public static const WORLD_FACTION_WAR_PREPARE:int = 6;
        public static const WORLD_FACTION_WAR_APPLY:int = 7;
        public static const WORLD_FACTION_WAR_APPLY_COMPLETE:int = 8;
        public static const WORLD_FACTION_WAR_TIANBANG:int = 9;
        public static const WORLD_FACTION_WAR_DIBANG:int = 10;
        public static const WORLD_FACTION_WAR_DIBANG_COMPLETE:int = 11;
        public static const WORLD_FACTION_WAR_16:int = 12;
        public static const WORLD_FACTION_WAR_16_COMPLETE:int = 13;
        public static const WORLD_FACTION_WAR_8:int = 14;
        public static const WORLD_FACTION_WAR_8_COMPLETE:int = 15;
        public static const WORLD_FACTION_WAR_4:int = 16;
        public static const WORLD_FACTION_WAR_4_COMPLETE:int = 17;
        public static const WORLD_FACTION_WAR_2:int = 18;
        public static const WORLD_FACTION_WAR_2_COMPLETE:int = 19;
        public static const WORLD_FACTION_WAR_1:int = 20;
        public static const WORLD_FACTION_WAR_1_COMPLETE:int = 21;
        public static const GROUP_NULL:int = 22;
        public static const GROUP_TIAN_BANG:int = 23;
        public static const GROUP_DI_BANG:int = 24;
        public static const SUCCESS:int = 25;
        public static const SIGN_UP_NO_OPEN:int = 26;
        public static const REQUIRE_LEVEL:int = 27;
        public static const ERROR:int = 28;
        public static const REBET:int = 29;
        public static const INVALID_RACE:int = 30;
        public static const NOT_ENOUGH_COIN:int = 31;
        public static const FULL_BAG:int = 32;
        public static const CAN_NOT_RECEIVE:int = 33;
        public static const get_race_step:Object = {module:49, action:0, request:[], response:[Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, [Utils.StringUtil, Utils.StringUtil], Utils.IntUtil]};
        public static const get_race_list:Object = {module:49, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil]]};
        public static const get_war_result_list:Object = {module:49, action:2, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_standings:Object = {module:49, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_race_standings:Object = {module:49, action:4, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil], Utils.UByteUtil]]};
        public static const sign_up:Object = {module:49, action:5, request:[], response:[Utils.UByteUtil]};
        public static const sign_list:Object = {module:49, action:6, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_player_bet:Object = {module:49, action:7, request:[], response:[[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const bet:Object = {module:49, action:8, request:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_bet_coin_rank:Object = {module:49, action:9, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil]]};
        public static const world_faction_war_single_result:Object = {module:49, action:10, request:[], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]};
        public static const world_faction_war_report:Object = {module:49, action:11, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil], response:[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]], Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil]]};
        public static const fight_member_list:Object = {module:49, action:12, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const award_info:Object = {module:49, action:13, request:[], response:[[Utils.IntUtil]]};
        public static const receive_award:Object = {module:49, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const now_figth_faction:Object = {module:49, action:15, request:[Utils.UByteUtil], response:[[Utils.IntUtil]]};
        public static const set_plot:Object = {module:49, action:16, request:[Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_plot:Object = {module:49, action:17, request:[Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil], response:[Utils.ByteUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_race_step", "get_race_list", "get_war_result_list", "get_standings", "get_race_standings", "sign_up", "sign_list", "get_player_bet", "bet", "get_bet_coin_rank", "world_faction_war_single_result", "world_faction_war_report", "fight_member_list", "award_info", "receive_award", "now_figth_faction", "set_plot", "get_plot"];

        public function Mod_WorldFactionWar_Base()
        {
            return;
        }// end function

    }
}
