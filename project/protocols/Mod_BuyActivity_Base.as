package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_BuyActivity_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const ROLL_CAKE:int = 2;
        public static const FIND_IMMORTAL:int = 3;
        public static const SUCCESS:int = 4;
        public static const NOT_ENOUGH_INGOT:int = 5;
        public static const FAILED:int = 6;
        public static const is_activity_time:Object = {module:81, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_activity_info:Object = {module:81, action:2, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const buy_number:Object = {module:81, action:3, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["is_activity_time", "get_activity_info", "buy_number"];

        public function Mod_BuyActivity_Base()
        {
            return;
        }// end function

    }
}
