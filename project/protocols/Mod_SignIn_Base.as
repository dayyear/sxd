package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SignIn_Base extends Object
    {
        public static const CAN_GET:int = 0;
        public static const CAN_NOT_GET:int = 1;
        public static const DAY_5:int = 2;
        public static const DAY_15:int = 3;
        public static const DAY_25:int = 4;
        public static const DAY_35:int = 5;
        public static const DAY_45:int = 6;
        public static const ALREADY_GET:int = 7;
        public static const NO_SIGN_IN:int = 8;
        public static const ALREADY_SIGN_IN:int = 9;
        public static const SUCCESS:int = 10;
        public static const FAILED:int = 11;
        public static const SI_SUCCESS:int = 12;
        public static const SI_FAILED:int = 13;
        public static const SI_FULL:int = 14;
        public static const SI_NO_INGOT:int = 15;
        public static const get_sign_in_info:Object = {module:89, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil], [Utils.UByteUtil, Utils.UByteUtil], Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_continue_award:Object = {module:89, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const player_sign_in:Object = {module:89, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil], [Utils.UByteUtil, Utils.UByteUtil], Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const repair_sign_in:Object = {module:89, action:3, request:[], response:[Utils.UByteUtil, [Utils.IntUtil], [Utils.UByteUtil, Utils.UByteUtil], Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_total_award:Object = {module:89, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil], [Utils.UByteUtil, Utils.UByteUtil], Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const get_sign_in_status:Object = {module:89, action:5, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_sign_in_info", "get_continue_award", "player_sign_in", "repair_sign_in", "get_total_award", "get_sign_in_status"];

        public function Mod_SignIn_Base()
        {
            return;
        }// end function

    }
}
