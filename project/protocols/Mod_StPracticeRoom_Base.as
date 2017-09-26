package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StPracticeRoom_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const YES:int = 2;
        public static const NO:int = 3;
        public static const SUCCESS:int = 4;
        public static const ROOM_SEAT_ERROR:int = 5;
        public static const ALREADY_IN_USED:int = 6;
        public static const EXP_NOT_GOTTEN:int = 7;
        public static const FUNCTION_NO_OPEN:int = 8;
        public static const ALREADY_SAT_DOWN:int = 9;
        public static const SOMEBODY:int = 10;
        public static const NOBODY:int = 11;
        public static const ROB_TIME_USED_UP:int = 12;
        public static const CD_TIME:int = 13;
        public static const NO_WAR:int = 14;
        public static const NO_ENOUGH_INGOT:int = 15;
        public static const NO_EXP_TO_GET:int = 16;
        public static const FAILURE:int = 17;
        public static const NO_IN_PRACTICE:int = 18;
        public static const MAX_PRACTICE_TIME:int = 19;
        public static const BE_ROBBED:int = 20;
        public static const get_rooms:Object = {module:117, action:0, request:[], response:[[Utils.ByteUtil, Utils.ShortUtil], Utils.UByteUtil, Utils.ByteUtil]};
        public static const get_room_info:Object = {module:117, action:1, request:[Utils.ByteUtil], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil]};
        public static const sit_down:Object = {module:117, action:2, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_seat_info:Object = {module:117, action:3, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const rob_the_seat:Object = {module:117, action:4, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil]]};
        public static const buy_rob_time:Object = {module:117, action:5, request:[], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const get_room_practice_exp:Object = {module:117, action:6, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_exp_flag:Object = {module:117, action:7, request:[], response:[Utils.UByteUtil]};
        public static const enter_room:Object = {module:117, action:8, request:[], response:[Utils.UByteUtil]};
        public static const exit_room:Object = {module:117, action:9, request:[], response:[Utils.UByteUtil]};
        public static const clean_rob_cd_time:Object = {module:117, action:10, request:[], response:[Utils.UByteUtil]};
        public static const get_rob_cd_time:Object = {module:117, action:11, request:[], response:[Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_refresh_exp:Object = {module:117, action:12, request:[], response:[Utils.IntUtil]};
        public static const player_leave_seat:Object = {module:117, action:13, request:[], response:[Utils.UByteUtil]};
        public static const get_player_room_quality:Object = {module:117, action:14, request:[], response:[Utils.ByteUtil]};
        public static const notify_practice_room_msg:Object = {module:117, action:15, request:[], response:[Utils.UByteUtil]};
        public static const get_free_room_info:Object = {module:117, action:16, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil]};
        public static const get_free_room_info_by_page:Object = {module:117, action:17, request:[Utils.ShortUtil], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const Actions:Array = ["get_rooms", "get_room_info", "sit_down", "get_seat_info", "rob_the_seat", "buy_rob_time", "get_room_practice_exp", "get_exp_flag", "enter_room", "exit_room", "clean_rob_cd_time", "get_rob_cd_time", "notify_refresh_exp", "player_leave_seat", "get_player_room_quality", "notify_practice_room_msg", "get_free_room_info", "get_free_room_info_by_page"];

        public function Mod_StPracticeRoom_Base()
        {
            return;
        }// end function

    }
}
