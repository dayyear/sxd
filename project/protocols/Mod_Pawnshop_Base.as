package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Pawnshop_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const LACK_OF_ITEM:int = 1;
        public static const PAWN_COUNT_LIMIT:int = 2;
        public static const FAILED:int = 3;
        public static const LACK_OF_PAWN_TICKET:int = 4;
        public static const PACK_FULL:int = 5;
        public static const ALREADY_BUY_BACK:int = 6;
        public static const EXCHANGE_COUNT_LIMIT:int = 7;
        public static const get_info:Object = {module:332, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const pawn:Object = {module:332, action:1, request:[Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_buy_back_info:Object = {module:332, action:2, request:[], response:[[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_back:Object = {module:332, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_exchange_info:Object = {module:332, action:4, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const exchange:Object = {module:332, action:5, request:[Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_info", "pawn", "get_buy_back_info", "buy_back", "get_exchange_info", "exchange"];

        public function Mod_Pawnshop_Base()
        {
            return;
        }// end function

    }
}
