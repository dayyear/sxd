package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CourtyardFurnance_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const UNSMELTABLE:int = 2;
        public static const NO_ENOUGH_COUNT:int = 3;
        public static const LIMIT:int = 4;
        public static const FAILURE:int = 5;
        public static const NO_ENOUGH_XIAN_QI:int = 6;
        public static const HAD_ACTIVITY:int = 7;
        public static const INVALID_WAR_ATTR_ID:int = 8;
        public static const LOCK:int = 9;
        public static const NON_ACTIVITY:int = 10;
        public static const NON_RESET:int = 11;
        public static const TOTAL_LIMIT:int = 12;
        public static const NO_ENOUGH_MAGIC_BREATH:int = 13;
        public static const UN_EXCHANGABLE:int = 14;
        public static const CARD_SOUL_ERROR:int = 15;
        public static const smelt:Object = {module:219, action:1, request:[[Utils.IntUtil, Utils.ShortUtil]], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_resource_list:Object = {module:219, action:2, request:[], response:[[Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil]};
        public static const get_player_furnance_rune_info:Object = {module:219, action:11, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const activity_furnance_rune:Object = {module:219, action:12, request:[Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const reset_furnance_rune:Object = {module:219, action:13, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const save_reset_furnance_rune:Object = {module:219, action:14, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_lock_list:Object = {module:219, action:15, request:[], response:[[Utils.IntUtil]]};
        public static const one_key_activity_furnance_rune:Object = {module:219, action:16, request:[], response:[Utils.UByteUtil]};
        public static const get_shop_info:Object = {module:219, action:20, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const exchange:Object = {module:219, action:21, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["smelt", "get_resource_list", "get_player_furnance_rune_info", "activity_furnance_rune", "reset_furnance_rune", "save_reset_furnance_rune", "get_lock_list", "one_key_activity_furnance_rune", "get_shop_info", "exchange"];

        public function Mod_CourtyardFurnance_Base()
        {
            return;
        }// end function

    }
}
