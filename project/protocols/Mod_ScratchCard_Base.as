package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ScratchCard_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_ENOUGH_TIMES:int = 3;
        public static const PACK_FULL:int = 4;
        public static const FAILED:int = 5;
        public static const POINT:int = 6;
        public static const INGOT:int = 7;
        public static const IMAGE:int = 8;
        public static const AWARD:int = 9;
        public static const NOT_RANDOM:int = 10;
        public static const ALREADY_RANDOM:int = 11;
        public static const ITEM_PACK_FULL:int = 12;
        public static const FATE_PACK_FULL:int = 13;
        public static const NOT_EXIST_CARD:int = 14;
        public static const scratch_card_info:Object = {module:185, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil]};
        public static const shave_card:Object = {module:185, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const use_grid_card:Object = {module:185, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil]]};
        public static const use_combos_card:Object = {module:185, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const use_rock_card:Object = {module:185, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const random_grid_card:Object = {module:185, action:5, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil]]};
        public static const random_combos_card:Object = {module:185, action:6, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const random_rock_card:Object = {module:185, action:7, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_award:Object = {module:185, action:8, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["scratch_card_info", "shave_card", "use_grid_card", "use_combos_card", "use_rock_card", "random_grid_card", "random_combos_card", "random_rock_card", "get_award"];

        public function Mod_ScratchCard_Base()
        {
            return;
        }// end function

    }
}
