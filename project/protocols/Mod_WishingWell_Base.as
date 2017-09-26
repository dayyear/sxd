package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WishingWell_Base extends Object
    {
        public static const QUALITY_S:int = 0;
        public static const QUALITY_A:int = 1;
        public static const QUALITY_B:int = 2;
        public static const QUALITY_C:int = 3;
        public static const HAD_GET:int = 4;
        public static const FAIL_GET:int = 5;
        public static const CAN_WISH:int = 6;
        public static const MAYBE:int = 7;
        public static const MAYBE_UP:int = 8;
        public static const MUST:int = 9;
        public static const SUCCESS:int = 10;
        public static const HAD_WISH:int = 11;
        public static const PACK_FULL:int = 12;
        public static const FATE_PACK_FULL:int = 13;
        public static const DRAGONBALL_PACK_FULL:int = 14;
        public static const JEWEL_PACK_FULL:int = 15;
        public static const FAILURE_NUM:int = 16;
        public static const FAILURE:int = 17;
        public static const ACTIVITY_OPEN:int = 18;
        public static const ACTIVITY_CLOSE:int = 19;
        public static const get_info:Object = {module:325, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], [Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const wishing:Object = {module:325, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const log:Object = {module:325, action:2, request:[], response:[[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil]]};
        public static const get_activity_state:Object = {module:325, action:3, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "wishing", "log", "get_activity_state"];

        public function Mod_WishingWell_Base()
        {
            return;
        }// end function

    }
}
