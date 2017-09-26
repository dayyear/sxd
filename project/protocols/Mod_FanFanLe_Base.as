package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FanFanLe_Base extends Object
    {
        public static const AWARD_1:int = 0;
        public static const AWARD_2:int = 1;
        public static const NO_AWARD:int = 2;
        public static const SUCCESS:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const ACTIVITY_CLOSE:int = 5;
        public static const TIMES_USED_UP:int = 6;
        public static const NEED_GET_AWARD:int = 7;
        public static const PACKAGE_FULL:int = 8;
        public static const FLOPPED:int = 9;
        public static const FATE_PACKAGE_FULL:int = 10;
        public static const UNGETTABLE:int = 11;
        public static const get_info:Object = {module:241, action:0, request:[], response:[Utils.ByteUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil]};
        public static const flop:Object = {module:241, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const get_extra_award:Object = {module:241, action:2, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_info", "flop", "get_extra_award"];

        public function Mod_FanFanLe_Base()
        {
            return;
        }// end function

    }
}
