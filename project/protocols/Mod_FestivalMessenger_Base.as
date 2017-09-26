package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FestivalMessenger_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const GOTTEN:int = 3;
        public static const FAILURE:int = 4;
        public static const FUNCTION_NO_OPEN:int = 5;
        public static const PACKAGE_FULL:int = 6;
        public static const get_info:Object = {module:266, action:0, request:[], response:[Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil]};
        public static const get_award:Object = {module:266, action:1, request:[], response:[Utils.UByteUtil]};
        public static const show:Object = {module:266, action:2, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "get_award", "show"];

        public function Mod_FestivalMessenger_Base()
        {
            return;
        }// end function

    }
}
