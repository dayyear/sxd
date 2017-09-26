package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Rune_Base extends Object
    {
        public static const SUCCEED:int = 0;
        public static const FAILED:int = 1;
        public static const NOENOUGHINGOT:int = 2;
        public static const YES:int = 3;
        public static const NO:int = 4;
        public static const rune_list:Object = {module:16, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const rune_use:Object = {module:16, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const batch_rune_list:Object = {module:16, action:3, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const batch_rune_use:Object = {module:16, action:4, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const auto_rune_info:Object = {module:16, action:5, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const set_auto_rune:Object = {module:16, action:6, request:[Utils.UByteUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const rune_use_notify:Object = {module:16, action:7, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["rune_list", "rune_use", "batch_rune_list", "batch_rune_use", "auto_rune_info", "set_auto_rune", "rune_use_notify"];

        public function Mod_Rune_Base()
        {
            return;
        }// end function

    }
}
