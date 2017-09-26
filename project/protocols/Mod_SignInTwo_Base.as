package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SignInTwo_Base extends Object
    {
        public static const FIVE:int = 0;
        public static const FIFTEEN:int = 1;
        public static const TWENTY_FIVE:int = 2;
        public static const THIRTY_FIVE:int = 3;
        public static const FORTY_FIVE:int = 4;
        public static const CAN_GET:int = 5;
        public static const CANNT_GET:int = 6;
        public static const HAD_GET:int = 7;
        public static const ONE:int = 8;
        public static const TWO:int = 9;
        public static const THREE:int = 10;
        public static const FOUR:int = 11;
        public static const YES:int = 12;
        public static const NO:int = 13;
        public static const SUCCESS:int = 14;
        public static const HAD_SIGNED_IN:int = 15;
        public static const FAILED:int = 16;
        public static const NOT_ENOUGH_INGOT:int = 17;
        public static const PACK_FULL:int = 18;
        public static const get_player_sign_in_info_two:Object = {module:92, action:0, request:[], response:[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.UByteUtil], Utils.ByteUtil, [Utils.UByteUtil, Utils.UByteUtil]]};
        public static const get_ji_and_ma_two:Object = {module:92, action:1, request:[], response:[[Utils.StringUtil, Utils.UByteUtil]]};
        public static const player_sign_in_two:Object = {module:92, action:2, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.UByteUtil]]};
        public static const player_repair_sign_in_two:Object = {module:92, action:3, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.UByteUtil]]};
        public static const get_total_signed_in_award_two:Object = {module:92, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.UByteUtil]]};
        public static const get_continue_login_award_two:Object = {module:92, action:5, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.UByteUtil]]};
        public static const get_sign_in_status_two:Object = {module:92, action:6, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil]};
        public static const Actions:Array = ["get_player_sign_in_info_two", "get_ji_and_ma_two", "player_sign_in_two", "player_repair_sign_in_two", "get_total_signed_in_award_two", "get_continue_login_award_two", "get_sign_in_status_two"];

        public function Mod_SignInTwo_Base()
        {
            return;
        }// end function

    }
}
