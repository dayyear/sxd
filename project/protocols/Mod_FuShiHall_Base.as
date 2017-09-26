package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FuShiHall_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGH_INGOT:int = 1;
        public static const NOT_ENOUGH_COIN:int = 2;
        public static const NOT_ENOUGH_BLESS_TIMES:int = 3;
        public static const FAILURE:int = 4;
        public static const NOT_ENOUGH_REFRESH_TIMES:int = 5;
        public static const get_hall_info:Object = {module:323, action:0, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const bless:Object = {module:323, action:1, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const refresh:Object = {module:323, action:2, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const get_award:Object = {module:323, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_hall_info", "bless", "refresh", "get_award"];

        public function Mod_FuShiHall_Base()
        {
            return;
        }// end function

    }
}
