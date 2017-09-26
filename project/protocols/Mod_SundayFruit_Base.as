package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SundayFruit_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const TIME_USE:int = 3;
        public static const PACK_FULL:int = 4;
        public static const FATE_PACK_FULL:int = 5;
        public static const FIVE_ELEMENTS_PACK_FULL:int = 6;
        public static const ACTIVE_NOT_OPEN:int = 7;
        public static const ERROR:int = 8;
        public static const active_status:Object = {module:242, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const sunday_fruit_info:Object = {module:242, action:1, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const draw:Object = {module:242, action:2, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["active_status", "sunday_fruit_info", "draw"];

        public function Mod_SundayFruit_Base()
        {
            return;
        }// end function

    }
}
