package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CampWar_Base extends Object
    {
        public static const STOP:int = 0;
        public static const START:int = 1;
        public static const OPEN_CAMP_WAR:int = 2;
        public static const JOIN_CAMP_WAR:int = 3;
        public static const ON_WAR:int = 4;
        public static const SUCCESS:int = 5;
        public static const CD_TIME:int = 6;
        public static const END_CAMP_WAR:int = 7;
        public static const PLAYER_JOIN_CAMP_WAR:int = 8;
        public static const PLAYER_EXIT_CAMP_WAR:int = 9;
        public static const UPDATE_PLAYER_CAMP_STATUS:int = 10;
        public static const UPDATE_TOP_WINNER:int = 11;
        public static const UPDATE_PLAYER_CAMP_WAR_INFO:int = 12;
        public static const START_WAR:int = 13;
        public static const CAN_JOIN_CAMP_WAR:int = 14;
        public static const UPDATE_INTEGRAL:int = 15;
        public static const PAY_INGOT:int = 16;
        public static const PAY_SKILL:int = 17;
        public static const NOT_ENOUGH_INGOT:int = 18;
        public static const NOT_ENOUGH_SKILL:int = 19;
        public static const MAX_BUFF:int = 20;
        public static const REQUEST_VIP_LEVEL:int = 21;
        public static const ON:int = 22;
        public static const OFF:int = 23;
        public static const REQUEST_VIP:int = 24;
        public static const IN_ACTION:int = 25;
        public static const get_camp_open_time:Object = {module:23, action:0, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const open_camp_war:Object = {module:23, action:1, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const close_camp_war:Object = {module:23, action:2, request:[], response:[]};
        public static const get_camp_player:Object = {module:23, action:3, request:[Utils.ByteUtil], response:[Utils.ByteUtil, [Utils.ShortUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil]]]};
        public static const join_camp_war:Object = {module:23, action:4, request:[], response:[Utils.UByteUtil]};
        public static const get_war_result:Object = {module:23, action:5, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const notify:Object = {module:23, action:6, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil], [Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const notify_report:Object = {module:23, action:7, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const notify_camp_result:Object = {module:23, action:8, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const exit_camp_war:Object = {module:23, action:9, request:[], response:[]};
        public static const finish_war:Object = {module:23, action:10, request:[], response:[]};
        public static const buy_buff:Object = {module:23, action:11, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const get_buff:Object = {module:23, action:12, request:[], response:[Utils.ByteUtil]};
        public static const set_robot:Object = {module:23, action:13, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_robot_status:Object = {module:23, action:14, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_camp_open_time", "open_camp_war", "close_camp_war", "get_camp_player", "join_camp_war", "get_war_result", "notify", "notify_report", "notify_camp_result", "exit_camp_war", "finish_war", "buy_buff", "get_buff", "set_robot", "get_robot_status"];

        public function Mod_CampWar_Base()
        {
            return;
        }// end function

    }
}
