package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUnionSixvsixShop_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const EXCHANGE_COUNT_LIMIT:int = 2;
        public static const NO_ENOUGH_SCORE:int = 3;
        public static const ITEM_FUNCTION_NO_OPEN:int = 4;
        public static const get_exchange_list:Object = {module:258, action:0, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const exchange:Object = {module:258, action:1, request:[Utils.ByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_exchange_list", "exchange"];

        public function Mod_StUnionSixvsixShop_Base()
        {
            return;
        }// end function

    }
}
