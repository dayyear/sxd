package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CardSoulMachine_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_IN_ACTIVITY:int = 1;
        public static const FUNCTION_NO_OPEN:int = 2;
        public static const NOT_ENOUGHT_INGOT:int = 3;
        public static const TODAY_LIMIT:int = 4;
        public static const FAILURE:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const NOT_ENOUGHT_SCORE:int = 7;
        public static const TIMES_LIMIT:int = 8;
        public static const get_machine_info:Object = {module:269, action:0, request:[], response:[[Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const start:Object = {module:269, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_exchange_info:Object = {module:269, action:2, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const exchange_award:Object = {module:269, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_machine_info", "start", "get_exchange_info", "exchange_award"];

        public function Mod_CardSoulMachine_Base()
        {
            return;
        }// end function

    }
}
