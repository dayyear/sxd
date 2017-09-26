package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Dragonball_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const PACKAGE_FULL:int = 1;
        public static const INVALID_DRAGONBALL:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const NORMAL:int = 4;
        public static const HIGH_LEVEL:int = 5;
        public static const AUTO:int = 6;
        public static const NOT_AUTO:int = 7;
        public static const TMP_GRID_FULL:int = 8;
        public static const TMP_GRID_NOT_ENOUGH:int = 9;
        public static const NO_ENOUGH_COIN:int = 10;
        public static const NO_ENOUGH_INGOT:int = 11;
        public static const TIMES_USE_UP:int = 12;
        public static const NOT_ENOUGH_LEVEL:int = 13;
        public static const PLAY:int = 14;
        public static const NOT_PLAY:int = 15;
        public static const FROM_LOCATION:int = 16;
        public static const TO_LOCATION:int = 17;
        public static const MAX_LEVEL_LIMIT:int = 18;
        public static const EQUIP_SAME_TYPE_DRAGONBALL:int = 19;
        public static const LOCK:int = 20;
        public static const SAME_DRAGONBALL:int = 21;
        public static const INVALID_GRID:int = 22;
        public static const NOT_EMPTY_GRID:int = 23;
        public static const DRAGONBALL_ERROR:int = 24;
        public static const EQUIP_GRID_NO_AVALIABLE:int = 25;
        public static const DRAGONBALL_CAN_NOT_EQUIP:int = 26;
        public static const FAILURE:int = 27;
        public static const DRAGONBALL_NO_EXIST:int = 28;
        public static const TRUE:int = 29;
        public static const FALSE:int = 30;
        public static const NOT_ENOUGH_DRAGONBALL_SCRAP:int = 31;
        public static const PACKAGE_GRID_NOT_ENOUGH:int = 32;
        public static const FAILED:int = 33;
        public static const LEVEL_6_LOCK:int = 34;
        public static const EXP_LEVEL_LIMIT:int = 35;
        public static const NO_ENOUGH_SOUL:int = 36;
        public static const TOO_MUCK_SOUL:int = 37;
        public static const ACTIVITY_OPEN:int = 38;
        public static const ACTIVITY_CLOSE:int = 39;
        public static const YES:int = 40;
        public static const NO:int = 41;
        public static const NOT_ENOUGH_GOLD_DRAGONBALL_SCRAP:int = 42;
        public static const EQUIP_GRID_COUNT_LIMIT:int = 43;
        public static const LONGZHUSUIPIAN_NOT_ENOUGH:int = 44;
        public static const SHENLONGSUIPIAN_NOT_ENOUGH:int = 45;
        public static const INGOT_NOT_ENOUGH:int = 46;
        public static const get_tmp_dragonball_basic_info:Object = {module:111, action:0, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil]]};
        public static const collect_dragonball:Object = {module:111, action:1, request:[[Utils.IntUtil]], response:[Utils.UByteUtil, [Utils.IntUtil]]};
        public static const sacrifice:Object = {module:111, action:2, request:[Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.UByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_dragonball_list:Object = {module:111, action:3, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const merge:Object = {module:111, action:4, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const move:Object = {module:111, action:5, request:[Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const one_key_merge:Object = {module:111, action:6, request:[], response:[Utils.UByteUtil, [Utils.IntUtil]]};
        public static const sell_dragonball:Object = {module:111, action:7, request:[[Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const is_dragonball_open:Object = {module:111, action:8, request:[], response:[Utils.UByteUtil]};
        public static const get_dragonballs_in_warehouse:Object = {module:111, action:9, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]]};
        public static const get_dragonball_skill_data:Object = {module:111, action:10, request:[], response:[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const make_a_vow:Object = {module:111, action:11, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.IntUtil]};
        public static const resolve:Object = {module:111, action:12, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const dragon_soul_data:Object = {module:111, action:13, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const one_key_resolve:Object = {module:111, action:14, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const merge_soul:Object = {module:111, action:15, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]};
        public static const play_animation:Object = {module:111, action:16, request:[], response:[Utils.UByteUtil]};
        public static const get_activity_state:Object = {module:111, action:17, request:[], response:[Utils.UByteUtil]};
        public static const notify:Object = {module:111, action:18, request:[], response:[Utils.UByteUtil]};
        public static const get_init_dragonball_vow_info:Object = {module:111, action:19, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.UByteUtil]};
        public static const exchange_gold_dragonball:Object = {module:111, action:20, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const unlock_new_dragonball:Object = {module:111, action:21, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const Actions:Array = ["get_tmp_dragonball_basic_info", "collect_dragonball", "sacrifice", "get_dragonball_list", "merge", "move", "one_key_merge", "sell_dragonball", "is_dragonball_open", "get_dragonballs_in_warehouse", "get_dragonball_skill_data", "make_a_vow", "resolve", "dragon_soul_data", "one_key_resolve", "merge_soul", "play_animation", "get_activity_state", "notify", "get_init_dragonball_vow_info", "exchange_gold_dragonball", "unlock_new_dragonball"];

        public function Mod_Dragonball_Base()
        {
            return;
        }// end function

    }
}
