package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NumberTreasure_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const NO_ACTIVITY_TIME:int = 2;
        public static const NOT_ENOUGH_COIN:int = 3;
        public static const NOT_ENOUGH_INGOT:int = 4;
        public static const END:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const FAILURE:int = 7;
        public static const get_number_treasure_info:Object = {module:316, action:0, request:[], response:[[Utils.ByteUtil], Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]], [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const draw:Object = {module:316, action:1, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]], [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_number_treasure_info", "draw"];

        public function Mod_NumberTreasure_Base()
        {
            return;
        }// end function

    }
}
