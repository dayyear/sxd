package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SealDemon_Base extends Object
    {
        public static const FALL:int = 0;
        public static const TORNADO:int = 1;
        public static const COIN:int = 2;
        public static const SKILL:int = 3;
        public static const SAFE:int = 4;
        public static const THUNDER:int = 5;
        public static const MONSTER:int = 6;
        public static const FIREGRAGAN:int = 7;
        public static const SUCCESS:int = 8;
        public static const HAS_CREATED:int = 9;
        public static const FULL_TEAM_NUMBER:int = 10;
        public static const INVALID_TEAM_ID:int = 11;
        public static const FULL_MEMBER:int = 12;
        public static const HAS_IN_A_TEAM:int = 13;
        public static const FAILED:int = 14;
        public static const HASPLAYER:int = 15;
        public static const ERRORTEAMID:int = 16;
        public static const ERRORROWID:int = 17;
        public static const ERRORGRIDID:int = 18;
        public static const HASDEAD:int = 19;
        public static const HASOVER:int = 20;
        public static const UPDATE_TEAM_INFO:int = 21;
        public static const LEADER_DISSOLVE:int = 22;
        public static const KICK_OUT_TEAM:int = 23;
        public static const TIME_LIMIT:int = 24;
        public static const START_SEAL_DEMON:int = 25;
        public static const STOP_SEAL_DEMON:int = 26;
        public static const JOIN_SEAL_DEMON:int = 27;
        public static const GAME_OVER:int = 28;
        public static const INVALIDNUM:int = 29;
        public static const NOLEADER:int = 30;
        public static const NOTEAM:int = 31;
        public static const ACTION_SUCCESS:int = 32;
        public static const MONSTER_DEAD:int = 33;
        public static const ACTION_FAILED:int = 34;
        public static const NOT_ENOUGH_INGOT:int = 35;
        public static const MAX_BUFF:int = 36;
        public static const get_seal_demon_open_time:Object = {module:75, action:0, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil]};
        public static const open_seal_demon:Object = {module:75, action:1, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const get_player_team_info:Object = {module:75, action:2, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil]]};
        public static const create_seal_demon_team:Object = {module:75, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const dissolve_seal_demon_team:Object = {module:75, action:4, request:[Utils.IntUtil], response:[]};
        public static const join_seal_demon_team:Object = {module:75, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const exit_seal_demon_team:Object = {module:75, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const close_seal_demon:Object = {module:75, action:7, request:[], response:[]};
        public static const walk_seal_demon_grid:Object = {module:75, action:8, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify:Object = {module:75, action:9, request:[], response:[Utils.UByteUtil]};
        public static const kicked_out_member:Object = {module:75, action:10, request:[Utils.IntUtil, Utils.IntUtil], response:[]};
        public static const notify_new_team:Object = {module:75, action:11, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_drop_team:Object = {module:75, action:12, request:[], response:[Utils.IntUtil]};
        public static const notify_update_member_number:Object = {module:75, action:13, request:[], response:[Utils.IntUtil, Utils.ByteUtil]};
        public static const notify_end_award:Object = {module:75, action:14, request:[Utils.IntUtil], response:[Utils.ByteUtil]};
        public static const start_seal_demon:Object = {module:75, action:15, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil]]};
        public static const get_seal_demon_info:Object = {module:75, action:16, request:[Utils.IntUtil], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const revival_player:Object = {module:75, action:17, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const challenge_monster_result:Object = {module:75, action:18, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], Utils.IntUtil]};
        public static const player_death_cd:Object = {module:75, action:19, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const clear_death_cd:Object = {module:75, action:20, request:[], response:[Utils.UByteUtil]};
        public static const get_team_player_health:Object = {module:75, action:21, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_buff:Object = {module:75, action:22, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const get_buff:Object = {module:75, action:23, request:[], response:[Utils.ByteUtil]};
        public static const Actions:Array = ["get_seal_demon_open_time", "open_seal_demon", "get_player_team_info", "create_seal_demon_team", "dissolve_seal_demon_team", "join_seal_demon_team", "exit_seal_demon_team", "close_seal_demon", "walk_seal_demon_grid", "notify", "kicked_out_member", "notify_new_team", "notify_drop_team", "notify_update_member_number", "notify_end_award", "start_seal_demon", "get_seal_demon_info", "revival_player", "challenge_monster_result", "player_death_cd", "clear_death_cd", "get_team_player_health", "buy_buff", "get_buff"];

        public function Mod_SealDemon_Base()
        {
            return;
        }// end function

    }
}
