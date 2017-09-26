package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SpecialEffect_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const MAX_LEVEL_LIMIT:int = 4;
        public static const NO_ENOUGH_XIAN_LING:int = 5;
        public static const NO_ENOUGH_XING_HUN:int = 6;
        public static const NO_ENOUGH_HMZQ:int = 7;
        public static const MAIN_ROLE_LEVEL_LIMIT:int = 8;
        public static const LIBRARY_LIMIT:int = 9;
        public static const SPECIAL_EFFECT_LIMIT:int = 10;
        public static const SPECIAL_EFFECT_ERROR:int = 11;
        public static const get_info:Object = {module:275, action:0, request:[], response:[[Utils.ByteUtil, Utils.ShortUtil], Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const upgrade:Object = {module:275, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const active:Object = {module:275, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "upgrade", "active"];

        public function Mod_SpecialEffect_Base()
        {
            return;
        }// end function

    }
}
