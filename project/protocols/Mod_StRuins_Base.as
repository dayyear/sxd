package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StRuins_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const TIME_OUT:int = 2;
        public static const NOT_ENOUGTH_SCRAP:int = 3;
        public static const IS_HAVE_SCRAP:int = 4;
        public static const CD:int = 5;
        public static const EXPIRED:int = 6;
        public static const IS_EXCHANGE:int = 7;
        public static const CHANGE_SELF:int = 8;
        public static const st_ruins_info:Object = {module:189, action:0, request:[], response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const find_scrap:Object = {module:189, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const scrap_info:Object = {module:189, action:2, request:[], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const send_exchange:Object = {module:189, action:3, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const exchange_info:Object = {module:189, action:4, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const exchange:Object = {module:189, action:5, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const merge:Object = {module:189, action:6, request:[], response:[Utils.UByteUtil]};
        public static const delivery:Object = {module:189, action:7, request:[], response:[Utils.UByteUtil]};
        public static const notify_scrap_change:Object = {module:189, action:8, request:[], response:[Utils.ByteUtil]};
        public static const get_st_ruins_time:Object = {module:189, action:9, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["st_ruins_info", "find_scrap", "scrap_info", "send_exchange", "exchange_info", "exchange", "merge", "delivery", "notify_scrap_change", "get_st_ruins_time"];

        public function Mod_StRuins_Base()
        {
            return;
        }// end function

    }
}
