package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WorshipMars_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const OFFERINGS_NO_EXIST:int = 1;
        public static const COUNT_USED:int = 2;
        public static const INSUFFICIENT_INGOT:int = 3;
        public static const NO_ENOUGTH_VIP:int = 4;
        public static const INSUFFICIENT_SKILL:int = 5;
        public static const BLESSING_TIMES:int = 6;
        public static const EXP_ADD:int = 7;
        public static const mars_info:Object = {module:41, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const incense:Object = {module:41, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_blessing_times_and_exp_add:Object = {module:41, action:2, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const blessing_times_and_exp_add_notify:Object = {module:41, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_remain_incense_times:Object = {module:41, action:4, request:[], response:[Utils.IntUtil]};
        public static const qingming_active_time_list:Object = {module:41, action:5, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["mars_info", "incense", "get_blessing_times_and_exp_add", "blessing_times_and_exp_add_notify", "get_remain_incense_times", "qingming_active_time_list"];

        public function Mod_WorshipMars_Base()
        {
            return;
        }// end function

    }
}
