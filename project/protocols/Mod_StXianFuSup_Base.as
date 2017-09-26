package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StXianFuSup_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const FIGHT_END:int = 2;
        public static const NOT_FIGHT:int = 3;
        public static const LEFT:int = 4;
        public static const RIGHT:int = 5;
        public static const SUCCESS:int = 6;
        public static const FIGHTING:int = 7;
        public static const FAILED:int = 8;
        public static const ERROR_STATUS:int = 9;
        public static const ALREADY_SIGN_UP:int = 10;
        public static const NOT_ENOUGH_LEVEL:int = 11;
        public static const CAN_JOIN:int = 12;
        public static const NOT_SIGN_UP:int = 13;
        public static const FULL:int = 14;
        public static const ALREADY_JOIN:int = 15;
        public static const NULL:int = 16;
        public static const ALREADY_LEAVE:int = 17;
        public static const INVALID_PLAYER_ID:int = 18;
        public static const NOT_ONLINE:int = 19;
        public static const ALREADY_APPLY:int = 20;
        public static const CANCEL_APPLY:int = 21;
        public static const ERROR_POSITION:int = 22;
        public static const POSITION_NOT_NULL:int = 23;
        public static const NOT_JOIN:int = 24;
        public static const SIGN_UP_START:int = 25;
        public static const SIGN_UP_ING:int = 26;
        public static const SIGN_UP_END:int = 27;
        public static const OPEN:int = 28;
        public static const PREPARE:int = 29;
        public static const OPEN_FIGHT:int = 30;
        public static const END_FIGHT:int = 31;
        public static const CLOSE:int = 32;
        public static const CHANGE_RESULT:int = 33;
        public static const NOTIFY_CHANGE:int = 34;
        public static const POSITION_CHANGE:int = 35;
        public static const STATUS_CHANGE:int = 36;
        public static const POSITION_PLAY:int = 37;
        public static const GAME_START:int = 38;
        public static const WIN_NOTIFY:int = 39;
        public static const ROUND_END:int = 40;
        public static const APPROVE:int = 41;
        public static const REJECT:int = 42;
        public static const WIN:int = 43;
        public static const LOSE:int = 44;
        public static const NOT_BE_PICK:int = 45;
        public static const open:Object = {module:119, action:0, request:[], response:[Utils.UByteUtil]};
        public static const sign_up:Object = {module:119, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_sign_up_list:Object = {module:119, action:2, request:[], response:[[Utils.IntUtil]]};
        public static const get_player_ranking_by_list:Object = {module:119, action:3, request:[[Utils.IntUtil]], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_zhan_qu_data:Object = {module:119, action:4, request:[], response:[[Utils.ShortUtil, Utils.UByteUtil]]};
        public static const get_xian_fu_status:Object = {module:119, action:5, request:[Utils.ShortUtil], response:[[Utils.ShortUtil, [Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil], Utils.UByteUtil, Utils.StringUtil], Utils.ShortUtil, Utils.UByteUtil]};
        public static const join:Object = {module:119, action:6, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_xian_fu_position_info:Object = {module:119, action:7, request:[Utils.ShortUtil, Utils.ShortUtil], response:[[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], Utils.UByteUtil]};
        public static const leave:Object = {module:119, action:8, request:[], response:[Utils.UByteUtil]};
        public static const apply_change:Object = {module:119, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const approve_apply:Object = {module:119, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const reject_apply:Object = {module:119, action:12, request:[Utils.IntUtil], response:[]};
        public static const change_position:Object = {module:119, action:13, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const notify_status:Object = {module:119, action:14, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify:Object = {module:119, action:15, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil], Utils.ShortUtil, [Utils.StringUtil, Utils.StringUtil]]};
        public static const finally_war_result:Object = {module:119, action:16, request:[Utils.ShortUtil, Utils.ShortUtil], response:[[Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const get_player_war_report:Object = {module:119, action:17, request:[Utils.IntUtil], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]};
        public static const notify_fight_over:Object = {module:119, action:18, request:[], response:[Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], [Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil]};
        public static const notify_battle_war_list:Object = {module:119, action:19, request:[], response:[[Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], [Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]]};
        public static const get_player_status:Object = {module:119, action:20, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["open", "sign_up", "get_sign_up_list", "get_player_ranking_by_list", "get_zhan_qu_data", "get_xian_fu_status", "join", "get_xian_fu_position_info", "leave", "apply_change", "approve_apply", "reject_apply", "change_position", "notify_status", "notify", "finally_war_result", "get_player_war_report", "notify_fight_over", "notify_battle_war_list", "get_player_status"];

        public function Mod_StXianFuSup_Base()
        {
            return;
        }// end function

    }
}
