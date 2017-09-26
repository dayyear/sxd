package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_MagicWeapon_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NO_ENOUGH_FU:int = 1;
        public static const FUNCTION_NO_OPEN:int = 2;
        public static const LEVEL_LIMIT:int = 3;
        public static const MAX_LEVEL_LIMIT:int = 4;
        public static const NOT_PLAYER_YU_BAO:int = 5;
        public static const FAILURE:int = 6;
        public static const NOT_PLAYER_ROLE:int = 7;
        public static const HAD_EQUIP:int = 8;
        public static const NOT_PLAYER_MAGIC_WEAPON:int = 9;
        public static const NO_ENOUGH_LEVEL:int = 10;
        public static const NO_ENOUGH_FLOOR:int = 11;
        public static const NO_ENOUGH_MO_FU:int = 12;
        public static const MAX_LIMIT:int = 13;
        public static const SEQ_ERROR:int = 14;
        public static const LIMIT:int = 15;
        public static const NOT_ENOUGH_COIN:int = 16;
        public static const NOT_ENOUGH_JINGHUA:int = 17;
        public static const NOT_ENOUGH_INGOT:int = 18;
        public static const get_magic_weapon_info:Object = {module:273, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_magic_weapon_picture:Object = {module:273, action:1, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const upgrade:Object = {module:273, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const one_key_upgrade:Object = {module:273, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const equip_yu_bao:Object = {module:273, action:5, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const unequip_yu_bao:Object = {module:273, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const equip_magic_weapon:Object = {module:273, action:7, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const unlock_yu_bao:Object = {module:273, action:8, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const add_magic:Object = {module:273, action:9, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const refresh_magic:Object = {module:273, action:10, request:[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const get_combine_info:Object = {module:273, action:11, request:[], response:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const unlock:Object = {module:273, action:12, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const activate:Object = {module:273, action:13, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const upgrade_stone:Object = {module:273, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const break_stone:Object = {module:273, action:15, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const remove_stone:Object = {module:273, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_combine_stone_list:Object = {module:273, action:17, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const get_un_combine_weapon_list:Object = {module:273, action:18, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]};
        public static const Actions:Array = ["get_magic_weapon_info", "get_magic_weapon_picture", "upgrade", "one_key_upgrade", "equip_yu_bao", "unequip_yu_bao", "equip_magic_weapon", "unlock_yu_bao", "add_magic", "refresh_magic", "get_combine_info", "unlock", "activate", "upgrade_stone", "break_stone", "remove_stone", "get_combine_stone_list", "get_un_combine_weapon_list"];

        public function Mod_MagicWeapon_Base()
        {
            return;
        }// end function

    }
}
