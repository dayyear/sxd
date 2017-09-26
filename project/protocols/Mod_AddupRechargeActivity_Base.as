package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_AddupRechargeActivity_Base extends Object
    {
        public static const ACTIVITY_OPEN:int = 0;
        public static const ACTIVITY_CLOSE:int = 1;
        public static const GOTTEN:int = 2;
        public static const NO_GOTTEN:int = 3;
        public static const NO_CHARGE:int = 4;
        public static const CAN_GET:int = 5;
        public static const HAD_GET:int = 6;
        public static const NOT_GET:int = 7;
        public static const SUCCESS:int = 8;
        public static const ALREADY_GOTTEN:int = 9;
        public static const NO_ADDUP_RECHARGE_LI_BAO:int = 10;
        public static const PACK_FULL:int = 11;
        public static const FAILURE:int = 12;
        public static const get_activity_state:Object = {module:318, action:0, request:[], response:[Utils.UByteUtil]};
        public static const get_player_addup_recharge_info:Object = {module:318, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], [Utils.ShortUtil, [Utils.IntUtil, Utils.IntUtil]], Utils.ShortUtil, [Utils.ShortUtil, Utils.UByteUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const get_addup_recharge_li_bao:Object = {module:318, action:2, request:[], response:[Utils.UByteUtil]};
        public static const get_addup_recharge_extra_award:Object = {module:318, action:3, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const notify_charge_result:Object = {module:318, action:4, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_state", "get_player_addup_recharge_info", "get_addup_recharge_li_bao", "get_addup_recharge_extra_award", "notify_charge_result"];

        public function Mod_AddupRechargeActivity_Base()
        {
            return;
        }// end function

    }
}
