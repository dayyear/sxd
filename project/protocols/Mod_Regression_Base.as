package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Regression_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_IN_ACTIVITY:int = 1;
        public static const MISSION_LOCKED:int = 2;
        public static const FAILED:int = 3;
        public static const LACK_OF_ACTIVENESS:int = 4;
        public static const MAX_TIMES_LIMIT:int = 5;
        public static const PACK_FULL:int = 6;
        public static const FATE_PACK_FULL:int = 7;
        public static const LACK_OF_LUCKY_COINS:int = 8;
        public static const EXCHANGE_TIMES_LIMIT:int = 9;
        public static const ERROR:int = 10;
        public static const get_player_regression_login_info:Object = {module:254, action:0, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const dice:Object = {module:254, action:1, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const lucky_coins_exchange:Object = {module:254, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil]};
        public static const get_back_send_gift_info:Object = {module:254, action:3, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const get_back_send_gift_award:Object = {module:254, action:4, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_back_assistant_info:Object = {module:254, action:5, request:[], response:[Utils.IntUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]]};
        public static const get_back_assistant_award:Object = {module:254, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_player_regression_login_info", "dice", "lucky_coins_exchange", "get_back_send_gift_info", "get_back_send_gift_award", "get_back_assistant_info", "get_back_assistant_award"];

        public function Mod_Regression_Base()
        {
            return;
        }// end function

    }
}
