package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SixthAnniversaryCake_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const HAD_EAT:int = 1;
        public static const NOT_ENOUGH_NUM:int = 2;
        public static const NON_ACTIVITY_TIME:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const ITEM_PACK_FULL:int = 5;
        public static const FAILURE:int = 6;
        public static const get_sixth_anniversary_cake_info:Object = {module:350, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const eat_cake:Object = {module:350, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["get_sixth_anniversary_cake_info", "eat_cake"];

        public function Mod_SixthAnniversaryCake_Base()
        {
            return;
        }// end function

    }
}
