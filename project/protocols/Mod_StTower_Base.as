package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StTower_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const FALSE:int = 3;
        public static const FAILD_TOWER:int = 4;
        public static const HAS_CREATED:int = 5;
        public static const FULL_TEAM_NUMBER:int = 6;
        public static const ERROR_TOWER_ID:int = 7;
        public static const INVALID_TEAM_ID:int = 8;
        public static const FULL_MEMBER:int = 9;
        public static const HAS_IN_A_TEAM:int = 10;
        public static const IS_BEGIN:int = 11;
        public static const FAILED:int = 12;
        public static const UPDATE_TEAM_INFO:int = 13;
        public static const LEADER_DISSOLVE:int = 14;
        public static const KICK_ST_TOWER:int = 15;
        public static const START_ST_TOWER:int = 16;
        public static const TEAM_UPDATA:int = 17;
        public static const ENTER_NEXT:int = 18;
        public static const DEPLOY_CHANGE:int = 19;
        public static const FIRST_SUCCESS_AWARD:int = 20;
        public static const AWARD:int = 21;
        public static const FULL_AWARD:int = 22;
        public static const OPEN:int = 23;
        public static const CLOSE:int = 24;
        public static const NOT_FIND:int = 25;
        public static const NOT_OPEN:int = 26;
        public static const NOT_EXIST_GRID:int = 27;
        public static const SUCCEED:int = 28;
        public static const STAGE_COMPLETE:int = 29;
        public static const INSUFFICIENT_KEY:int = 30;
        public static const ERROR:int = 31;
        public static const CD_TIME:int = 32;
        public static const GOLDEN:int = 33;
        public static const SILVER:int = 34;
        public static const BRONZE:int = 35;
        public static const NULL:int = 36;
        public static const AWARD_FULL:int = 37;
        public static const DEPLOY:int = 38;
        public static const NODEPLOY:int = 39;
        public static const REPLACE:int = 40;
        public static const get_st_tower_open_time:Object = {module:109, action:0, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const open_st_tower:Object = {module:109, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_team_info:Object = {module:109, action:2, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const create_st_tower_team:Object = {module:109, action:3, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const dissolve_st_tower_team:Object = {module:109, action:4, request:[Utils.IntUtil], response:[]};
        public static const join_st_tower_team:Object = {module:109, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const exit_st_tower_team:Object = {module:109, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const close_st_tower:Object = {module:109, action:7, request:[], response:[]};
        public static const notify:Object = {module:109, action:9, request:[], response:[Utils.UByteUtil]};
        public static const kicked_out_member:Object = {module:109, action:10, request:[Utils.IntUtil, Utils.IntUtil], response:[]};
        public static const notify_end_award:Object = {module:109, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const filter_team:Object = {module:109, action:12, request:[Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_st_tower_status:Object = {module:109, action:13, request:[], response:[Utils.UByteUtil]};
        public static const find_team:Object = {module:109, action:14, request:[Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const change_st_tower_deploy:Object = {module:109, action:15, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_st_tower_deploy:Object = {module:109, action:16, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const get_st_tower_dragon_blood:Object = {module:109, action:17, request:[], response:[Utils.ShortUtil]};
        public static const get_can_challenge_max_st_tower_id:Object = {module:109, action:18, request:[], response:[Utils.ByteUtil]};
        public static const challenge:Object = {module:109, action:19, request:[Utils.ShortUtil, Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const start:Object = {module:109, action:20, request:[], response:[]};
        public static const war_result:Object = {module:109, action:21, request:[], response:[[[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]], Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil], Utils.UByteUtil, Utils.ShortUtil]};
        public static const enter_next:Object = {module:109, action:22, request:[], response:[]};
        public static const choose_role:Object = {module:109, action:23, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const helper_role_list:Object = {module:109, action:24, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const deploy_change:Object = {module:109, action:25, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_st_tower_open_time", "open_st_tower", "get_player_team_info", "create_st_tower_team", "dissolve_st_tower_team", "join_st_tower_team", "exit_st_tower_team", "close_st_tower", "notify", "kicked_out_member", "notify_end_award", "filter_team", "notify_st_tower_status", "find_team", "change_st_tower_deploy", "get_st_tower_deploy", "get_st_tower_dragon_blood", "get_can_challenge_max_st_tower_id", "challenge", "start", "war_result", "enter_next", "choose_role", "helper_role_list", "deploy_change"];

        public function Mod_StTower_Base()
        {
            return;
        }// end function

    }
}
