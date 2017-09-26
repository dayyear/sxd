package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Agate_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const HALF_INGOT_COST:int = 2;
        public static const DOUBLE_COIN_AWARD:int = 3;
        public static const NOTHING:int = 4;
        public static const SUCCEED:int = 5;
        public static const FAILED:int = 6;
        public static const NOENOUGHINGOT:int = 7;
        public static const NOENOUGHNUMBER:int = 8;
        public static const agate_list:Object = {module:110, action:1, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const agate_use:Object = {module:110, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const Actions:Array = ["agate_list", "agate_use"];

        public function Mod_Agate_Base()
        {
            return;
        }// end function

    }
}
