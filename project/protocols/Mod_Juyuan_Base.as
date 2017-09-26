package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Juyuan_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const REPLACE:int = 2;
        public static const SUCCESS:int = 3;
        public static const ID_ERROR:int = 4;
        public static const SPIRIT_LIMIT:int = 5;
        public static const NO_ENOUGH_SPIRIT:int = 6;
        public static const FUNCTION_NO_OPEN:int = 7;
        public static const EQUIPED:int = 8;
        public static const MAIN_ROLE_LIMIT:int = 9;
        public static const get_info:Object = {module:247, action:0, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil], [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const merge_spirit:Object = {module:247, action:1, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const equip:Object = {module:247, action:2, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const show:Object = {module:247, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "merge_spirit", "equip", "show"];

        public function Mod_Juyuan_Base()
        {
            return;
        }// end function

    }
}
