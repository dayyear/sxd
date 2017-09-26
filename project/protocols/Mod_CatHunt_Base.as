package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_CatHunt_Base extends Object
    {
        public static const BOX_NONE:int = 0;
        public static const BOX_BLUE:int = 1;
        public static const BOX_PURPLE:int = 2;
        public static const BOX_GOLDEN:int = 3;
        public static const BT_NONE:int = 4;
        public static const BT_VIGOUR:int = 5;
        public static const BT_REPUTATION:int = 6;
        public static const BT_EXPERIENCE:int = 7;
        public static const BT_COIN:int = 8;
        public static const BT_KARMA:int = 9;
        public static const BT_REACHED:int = 10;
        public static const MT_NORMAL:int = 11;
        public static const MT_ADVANCED:int = 12;
        public static const USE_SUCCESS:int = 13;
        public static const USE_FAILED:int = 14;
        public static const NO_REASON:int = 15;
        public static const NOT_ENOUGH_COIN:int = 16;
        public static const NOT_ENOUGH_INGOT:int = 17;
        public static const NOT_ENOUGH_VIPLEVEL:int = 18;
        public static const NOT_ENOUGH_TIMES:int = 19;
        public static const OTHER_REASON:int = 20;
        public static const auto_search_bonus:Object = {module:51, action:0, request:[], response:[Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil]]]};
        public static const use_map_search:Object = {module:51, action:1, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil]]};
        public static const Actions:Array = ["auto_search_bonus", "use_map_search"];

        public function Mod_CatHunt_Base()
        {
            return;
        }// end function

    }
}
