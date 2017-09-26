package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RefinePool_Base extends Object
    {
        public static const UNDO:int = 0;
        public static const DOING:int = 1;
        public static const DONE:int = 2;
        public static const LOCK:int = 3;
        public static const UNLOCK:int = 4;
        public static const COINS:int = 5;
        public static const INGOT:int = 6;
        public static const NORMAL:int = 7;
        public static const ONE_KEY:int = 8;
        public static const SUCCESS:int = 9;
        public static const LACK_OF_COINS:int = 10;
        public static const LACK_OF_INGOT:int = 11;
        public static const FAILED:int = 12;
        public static const open_panel:Object = {module:282, action:0, request:[], response:[[Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const refine:Object = {module:282, action:1, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.IntUtil]], Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const notify_refine_status_change:Object = {module:282, action:2, request:[], response:[[Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const close_panel:Object = {module:282, action:3, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["open_panel", "refine", "notify_refine_status_change", "close_panel"];

        public function Mod_RefinePool_Base()
        {
            return;
        }// end function

    }
}
