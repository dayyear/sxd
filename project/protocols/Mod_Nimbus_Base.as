package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Nimbus_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FAILED:int = 1;
        public static const NO_ENOUGH_INGOT:int = 2;
        public static const NO_ENOUGH_LEVEL:int = 3;
        public static const NO_ENOUGH_TIME:int = 4;
        public static const nimbus_info:Object = {module:104, action:0, request:[], response:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const gather_nimbus:Object = {module:104, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["nimbus_info", "gather_nimbus"];

        public function Mod_Nimbus_Base()
        {
            return;
        }// end function

    }
}
