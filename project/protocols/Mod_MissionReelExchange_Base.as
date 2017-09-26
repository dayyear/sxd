package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MissionReelExchange_Base extends Object
    {
        public static const UNLOCKED:int = 0;
        public static const LOCKED:int = 1;
        public static const SUCCESS:int = 2;
        public static const REEL_NO_UNLOCK:int = 3;
        public static const NO_ENOUGH_DAOYUAN:int = 4;
        public static const PACKAGE_FULL:int = 5;
        public static const get_reel_exchange_detail:Object = {module:148, action:0, request:[Utils.ShortUtil], response:[[Utils.ShortUtil, [Utils.IntUtil, Utils.UByteUtil]]]};
        public static const buy_reel:Object = {module:148, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_reel_exchange_detail", "buy_reel"];

        public function Mod_MissionReelExchange_Base()
        {
            return;
        }// end function

    }
}
