package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WagerShop_Base extends Object
    {
        public static const HEI:int = 0;
        public static const HONG:int = 1;
        public static const MEI:int = 2;
        public static const FANG:int = 3;
        public static const COMMON:int = 4;
        public static const NIUNIU:int = 5;
        public static const FIVENIU:int = 6;
        public static const SUCCESS:int = 7;
        public static const NOT_IN_ACTIVITY:int = 8;
        public static const NOT_ENOUGH_GOLD:int = 9;
        public static const TIMES_LIMIT:int = 10;
        public static const BET_GOLD_LIMIT:int = 11;
        public static const CITY_NOT_OPEN:int = 12;
        public static const HAS_NOT_BET:int = 13;
        public static const WIN:int = 14;
        public static const TIE:int = 15;
        public static const LOSE:int = 16;
        public static const PENDING:int = 17;
        public static const BIG:int = 18;
        public static const SMALL:int = 19;
        public static const TODAY_LIMIT:int = 20;
        public static const GOLD_MORE_THAN_LIMIT:int = 21;
        public static const FAILURE:int = 22;
        public static const NOT_ENOUGH_TIMES:int = 23;
        public static const HAVE_CARD:int = 24;
        public static const FAILED:int = 25;
        public static const ITEM_PACK_FULL:int = 26;
        public static const FATE_PACK_FULL:int = 27;
        public static const GOLD_NUM_LIMIT:int = 28;
        public static const HAVE_NIU:int = 29;
        public static const CHOICE_THREE:int = 30;
        public static const TEN_TYPE:int = 31;
        public static const get_twenty_one_info:Object = {module:260, action:0, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const bet_twenty_one:Object = {module:260, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const call_twenty_one:Object = {module:260, action:2, request:[], response:[Utils.UByteUtil]};
        public static const open_twenty_one:Object = {module:260, action:3, request:[], response:[Utils.UByteUtil]};
        public static const notify_twenty_one_result:Object = {module:260, action:4, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.ByteUtil], [Utils.UByteUtil, Utils.ByteUtil]]};
        public static const get_ya_da_xiao_info:Object = {module:260, action:5, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const bet:Object = {module:260, action:6, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil], Utils.IntUtil]};
        public static const get_gua_gua_ka_info:Object = {module:260, action:7, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const scrape:Object = {module:260, action:8, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const buy_card:Object = {module:260, action:9, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_turntable_info:Object = {module:260, action:10, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const turntable:Object = {module:260, action:11, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_exchange_info:Object = {module:260, action:12, request:[], response:[Utils.IntUtil, [Utils.ShortUtil, Utils.ShortUtil]]};
        public static const exchange_award:Object = {module:260, action:13, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const get_fruit_machine_info:Object = {module:260, action:14, request:[], response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const bet_fruit_machine:Object = {module:260, action:15, request:[[Utils.ShortUtil, Utils.IntUtil]], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil]]};
        public static const get_christmas_sock_info:Object = {module:260, action:16, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const pick:Object = {module:260, action:17, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_niu_niu_info:Object = {module:260, action:18, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const xia_zhu:Object = {module:260, action:19, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const fan_bei:Object = {module:260, action:20, request:[Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.ByteUtil], [Utils.UByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const open_card:Object = {module:260, action:21, request:[[Utils.UByteUtil, Utils.ByteUtil]], response:[Utils.UByteUtil]};
        public static const notify_niu_result:Object = {module:260, action:22, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.UByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.UByteUtil, [Utils.UByteUtil, Utils.ByteUtil]]};
        public static const notify_fan_bei:Object = {module:260, action:23, request:[], response:[[Utils.UByteUtil, Utils.ByteUtil], [Utils.UByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_twenty_one_info", "bet_twenty_one", "call_twenty_one", "open_twenty_one", "notify_twenty_one_result", "get_ya_da_xiao_info", "bet", "get_gua_gua_ka_info", "scrape", "buy_card", "get_turntable_info", "turntable", "get_exchange_info", "exchange_award", "get_fruit_machine_info", "bet_fruit_machine", "get_christmas_sock_info", "pick", "get_niu_niu_info", "xia_zhu", "fan_bei", "open_card", "notify_niu_result", "notify_fan_bei"];

        public function Mod_WagerShop_Base()
        {
            return;
        }// end function

    }
}
