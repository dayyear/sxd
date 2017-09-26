package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RechargeOpenBox_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const HAS_GET:int = 2;
        public static const NOT_GET:int = 3;
        public static const CAN_GET:int = 4;
        public static const CAN_NOT_GET:int = 5;
        public static const SUCCESS:int = 6;
        public static const NOT_IN_ACTIVITY:int = 7;
        public static const LACK_OF_TIMES:int = 8;
        public static const PACK_FULL:int = 9;
        public static const FATE_PACK_FULL:int = 10;
        public static const DRAGONBALL_PACK_FULL:int = 11;
        public static const JEWEL_PACK_FULL:int = 12;
        public static const FAILED:int = 13;
        public static const YES:int = 14;
        public static const NO:int = 15;
        public static const get_info:Object = {module:301, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const open_panel:Object = {module:301, action:1, request:[], response:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], [Utils.ByteUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil]};
        public static const open_box:Object = {module:301, action:2, request:[Utils.ByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], [Utils.ByteUtil], [Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const get_extra_award:Object = {module:301, action:3, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil]};
        public static const notify_refresh_server_charge:Object = {module:301, action:4, request:[], response:[Utils.IntUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_info", "open_panel", "open_box", "get_extra_award", "notify_refresh_server_charge"];

        public function Mod_RechargeOpenBox_Base()
        {
            return;
        }// end function

    }
}
