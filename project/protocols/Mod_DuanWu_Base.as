package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_DuanWu_Base extends Object
    {
        public static const CAN_GET:int = 0;
        public static const CAN_NOT_GET:int = 1;
        public static const TIME_ERROR:int = 2;
        public static const SUCCESS:int = 3;
        public static const FAILED:int = 4;
        public static const PACK_FULL:int = 5;
        public static const NOT_ENOUGH_VIP:int = 6;
        public static const ARG_ERROR:int = 7;
        public static const zongzi_state:Object = {module:64, action:0, request:[], response:[Utils.UByteUtil]};
        public static const get_zongzi:Object = {module:64, action:1, request:[], response:[Utils.UByteUtil]};
        public static const worship_state:Object = {module:64, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const worship:Object = {module:64, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["zongzi_state", "get_zongzi", "worship_state", "worship"];

        public function Mod_DuanWu_Base()
        {
            return;
        }// end function

    }
}
