package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_JobStrengthen_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_PLAYER_RUNE:int = 1;
        public static const FUNCTION_NO_OPEN:int = 2;
        public static const FAILURE:int = 3;
        public static const NO_ENOUGH_PROP:int = 4;
        public static const LEVEL_LIMIT:int = 5;
        public static const NEED_ONE:int = 6;
        public static const NEED_TWO:int = 7;
        public static const NEED_THREE:int = 8;
        public static const get_prop_num:Object = {module:368, action:0, request:[], response:[Utils.IntUtil]};
        public static const get_rune_list:Object = {module:368, action:1, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const equip:Object = {module:368, action:2, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const upgrade:Object = {module:368, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_prop_num", "get_rune_list", "equip", "upgrade"];

        public function Mod_JobStrengthen_Base()
        {
            return;
        }// end function

    }
}
