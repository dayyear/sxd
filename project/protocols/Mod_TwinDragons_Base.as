﻿package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_TwinDragons_Base extends Object
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
        public static const TWIN_DRAGONS_STOP:int = 10;
        public static const TWIN_DRAGONS_PREPARE:int = 11;
        public static const TWIN_DRAGONS_APPLY:int = 12;
        public static const TWIN_DRAGONS_APPLY_COMPLETE:int = 13;
        public static const TWIN_DRAGONS_TIANBANG:int = 14;
        public static const TWIN_DRAGONS_DIBANG:int = 15;
        public static const TWIN_DRAGONS_DIBANG_COMPLETE:int = 16;
        public static const TWIN_DRAGONS_8:int = 17;
        public static const TWIN_DRAGONS_8_COMPLETE:int = 18;
        public static const TWIN_DRAGONS_4:int = 19;
        public static const TWIN_DRAGONS_4_COMPLETE:int = 20;
        public static const TWIN_DRAGONS_2:int = 21;
        public static const TWIN_DRAGONS_2_COMPLETE:int = 22;
        public static const TWIN_DRAGONS_1:int = 23;
        public static const TWIN_DRAGONS_1_COMPLETE:int = 24;
        public static const GROUP_NULL:int = 25;
        public static const GROUP_TIAN_BANG:int = 26;
        public static const GROUP_DI_BANG:int = 27;
        public static const YES:int = 28;
        public static const NO:int = 29;
        public static const MAIN_ROLE:int = 30;
        public static const FIRST_ROLE:int = 31;
        public static const SECOND_ROLE:int = 32;
        public static const SUCCESS:int = 33;
        public static const PLAYER_LEVEL_LIMIT:int = 34;
        public static const NON_SIGN_UP_STEP:int = 35;
        public static const ALREADY_IN_TEAM:int = 36;
        public static const FAILED:int = 37;
        public static const ALREADY_SIGN_UP:int = 38;
        public static const NON_LEADER:int = 39;
        public static const ALREADY_DISSOLVE:int = 40;
        public static const DEPLOY:int = 41;
        public static const NODEPLOY:int = 42;
        public static const REPLACE:int = 43;
        public static const ALREADY_CHOOSE:int = 44;
        public static const NO_ON_DEPLOY:int = 45;
        public static const NON_FRIEND:int = 46;
        public static const PASS_APPLY:int = 47;
        public static const KICKOUT_MEMBER:int = 48;
        public static const QUIT_TEAM:int = 49;
        public static const CHOOSE_HELP_ROLE:int = 50;
        public static const PASS_FRIEND_APPLY:int = 51;
        public static const NO_CHOOSE:int = 52;
        public static const NOT_EXIST_GRID:int = 53;
        public static const NOT_FULL:int = 54;
        public static const REAPPLY:int = 55;
        public static const NO_LEADER:int = 56;
        public static const NO_ENOUGTH_MEMBER:int = 57;
        public static const NO_APPLY_STEP:int = 58;
        public static const REBET:int = 59;
        public static const INVALID_RACE:int = 60;
        public static const NOT_ENOUGH_COIN:int = 61;
        public static const get_player_twin_dragons_team:Object = {module:90, action:0, request:[], response:[Utils.IntUtil]};
        public static const get_all_twin_dragons_team:Object = {module:90, action:1, request:[Utils.StringUtil, Utils.ShortUtil], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const get_twin_dragons_team_info:Object = {module:90, action:2, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]]]};
        public static const create_team:Object = {module:90, action:3, request:[], response:[Utils.UByteUtil]};
        public static const dissolve_team:Object = {module:90, action:4, request:[], response:[Utils.UByteUtil]};
        public static const apply_join_the_team:Object = {module:90, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const cancel_apply_join_the_team:Object = {module:90, action:6, request:[Utils.IntUtil], response:[]};
        public static const look_up_all_apply_player:Object = {module:90, action:7, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const pass_apply_of_the_player:Object = {module:90, action:8, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const ignore_apply_of_the_player:Object = {module:90, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const ignore_all_apply:Object = {module:90, action:10, request:[], response:[Utils.UByteUtil]};
        public static const kickout_member:Object = {module:90, action:11, request:[], response:[Utils.UByteUtil]};
        public static const quit_team:Object = {module:90, action:12, request:[], response:[Utils.UByteUtil]};
        public static const helper_role_list:Object = {module:90, action:13, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const choose_helper_role:Object = {module:90, action:14, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_can_apply_friend_list:Object = {module:90, action:15, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const apply_friend:Object = {module:90, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const pass_friend_apply:Object = {module:90, action:17, request:[Utils.StringUtil], response:[Utils.UByteUtil]};
        public static const ignore_friend_apply:Object = {module:90, action:18, request:[Utils.StringUtil], response:[]};
        public static const notify_team_info_change:Object = {module:90, action:19, request:[], response:[Utils.UByteUtil]};
        public static const get_twin_dragons_team_deploy:Object = {module:90, action:20, request:[], response:[Utils.IntUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const change_twin_dragons_deploy:Object = {module:90, action:21, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const get_race_step:Object = {module:90, action:27, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.StringUtil, [Utils.StringUtil, Utils.StringUtil]]};
        public static const get_standings:Object = {module:90, action:28, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_race_list:Object = {module:90, action:29, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, [Utils.ShortUtil, Utils.ShortUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil]]};
        public static const get_war_result_list:Object = {module:90, action:30, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_race_standings:Object = {module:90, action:31, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil], Utils.UByteUtil, Utils.UByteUtil]]};
        public static const apply:Object = {module:90, action:32, request:[], response:[Utils.UByteUtil]};
        public static const get_player_war_report:Object = {module:90, action:33, request:[Utils.IntUtil], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil], [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const get_player_bet:Object = {module:90, action:34, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil]]};
        public static const bet:Object = {module:90, action:35, request:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_bet_coin_rank:Object = {module:90, action:36, request:[], response:[[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.StringUtil, Utils.StringUtil, Utils.LongUtil]]};
        public static const Actions:Array = ["get_player_twin_dragons_team", "get_all_twin_dragons_team", "get_twin_dragons_team_info", "create_team", "dissolve_team", "apply_join_the_team", "cancel_apply_join_the_team", "look_up_all_apply_player", "pass_apply_of_the_player", "ignore_apply_of_the_player", "ignore_all_apply", "kickout_member", "quit_team", "helper_role_list", "choose_helper_role", "get_can_apply_friend_list", "apply_friend", "pass_friend_apply", "ignore_friend_apply", "notify_team_info_change", "get_twin_dragons_team_deploy", "change_twin_dragons_deploy", "get_race_step", "get_standings", "get_race_list", "get_war_result_list", "get_race_standings", "apply", "get_player_war_report", "get_player_bet", "bet", "get_bet_coin_rank"];

        public function Mod_TwinDragons_Base()
        {
            return;
        }// end function

    }
}
