package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Bank_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const DAY_1:int = 2;
        public static const DAY_2:int = 3;
        public static const DAY_3:int = 4;
        public static const DAY_4:int = 5;
        public static const DAY_5:int = 6;
        public static const DAY_6:int = 7;
        public static const DAY_7:int = 8;
        public static const SUCCESS:int = 9;
        public static const NEED_INGOT:int = 10;
        public static const NEED_CARD:int = 11;
        public static const NEED_VIP_LEVEL:int = 12;
        public static const DRAGONBALL_PACK_FULL:int = 13;
        public static const ITEM_PACK_FULL:int = 14;
        public static const get_bank_activity_time:Object = {module:175, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const get_activity_info:Object = {module:175, action:1, request:[], response:[[Utils.ByteUtil, [Utils.UByteUtil, Utils.ByteUtil]]]};
        public static const buy_product:Object = {module:175, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_award:Object = {module:175, action:3, request:[Utils.ByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_total_award_list:Object = {module:175, action:4, request:[], response:[[Utils.ByteUtil, [Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil]]]]};
        public static const Actions:Array = ["get_bank_activity_time", "get_activity_info", "buy_product", "get_award", "get_total_award_list"];

        public function Mod_Bank_Base()
        {
            return;
        }// end function

    }
}
