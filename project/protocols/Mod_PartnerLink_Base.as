package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_PartnerLink_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const LACK_OF_LINK_SOUL:int = 3;
        public static const FAILED:int = 4;
        public static const GENERAL:int = 5;
        public static const ADVANCED:int = 6;
        public static const SUPREMACY:int = 7;
        public static const DAO_YUAN:int = 8;
        public static const COIN:int = 9;
        public static const INGOT:int = 10;
        public static const SUCCEED:int = 11;
        public static const FUNCTION_NO_OPEN:int = 12;
        public static const NOT_BUY_COUNT:int = 13;
        public static const NOT_ENOUGH_DAOYUAN:int = 14;
        public static const NOT_ENOUGH_COIN:int = 15;
        public static const NOT_ENOUGH_INGOT:int = 16;
        public static const NOT_ENOUGH_ROLE_YUAN_HUN:int = 17;
        public static const NOT_ENOUGH_YUAN_HUN:int = 18;
        public static const NOT_ACTIVE:int = 19;
        public static const get_info:Object = {module:290, action:0, request:[], response:[Utils.ShortUtil, [Utils.ShortUtil, Utils.ShortUtil], [Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.UByteUtil, [Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil], Utils.UByteUtil]]};
        public static const activate:Object = {module:290, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_shopping_info:Object = {module:290, action:2, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil]]};
        public static const buy_item:Object = {module:290, action:3, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_change_shopping_info:Object = {module:290, action:4, request:[], response:[[Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const resolve_item:Object = {module:290, action:5, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const convert_item:Object = {module:290, action:6, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const advance:Object = {module:290, action:7, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_info", "activate", "get_shopping_info", "buy_item", "get_change_shopping_info", "resolve_item", "convert_item", "advance"];

        public function Mod_PartnerLink_Base()
        {
            return;
        }// end function

    }
}
