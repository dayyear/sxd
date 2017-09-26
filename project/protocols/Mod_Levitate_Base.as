package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Levitate_Base extends Object
    {
        public static const MAINROLE:int = 0;
        public static const ROLE:int = 1;
        public static const SUCCESS:int = 2;
        public static const USED_UP:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const FULL:int = 5;
        public static const STEP_LEVITATE_LIMIT:int = 6;
        public static const NO_ENOUGH_MATERIAL:int = 7;
        public static const LEVITATE_LIMIT:int = 8;
        public static const NO_ENOUGH_LING_ZHI:int = 9;
        public static const LIMIT:int = 10;
        public static const AVALIABLE_LING_ZHI:int = 11;
        public static const MAX_STEP_LIMIT:int = 12;
        public static const STEP_LIMIT:int = 13;
        public static const get_levitate_info:Object = {module:357, action:0, request:[Utils.UByteUtil], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.LongUtil, Utils.LongUtil], [Utils.ShortUtil, Utils.ShortUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const perfusion:Object = {module:357, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const levitate:Object = {module:357, action:2, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const use_ling_zhi:Object = {module:357, action:3, request:[Utils.UByteUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const upgrade_step:Object = {module:357, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_levitate_info", "perfusion", "levitate", "use_ling_zhi", "upgrade_step"];

        public function Mod_Levitate_Base()
        {
            return;
        }// end function

    }
}
