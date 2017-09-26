package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Adventure_Base extends Object
    {
        public static const BOMB:int = 0;
        public static const SPIKE:int = 1;
        public static const COIN:int = 2;
        public static const SKILL:int = 3;
        public static const SAFE:int = 4;
        public static const THUNDER:int = 5;
        public static const SUCCESS:int = 6;
        public static const HAS_CREATED:int = 7;
        public static const FULL_TEAM_NUMBER:int = 8;
        public static const INVALID_TEAM_ID:int = 9;
        public static const FULL_MEMBER:int = 10;
        public static const HAS_IN_A_TEAM:int = 11;
        public static const FAILED:int = 12;
        public static const HASPLAYER:int = 13;
        public static const ERRORTEAMID:int = 14;
        public static const ERRORROWID:int = 15;
        public static const ERRORGRIDID:int = 16;
        public static const HASDEAD:int = 17;
        public static const HASOVER:int = 18;
        public static const UPDATE_TEAM_INFO:int = 19;
        public static const LEADER_DISSOLVE:int = 20;
        public static const KICK_OUT_TEAM:int = 21;
        public static const TIME_LIMIT:int = 22;
        public static const START_ADVENTURE:int = 23;
        public static const STOP_ADVENTURE:int = 24;
        public static const JOIN_ADVENTURE:int = 25;
        public static const GAME_OVER:int = 26;
        public static const INVALIDNUM:int = 27;
        public static const NOLEADER:int = 28;
        public static const NOTEAM:int = 29;
        public static const NOENOUGHINGOT:int = 30;
        public static const OVERFREETIMES:int = 31;
        public static const NOTEAMMEMBER:int = 32;
        public static const ISALIVE:int = 33;
        public static const get_adventure_open_time:Object = {module:73, action:0, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const open_adventure:Object = {module:73, action:1, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const get_player_team_info:Object = {module:73, action:2, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil]]};
        public static const create_adventure_team:Object = {module:73, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const dissolve_adventure_team:Object = {module:73, action:4, request:[Utils.IntUtil], response:[]};
        public static const join_adventure_team:Object = {module:73, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const exit_adventure_team:Object = {module:73, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const close_adventure:Object = {module:73, action:7, request:[], response:[]};
        public static const walk_adventure_grid:Object = {module:73, action:8, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify:Object = {module:73, action:9, request:[], response:[Utils.UByteUtil]};
        public static const kicked_out_member:Object = {module:73, action:10, request:[Utils.IntUtil, Utils.IntUtil], response:[]};
        public static const notify_new_team:Object = {module:73, action:11, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_drop_team:Object = {module:73, action:12, request:[], response:[Utils.IntUtil]};
        public static const notify_update_member_number:Object = {module:73, action:13, request:[], response:[Utils.IntUtil, Utils.ByteUtil]};
        public static const notify_end_award:Object = {module:73, action:14, request:[Utils.IntUtil], response:[Utils.ByteUtil]};
        public static const start_adventure:Object = {module:73, action:15, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_adventure_info:Object = {module:73, action:16, request:[Utils.IntUtil], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const revival_player:Object = {module:73, action:17, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_adventure_open_time", "open_adventure", "get_player_team_info", "create_adventure_team", "dissolve_adventure_team", "join_adventure_team", "exit_adventure_team", "close_adventure", "walk_adventure_grid", "notify", "kicked_out_member", "notify_new_team", "notify_drop_team", "notify_update_member_number", "notify_end_award", "start_adventure", "get_adventure_info", "revival_player"];

        public function Mod_Adventure_Base()
        {
            return;
        }// end function

    }
}
