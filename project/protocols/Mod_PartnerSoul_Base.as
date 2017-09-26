package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_PartnerSoul_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const MISSION_LIMIT:int = 1;
        public static const NOT_ENOUGH_ZIQI:int = 2;
        public static const FAILURE:int = 3;
        public static const IN_DEPLOY:int = 4;
        public static const HAD_CHOICE:int = 5;
        public static const NOT_PLAYER_FU_SHI:int = 6;
        public static const GRID_ERROR:int = 7;
        public static const GRID_LOCK:int = 8;
        public static const INCONSISTENR_CONDITION:int = 9;
        public static const NOT_ENOUGH_INGOT:int = 10;
        public static const LEVEL_LIMIT:int = 11;
        public static const NOT_SAME_TYPE:int = 12;
        public static const ALL:int = 13;
        public static const EXP:int = 14;
        public static const BLUE:int = 15;
        public static const PURPLE:int = 16;
        public static const GOLD:int = 17;
        public static const IN_PARTNER_SOUL:int = 18;
        public static const OUT_PARTNER_SOUL:int = 19;
        public static const get_fight_turntable_info:Object = {module:322, action:0, request:[], response:[Utils.IntUtil, [Utils.IntUtil], Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const unlock:Object = {module:322, action:1, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_partner_list:Object = {module:322, action:2, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const choose_partner:Object = {module:322, action:3, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_package_info:Object = {module:322, action:4, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const move:Object = {module:322, action:5, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_unlock_fu_shi_info:Object = {module:322, action:6, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const unlock_fu_shi:Object = {module:322, action:7, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const onekey_merge:Object = {module:322, action:8, request:[Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const sort:Object = {module:322, action:9, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_partner_status:Object = {module:322, action:10, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const unlock_fu_shi_skill_grid:Object = {module:322, action:11, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_fight_turntable_info", "unlock", "get_partner_list", "choose_partner", "get_package_info", "move", "get_unlock_fu_shi_info", "unlock_fu_shi", "onekey_merge", "sort", "get_partner_status", "unlock_fu_shi_skill_grid"];

        public function Mod_PartnerSoul_Base()
        {
            return;
        }// end function

    }
}
