package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChristmasSock_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_OPEN:int = 1;
        public static const NO_RECEIVE:int = 2;
        public static const IS_HANG:int = 3;
        public static const NO_ENOUGTH_INGOT:int = 4;
        public static const NO_ENOUGTH_COIN:int = 5;
        public static const ERROR:int = 6;
        public static const ITEM_PACK_FULL:int = 7;
        public static const activity_info:Object = {module:208, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil]]};
        public static const hang_sock:Object = {module:208, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const receive_award:Object = {module:208, action:2, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_refurbish:Object = {module:208, action:3, request:[], response:[Utils.ByteUtil]};
        public static const Actions:Array = ["activity_info", "hang_sock", "receive_award", "notify_refurbish"];

        public function Mod_ChristmasSock_Base()
        {
            return;
        }// end function

    }
}
