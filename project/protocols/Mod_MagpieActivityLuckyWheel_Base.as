package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MagpieActivityLuckyWheel_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const PACK_FULL:int = 3;
        public static const ERROR:int = 4;
        public static const NO_MARRY:int = 5;
        public static const lucky_wheel_info:Object = {module:246, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const lottery:Object = {module:246, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const qi_xi_gift_info:Object = {module:246, action:2, request:[], response:[Utils.UByteUtil]};
        public static const get_qi_xi_gift:Object = {module:246, action:3, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["lucky_wheel_info", "lottery", "qi_xi_gift_info", "get_qi_xi_gift"];

        public function Mod_MagpieActivityLuckyWheel_Base()
        {
            return;
        }// end function

    }
}
