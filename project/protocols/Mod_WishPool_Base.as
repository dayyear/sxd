package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WishPool_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const ALREADY_CHOSE:int = 4;
        public static const ID_ERROR:int = 5;
        public static const FULL_WISH_VALUE:int = 6;
        public static const WISHED_TODAY:int = 7;
        public static const NO_CHOSE:int = 8;
        public static const SPEEDUP_TIME_USEDUP:int = 9;
        public static const NO_ENOUGH_COINS:int = 10;
        public static const TARGET_FUNCTION_NO_OPEN:int = 11;
        public static const WISHED_LIMIT:int = 12;
        public static const TARGET_NO_CHOSE:int = 13;
        public static const WISH_SELF:int = 14;
        public static const NO_ENOUGH_INGOT:int = 15;
        public static const GOTTEN:int = 16;
        public static const NO_ENOUGH_VALUE:int = 17;
        public static const ITEM_PACK_FULL:int = 18;
        public static const get_wish_pool_info:Object = {module:359, action:0, request:[], response:[[Utils.IntUtil, Utils.UByteUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil]};
        public static const get_wish_list:Object = {module:359, action:1, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, [Utils.IntUtil, Utils.UByteUtil], Utils.ShortUtil]]};
        public static const choose_awards:Object = {module:359, action:2, request:[[Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const wish_self:Object = {module:359, action:3, request:[], response:[Utils.UByteUtil]};
        public static const speedup:Object = {module:359, action:4, request:[], response:[Utils.UByteUtil]};
        public static const wish_other:Object = {module:359, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_award:Object = {module:359, action:6, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_wish_pool_info", "get_wish_list", "choose_awards", "wish_self", "speedup", "wish_other", "get_award"];

        public function Mod_WishPool_Base()
        {
            return;
        }// end function

    }
}
