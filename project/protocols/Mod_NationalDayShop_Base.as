package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NationalDayShop_Base extends Object
    {
        public static const EXTRA_BOX_GET:int = 0;
        public static const EXTRA_BOX_NOT_GET:int = 1;
        public static const SUCCESS:int = 2;
        public static const FAILD:int = 3;
        public static const PACK_FULL:int = 4;
        public static const NOT_ENOUGTH_INGOT:int = 5;
        public static const shop_info:Object = {module:376, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], [Utils.IntUtil, [Utils.IntUtil, Utils.LongUtil], Utils.UByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil]};
        public static const buy_goods:Object = {module:376, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.LongUtil]};
        public static const get_extra_box:Object = {module:376, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.LongUtil]]};
        public static const Actions:Array = ["shop_info", "buy_goods", "get_extra_box"];

        public function Mod_NationalDayShop_Base()
        {
            return;
        }// end function

    }
}
