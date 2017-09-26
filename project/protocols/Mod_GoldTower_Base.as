package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_GoldTower_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGHT_INGOT:int = 1;
        public static const IREM_PACK_FULL:int = 2;
        public static const JEWEL_PACK_FULL:int = 3;
        public static const LINK_FATE_PACK_FULL:int = 4;
        public static const FAILURE:int = 5;
        public static const GOLD:int = 6;
        public static const SILVER:int = 7;
        public static const NOT_IN_ACTIVITY:int = 8;
        public static const FUNCTION_UNOPEN:int = 9;
        public static const NOT_ENOUGHT_PACK:int = 10;
        public static const NOT_ENOUGHT_GOLD:int = 11;
        public static const NOT_ENOUGHT_SILVER:int = 12;
        public static const TIMES_LIMIT:int = 13;
        public static const DRAGONBALL_PACK_FULL:int = 14;
        public static const FATE_PACK_FULL:int = 15;
        public static const tower_info:Object = {module:367, action:0, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]]]};
        public static const draw:Object = {module:367, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_exchange_award_info:Object = {module:367, action:2, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const exchange_award:Object = {module:367, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_top_award:Object = {module:367, action:4, request:[Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["tower_info", "draw", "get_exchange_award_info", "exchange_award", "get_top_award"];

        public function Mod_GoldTower_Base()
        {
            return;
        }// end function

    }
}
