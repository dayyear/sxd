package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_BeelzebubTrials_Base extends Object
    {
        public static const NOT_LIMIT:int = 0;
        public static const SAME_GANG:int = 1;
        public static const ON_ACTIVITY:int = 2;
        public static const NON_ACTIVITY:int = 3;
        public static const ALL_RECORD:int = 4;
        public static const SUCCESS:int = 5;
        public static const INVALID_BEELZEBUB_TRIALS_ID:int = 6;
        public static const FULL_TEAM_NUMBER:int = 7;
        public static const INVALID_TEAM_ID:int = 8;
        public static const FULL_MEMBER:int = 9;
        public static const NOT_SAME_CANO:int = 10;
        public static const NOT_SAME_GANG:int = 11;
        public static const ERROR_BEELZEBUB_ID:int = 12;
        public static const TODAY_CHALLENGED:int = 13;
        public static const FAILED:int = 14;
        public static const DEPLOY:int = 15;
        public static const NODEPLOY:int = 16;
        public static const LIMIT_MEMBER_NUMBER:int = 17;
        public static const NO_LEADER:int = 18;
        public static const UPDATE_TEAM_INFO:int = 19;
        public static const LEADER_DISSOLVE:int = 20;
        public static const KICK_OUT_TEAM:int = 21;
        public static const HAVE_WAR_RESULT:int = 22;
        public static const START_BEELZEBUB_TRAILS:int = 23;
        public static const STOP_BEELZEBUB_TRAILS:int = 24;
        public static const ERRLEVEL:int = 25;
        public static const NOTENOUGH:int = 26;
        public static const HASGET:int = 27;
        public static const TRUE:int = 28;
        public static const FALSE:int = 29;
        public static const NOT_OPEN:int = 30;
        public static const NOT_EXIST_GRID:int = 31;
        public static const NOT_FULL:int = 32;
        public static const NOBODY:int = 33;
        public static const get_beelzebub_trials_open_time:Object = {module:57, action:0, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.UByteUtil]};
        public static const open_beelzebub_trials:Object = {module:57, action:1, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const get_beelzebub_trials_team_list:Object = {module:57, action:2, request:[Utils.IntUtil, Utils.UByteUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_player_team_info:Object = {module:57, action:3, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil]]};
        public static const create_beelzebub_trials_team:Object = {module:57, action:4, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const dissolve_beelzebub_trials_team:Object = {module:57, action:5, request:[], response:[]};
        public static const join_beelzebub_trials_team:Object = {module:57, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const exit_beelzebub_trials_team:Object = {module:57, action:7, request:[], response:[Utils.UByteUtil]};
        public static const get_helper_role_list:Object = {module:57, action:8, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const choose_helper_role:Object = {module:57, action:9, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const sort_beelzebub_trials_team:Object = {module:57, action:10, request:[Utils.StringUtil], response:[]};
        public static const kicked_out_member:Object = {module:57, action:11, request:[Utils.IntUtil], response:[]};
        public static const close_beelzebub_trials:Object = {module:57, action:12, request:[], response:[]};
        public static const fight_beelzebub_trials:Object = {module:57, action:13, request:[], response:[Utils.UByteUtil]};
        public static const get_war_result:Object = {module:57, action:14, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]};
        public static const notify:Object = {module:57, action:15, request:[], response:[Utils.UByteUtil]};
        public static const leave_beelzebub_trials_war:Object = {module:57, action:16, request:[Utils.IntUtil], response:[]};
        public static const notify_new_team:Object = {module:57, action:17, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_drop_team:Object = {module:57, action:18, request:[], response:[Utils.IntUtil]};
        public static const notify_update_member_number:Object = {module:57, action:19, request:[], response:[Utils.IntUtil, Utils.ByteUtil]};
        public static const check_is_can_challenge:Object = {module:57, action:20, request:[], response:[Utils.ByteUtil]};
        public static const get_player_cd_time:Object = {module:57, action:21, request:[], response:[Utils.ShortUtil]};
        public static const get_player_can_challenge_list:Object = {module:57, action:22, request:[], response:[[Utils.IntUtil]]};
        public static const open_moral:Object = {module:57, action:23, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_moral_award:Object = {module:57, action:24, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_beelzebub_trails_deploy:Object = {module:57, action:25, request:[], response:[[Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil], [Utils.StringUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil]]};
        public static const change_beelzebub_trails_deploy:Object = {module:57, action:26, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.StringUtil, Utils.ShortUtil]]};
        public static const invite:Object = {module:57, action:27, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_beelzebub_trials_open_time", "open_beelzebub_trials", "get_beelzebub_trials_team_list", "get_player_team_info", "create_beelzebub_trials_team", "dissolve_beelzebub_trials_team", "join_beelzebub_trials_team", "exit_beelzebub_trials_team", "get_helper_role_list", "choose_helper_role", "sort_beelzebub_trials_team", "kicked_out_member", "close_beelzebub_trials", "fight_beelzebub_trials", "get_war_result", "notify", "leave_beelzebub_trials_war", "notify_new_team", "notify_drop_team", "notify_update_member_number", "check_is_can_challenge", "get_player_cd_time", "get_player_can_challenge_list", "open_moral", "get_moral_award", "get_beelzebub_trails_deploy", "change_beelzebub_trails_deploy", "invite"];

        public function Mod_BeelzebubTrials_Base()
        {
            return;
        }// end function

    }
}
