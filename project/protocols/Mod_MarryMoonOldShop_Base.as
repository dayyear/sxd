package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MarryMoonOldShop_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const PACK_FULL:int = 1;
        public static const NO_ENOUGH_INGOT:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const ALREADY_BOUGHT:int = 4;
        public static const NO_MARRY:int = 5;
        public static const LEVEL_LIMIT:int = 6;
        public static const buy_moon_shop_item:Object = {module:211, action:0, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_bought_list:Object = {module:211, action:1, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil]]};
        public static const Actions:Array = ["buy_moon_shop_item", "get_bought_list"];

        public function Mod_MarryMoonOldShop_Base()
        {
            return;
        }// end function

    }
}
