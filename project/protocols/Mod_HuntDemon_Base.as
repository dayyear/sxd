package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_HuntDemon_Base extends Object
    {
        public static const COIN:int = 0;
        public static const ITEM:int = 1;
        public static const SKILL:int = 2;
        public static const FIND_IMMORTAL_NUM:int = 3;
        public static const JEWEL_SCRAP:int = 4;
        public static const SUCCESS:int = 5;
        public static const PACK_FULL:int = 6;
        public static const NO_ENOUGH_INGOT:int = 7;
        public static const NO_ENOUGH_COIN:int = 8;
        public static const NO_ENOUGH_TIMES:int = 9;
        public static const FIND_IMMORTAL_NUM_FULL:int = 10;
        public static const open_hunt_demon:Object = {module:105, action:1, request:[Utils.ByteUtil], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil]]};
        public static const hunt_demon:Object = {module:105, action:2, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["open_hunt_demon", "hunt_demon"];

        public function Mod_HuntDemon_Base()
        {
            return;
        }// end function

    }
}
