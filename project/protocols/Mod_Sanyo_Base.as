package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Sanyo_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGH_INGOT:int = 1;
        public static const HAD_BUY:int = 2;
        public static const NOT_ENOUGH_TODAY_CHARGE_INGOT:int = 3;
        public static const DEADLINE:int = 4;
        public static const FUNCTION_NO_OPEN:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const FAILURE:int = 7;
        public static const OPEN:int = 8;
        public static const get_sanyo_info:Object = {module:373, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, [Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const buy_goods:Object = {module:373, action:1, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const notify_lottery:Object = {module:373, action:2, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_sanyo_info", "buy_goods", "notify_lottery"];

        public function Mod_Sanyo_Base()
        {
            return;
        }// end function

    }
}
