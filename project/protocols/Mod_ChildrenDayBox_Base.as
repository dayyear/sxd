package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChildrenDayBox_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const ERROR:int = 1;
        public static const ACTIVE_END:int = 2;
        public static const NOT_ENOUGTH_INGOT:int = 3;
        public static const ITEM_PCAK_FULL:int = 4;
        public static const NOT_ENOUGTH_GOLD_COIN:int = 5;
        public static const get_info:Object = {module:358, action:0, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.ByteUtil]};
        public static const refresh:Object = {module:358, action:1, request:[], response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const search:Object = {module:358, action:2, request:[], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const get_luck_value_award:Object = {module:358, action:3, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const get_extra_award:Object = {module:358, action:4, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_info", "refresh", "search", "get_luck_value_award", "get_extra_award"];

        public function Mod_ChildrenDayBox_Base()
        {
            return;
        }// end function

    }
}
