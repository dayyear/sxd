package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MidBackLottery_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const TODAY_LIMIT:int = 3;
        public static const NO_ENOUGH_INGOT:int = 4;
        public static const PACK_FULL:int = 5;
        public static const FIVE_ELEMENTS_PACK_FULL:int = 6;
        public static const NO_ENOUGH_MEMENTO_COIN:int = 7;
        public static const get_back_lottery_info:Object = {module:378, action:0, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil], [Utils.ByteUtil, Utils.UByteUtil], Utils.LongUtil]};
        public static const back_lottery:Object = {module:378, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const memento_coin_exchange:Object = {module:378, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_memento_coin_exchange_info:Object = {module:378, action:3, request:[], response:[[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil]]};
        public static const Actions:Array = ["get_back_lottery_info", "back_lottery", "memento_coin_exchange", "get_memento_coin_exchange_info"];

        public function Mod_MidBackLottery_Base()
        {
            return;
        }// end function

    }
}
