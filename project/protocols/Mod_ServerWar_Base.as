package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ServerWar_Base extends Object
    {
        public static const RACE_TYPE_CLOSE:int = 0;
        public static const RACE_TYPE_STAGE_SELECT_RACE:int = 1;
        public static const RACE_TYPE_STAGE_RACE:int = 2;
        public static const RACE_TYPE_WORLD_SELECT_RACE:int = 3;
        public static const RACE_TYPE_WORLD_RACE:int = 4;
        public static const WORLD_WAR_LEVEL_NULL:int = 5;
        public static const WORLD_WAR_LEVEL_70:int = 6;
        public static const WORLD_WAR_LEVEL_80:int = 7;
        public static const WORLD_WAR_LEVEL_90:int = 8;
        public static const CLOSE:int = 9;
        public static const SERVER_WAR_STOP:int = 10;
        public static const SERVER_WAR_PREPARE:int = 11;
        public static const SERVER_WAR_APPLY:int = 12;
        public static const SERVER_WAR_APPLY_COMPLETE:int = 13;
        public static const SERVER_WAR_TIANBANG:int = 14;
        public static const SERVER_WAR_DIBANG:int = 15;
        public static const SERVER_WAR_DIBANG_COMPLETE:int = 16;
        public static const SERVER_WAR_16:int = 17;
        public static const SERVER_WAR_16_COMPLETE:int = 18;
        public static const SERVER_WAR_8:int = 19;
        public static const SERVER_WAR_8_COMPLETE:int = 20;
        public static const SERVER_WAR_4:int = 21;
        public static const SERVER_WAR_4_COMPLETE:int = 22;
        public static const SERVER_WAR_2:int = 23;
        public static const SERVER_WAR_2_COMPLETE:int = 24;
        public static const SERVER_WAR_1:int = 25;
        public static const SERVER_WAR_1_COMPLETE:int = 26;
        public static const GROUP_NULL:int = 27;
        public static const GROUP_TIAN_BANG:int = 28;
        public static const GROUP_DI_BANG:int = 29;
        public static const SUCCESS:int = 30;
        public static const REAPPLY:int = 31;
        public static const REQUEST_LEVEL:int = 32;
        public static const NO_APPLY_STEP:int = 33;
        public static const PACK_FULL:int = 34;
        public static const REBET:int = 35;
        public static const INVALID_RACE:int = 36;
        public static const NOT_ENOUGH_COIN:int = 37;
        public static const WIN:int = 38;
        public static const LOSE:int = 39;
        public static const ZERO_ROUND:int = 40;
        public static const FIRST_ROUND:int = 41;
        public static const SECOND_ROUND:int = 42;
        public static const THIRD_ROUND:int = 43;
        public static const FOUR_ROUND:int = 44;
        public static const CAN_CHANGE_DEPLOY:int = 45;
        public static const CANNT_CHANGE_DEPLOY:int = 46;
        public static const NOT_EXIST_PLAYER_ROLE:int = 47;
        public static const NOT_EXIST_GRID:int = 48;
        public static const LAST_RACE_WIN:int = 49;
        public static const FAILED:int = 50;
        public static const DEPLOY:int = 51;
        public static const NODEPLOY:int = 52;
        public static const REPLACE:int = 53;
        public static const ALREADY_CHOOSE:int = 54;
        public static const NUMBER_LIMIT:int = 55;
        public static const get_race_step:Object = {module:36, action:0, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.StringUtil, [Utils.StringUtil, Utils.StringUtil]]};
        public static const get_standings:Object = {module:36, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_race_list:Object = {module:36, action:2, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil]]};
        public static const get_war_result_list:Object = {module:36, action:3, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_race_standings:Object = {module:36, action:4, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil], Utils.UByteUtil, Utils.UByteUtil]]};
        public static const apply:Object = {module:36, action:5, request:[], response:[Utils.UByteUtil]};
        public static const get_player_war_report:Object = {module:36, action:6, request:[Utils.IntUtil], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]};
        public static const get_player_bet:Object = {module:36, action:7, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const bet:Object = {module:36, action:8, request:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_bet_coin_rank:Object = {module:36, action:9, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil]]};
        public static const get_server_war_deploy:Object = {module:36, action:10, request:[], response:[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const change_server_war_deploy:Object = {module:36, action:11, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const get_other_server_war_deploy:Object = {module:36, action:12, request:[], response:[Utils.StringUtil]};
        public static const notift_deploy_info_change:Object = {module:36, action:13, request:[], response:[Utils.UByteUtil]};
        public static const helper_role_list:Object = {module:36, action:14, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const choose_player_role:Object = {module:36, action:15, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const change_player_role:Object = {module:36, action:16, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_race_step", "get_standings", "get_race_list", "get_war_result_list", "get_race_standings", "apply", "get_player_war_report", "get_player_bet", "bet", "get_bet_coin_rank", "get_server_war_deploy", "change_server_war_deploy", "get_other_server_war_deploy", "notift_deploy_info_change", "helper_role_list", "choose_player_role", "change_player_role"];

        public function Mod_ServerWar_Base()
        {
            return;
        }// end function

    }
}
