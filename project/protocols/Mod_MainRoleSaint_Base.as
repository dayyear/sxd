package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MainRoleSaint_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const SAINTED:int = 4;
        public static const CONDITION_NO_SATISFIED:int = 5;
        public static const NO_ENOUGH_COINS:int = 6;
        public static const NOT_ENOUGH_SAGE_STONE:int = 7;
        public static const get_info:Object = {module:262, action:0, request:[], response:[[Utils.ByteUtil, Utils.LongUtil], Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil]};
        public static const saint:Object = {module:262, action:1, request:[], response:[Utils.UByteUtil]};
        public static const get_saint_flag:Object = {module:262, action:2, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "saint", "get_saint_flag"];

        public function Mod_MainRoleSaint_Base()
        {
            return;
        }// end function

    }
}
