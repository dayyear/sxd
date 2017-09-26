package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NewServerFund_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGTH_INGOT:int = 1;
        public static const ERROR:int = 2;
        public static const ITEM_PACK_FULL:int = 3;
        public static const FUN_NOT_OPEN:int = 4;
        public static const FATE_PACK_FULL:int = 5;
        public static const is_can_buy_new_server_fund:Object = {module:221, action:0, request:[], response:[Utils.ByteUtil]};
        public static const new_server_fund_info:Object = {module:221, action:1, request:[], response:[Utils.ByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const buy_new_server_fund:Object = {module:221, action:2, request:[], response:[Utils.UByteUtil]};
        public static const get_new_server_fund:Object = {module:221, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["is_can_buy_new_server_fund", "new_server_fund_info", "buy_new_server_fund", "get_new_server_fund"];

        public function Mod_NewServerFund_Base()
        {
            return;
        }// end function

    }
}
