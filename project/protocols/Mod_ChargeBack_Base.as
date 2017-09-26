package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChargeBack_Base extends Object
    {
        public static const CAN_NOT_GET:int = 0;
        public static const CAN_GET:int = 1;
        public static const ALREADY_GET:int = 2;
        public static const YES:int = 3;
        public static const NO:int = 4;
        public static const SUCCESS:int = 5;
        public static const PACK_FULL:int = 6;
        public static const FAILED:int = 7;
        public static const OPEN:int = 8;
        public static const CLOSE:int = 9;
        public static const HAD_GET:int = 10;
        public static const NOT_GET:int = 11;
        public static const HAD_ACTIVATE:int = 12;
        public static const NOT_ENOUGH_FREEDOM:int = 13;
        public static const MAX_BUFF_LEVEL:int = 14;
        public static const NON_CHARGE:int = 15;
        public static const open_charge_back:Object = {module:155, action:0, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil, Utils.UByteUtil]};
        public static const get_gift:Object = {module:155, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_new_can_get:Object = {module:155, action:2, request:[], response:[Utils.IntUtil]};
        public static const get_charge_back_activity_time:Object = {module:155, action:3, request:[], response:[[Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil]};
        public static const notify_activity_status:Object = {module:155, action:4, request:[], response:[Utils.UByteUtil]};
        public static const get_player_freedom_info:Object = {module:155, action:5, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.ShortUtil]]};
        public static const get_mascot_befall_time:Object = {module:155, action:6, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_mascot_befall_info:Object = {module:155, action:7, request:[], response:[Utils.IntUtil, [Utils.ShortUtil, Utils.ByteUtil]]};
        public static const activate_fuction_of_mascot_befall:Object = {module:155, action:8, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_world_charge_award_info:Object = {module:155, action:9, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil]]};
        public static const get_world_charge_award:Object = {module:155, action:10, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["open_charge_back", "get_gift", "notify_new_can_get", "get_charge_back_activity_time", "notify_activity_status", "get_player_freedom_info", "get_mascot_befall_time", "get_player_mascot_befall_info", "activate_fuction_of_mascot_befall", "get_world_charge_award_info", "get_world_charge_award"];

        public function Mod_ChargeBack_Base()
        {
            return;
        }// end function

    }
}
