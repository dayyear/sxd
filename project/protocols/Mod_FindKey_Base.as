package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FindKey_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const NOT_ENOUGTH_INGOT:int = 2;
        public static const BUY_TIMES_USED:int = 3;
        public static const PACKFULL:int = 4;
        public static const FIVE_ELEMENTS_PACK_FULL:int = 5;
        public static const FUN_NOT_OPEN:int = 6;
        public static const NOT_ENOUGTH_GOLD_COIN:int = 7;
        public static const ALREADY_HAS_DANCE_ACTION:int = 8;
        public static const YES:int = 9;
        public static const NO:int = 10;
        public static const find_key_info:Object = {module:249, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const buy_find_times:Object = {module:249, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const find:Object = {module:249, action:2, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const exchange_list:Object = {module:249, action:3, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const exchange:Object = {module:249, action:4, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const is_pass:Object = {module:249, action:5, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["find_key_info", "buy_find_times", "find", "exchange_list", "exchange", "is_pass"];

        public function Mod_FindKey_Base()
        {
            return;
        }// end function

    }
}
