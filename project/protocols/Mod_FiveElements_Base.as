package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_FiveElements_Base extends Object
    {
        public static const ATTACK:int = 0;
        public static const ATTACK_REDUCE:int = 1;
        public static const HEALTH:int = 2;
        public static const DEFENSE:int = 3;
        public static const STUNT_ATTACK_REDUCE:int = 4;
        public static const STUNT_DEFENSE:int = 5;
        public static const MAGIC_DEFENSE:int = 6;
        public static const STUNT_ATTACK:int = 7;
        public static const FIRST_ATTACK:int = 8;
        public static const SUCCESS:int = 9;
        public static const NOT_EXIST:int = 10;
        public static const ALREADY_EQUIP:int = 11;
        public static const FAILED:int = 12;
        public static const NOT_ENOUGH_EQUIP:int = 13;
        public static const LEVEL_FULL:int = 14;
        public static const NOT_HAVE_SKILL:int = 15;
        public static const ALREADY_USED:int = 16;
        public static const YES:int = 17;
        public static const NO:int = 18;
        public static const NOT_ENOUGH_LEVEL:int = 19;
        public static const NOT_ENOUGH_STATE_POINT:int = 20;
        public static const NOT_ENOUGH_ZIQI:int = 21;
        public static const NOT_ENOUGH_SKILL:int = 22;
        public static const FULL:int = 23;
        public static const NOT_ENOUGH_LING:int = 24;
        public static const NOT_ENOUGH_ADDITION:int = 25;
        public static const get_pack_five_elements_equip_list:Object = {module:168, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const get_role_five_elements:Object = {module:168, action:1, request:[Utils.IntUtil, Utils.IntUtil], response:[[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const move_five_elements_equip:Object = {module:168, action:2, request:[Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil]], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const upgrade_five_elements_level:Object = {module:168, action:3, request:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const use_skill:Object = {module:168, action:4, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_player_skill_status:Object = {module:168, action:5, request:[], response:[[Utils.ByteUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.IntUtil]};
        public static const active_skill:Object = {module:168, action:6, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_player_role_five_elements_stone:Object = {module:168, action:7, request:[], response:[[Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil]]};
        public static const move_player_five_elements_stone:Object = {module:168, action:8, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const unlock_five_elements_stone:Object = {module:168, action:9, request:[], response:[Utils.UByteUtil]};
        public static const clean_up_pack:Object = {module:168, action:10, request:[], response:[Utils.UByteUtil]};
        public static const get_attritube_addition_id_list:Object = {module:168, action:11, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.UByteUtil]]};
        public static const active_attritube_addition:Object = {module:168, action:12, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const upgrade_five_elements_level_ten:Object = {module:168, action:13, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const Actions:Array = ["get_pack_five_elements_equip_list", "get_role_five_elements", "move_five_elements_equip", "upgrade_five_elements_level", "use_skill", "get_player_skill_status", "active_skill", "get_player_role_five_elements_stone", "move_player_five_elements_stone", "unlock_five_elements_stone", "clean_up_pack", "get_attritube_addition_id_list", "active_attritube_addition", "upgrade_five_elements_level_ten"];

        public function Mod_FiveElements_Base()
        {
            return;
        }// end function

    }
}
