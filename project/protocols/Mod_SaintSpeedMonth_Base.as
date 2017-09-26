package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SaintSpeedMonth_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const HAD_GET:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const NOT_IN_ACTIVITY:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const FAILURE:int = 7;
        public static const NOT_SAINT:int = 8;
        public static const get_saint_speed_month_info:Object = {module:327, action:0, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.LongUtil, [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const get_award:Object = {module:327, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_extra_award:Object = {module:327, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const onekey_get_award:Object = {module:327, action:3, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_saint_speed_month_info", "get_award", "get_extra_award", "onekey_get_award"];

        public function Mod_SaintSpeedMonth_Base()
        {
            return;
        }// end function

    }
}
