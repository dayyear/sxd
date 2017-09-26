package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUnionMagic_Base extends Object
    {
        public static const PLAYER:int = 0;
        public static const ROLE:int = 1;
        public static const ONE:int = 2;
        public static const TEN:int = 3;
        public static const SUCCESS:int = 4;
        public static const MAGIC_NO_EXISTS:int = 5;
        public static const NO_ENOUGH_DONATE_VALUE:int = 6;
        public static const LEVEL_LIMIT:int = 7;
        public static const MAGIC_NO_OPEN:int = 8;
        public static const ROLE_LEVEL_LIMIT:int = 9;
        public static const get_st_union_magic_list:Object = {module:183, action:0, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const upgrade:Object = {module:183, action:1, request:[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_st_union_magic_list", "upgrade"];

        public function Mod_StUnionMagic_Base()
        {
            return;
        }// end function

    }
}
