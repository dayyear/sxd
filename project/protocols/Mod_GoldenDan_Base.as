package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_GoldenDan_Base extends Object
    {
        public static const UPDATE_SUCCESS:int = 0;
        public static const UPDATE_FAILED:int = 1;
        public static const NOT_ENOUGH_NE_DAN:int = 2;
        public static const PLAYER_ID_ERROR:int = 3;
        public static const MAX_LEVEL:int = 4;
        public static const FAILED:int = 5;
        public static const SUCCESS:int = 6;
        public static const ALREADY_EQUIP:int = 7;
        public static const NOT_GOD_ROLE:int = 8;
        public static const NO_EQUIP:int = 9;
        public static const FULL:int = 10;
        public static const NOT_ENOUGH_LEVEL:int = 11;
        public static const NOT_ENOUGH_INGOT:int = 12;
        public static const get_player_golden_dan_list:Object = {module:139, action:0, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_player_golden_dan:Object = {module:139, action:1, request:[Utils.IntUtil], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const update_golden_dan:Object = {module:139, action:2, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const get_player_role_3_way:Object = {module:139, action:3, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const equip_golden_dan:Object = {module:139, action:4, request:[Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const unequip_golden_dan:Object = {module:139, action:5, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const unlock_golden_dan:Object = {module:139, action:6, request:[], response:[Utils.UByteUtil]};
        public static const buy_ne_dan:Object = {module:139, action:7, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const notify_golden_dan:Object = {module:139, action:8, request:[], response:[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil]};
        public static const Actions:Array = ["get_player_golden_dan_list", "get_player_golden_dan", "update_golden_dan", "get_player_role_3_way", "equip_golden_dan", "unequip_golden_dan", "unlock_golden_dan", "buy_ne_dan", "notify_golden_dan"];

        public function Mod_GoldenDan_Base()
        {
            return;
        }// end function

    }
}
