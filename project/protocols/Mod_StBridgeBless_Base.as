package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StBridgeBless_Base extends Object
    {
        public static const ST_BBRIDGE_BLESS_GIFT_GET:int = 0;
        public static const ST_BBRIDGE_BLESS_GIFT_NO_GET:int = 1;
        public static const SUCCESS:int = 2;
        public static const ERROR:int = 3;
        public static const NO_ENOUGHT_REMAIN_TIMES:int = 4;
        public static const NOT_ENOUGTH_PROP:int = 5;
        public static const PACK_FULL:int = 6;
        public static const CD:int = 7;
        public static const TIME_OUT:int = 8;
        public static const EXPIRED:int = 9;
        public static const IS_EXCHANGE:int = 10;
        public static const CHANGE_SELF:int = 11;
        public static const st_bridge_bless_info:Object = {module:372, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil], Utils.LongUtil]};
        public static const get_prop:Object = {module:372, action:1, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const bless:Object = {module:372, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_gift:Object = {module:372, action:3, request:[], response:[Utils.UByteUtil]};
        public static const get_big_gift:Object = {module:372, action:4, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const send_exchange:Object = {module:372, action:5, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const exchange_info:Object = {module:372, action:6, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const exchange:Object = {module:372, action:7, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["st_bridge_bless_info", "get_prop", "bless", "get_gift", "get_big_gift", "send_exchange", "exchange_info", "exchange"];

        public function Mod_StBridgeBless_Base()
        {
            return;
        }// end function

    }
}
