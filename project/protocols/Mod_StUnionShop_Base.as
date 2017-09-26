package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUnionShop_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const TOTAL_LIMIT:int = 2;
        public static const NO_ENOUGH_CONTRIBUTE_VALUE:int = 3;
        public static const UN_EXCHANGABLE:int = 4;
        public static const CARD_SOUL_ERROR:int = 5;
        public static const get_shop_info:Object = {module:193, action:0, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange:Object = {module:193, action:1, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_shop_info", "exchange"];

        public function Mod_StUnionShop_Base()
        {
            return;
        }// end function

    }
}
