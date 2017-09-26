package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Furnace_Base extends Object
    {
        public static const NORMAL:int = 0;
        public static const INGOT:int = 1;
        public static const MAKE_SUCCESS:int = 2;
        public static const INVALID_ITEM:int = 3;
        public static const NOT_ENOUGH_ITEM:int = 4;
        public static const BAG_FULL:int = 5;
        public static const NOT_ENOUGH_COINS:int = 6;
        public static const NOT_ENOUGH_INGOT:int = 7;
        public static const NOT_ENOUGH_VIPLV:int = 8;
        public static const MRT_ITEM:int = 9;
        public static const MRT_STONE:int = 10;
        public static const MRT_SCRAP:int = 11;
        public static const CRIT:int = 12;
        public static const BIG_CRIT:int = 13;
        public static const SUBMIT_SUCCESS:int = 14;
        public static const INVALID_SUBMIT_ROLE:int = 15;
        public static const CANT_SUBMIT:int = 16;
        public static const NOT_ENOUGH_FAVOR_ITEM:int = 17;
        public static const BASE_ROLE_NEED_LEVELUP:int = 18;
        public static const LEVELUP_SUCCESS:int = 19;
        public static const INVALID_LEVELUP_ROLE:int = 20;
        public static const FAVOR_VALUE_NOT_ENOUGH:int = 21;
        public static const ALREADY_LEVELUP:int = 22;
        public static const AWARD_SUCCESS:int = 23;
        public static const AWARD_FAILED:int = 24;
        public static const player_role_info:Object = {module:54, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.IntUtil]]};
        public static const make_favor_item:Object = {module:54, action:1, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil], Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const submit_favor_item:Object = {module:54, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const role_level_up:Object = {module:54, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_level_up_award:Object = {module:54, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_player_favor_info:Object = {module:54, action:5, request:[Utils.IntUtil], response:[Utils.ByteUtil]};
        public static const Actions:Array = ["player_role_info", "make_favor_item", "submit_favor_item", "role_level_up", "get_level_up_award", "get_player_favor_info"];

        public function Mod_Furnace_Base()
        {
            return;
        }// end function

    }
}
