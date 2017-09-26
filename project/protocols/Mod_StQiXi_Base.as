package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StQiXi_Base extends Object
    {
        public static const A:int = 0;
        public static const B:int = 1;
        public static const TRUE:int = 2;
        public static const FALSE:int = 3;
        public static const FULL_AWARD:int = 4;
        public static const NOT_CHOOSE:int = 5;
        public static const SUCCESS:int = 6;
        public static const QI_XI_NOT_OPEN:int = 7;
        public static const OPEN:int = 8;
        public static const READY:int = 9;
        public static const CLOSE:int = 10;
        public static const start_qi_xi:Object = {module:107, action:1, request:[], response:[Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const give_answer_and_award:Object = {module:107, action:2, request:[], response:[Utils.UByteUtil, Utils.UByteUtil]};
        public static const notify_qi_xi_status:Object = {module:107, action:3, request:[], response:[Utils.ByteUtil]};
        public static const get_activity_open_timestamp:Object = {module:107, action:4, request:[], response:[Utils.ByteUtil]};
        public static const notify_question:Object = {module:107, action:5, request:[], response:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const player_choose:Object = {module:107, action:6, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_question:Object = {module:107, action:7, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil]};
        public static const get_xin_yi:Object = {module:107, action:8, request:[], response:[Utils.ShortUtil, Utils.ShortUtil]};
        public static const send_choose_number:Object = {module:107, action:9, request:[], response:[Utils.ShortUtil, Utils.ShortUtil]};
        public static const send_award_number:Object = {module:107, action:10, request:[], response:[Utils.ByteUtil, Utils.ByteUtil]};
        public static const send_right_number:Object = {module:107, action:11, request:[], response:[Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_st_qi_xi_status:Object = {module:107, action:12, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["start_qi_xi", "give_answer_and_award", "notify_qi_xi_status", "get_activity_open_timestamp", "notify_question", "player_choose", "get_question", "get_xin_yi", "send_choose_number", "send_award_number", "send_right_number", "get_st_qi_xi_status"];

        public function Mod_StQiXi_Base()
        {
            return;
        }// end function

    }
}
