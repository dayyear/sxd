package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_NewYearDaySignIn_Base extends Object
    {
        public static const FIVE:int = 0;
        public static const FIFTEEN:int = 1;
        public static const TWENTY_FIVE:int = 2;
        public static const THIRTY_FIVE:int = 3;
        public static const FORTY_FIVE:int = 4;
        public static const FIFTY:int = 5;
        public static const CAN_GET:int = 6;
        public static const CANNT_GET:int = 7;
        public static const HAD_GET:int = 8;
        public static const YES:int = 9;
        public static const NO:int = 10;
        public static const SUCCESS:int = 11;
        public static const HAD_SIGNED_IN:int = 12;
        public static const FAILED:int = 13;
        public static const NOT_ENOUGH_INGOT:int = 14;
        public static const ROLL_CAKE_FUN_NOT_OPEN:int = 15;
        public static const FIND_IMMORTAL_FUN_NOT_OPEN:int = 16;
        public static const PACK_FULL:int = 17;
        public static const get_player_sign_in_info:Object = {module:133, action:0, request:[], response:[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const get_sign_in_status:Object = {module:133, action:1, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil]};
        public static const player_sign_in:Object = {module:133, action:2, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const player_repair_sign_in:Object = {module:133, action:3, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const get_total_signed_in_award:Object = {module:133, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_player_sign_in_info", "get_sign_in_status", "player_sign_in", "player_repair_sign_in", "get_total_signed_in_award"];

        public function Mod_NewYearDaySignIn_Base()
        {
            return;
        }// end function

    }
}
