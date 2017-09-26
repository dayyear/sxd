package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StJinBangTiMing_Base extends Object
    {
        public static const ACTIVITY_START:int = 0;
        public static const ACTIVITY_END:int = 1;
        public static const ACTIVITY_CLOSE:int = 2;
        public static const ANSWER_OVER:int = 3;
        public static const TOWN_SHIP_EXAM:int = 4;
        public static const CENTRAL_EXAM:int = 5;
        public static const ROYAL_PALACE_EXAM:int = 6;
        public static const SEQUENCE_A:int = 7;
        public static const SEQUENCE_B:int = 8;
        public static const SEQUENCE_C:int = 9;
        public static const SEQUENCE_D:int = 10;
        public static const SUCCESS:int = 11;
        public static const NON_ACTIVITY_TIME:int = 12;
        public static const SUBMIT_TIME_OUT:int = 13;
        public static const get_activity_time_status_info:Object = {module:237, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const get_player_jin_bang_info:Object = {module:237, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil]]};
        public static const start_answer:Object = {module:237, action:2, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]};
        public static const submit_answer:Object = {module:237, action:3, request:[Utils.ByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil]};
        public static const get_rank_info:Object = {module:237, action:4, request:[], response:[[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const activity_notify:Object = {module:237, action:11, request:[], response:[Utils.UByteUtil]};
        public static const answer_notify:Object = {module:237, action:12, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_time_status_info", "get_player_jin_bang_info", "start_answer", "submit_answer", "get_rank_info", "activity_notify", "answer_notify"];

        public function Mod_StJinBangTiMing_Base()
        {
            return;
        }// end function

    }
}
