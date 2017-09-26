package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChristmasGift_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_ENOUGH_TIMES:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const NOT_ACTIVITY_TIME:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const FAILURE:int = 7;
        public static const NOT_ENOUGH_WORD:int = 8;
        public static const BUY_TIMES_LIMIT:int = 9;
        public static const NOT_ENOUGH_INGOT:int = 10;
        public static const NOT_ENOUGH_DAOYUAN:int = 11;
        public static const get_sock_info:Object = {module:331, action:0, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_sock:Object = {module:331, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const exchange_gift:Object = {module:331, action:2, request:[], response:[Utils.UByteUtil]};
        public static const shop_info:Object = {module:331, action:3, request:[], response:[Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_goods:Object = {module:331, action:4, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_sock_info", "get_sock", "exchange_gift", "shop_info", "buy_goods"];

        public function Mod_ChristmasGift_Base()
        {
            return;
        }// end function

    }
}
