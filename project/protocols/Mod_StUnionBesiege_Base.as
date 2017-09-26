package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUnionBesiege_Base extends Object
    {
        public static const PREPARE:int = 0;
        public static const OPEN:int = 1;
        public static const CLOSE:int = 2;
        public static const FINISH:int = 3;
        public static const TRUE:int = 4;
        public static const FALSE:int = 5;
        public static const ATTACK:int = 6;
        public static const DEFENSE:int = 7;
        public static const SUCCESS:int = 8;
        public static const CD:int = 9;
        public static const NO_OPEN:int = 10;
        public static const NO_IN_TOWN:int = 11;
        public static const REBORN_AREA:int = 12;
        public static const PLAYER_EXISTS:int = 13;
        public static const PLAYER_NO_EXISTS:int = 14;
        public static const SIDE_ERROR:int = 15;
        public static const CAN_NOT_CHANGE_ROLES:int = 16;
        public static const FUNCTION_NO_OPEN:int = 17;
        public static const GAME_OVER:int = 18;
        public static const PLAYER:int = 19;
        public static const WALL:int = 20;
        public static const ST_UNION:int = 21;
        public static const KILLER:int = 22;
        public static const PLAYER_HURT:int = 23;
        public static const ST_UNION_HURT:int = 24;
        public static const ATTACKER:int = 25;
        public static const DEFENSER:int = 26;
        public static const MO_BAI:int = 27;
        public static const BI_SHI:int = 28;
        public static const RE_MOBAI:int = 29;
        public static const FAILURE:int = 30;
        public static const DEFENSER_WIN:int = 31;
        public static const ATTACKER_WIN:int = 32;
        public static const NO_ENOUGH_INGOT:int = 33;
        public static const YES:int = 34;
        public static const NO:int = 35;
        public static const BUFF_1:int = 36;
        public static const BUFF_2:int = 37;
        public static const BUFF_3:int = 38;
        public static const BUFF_4:int = 39;
        public static const BUFF_5:int = 40;
        public static const USED:int = 41;
        public static const NO_LEADER:int = 42;
        public static const DUPLICATE_USE:int = 43;
        public static const get_activity_state:Object = {module:223, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const notify:Object = {module:223, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_st_unions:Object = {module:223, action:2, request:[], response:[[Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const get_wall_info:Object = {module:223, action:3, request:[], response:[Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], [Utils.IntUtil, Utils.ShortUtil], Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const get_cd_time:Object = {module:223, action:4, request:[], response:[Utils.ShortUtil]};
        public static const get_fightable_players:Object = {module:223, action:6, request:[Utils.UByteUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const fight:Object = {module:223, action:7, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_war_report:Object = {module:223, action:8, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const get_kill_list:Object = {module:223, action:9, request:[], response:[[Utils.ShortUtil, Utils.StringUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_top_list:Object = {module:223, action:10, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil], Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_player_rank:Object = {module:223, action:14, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_new_top_10:Object = {module:223, action:15, request:[], response:[Utils.UByteUtil, [Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil]]};
        public static const notify_wall_health_decrease:Object = {module:223, action:16, request:[], response:[Utils.LongUtil]};
        public static const get_defense_st_union_name:Object = {module:223, action:17, request:[], response:[Utils.StringUtil]};
        public static const get_besiege_info:Object = {module:223, action:18, request:[], response:[[Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil], [Utils.StringUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.UByteUtil], Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil]};
        public static const mo_bai:Object = {module:223, action:19, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_result:Object = {module:223, action:20, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_battle_result:Object = {module:223, action:21, request:[], response:[Utils.UByteUtil, Utils.StringUtil]};
        public static const notify_player_cd:Object = {module:223, action:22, request:[], response:[Utils.IntUtil, Utils.ShortUtil]};
        public static const clean_cd:Object = {module:223, action:23, request:[], response:[Utils.UByteUtil]};
        public static const get_qualication_flag:Object = {module:223, action:24, request:[], response:[Utils.UByteUtil]};
        public static const get_mo_bai_info:Object = {module:223, action:25, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_defenser_count:Object = {module:223, action:26, request:[], response:[Utils.ShortUtil]};
        public static const use_buff:Object = {module:223, action:27, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_use_leader_buff:Object = {module:223, action:28, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.UByteUtil, Utils.ShortUtil]};
        public static const notify_honor_changed:Object = {module:223, action:29, request:[], response:[Utils.IntUtil]};
        public static const Actions:Array = ["get_activity_state", "notify", "get_st_unions", "get_wall_info", "get_cd_time", "get_fightable_players", "fight", "notify_war_report", "get_kill_list", "get_top_list", "get_player_rank", "notify_new_top_10", "notify_wall_health_decrease", "get_defense_st_union_name", "get_besiege_info", "mo_bai", "notify_result", "notify_battle_result", "notify_player_cd", "clean_cd", "get_qualication_flag", "get_mo_bai_info", "notify_defenser_count", "use_buff", "notify_use_leader_buff", "notify_honor_changed"];

        public function Mod_StUnionBesiege_Base()
        {
            return;
        }// end function

    }
}
