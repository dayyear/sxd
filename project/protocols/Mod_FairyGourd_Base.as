package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FairyGourd_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const TIME_ERROR:int = 1;
        public static const NO_GRID:int = 2;
        public static const ALREADY_GET:int = 3;
        public static const FAILURE:int = 4;
        public static const get_date:Object = {module:220, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_fairy_gourd_list:Object = {module:220, action:1, request:[], response:[[Utils.LongUtil, Utils.LongUtil, Utils.IntUtil]]};
        public static const get_fairy_gourd:Object = {module:220, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_date", "get_fairy_gourd_list", "get_fairy_gourd"];

        public function Mod_FairyGourd_Base()
        {
            return;
        }// end function

    }
}
