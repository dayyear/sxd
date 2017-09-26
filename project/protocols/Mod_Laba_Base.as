package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Laba_Base extends Object
    {
        public static const ONE:int = 0;
        public static const TEN:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_ENOUGH_COIN:int = 3;
        public static const NOT_ENOUGH_INGOT:int = 4;
        public static const NOT_ENOUGH_COUNT:int = 5;
        public static const FIVE_ELEMENTS_PACK_FULL:int = 6;
        public static const NOT_ENOUGH_SCORE:int = 7;
        public static const PACK_FULL:int = 8;
        public static const NOT_ENOUGH_EQUIP:int = 9;
        public static const NO_ENOUGH_FIVE_DUST:int = 10;
        public static const laba_info:Object = {module:172, action:0, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const draw:Object = {module:172, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [[Utils.ByteUtil]], Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const exchange_box:Object = {module:172, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const resolve_five_element:Object = {module:172, action:3, request:[Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const exchange_five_element:Object = {module:172, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["laba_info", "draw", "exchange_box", "resolve_five_element", "exchange_five_element"];

        public function Mod_Laba_Base()
        {
            return;
        }// end function

    }
}
