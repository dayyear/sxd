package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SimpleActivity_Base extends Object
    {
        public static const SIMPLE_ACTIVITY_TAOBAO_TEN_YEARS:int = 0;
        public static const OK:int = 1;
        public static const FETCHED:int = 2;
        public static const INACTIVE:int = 3;
        public static const WRONG_SERVER:int = 4;
        public static const WRONG_SOURCE:int = 5;
        public static const ERROR:int = 6;
        public static const SUCCEED:int = 7;
        public static const UNREACHABLE:int = 8;
        public static const check_activity_award:Object = {module:93, action:0, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const fetch_activity_award:Object = {module:93, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["check_activity_award", "fetch_activity_award"];

        public function Mod_SimpleActivity_Base()
        {
            return;
        }// end function

    }
}
