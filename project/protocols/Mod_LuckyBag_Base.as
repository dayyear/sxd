package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LuckyBag_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const GOTTEN:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const get_info:Object = {module:268, action:0, request:[], response:[Utils.ByteUtil, Utils.UByteUtil]};
        public static const get_bag:Object = {module:268, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_info", "get_bag"];

        public function Mod_LuckyBag_Base()
        {
            return;
        }// end function

    }
}
