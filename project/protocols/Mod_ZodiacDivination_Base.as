package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ZodiacDivination_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const TODAY_TIMES_HAVE_USED:int = 2;
        public static const NOT_ENOUGTH_INGOT:int = 3;
        public static const HAVE_AWARD:int = 4;
        public static const OVER_TIME:int = 5;
        public static const get_zodiac_divination_info:Object = {module:252, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil]]};
        public static const divination:Object = {module:252, action:1, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const get_award:Object = {module:252, action:2, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_lottery_results:Object = {module:252, action:3, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_zodiac_divination_info", "divination", "get_award", "notify_lottery_results"];

        public function Mod_ZodiacDivination_Base()
        {
            return;
        }// end function

    }
}
