package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ReleaseWelfare_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const GOTTEN:int = 2;
        public static const SUCCESS:int = 3;
        public static const COMPLETE_ALL:int = 4;
        public static const PACKAGE_FULL:int = 5;
        public static const get_info:Object = {module:240, action:0, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil]]};
        public static const get_welfare:Object = {module:240, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "get_welfare"];

        public function Mod_ReleaseWelfare_Base()
        {
            return;
        }// end function

    }
}
