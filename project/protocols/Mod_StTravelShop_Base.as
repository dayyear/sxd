package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StTravelShop_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_COUNT:int = 1;
        public static const NO_INGOT:int = 2;
        public static const SPEAKER_LIMIT:int = 3;
        public static const TESTER:int = 4;
        public static const DAY_LIMIT:int = 5;
        public static const NO_DAOYUAN:int = 6;
        public static const NOT_ENOUGH_FATE_GRID:int = 7;
        public static const OPEN:int = 8;
        public static const NOT_OPEN:int = 9;
        public static const travel_shop_info:Object = {module:126, action:0, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_goods:Object = {module:126, action:1, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const is_travel_shop_open:Object = {module:126, action:2, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["travel_shop_info", "buy_goods", "is_travel_shop_open"];

        public function Mod_StTravelShop_Base()
        {
            return;
        }// end function

    }
}
