package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Sigil_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_ENOUGH_MATERIAL:int = 3;
        public static const HAVE_ACTIVATE:int = 4;
        public static const NOT_ENOUGH_PLAYER_LEVEL:int = 5;
        public static const NOT_ENOUGH_XIU_WEI:int = 6;
        public static const PACK_FULL:int = 7;
        public static const NOT_PASS_MISSION:int = 8;
        public static const player_sigil_info:Object = {module:72, action:0, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil]]};
        public static const upgrade:Object = {module:72, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const select_sigil_stunt:Object = {module:72, action:2, request:[Utils.ByteUtil], response:[Utils.ByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_cur_use_sigil_stunt:Object = {module:72, action:3, request:[], response:[Utils.ByteUtil]};
        public static const exchang_fushi:Object = {module:72, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const show_fushi:Object = {module:72, action:5, request:[], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["player_sigil_info", "upgrade", "select_sigil_stunt", "get_cur_use_sigil_stunt", "exchang_fushi", "show_fushi"];

        public function Mod_Sigil_Base()
        {
            return;
        }// end function

    }
}
