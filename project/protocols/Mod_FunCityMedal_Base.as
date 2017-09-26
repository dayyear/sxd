package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FunCityMedal_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const HAD_GET:int = 1;
        public static const CITY_NOT_OPEN:int = 2;
        public static const NOT_IN_ACTIVITY:int = 3;
        public static const FAILURE:int = 4;
        public static const get_medal_info:Object = {module:288, action:0, request:[], response:[[Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const get_medal:Object = {module:288, action:1, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_medal_info", "get_medal"];

        public function Mod_FunCityMedal_Base()
        {
            return;
        }// end function

    }
}
