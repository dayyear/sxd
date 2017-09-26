package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_RedEnvelopes_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const TIME_ERROR:int = 1;
        public static const NO_GRID:int = 2;
        public static const ALREADY_GET:int = 3;
        public static const FAILURE:int = 4;
        public static const get_envelopes_info:Object = {module:43, action:0, request:[], response:[[Utils.LongUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_envelope:Object = {module:43, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_date:Object = {module:43, action:2, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_envelopes_info", "get_envelope", "get_date"];

        public function Mod_RedEnvelopes_Base()
        {
            return;
        }// end function

    }
}
