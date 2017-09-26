package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ShenGun_Base extends Object
    {
        public static const CAN_GET:int = 0;
        public static const ALREADY_GET:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_IN_ACTIVITY:int = 3;
        public static const HAS_ALREADY_GET:int = 4;
        public static const ITEM_PACK_FULL:int = 5;
        public static const FAILED:int = 6;
        public static const shen_gun_info:Object = {module:202, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const all_server_shen_gun_count:Object = {module:202, action:1, request:[], response:[Utils.LongUtil]};
        public static const get_groupon_award_info:Object = {module:202, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const receive_groupon_award:Object = {module:202, action:3, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["shen_gun_info", "all_server_shen_gun_count", "get_groupon_award_info", "receive_groupon_award"];

        public function Mod_ShenGun_Base()
        {
            return;
        }// end function

    }
}
