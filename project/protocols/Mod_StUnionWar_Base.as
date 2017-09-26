package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUnionWar_Base extends Object
    {
        public static const ST_FACTION_WAR_CLOSE:int = 0;
        public static const ST_FACTION_WAR_SIGN_UP:int = 1;
        public static const ST_FACTION_WAR_8:int = 2;
        public static const ST_FACTION_WAR_8_COMPLETE:int = 3;
        public static const ST_FACTION_WAR_4:int = 4;
        public static const ST_FACTION_WAR_4_COMPLETE:int = 5;
        public static const ST_FACTION_WAR_2:int = 6;
        public static const ST_FACTION_WAR_2_COMPLETE:int = 7;
        public static const ST_FACTION_WAR_1:int = 8;
        public static const ST_FACTION_WAR_1_COMPLETE:int = 9;
        public static const NOT_FIGHT:int = 10;
        public static const FIGHTING:int = 11;
        public static const FIGHT_END:int = 12;
        public static const YES:int = 13;
        public static const NO:int = 14;
        public static const CAN_NOT_SIGN_UP:int = 15;
        public static const ACTION_SUCCESS:int = 16;
        public static const NOT_PERMISSION:int = 17;
        public static const ACTION_FAILED:int = 18;
        public static const REFRESH_RACE_LIST:int = 19;
        public static const NOT_ST_UNION_MASTER:int = 20;
        public static const INVALID_MEMBER:int = 21;
        public static const notify_status:Object = {module:181, action:0, request:[], response:[Utils.UByteUtil]};
        public static const get_player_st_union_war_status:Object = {module:181, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const sign_up:Object = {module:181, action:2, request:[], response:[Utils.UByteUtil]};
        public static const sign_up_list:Object = {module:181, action:3, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const get_race_step:Object = {module:181, action:4, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const get_race_list:Object = {module:181, action:6, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil]};
        public static const notify_refresh:Object = {module:181, action:7, request:[], response:[Utils.UByteUtil]};
        public static const get_player_war_report:Object = {module:181, action:8, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]], Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]};
        public static const get_report_list:Object = {module:181, action:9, request:[Utils.IntUtil, Utils.IntUtil], response:[[Utils.IntUtil]]};
        public static const notify_new_report:Object = {module:181, action:10, request:[], response:[Utils.IntUtil]};
        public static const look_up_the_war:Object = {module:181, action:11, request:[Utils.IntUtil, Utils.IntUtil], response:[]};
        public static const get_war_info:Object = {module:181, action:12, request:[Utils.IntUtil, Utils.IntUtil], response:[[Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]]};
        public static const leave_look_up_the_war:Object = {module:181, action:13, request:[], response:[]};
        public static const notify_st_union_war_gift:Object = {module:181, action:14, request:[], response:[Utils.IntUtil]};
        public static const get_st_union_war_gift_detail:Object = {module:181, action:15, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const give_st_union_war_gift:Object = {module:181, action:16, request:[[Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const get_status:Object = {module:181, action:17, request:[], response:[Utils.UByteUtil]};
        public static const game_report:Object = {module:181, action:18, request:[Utils.IntUtil, Utils.IntUtil], response:[[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil]]]};
        public static const notify_xuan_wu_zuo_qi:Object = {module:181, action:19, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const notify_give_st_union_war_gift:Object = {module:181, action:20, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]]};
        public static const notify_have_st_union_war_gift:Object = {module:181, action:21, request:[], response:[Utils.ShortUtil]};
        public static const Actions:Array = ["notify_status", "get_player_st_union_war_status", "sign_up", "sign_up_list", "get_race_step", "get_race_list", "notify_refresh", "get_player_war_report", "get_report_list", "notify_new_report", "look_up_the_war", "get_war_info", "leave_look_up_the_war", "notify_st_union_war_gift", "get_st_union_war_gift_detail", "give_st_union_war_gift", "get_status", "game_report", "notify_xuan_wu_zuo_qi", "notify_give_st_union_war_gift", "notify_have_st_union_war_gift"];

        public function Mod_StUnionWar_Base()
        {
            return;
        }// end function

    }
}
