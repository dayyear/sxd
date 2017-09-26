package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StFlyEgg_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const NON_ACTIVITY_TIME:int = 3;
        public static const CATCH_COUNT_LIMIT:int = 4;
        public static const FUNCTION_NOT_OPEN:int = 5;
        public static const ITEM_PACK_FULL:int = 6;
        public static const FAILED:int = 7;
        public static const NOT_ENOUGH_EGG:int = 8;
        public static const HAD_GET:int = 9;
        public static const get_fly_egg_activity_info:Object = {module:334, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const notify_fly_egg_activity_status_change:Object = {module:334, action:1, request:[], response:[Utils.UByteUtil]};
        public static const notify_fly_egg_refresh:Object = {module:334, action:2, request:[], response:[Utils.ByteUtil]};
        public static const player_catch_egg:Object = {module:334, action:3, request:[], response:[Utils.UByteUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_exchange_award_info:Object = {module:334, action:4, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.ByteUtil]};
        public static const exchange_award:Object = {module:334, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_fly_egg_activity_info", "notify_fly_egg_activity_status_change", "notify_fly_egg_refresh", "player_catch_egg", "get_exchange_award_info", "exchange_award"];

        public function Mod_StFlyEgg_Base()
        {
            return;
        }// end function

    }
}
