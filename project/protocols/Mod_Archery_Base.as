package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Archery_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGTH_ITEM:int = 1;
        public static const ACT_CLOSE:int = 2;
        public static const ERROR:int = 3;
        public static const PACK_FULL:int = 4;
        public static const NOT_ENOUGTH_HERT:int = 5;
        public static const act_open_time:Object = {module:215, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const act_info:Object = {module:215, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const archery_info:Object = {module:215, action:2, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil]};
        public static const send_gift:Object = {module:215, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const archery:Object = {module:215, action:4, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const exchange:Object = {module:215, action:5, request:[], response:[Utils.UByteUtil]};
        public static const join:Object = {module:215, action:6, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["act_open_time", "act_info", "archery_info", "send_gift", "archery", "exchange", "join"];

        public function Mod_Archery_Base()
        {
            return;
        }// end function

    }
}
