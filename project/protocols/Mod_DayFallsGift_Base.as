package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_DayFallsGift_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const PACK_FULL:int = 2;
        public static const day_falls_info:Object = {module:248, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_gift:Object = {module:248, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_status:Object = {module:248, action:2, request:[], response:[Utils.ByteUtil]};
        public static const Actions:Array = ["day_falls_info", "get_gift", "notify_status"];

        public function Mod_DayFallsGift_Base()
        {
            return;
        }// end function

    }
}
