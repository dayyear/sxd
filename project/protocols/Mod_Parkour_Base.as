package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Parkour_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const get_active_info:Object = {module:184, action:0, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const start_run:Object = {module:184, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const update_score:Object = {module:184, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const give_award:Object = {module:184, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_active_status:Object = {module:184, action:4, request:[], response:[Utils.ByteUtil]};
        public static const rank:Object = {module:184, action:5, request:[], response:[[Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_remain_award_times:Object = {module:184, action:6, request:[], response:[Utils.IntUtil]};
        public static const Actions:Array = ["get_active_info", "start_run", "update_score", "give_award", "notify_active_status", "rank", "get_remain_award_times"];

        public function Mod_Parkour_Base()
        {
            return;
        }// end function

    }
}
