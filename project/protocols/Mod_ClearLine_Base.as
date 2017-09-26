package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ClearLine_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const CLOSED:int = 2;
        public static const EXCHANGE_LIMIT:int = 3;
        public static const NO_ENOUGH_SCORE:int = 4;
        public static const PACK_FULL:int = 5;
        public static const result_score:Object = {module:281, action:0, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_exchange_list:Object = {module:281, action:1, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange:Object = {module:281, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["result_score", "get_exchange_list", "exchange"];

        public function Mod_ClearLine_Base()
        {
            return;
        }// end function

    }
}
