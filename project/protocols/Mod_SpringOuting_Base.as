package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SpringOuting_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const HAD_NO_GET:int = 1;
        public static const NO_TIMES:int = 2;
        public static const STARTING:int = 3;
        public static const NOT_ACTIVITY_TIME:int = 4;
        public static const FAILURE:int = 5;
        public static const HAD_GET:int = 6;
        public static const PACK_FULL:int = 7;
        public static const NO_START:int = 8;
        public static const open_peal:Object = {module:346, action:0, request:[], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]], [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.ShortUtil, Utils.ShortUtil]};
        public static const chooid_spring_outing:Object = {module:346, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const get_choose_award:Object = {module:346, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil]};
        public static const get_times_award:Object = {module:346, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["open_peal", "chooid_spring_outing", "get_choose_award", "get_times_award"];

        public function Mod_SpringOuting_Base()
        {
            return;
        }// end function

    }
}
