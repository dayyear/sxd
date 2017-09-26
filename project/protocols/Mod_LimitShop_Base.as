package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LimitShop_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const BUY_TIMES_LIMIT:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const NOT_ACTIVITY_TIME:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const NOT_ENOUGH_INGOT:int = 7;
        public static const NOT_ENOUGH_CHARGE_INGOT:int = 8;
        public static const GOOD_ID_ERROR:int = 9;
        public static const FAILURE:int = 10;
        public static const get_limit_shop_info:Object = {module:333, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ShortUtil, Utils.ByteUtil]]};
        public static const buy_good:Object = {module:333, action:1, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_limit_shop_info", "buy_good"];

        public function Mod_LimitShop_Base()
        {
            return;
        }// end function

    }
}
