package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUnionSixvsix_Base extends Object
    {
        public static const RACE_TYPE_CLOSE:int = 0;
        public static const RACE_TYPE_STAGE_SELECT_RACE:int = 1;
        public static const RACE_TYPE_STAGE_RACE:int = 2;
        public static const RACE_TYPE_WORLD_SELECT_RACE:int = 3;
        public static const RACE_TYPE_WORLD_RACE:int = 4;
        public static const CLOSE:int = 5;
        public static const STU6_STOP:int = 6;
        public static const STU6_PREPARE:int = 7;
        public static const STU6_APPLY:int = 8;
        public static const STU6_APPLY_COMPLETE:int = 9;
        public static const STU6_TIANBANG:int = 10;
        public static const STU6_DIBANG:int = 11;
        public static const STU6_DIBANG_COMPLETE:int = 12;
        public static const STU6_4:int = 13;
        public static const STU6_4_COMPLETE:int = 14;
        public static const STU6_2:int = 15;
        public static const STU6_2_COMPLETE:int = 16;
        public static const STU6_1:int = 17;
        public static const STU6_1_COMPLETE:int = 18;
        public static const GROUP_NULL:int = 19;
        public static const GROUP_TIAN_BANG:int = 20;
        public static const GROUP_DI_BANG:int = 21;
        public static const TRUE:int = 22;
        public static const FALSE:int = 23;
        public static const SUCCESS:int = 24;
        public static const FUNCTION_NOT_OPEN:int = 25;
        public static const NON_SIGN_UP_STEP:int = 26;
        public static const ALREADY_IN_TEAM:int = 27;
        public static const FAILED:int = 28;
        public static const ALREADY_SIGN_UP:int = 29;
        public static const NON_LEADER:int = 30;
        public static const ALREADY_DISSOLVE:int = 31;
        public static const NOT_SIGN_UP_STEP:int = 32;
        public static const TEAM_FULL:int = 33;
        public static const NO_APPLY:int = 34;
        public static const MEMBER_NO_EXISTS:int = 35;
        public static const NO_TEAM_MEMBER:int = 36;
        public static const NO_ON_DEPLOY:int = 37;
        public static const NON_FRIEND:int = 38;
        public static const OFFLINE:int = 39;
        public static const NO_APPLY_TO_PASS:int = 40;
        public static const PASS_APPLY:int = 41;
        public static const KICKOUT_MEMBER:int = 42;
        public static const QUIT_TEAM:int = 43;
        public static const CHOOSE_HELP_ROLE:int = 44;
        public static const PASS_FRIEND_APPLY:int = 45;
        public static const NOT_EXIST_GRID:int = 46;
        public static const REAPPLY:int = 47;
        public static const NO_LEADER:int = 48;
        public static const NO_ENOUGH_MEMBER:int = 49;
        public static const NO_APPLY_STEP:int = 50;
        public static const REBET:int = 51;
        public static const INVALID_RACE:int = 52;
        public static const NOT_ENOUGH_COIN:int = 53;
        public static const get_my_team:Object = {module:257, action:0, request:[], response:[Utils.IntUtil]};
        public static const get_team_list:Object = {module:257, action:1, request:[Utils.UByteUtil, Utils.StringUtil, Utils.ShortUtil], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil, [Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.UByteUtil]};
        public static const get_team_members:Object = {module:257, action:2, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const create_team:Object = {module:257, action:3, request:[], response:[Utils.UByteUtil]};
        public static const dissolve_team:Object = {module:257, action:4, request:[], response:[Utils.UByteUtil]};
        public static const request_join_the_team:Object = {module:257, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const cancel_request_join_the_team:Object = {module:257, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_join_requests:Object = {module:257, action:7, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const accept_join_request:Object = {module:257, action:8, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const ignore_join_request:Object = {module:257, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const ignore_all_join_request:Object = {module:257, action:10, request:[], response:[Utils.UByteUtil]};
        public static const kickout_member:Object = {module:257, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const quit_team:Object = {module:257, action:12, request:[], response:[Utils.UByteUtil]};
        public static const get_roles_on_deploy:Object = {module:257, action:13, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const deploy_role:Object = {module:257, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_invitable_list:Object = {module:257, action:15, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const invite:Object = {module:257, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const accept_invitation:Object = {module:257, action:17, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const reject_invitation:Object = {module:257, action:18, request:[Utils.IntUtil], response:[]};
        public static const notify_team_info_change:Object = {module:257, action:19, request:[], response:[Utils.UByteUtil]};
        public static const get_team_deploy:Object = {module:257, action:20, request:[], response:[Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const change_deploy:Object = {module:257, action:21, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_race_step:Object = {module:257, action:22, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, [Utils.StringUtil, Utils.StringUtil]]};
        public static const get_standings:Object = {module:257, action:23, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const get_race_list:Object = {module:257, action:24, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.StringUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.StringUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil]]};
        public static const get_war_result_list:Object = {module:257, action:25, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const get_race_standings:Object = {module:257, action:26, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil], Utils.UByteUtil]]};
        public static const get_player_war_report:Object = {module:257, action:27, request:[Utils.IntUtil], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]};
        public static const apply:Object = {module:257, action:28, request:[], response:[Utils.UByteUtil]};
        public static const get_player_bet:Object = {module:257, action:29, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const bet:Object = {module:257, action:30, request:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_bet_coin_rank:Object = {module:257, action:31, request:[], response:[[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.StringUtil, Utils.StringUtil, Utils.LongUtil]]};
        public static const Actions:Array = ["get_my_team", "get_team_list", "get_team_members", "create_team", "dissolve_team", "request_join_the_team", "cancel_request_join_the_team", "get_join_requests", "accept_join_request", "ignore_join_request", "ignore_all_join_request", "kickout_member", "quit_team", "get_roles_on_deploy", "deploy_role", "get_invitable_list", "invite", "accept_invitation", "reject_invitation", "notify_team_info_change", "get_team_deploy", "change_deploy", "get_race_step", "get_standings", "get_race_list", "get_war_result_list", "get_race_standings", "get_player_war_report", "apply", "get_player_bet", "bet", "get_bet_coin_rank"];

        public function Mod_StUnionSixvsix_Base()
        {
            return;
        }// end function

    }
}
