package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SummerScratch_Base extends Object
    {
        public static const NULL:int = 0;
        public static const FREE:int = 1;
        public static const INGOT:int = 2;
        public static const SUCCESS:int = 3;
        public static const NOT_ENOUGH_INGOT:int = 4;
        public static const NOT_ENOUGH_COUNT:int = 5;
        public static const ALREADY_USED:int = 6;
        public static const ITEM_PACK_FULL:int = 7;
        public static const FIVE_ELEMENTS_PACK_FULL:int = 8;
        public static const NOT_HAVE_CARD:int = 9;
        public static const FATE_PACK_FULL:int = 10;
        public static const NOT_ENOUGH_MEDAL:int = 11;
        public static const ERROR:int = 12;
        public static const scratch_info:Object = {module:361, action:0, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.UByteUtil]};
        public static const get_card:Object = {module:361, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const shave_award:Object = {module:361, action:2, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const get_award:Object = {module:361, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const get_big_award:Object = {module:361, action:4, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["scratch_info", "get_card", "shave_award", "get_award", "get_big_award"];

        public function Mod_SummerScratch_Base()
        {
            return;
        }// end function

    }
}
