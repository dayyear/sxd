package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Rulai_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const NOT_ENOUGH_SKILL:int = 3;
        public static const NOT_ENOUGH_INGOT:int = 4;
        public static const NOT_ENOUGH_VIP:int = 5;
        public static const INCENSE_TYPE_NOT_EXIST:int = 6;
        public static const INCENSE_COUNT_USED:int = 7;
        public static const get_rulai_info:Object = {module:80, action:0, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const player_rulai_incense:Object = {module:80, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const incense_full_notify:Object = {module:80, action:2, request:[], response:[Utils.IntUtil]};
        public static const get_player_incense_type:Object = {module:80, action:3, request:[], response:[Utils.ByteUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_rulai_info", "player_rulai_incense", "incense_full_notify", "get_player_incense_type"];

        public function Mod_Rulai_Base()
        {
            return;
        }// end function

    }
}
