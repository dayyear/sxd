package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ServerTower_Base extends Object
    {
        public static const LEADER:int = 0;
        public static const MEMBER:int = 1;
        public static const OPEN:int = 2;
        public static const CLOSE:int = 3;
        public static const SUCCESS:int = 4;
        public static const FAILED:int = 5;
        public static const MEMBER_CHANGE:int = 6;
        public static const NEW_TEAM:int = 7;
        public static const DISAPPEAR:int = 8;
        public static const INVALID_TEAM_ID:int = 9;
        public static const FULL_MEMBER:int = 10;
        public static const IS_BEGIN:int = 11;
        public static const ALREADY_JOINED:int = 12;
        public static const NOT_IN_A_TEAM:int = 13;
        public static const NOT_TEAM_LEADER:int = 14;
        public static const INVALID_TEAM_SEQ:int = 15;
        public static const MEMBER_JOIN:int = 16;
        public static const MEMBER_QUIT:int = 17;
        public static const BE_KICKED_OUT:int = 18;
        public static const DISSOLVE:int = 19;
        public static const DEPLOY:int = 20;
        public static const NODEPLOY:int = 21;
        public static const REPLACE:int = 22;
        public static const MEMBER_COUNT_LIMIT:int = 23;
        public static const LACK_OF_SCORE:int = 24;
        public static const TIMES_LIMIT:int = 25;
        public static const SAY_HI:int = 26;
        public static const HURRY_UP:int = 27;
        public static const CHANGE_SKILL:int = 28;
        public static const CHANGE_PARTNER:int = 29;
        public static const get_open_flag:Object = {module:341, action:0, request:[], response:[Utils.UByteUtil]};
        public static const open_panel:Object = {module:341, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil]]};
        public static const close_panel:Object = {module:341, action:2, request:[], response:[Utils.UByteUtil]};
        public static const notify_team_status_change:Object = {module:341, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const create_team:Object = {module:341, action:4, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const join_team:Object = {module:341, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const leave_team:Object = {module:341, action:6, request:[], response:[Utils.UByteUtil]};
        public static const kick_out_team_member:Object = {module:341, action:7, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const notify_team_member_change:Object = {module:341, action:8, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const helper_role_list:Object = {module:341, action:9, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const choose_role:Object = {module:341, action:10, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_change_partner:Object = {module:341, action:11, request:[], response:[Utils.ByteUtil, Utils.ShortUtil]};
        public static const enter_tower:Object = {module:341, action:12, request:[], response:[Utils.UByteUtil]};
        public static const start_challenge:Object = {module:341, action:13, request:[], response:[Utils.UByteUtil]};
        public static const notify_war_result:Object = {module:341, action:14, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil, Utils.ByteUtil]};
        public static const enter_next_floor:Object = {module:341, action:15, request:[], response:[Utils.UByteUtil]};
        public static const notify_other_enter_next_floor:Object = {module:341, action:16, request:[], response:[Utils.ByteUtil]};
        public static const notify_all_enter_next_floor:Object = {module:341, action:17, request:[], response:[Utils.ByteUtil]};
        public static const get_exchange_info:Object = {module:341, action:18, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const exchange:Object = {module:341, action:19, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const quit_team:Object = {module:341, action:20, request:[], response:[Utils.UByteUtil]};
        public static const notify_activity_status_change:Object = {module:341, action:21, request:[], response:[Utils.UByteUtil]};
        public static const send_emoji:Object = {module:341, action:22, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const notify_recv_emoji:Object = {module:341, action:23, request:[], response:[Utils.ByteUtil, Utils.UByteUtil]};
        public static const Actions:Array = ["get_open_flag", "open_panel", "close_panel", "notify_team_status_change", "create_team", "join_team", "leave_team", "kick_out_team_member", "notify_team_member_change", "helper_role_list", "choose_role", "notify_change_partner", "enter_tower", "start_challenge", "notify_war_result", "enter_next_floor", "notify_other_enter_next_floor", "notify_all_enter_next_floor", "get_exchange_info", "exchange", "quit_team", "notify_activity_status_change", "send_emoji", "notify_recv_emoji"];

        public function Mod_ServerTower_Base()
        {
            return;
        }// end function

    }
}
