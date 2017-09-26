package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ConsumeTalent_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const CLOSE:int = 1;
        public static const CAN_NOT_GET:int = 2;
        public static const UNGET:int = 3;
        public static const ALREADY_GET:int = 4;
        public static const SUCCESS:int = 5;
        public static const PACK_FULL:int = 6;
        public static const FAILED:int = 7;
        public static const HAVE_TITTLE:int = 8;
        public static const NOT_HAVE_TITTLE:int = 9;
        public static const get_activity_info:Object = {module:274, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const open_panel:Object = {module:274, action:1, request:[], response:[[Utils.ShortUtil, Utils.UByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_award:Object = {module:274, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_info", "open_panel", "get_award"];

        public function Mod_ConsumeTalent_Base()
        {
            return;
        }// end function

    }
}
