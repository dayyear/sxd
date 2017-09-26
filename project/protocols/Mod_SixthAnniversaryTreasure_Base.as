package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SixthAnniversaryTreasure_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FAILURE:int = 1;
        public static const PACK_FULL:int = 2;
        public static const MAX_EXCHANGE:int = 3;
        public static const NO_ENOUGH:int = 4;
        public static const NO_ENOUGH_JIN_BI:int = 5;
        public static const get_sixth_anniversary_treasure_info:Object = {module:351, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const meet:Object = {module:351, action:1, request:[[Utils.IntUtil, Utils.IntUtil]], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const exchange:Object = {module:351, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const Actions:Array = ["get_sixth_anniversary_treasure_info", "meet", "exchange"];

        public function Mod_SixthAnniversaryTreasure_Base()
        {
            return;
        }// end function

    }
}
