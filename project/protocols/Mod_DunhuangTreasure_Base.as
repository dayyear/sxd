package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_DunhuangTreasure_Base extends Object
    {
        public static const DOUBLE_AWARD:int = 0;
        public static const ONEHALF_SCORE:int = 1;
        public static const DOUBLE_SCORE:int = 2;
        public static const NONE:int = 3;
        public static const JIN:int = 4;
        public static const YIN:int = 5;
        public static const TONG:int = 6;
        public static const SUCCESS:int = 7;
        public static const ACTIVITY_CLOSE:int = 8;
        public static const FUNCTION_NO_OPEN:int = 9;
        public static const TIMES_LIMIT:int = 10;
        public static const NOT_ENOUGH_COIN:int = 11;
        public static const NOT_ENOUGH_INGOT:int = 12;
        public static const ITEM_PACK_FULL:int = 13;
        public static const LINK_FATE_PACK_FULL:int = 14;
        public static const DRAGONBALL_PACK_FULL:int = 15;
        public static const FAILURE:int = 16;
        public static const NOT_ENOUGH_SCORE:int = 17;
        public static const get_dunhuang_treasure_info:Object = {module:356, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const open_treasure:Object = {module:356, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const get_exchange_info:Object = {module:356, action:2, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const exchange:Object = {module:356, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_dunhuang_treasure_info", "open_treasure", "get_exchange_info", "exchange"];

        public function Mod_DunhuangTreasure_Base()
        {
            return;
        }// end function

    }
}
