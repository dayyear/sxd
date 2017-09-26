package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LuckyStarEvent_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_OPEN:int = 1;
        public static const CAN_GET:int = 2;
        public static const HAD_GET:int = 3;
        public static const SHARE:int = 4;
        public static const PACK_FULL:int = 5;
        public static const FAILURE:int = 6;
        public static const get_day_info:Object = {module:353, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_award:Object = {module:353, action:1, request:[], response:[Utils.UByteUtil]};
        public static const share:Object = {module:353, action:2, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_day_info", "get_award", "share"];

        public function Mod_LuckyStarEvent_Base()
        {
            return;
        }// end function

    }
}
