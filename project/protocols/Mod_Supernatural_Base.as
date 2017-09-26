package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Supernatural_Base extends Object
    {
        public static const NODEPLOY:int = 0;
        public static const DEPLOY:int = 1;
        public static const REPLACE:int = 2;
        public static const SUCCESS:int = 3;
        public static const SUPERNATURAL_NOT_OPEN:int = 4;
        public static const NOT_ENOUGH_LING_QI:int = 5;
        public static const OTHER_ROLE_JOB_LIMIT:int = 6;
        public static const WU_XING_LIMIT:int = 7;
        public static const FULL_LEVEL:int = 8;
        public static const NO_HAVE:int = 9;
        public static const HAVE_IN_OTHER:int = 10;
        public static const INVALID_ARGS:int = 11;
        public static const ONE:int = 12;
        public static const TWO:int = 13;
        public static const TRUE:int = 14;
        public static const FALSE:int = 15;
        public static const PLAYER_LEVEL_LIMIT:int = 16;
        public static const NOT_ENOUGH_XIAN_LING:int = 17;
        public static const INVALID_ROLE_JOB_ID:int = 18;
        public static const get_supernatural_info:Object = {module:101, action:1, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const up_supernatural_level:Object = {module:101, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const use_supernatural:Object = {module:101, action:3, request:[Utils.ShortUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_off_supernatural:Object = {module:101, action:4, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_supernatural_level:Object = {module:101, action:5, request:[Utils.UByteUtil], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const get_exclusive_supernatural_info:Object = {module:101, action:6, request:[], response:[[Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil, Utils.IntUtil]], Utils.ShortUtil]};
        public static const up_exclusive_supernatural_level:Object = {module:101, action:7, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const use_exclusive_supernatural:Object = {module:101, action:8, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const quick_use:Object = {module:101, action:9, request:[], response:[[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const quick_change:Object = {module:101, action:10, request:[Utils.ShortUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_supernatural_list:Object = {module:101, action:11, request:[], response:[[Utils.ShortUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_supernatural_info", "up_supernatural_level", "use_supernatural", "get_off_supernatural", "get_supernatural_level", "get_exclusive_supernatural_info", "up_exclusive_supernatural_level", "use_exclusive_supernatural", "quick_use", "quick_change", "get_supernatural_list"];

        public function Mod_Supernatural_Base()
        {
            return;
        }// end function

    }
}
