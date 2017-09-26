package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NewYearCumulativeLogin_Base extends Object
    {
        public static const CANNT:int = 0;
        public static const DONE:int = 1;
        public static const UNDO:int = 2;
        public static const LOGIN:int = 3;
        public static const CHARGE:int = 4;
        public static const SUCCESS:int = 5;
        public static const LACK_OF_CUMULATIVE_DAYS:int = 6;
        public static const ALREADY_GET:int = 7;
        public static const PACK_FULL:int = 8;
        public static const FAILED:int = 9;
        public static const get_info:Object = {module:330, action:0, request:[Utils.UByteUtil], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const get_award:Object = {module:330, action:1, request:[Utils.UByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "get_award"];

        public function Mod_NewYearCumulativeLogin_Base()
        {
            return;
        }// end function

    }
}
