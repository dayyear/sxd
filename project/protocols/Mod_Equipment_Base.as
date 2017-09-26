package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Equipment_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const DEPLOY:int = 2;
        public static const NODEPLOY:int = 3;
        public static const REPLACE:int = 4;
        public static const SUCCESS:int = 5;
        public static const NOT_ENOUGH_STUFF:int = 6;
        public static const PLAYER_ROLE_NOT_EXIST:int = 7;
        public static const HAVE_NOT_PASS:int = 8;
        public static const NOT_ENOUGH_FAME:int = 9;
        public static const NORMAL:int = 10;
        public static const INGOT:int = 11;
        public static const NOT_ENOUGH_INGOT:int = 12;
        public static const NOT_ENOUGH_PLAYER_LEVEL:int = 13;
        public static const MAX_LEVEL:int = 14;
        public static const NOT_ENOUGH_VIP_LEVEL:int = 15;
        public static const NOT_ENOUGH_NORMAL_COUNT:int = 16;
        public static const NOT_ENOUGH_INGOT_COUNT:int = 17;
        public static const TRANS_TO:int = 18;
        public static const FROM_TRANS:int = 19;
        public static const NOT_ENOUGH_COIN:int = 20;
        public static const NOT_ENOUGH_ITEM:int = 21;
        public static const EXCL_ARTI_LV_LIMIT:int = 22;
        public static const HAVE_INHERIT:int = 23;
        public static const HAVE_BE_INHERIT:int = 24;
        public static const INHERIT_SELF:int = 25;
        public static const TRUE:int = 26;
        public static const FALSE:int = 27;
        public static const ACTION_SUCCESS:int = 28;
        public static const PLAYER_ITEM_NO_EXIST:int = 29;
        public static const PLAYER_INSURRICIENT_LEVEL:int = 30;
        public static const INSUFFICIENT_GEMS:int = 31;
        public static const WRONG_GEM_TYPE:int = 32;
        public static const LEVEL_LIMIT:int = 33;
        public static const INSUFFICIENT_COINS:int = 34;
        public static const UNABLE_UPGRADE_WITH_GEMS:int = 35;
        public static const NO_ENOUGH_MATERIALS:int = 36;
        public static const LEVEL_2_FUNCTION_NO_OPEN:int = 37;
        public static const EQUIP_COUNT_NO_SATISFIED:int = 38;
        public static const COIN_REPLACE_TIMES_USED_UP:int = 39;
        public static const NEED_PASS_ZODIAC:int = 40;
        public static const NEED_PASS_CIRCLE_WAR:int = 41;
        public static const NEED_GOD_OIL:int = 42;
        public static const NOT_ENOUGH_SOUL_STONE:int = 43;
        public static const NOT_ENOUGH_ITEM_LEVEL:int = 44;
        public static const NOT_ENOUGH_STATE_POINT:int = 45;
        public static const PACK_FULL:int = 46;
        public static const JULING_FUN_NO_OPEN:int = 47;
        public static const FIVE_ELEMENTS_FUN_NOT_OPEN:int = 48;
        public static const NO_EXISTS:int = 49;
        public static const RESOURCE_LOCK:int = 50;
        public static const NOT_ENOUGH_FIVE_ELEMENTS_PACK:int = 51;
        public static const HAS_INSERT:int = 52;
        public static const NO_ENOUGH_ZODIAC_STONE:int = 53;
        public static const NO_ENOUGH_GOLD_OIL_STAR:int = 54;
        public static const NO_ENOUGH_ZODIAC_LEVEL:int = 55;
        public static const HAS_GOLD_OIL_OPEN_LIGHT:int = 56;
        public static const NO_ENOUGH_INSERT:int = 57;
        public static const NO_ENOUGH_COIN:int = 58;
        public static const NO_ENOUGH_STATE_POINT:int = 59;
        public static const NOT_ENOUGH_LEVEL:int = 60;
        public static const PERCENT_LIMIT:int = 61;
        public static const NO_ACTIVITY:int = 62;
        public static const get_player_role_exclusive_artifact_info:Object = {module:77, action:0, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const make_exclusive_artifact:Object = {module:77, action:1, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const upgrade_level:Object = {module:77, action:2, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const upgrade_stage:Object = {module:77, action:3, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil]};
        public static const player_role_excl_arti_inherit_list:Object = {module:77, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const inherit_excl_arti:Object = {module:77, action:5, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_all_cost_data:Object = {module:77, action:6, request:[], response:[[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil]]]};
        public static const upgrade_equip:Object = {module:77, action:7, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const god_equip_upgrade_level:Object = {module:77, action:10, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const exchange_soul_stone:Object = {module:77, action:11, request:[], response:[Utils.UByteUtil]};
        public static const get_level_2_upgrade_resource_list:Object = {module:77, action:12, request:[], response:[[Utils.IntUtil, Utils.ShortUtil], Utils.ByteUtil]};
        public static const get_unlock_resource_list:Object = {module:77, action:13, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]};
        public static const exchange_resource:Object = {module:77, action:14, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil]};
        public static const get_equipment_gold_oil_open_light_info:Object = {module:77, action:20, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil], Utils.UByteUtil]};
        public static const equipment_insert_zodiac_stone:Object = {module:77, action:21, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const equipment_auto_insert_zodiac_stone:Object = {module:77, action:22, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil]]};
        public static const equipment_gold_oil_open_light:Object = {module:77, action:23, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const god_equip_add_soul:Object = {module:77, action:24, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const god_equip_reset_soul:Object = {module:77, action:25, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_player_role_exclusive_artifact_info", "make_exclusive_artifact", "upgrade_level", "upgrade_stage", "player_role_excl_arti_inherit_list", "inherit_excl_arti", "get_all_cost_data", "upgrade_equip", "god_equip_upgrade_level", "exchange_soul_stone", "get_level_2_upgrade_resource_list", "get_unlock_resource_list", "exchange_resource", "get_equipment_gold_oil_open_light_info", "equipment_insert_zodiac_stone", "equipment_auto_insert_zodiac_stone", "equipment_gold_oil_open_light", "god_equip_add_soul", "god_equip_reset_soul"];

        public function Mod_Equipment_Base()
        {
            return;
        }// end function

    }
}
