package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_QingmingBurning_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const FUNCTION_NO_OPEN:int = 1;
        public static const ACTIVE_CLOSE:int = 2;
        public static const TIMES_USED_UP:int = 3;
        public static const NOT_ENOUGH_INGOT:int = 4;
        public static const NOT_ENOUGH_COINS:int = 5;
        public static const get_info:Object = {module:276, action:0, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const burning:Object = {module:276, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "burning"];

        public function Mod_QingmingBurning_Base()
        {
            return;
        }// end function

    }
}
