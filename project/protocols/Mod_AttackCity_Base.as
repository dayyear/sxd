package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_AttackCity_Base extends Object
    {
        public static const CLOSE:int = 0;
        public static const PREPARE:int = 1;
        public static const APPLY:int = 2;
        public static const APPLY_COMPLETE:int = 3;
        public static const STALEMATE:int = 4;
        public static const CLASH:int = 5;
        public static const DECISIVE_BATTLE:int = 6;
        public static const RACE_COMPLETE:int = 7;
        public static const PEACE:int = 8;
        public static const FIGHT:int = 9;
        public static const STATION:int = 10;
        public static const MOVING:int = 11;
        public static const DEFEND:int = 12;
        public static const ATTACK:int = 13;
        public static const DEATH:int = 14;
        public static const OUTOF:int = 15;
        public static const YES:int = 16;
        public static const NO:int = 17;
        public static const SUCCESS:int = 18;
        public static const NON_APPLY_STEP:int = 19;
        public static const PLAYER_LEVEL_LIMIT:int = 20;
        public static const FAILED:int = 21;
        public static const COIN:int = 22;
        public static const ITEM:int = 23;
        public static const STATE_POINT:int = 24;
        public static const DAO_YUAN:int = 25;
        public static const AC_TOOL:int = 26;
        public static const BLOOD_ESSENCE:int = 27;
        public static const NEI_DAN:int = 28;
        public static const QI_HUN:int = 29;
        public static const MAGIC_ARMS_BUFF:int = 30;
        public static const ROLE_SCRAP:int = 31;
        public static const XIAN_LING:int = 32;
        public static const CHAOS_VOID:int = 33;
        public static const ST_SPEAKER:int = 34;
        public static const NO_ENOUGH_HONOR:int = 35;
        public static const NO_ENOUGH_HONOR_ITEM:int = 36;
        public static const NO_ENOUGH_INGOT:int = 37;
        public static const SET_ATTACK_CITY_STATUS:int = 38;
        public static const CITY_CAMP_CHANGE:int = 39;
        public static const CITY_STATUS_CHANGE:int = 40;
        public static const TOWN_QI_XUE:int = 41;
        public static const APPLY_ATTACK_CITY:int = 42;
        public static const START_MOVE:int = 43;
        public static const MOVE_TO_CITY:int = 44;
        public static const QI_XUE:int = 45;
        public static const QIAN_BI:int = 46;
        public static const ENERGE:int = 47;
        public static const NO_OUTSIDE_CITY:int = 48;
        public static const PLAYER:int = 49;
        public static const NPC:int = 50;
        public static const APPLY_LOCK:int = 51;
        public static const ENEMY_LOCK:int = 52;
        public static const DIFFERENT_TOWN:int = 53;
        public static const APPLY_DEAD:int = 54;
        public static const ENEMY_DEAD:int = 55;
        public static const SAME_CAMP:int = 56;
        public static const ENERGY_NO_ENOUGH:int = 57;
        public static const NPC_LOCK:int = 58;
        public static const NPC_DEAD:int = 59;
        public static const DEFENSERS:int = 60;
        public static const APPLY_NO_IN_TOWN:int = 61;
        public static const HUO_LI:int = 62;
        public static const NO_ENOUGH_COIN:int = 63;
        public static const get_attack_city_race_info:Object = {module:159, action:0, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil]]};
        public static const is_player_apply:Object = {module:159, action:1, request:[], response:[Utils.UByteUtil]};
        public static const player_apply:Object = {module:159, action:2, request:[], response:[Utils.UByteUtil]};
        public static const get_attack_city_player_info:Object = {module:159, action:3, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ShortUtil]]};
        public static const move_to_another_city:Object = {module:159, action:4, request:[[Utils.ByteUtil, Utils.ShortUtil]], response:[Utils.UByteUtil]};
        public static const all_player_position_info:Object = {module:159, action:5, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ShortUtil]]]};
        public static const all_apply_server_info:Object = {module:159, action:6, request:[], response:[[Utils.StringUtil, Utils.StringUtil]]};
        public static const all_city_info:Object = {module:159, action:7, request:[], response:[[Utils.ByteUtil, Utils.ShortUtil], [Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil]]};
        public static const get_city_data:Object = {module:159, action:8, request:[Utils.ShortUtil], response:[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_group_addr:Object = {module:159, action:9, request:[], response:[Utils.StringUtil]};
        public static const get_player_honor_info:Object = {module:159, action:10, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const honor_lottery:Object = {module:159, action:11, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const use_honor_item:Object = {module:159, action:12, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const notify_global:Object = {module:159, action:13, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.UByteUtil, [Utils.ByteUtil]], [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_player:Object = {module:159, action:14, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ShortUtil]], Utils.IntUtil]};
        public static const enter_city:Object = {module:159, action:15, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const move_to:Object = {module:159, action:16, request:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], response:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_players:Object = {module:159, action:17, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_players_by_camp:Object = {module:159, action:18, request:[Utils.IntUtil, Utils.ByteUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const fight:Object = {module:159, action:19, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const fight_npc:Object = {module:159, action:20, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_war_report:Object = {module:159, action:21, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_battle_result:Object = {module:159, action:23, request:[], response:[Utils.StringUtil, Utils.StringUtil]};
        public static const buy_resource:Object = {module:159, action:24, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const leave_city:Object = {module:159, action:25, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_player_in_city_info:Object = {module:159, action:26, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const get_max_player_level:Object = {module:159, action:27, request:[], response:[Utils.ShortUtil]};
        public static const get_group_local_timestamp:Object = {module:159, action:28, request:[], response:[Utils.IntUtil]};
        public static const get_town_npc_troops:Object = {module:159, action:29, request:[Utils.IntUtil], response:[Utils.IntUtil]};
        public static const player_leave_attack_city:Object = {module:159, action:30, request:[], response:[]};
        public static const war_info:Object = {module:159, action:31, request:[], response:[[Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]]]};
        public static const buy_coin:Object = {module:159, action:32, request:[], response:[Utils.UByteUtil]};
        public static const buy_energy:Object = {module:159, action:33, request:[], response:[Utils.UByteUtil]};
        public static const move_quickly:Object = {module:159, action:34, request:[], response:[Utils.UByteUtil]};
        public static const relive_quickly:Object = {module:159, action:35, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_attack_city_race_info", "is_player_apply", "player_apply", "get_attack_city_player_info", "move_to_another_city", "all_player_position_info", "all_apply_server_info", "all_city_info", "get_city_data", "get_group_addr", "get_player_honor_info", "honor_lottery", "use_honor_item", "notify_global", "notify_player", "enter_city", "move_to", "get_players", "get_players_by_camp", "fight", "fight_npc", "notify_war_report", "notify_battle_result", "buy_resource", "leave_city", "get_player_in_city_info", "get_max_player_level", "get_group_local_timestamp", "get_town_npc_troops", "player_leave_attack_city", "war_info", "buy_coin", "buy_energy", "move_quickly", "relive_quickly"];

        public function Mod_AttackCity_Base()
        {
            return;
        }// end function

    }
}
