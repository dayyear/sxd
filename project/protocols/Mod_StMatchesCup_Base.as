package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StMatchesCup_Base extends Object
    {
        public static const CLOSE:int = 0;
        public static const INIT:int = 1;
        public static const STEP_16:int = 2;
        public static const STEP_16_COMPLETE:int = 3;
        public static const STEP_8:int = 4;
        public static const STEP_8_COMPLETE:int = 5;
        public static const STEP_4:int = 6;
        public static const STEP_4_COMPLETE:int = 7;
        public static const STEP_2:int = 8;
        public static const STEP_2_COMPLETE:int = 9;
        public static const STEP_1:int = 10;
        public static const STEP_1_COMPLETE:int = 11;
        public static const WIN:int = 12;
        public static const LOSE:int = 13;
        public static const LEADER:int = 14;
        public static const MEMBER:int = 15;
        public static const YES:int = 16;
        public static const NO:int = 17;
        public static const SUCCESS:int = 18;
        public static const NOT_TEAM_LEADER:int = 19;
        public static const INVALID_NAME:int = 20;
        public static const TOO_LONG:int = 21;
        public static const DUPLICATE_NAME:int = 22;
        public static const NTH_ERROR:int = 23;
        public static const ST_PLAYER_ID_ERROR:int = 24;
        public static const DUPLICATE_NTH:int = 25;
        public static const DUPLICATE_ST_PLAYER_ID:int = 26;
        public static const LOCK:int = 27;
        public static const NOT_START:int = 28;
        public static const BET_RACE_STEP_ERROR:int = 29;
        public static const BET_ST_SERVER_ERROR:int = 30;
        public static const REBET:int = 31;
        public static const NULL_ROUND:int = 32;
        public static const REFRESH_WAR_REPORT:int = 33;
        public static const PLAYER_ROLE_ID_ERROR:int = 34;
        public static const GRID_ID_ERROR:int = 35;
        public static const MAIN_ROLE_LIMIT:int = 36;
        public static const COUNT_LIMIT:int = 37;
        public static const NO_CANDIDATE:int = 38;
        public static const SELF:int = 39;
        public static const CANNOT_CHANGE_DEPLOY:int = 40;
        public static const RE_CANDIDATED:int = 41;
        public static const DEPLOY:int = 42;
        public static const ALREADY_CANDIDATE_NEW:int = 43;
        public static const OLD_NO_CANDIDATE:int = 44;
        public static const CHANGE_SAME_ROLE:int = 45;
        public static const NODEPLOY:int = 46;
        public static const REPLACE:int = 47;
        public static const get_cup_info:Object = {module:371, action:0, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.StringUtil], Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const serialize_war_report:Object = {module:371, action:1, request:[], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]};
        public static const get_my_team_info:Object = {module:371, action:2, request:[], response:[Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil], Utils.IntUtil, Utils.UByteUtil]]};
        public static const modify_name:Object = {module:371, action:3, request:[Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const modify_nth:Object = {module:371, action:4, request:[[Utils.ByteUtil, Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const get_team_info:Object = {module:371, action:5, request:[Utils.IntUtil], response:[Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, [Utils.IntUtil]]]};
        public static const get_my_result:Object = {module:371, action:6, request:[], response:[[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]]};
        public static const get_result:Object = {module:371, action:7, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.StringUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_bet_team_info:Object = {module:371, action:8, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.IntUtil, Utils.StringUtil, [Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.StringUtil, [Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const bet:Object = {module:371, action:9, request:[Utils.UByteUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_my_bet_info:Object = {module:371, action:10, request:[], response:[[Utils.UByteUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil]]};
        public static const get_team_bet_times:Object = {module:371, action:11, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.LongUtil]]};
        public static const notify_race_step:Object = {module:371, action:12, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const notify_war_result:Object = {module:371, action:13, request:[], response:[Utils.UByteUtil]};
        public static const modify_deploy:Object = {module:371, action:14, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const notify_deploy_change:Object = {module:371, action:15, request:[], response:[Utils.UByteUtil]};
        public static const candidate:Object = {module:371, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const change_candidate:Object = {module:371, action:17, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_deploy_info:Object = {module:371, action:18, request:[], response:[Utils.IntUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.UByteUtil]};
        public static const avaliable_role_list:Object = {module:371, action:19, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const get_race_step:Object = {module:371, action:20, request:[], response:[Utils.UByteUtil]};
        public static const get_buff_detail:Object = {module:371, action:21, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_cup_info", "serialize_war_report", "get_my_team_info", "modify_name", "modify_nth", "get_team_info", "get_my_result", "get_result", "get_bet_team_info", "bet", "get_my_bet_info", "get_team_bet_times", "notify_race_step", "notify_war_result", "modify_deploy", "notify_deploy_change", "candidate", "change_candidate", "get_deploy_info", "avaliable_role_list", "get_race_step", "get_buff_detail"];

        public function Mod_StMatchesCup_Base()
        {
            return;
        }// end function

    }
}
