package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SantWeapon_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGH_TIE:int = 1;
        public static const NOT_ENOUGH_HUA:int = 2;
        public static const PART_LOCK:int = 3;
        public static const PLAYER_ROLE_LIMIT:int = 4;
        public static const FAILURE:int = 5;
        public static const MAX_LEVEL_LIMIT:int = 6;
        public static const PLAYER_SANT_WEAPON_NOT_EXIST:int = 7;
        public static const PLAYER_ROLE_NOT_EXIST:int = 8;
        public static const GRID_ID_NOT_EXIST:int = 9;
        public static const SANT_WEAPON_PACK_FULL:int = 10;
        public static const NOT_SUITE_TYPE:int = 11;
        public static const NOT_SUITE_ROLE_JOB:int = 12;
        public static const HAD_EQUIP:int = 13;
        public static const NOT_LUCKY_DAY:int = 14;
        public static const NOT_ENOUGH_INGOT:int = 15;
        public static const TIMES_LIMIT:int = 16;
        public static const get_sant_weapon_info:Object = {module:280, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const make_sant_weapon:Object = {module:280, action:1, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const upgrade_sant_weapon:Object = {module:280, action:2, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const equip_sant_weapon:Object = {module:280, action:3, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_lucky_day_info:Object = {module:280, action:4, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const add_star:Object = {module:280, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_sant_weapon_info", "make_sant_weapon", "upgrade_sant_weapon", "equip_sant_weapon", "get_lucky_day_info", "add_star"];

        public function Mod_SantWeapon_Base()
        {
            return;
        }// end function

    }
}
