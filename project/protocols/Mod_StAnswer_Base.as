package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StAnswer_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const ANSWER_OVER:int = 2;
        public static const SEQUENCE_A:int = 3;
        public static const SEQUENCE_B:int = 4;
        public static const SEQUENCE_C:int = 5;
        public static const SEQUENCE_D:int = 6;
        public static const SUCCESS:int = 7;
        public static const NON_ACTIVITY_TIME:int = 8;
        public static const get_activity_info:Object = {module:195, action:0, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const start_answer:Object = {module:195, action:1, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.IntUtil, Utils.IntUtil]]};
        public static const submit_answer:Object = {module:195, action:2, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil]};
        public static const notify_activity_status:Object = {module:195, action:3, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_info", "start_answer", "submit_answer", "notify_activity_status"];

        public function Mod_StAnswer_Base()
        {
            return;
        }// end function

    }
}
