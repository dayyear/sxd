package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StBigTurntable_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGHT_INGOT:int = 1;
        public static const TIMES_LIMIT:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const NOT_IN_ACTIVITY:int = 4;
        public static const PACK_FULL:int = 5;
        public static const FAILURE:int = 6;
        public static const get_big_turntable_info:Object = {module:286, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const turntable:Object = {module:286, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const Actions:Array = ["get_big_turntable_info", "turntable"];

        public function Mod_StBigTurntable_Base()
        {
            return;
        }// end function

    }
}
