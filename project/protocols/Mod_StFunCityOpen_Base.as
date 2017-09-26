package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StFunCityOpen_Base extends Object
    {
        public static const SEQUENCE_A:int = 0;
        public static const SEQUENCE_B:int = 1;
        public static const SEQUENCE_C:int = 2;
        public static const SEQUENCE_D:int = 3;
        public static const COMPLETE:int = 4;
        public static const UNCOMPLETE:int = 5;
        public static const NON_ACTIVITY_TIME:int = 6;
        public static const CORRECT:int = 7;
        public static const ERROR:int = 8;
        public static const FAILED:int = 9;
        public static const SUCCESS:int = 10;
        public static const LACK_OF_COINS:int = 11;
        public static const DONATE_LOWER_LIMIT:int = 12;
        public static const TODAY_DONATE_LIMIT:int = 13;
        public static const HIGH:int = 14;
        public static const MIDDLE:int = 15;
        public static const LOW:int = 16;
        public static const CD_TIME:int = 17;
        public static const OPEN:int = 18;
        public static const CLOSE:int = 19;
        public static const ALREADY_BE_KILL:int = 20;
        public static const COUNT_LIMIT:int = 21;
        public static const ALREADY_AWARD:int = 22;
        public static const AWARD:int = 23;
        public static const AWARD_SUCCESS:int = 24;
        public static const AWARD_FAILED:int = 25;
        public static const open_panel:Object = {module:285, action:0, request:[], response:[Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil]};
        public static const start_answer:Object = {module:285, action:1, request:[], response:[Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil]]};
        public static const submit_answer:Object = {module:285, action:2, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const donate:Object = {module:285, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const attack_city:Object = {module:285, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const notify_activity_status:Object = {module:285, action:5, request:[], response:[Utils.UByteUtil]};
        public static const get_zhan_yao_info:Object = {module:285, action:6, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const notify_zhan_yao_refresh:Object = {module:285, action:7, request:[], response:[Utils.ByteUtil]};
        public static const zhan_yao_fight:Object = {module:285, action:8, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_total_value_change:Object = {module:285, action:9, request:[], response:[Utils.ByteUtil, Utils.LongUtil]};
        public static const close_panel:Object = {module:285, action:10, request:[], response:[Utils.IntUtil]};
        public static const get_by_mailer_state:Object = {module:285, action:11, request:[], response:[Utils.UByteUtil]};
        public static const award_mailer_item:Object = {module:285, action:12, request:[], response:[Utils.UByteUtil]};
        public static const get_activity_finish_info:Object = {module:285, action:13, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const Actions:Array = ["open_panel", "start_answer", "submit_answer", "donate", "attack_city", "notify_activity_status", "get_zhan_yao_info", "notify_zhan_yao_refresh", "zhan_yao_fight", "notify_total_value_change", "close_panel", "get_by_mailer_state", "award_mailer_item", "get_activity_finish_info"];

        public function Mod_StFunCityOpen_Base()
        {
            return;
        }// end function

    }
}
