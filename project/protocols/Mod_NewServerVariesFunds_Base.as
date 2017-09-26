package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NewServerVariesFunds_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGTH_INGOT:int = 1;
        public static const CAN_NOT_BUY_FUND:int = 2;
        public static const HAD_BUY:int = 3;
        public static const NOT_ENOUGTH_TODAY_CHARGE_INGOT:int = 4;
        public static const ERROR:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const FUN_NOT_OPEN:int = 7;
        public static const FATE_PACK_FULL:int = 8;
        public static const NEED_ADDUP_TIMES:int = 9;
        public static const HAD_GET:int = 10;
        public static const is_open:Object = {module:326, action:0, request:[], response:[Utils.ByteUtil]};
        public static const activity_info:Object = {module:326, action:1, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const buy_new_server_varies_funds:Object = {module:326, action:2, request:[], response:[Utils.UByteUtil]};
        public static const get_new_server_varies_funds:Object = {module:326, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const open_peal:Object = {module:326, action:4, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["is_open", "activity_info", "buy_new_server_varies_funds", "get_new_server_varies_funds", "open_peal"];

        public function Mod_NewServerVariesFunds_Base()
        {
            return;
        }// end function

    }
}
