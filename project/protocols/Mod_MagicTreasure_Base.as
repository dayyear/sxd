package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MagicTreasure_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const SUCCESS:int = 2;
        public static const NO_ENOUGH_INGOT:int = 3;
        public static const FUNCTION_NO_OPEN:int = 4;
        public static const ACTIVITY_CLOSE:int = 5;
        public static const PACKAGE_FULL:int = 6;
        public static const TIME_USED_UP:int = 7;
        public static const NO_EXCHANGE:int = 8;
        public static const NO_ENOUGH_SCORE:int = 9;
        public static const EXCHANGE_LIMIT:int = 10;
        public static const NEED_DRAW_TIMES:int = 11;
        public static const get_info:Object = {module:239, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const draw:Object = {module:239, action:1, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const exchange:Object = {module:239, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const use_draw_times_exchange:Object = {module:239, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_info", "draw", "exchange", "use_draw_times_exchange"];

        public function Mod_MagicTreasure_Base()
        {
            return;
        }// end function

    }
}
