package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StWorldBoss_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENGHOU_INGOT:int = 1;
        public static const FULL_TIME:int = 2;
        public static const NOT_ENGHOU_VIP_LEVEL:int = 3;
        public static const HAS_DETECT_BOX:int = 4;
        public static const FULL_PACK:int = 5;
        public static const STATUS_ERROR:int = 6;
        public static const COIN:int = 7;
        public static const FAME:int = 8;
        public static const STATE_POINT:int = 9;
        public static const QI_PIN_JUAN:int = 10;
        public static const DAO_YUAN:int = 11;
        public static const ZHANMA_PIECE:int = 12;
        public static const BLOOD_ESSENCE:int = 13;
        public static const POWER_FAME:int = 14;
        public static const XING_HUN:int = 15;
        public static const ZHEN_YUAN:int = 16;
        public static const QI_HUN:int = 17;
        public static const NEI_DAN:int = 18;
        public static const ACTION_SUCCESS:int = 19;
        public static const ACTION_FAILED:int = 20;
        public static const NOT_BEGIN:int = 21;
        public static const MISSION_OVER:int = 22;
        public static const WORLD_BOSS_DEAD:int = 23;
        public static const DEATH_STATUS:int = 24;
        public static const NOT_ENOUGH_INGOT:int = 25;
        public static const FAILED:int = 26;
        public static const get_st_world_boss_panel_info:Object = {module:98, action:0, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const get_st_boss_detect_info:Object = {module:98, action:1, request:[], response:[[Utils.ByteUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ShortUtil]]};
        public static const detect:Object = {module:98, action:2, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.LongUtil]]};
        public static const get_st_world_boss_player_data:Object = {module:98, action:3, request:[], response:[[Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.LongUtil, Utils.ShortUtil, Utils.StringUtil], Utils.LongUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const get_st_world_boss_info:Object = {module:98, action:4, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.LongUtil, Utils.ByteUtil, Utils.LongUtil]};
        public static const fight_st_world_boss:Object = {module:98, action:5, request:[], response:[Utils.UByteUtil]};
        public static const clear_death_cd:Object = {module:98, action:6, request:[], response:[Utils.UByteUtil]};
        public static const player_death_cd:Object = {module:98, action:7, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const update_st_world_boss_position:Object = {module:98, action:8, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const st_world_boss_low_health:Object = {module:98, action:9, request:[], response:[Utils.ByteUtil, Utils.ByteUtil]};
        public static const open_st_world_boss:Object = {module:98, action:10, request:[], response:[Utils.ByteUtil, Utils.StringUtil, Utils.ByteUtil]};
        public static const close_st_world_boss:Object = {module:98, action:11, request:[], response:[Utils.ByteUtil, Utils.StringUtil, Utils.LongUtil, [Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const defeat_st_world_boss:Object = {module:98, action:12, request:[], response:[Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.LongUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const hurt_st_world_boss:Object = {module:98, action:13, request:[], response:[Utils.LongUtil, Utils.IntUtil]};
        public static const leave_st_boss:Object = {module:98, action:14, request:[], response:[]};
        public static const get_st_boss_activity_date:Object = {module:98, action:15, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_st_boss_all_player_info:Object = {module:98, action:16, request:[], response:[[Utils.IntUtil, Utils.IntUtil]]};
        public static const st_boss_player_status_update_notify:Object = {module:98, action:17, request:[], response:[Utils.ByteUtil]};
        public static const notify_war_report:Object = {module:98, action:18, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.LongUtil]]};
        public static const get_server_detect_weakness_info:Object = {module:98, action:19, request:[Utils.ByteUtil], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil]]};
        public static const get_self_server_detect_weakness_info:Object = {module:98, action:20, request:[], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil]]};
        public static const Actions:Array = ["get_st_world_boss_panel_info", "get_st_boss_detect_info", "detect", "get_st_world_boss_player_data", "get_st_world_boss_info", "fight_st_world_boss", "clear_death_cd", "player_death_cd", "update_st_world_boss_position", "st_world_boss_low_health", "open_st_world_boss", "close_st_world_boss", "defeat_st_world_boss", "hurt_st_world_boss", "leave_st_boss", "get_st_boss_activity_date", "get_st_boss_all_player_info", "st_boss_player_status_update_notify", "notify_war_report", "get_server_detect_weakness_info", "get_self_server_detect_weakness_info"];

        public function Mod_StWorldBoss_Base()
        {
            return;
        }// end function

    }
}
