package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Bloodline_Base extends Object
    {
        public static const TRUE:int = 0;
        public static const FALSE:int = 1;
        public static const BLOODLINE_YES:int = 2;
        public static const BLOODLINE_NO:int = 3;
        public static const SUCCESS:int = 4;
        public static const NO_ENOUGH_ESSENCE:int = 5;
        public static const FUNCTION_NO_OPEN:int = 6;
        public static const AWAKEN_ALREADY:int = 7;
        public static const NO_AWAKEN:int = 8;
        public static const NO_ENOUGH_COINS:int = 9;
        public static const PLAYER_ID_ERROR:int = 10;
        public static const NO_ENOUGH_YUPAI:int = 11;
        public static const MAX_LEVEL_LIMIT:int = 12;
        public static const ERROR_BUFF_TYPE:int = 13;
        public static const NO_ENOUGH_POINTS:int = 14;
        public static const POINT_ERROR:int = 15;
        public static const NORMAL_REFRESH:int = 16;
        public static const INGOT_REFRESH:int = 17;
        public static const NO_ENOUGH_INGOT:int = 18;
        public static const NO_ENOUGH_COIN:int = 19;
        public static const LOCK_FOUR:int = 20;
        public static const NO_REFRESH:int = 21;
        public static const ALREADY_EQUIP:int = 22;
        public static const PARTNER_FUNCTION_NO_OPEN:int = 23;
        public static const NO_EQUIP:int = 24;
        public static const QINGLONG:int = 25;
        public static const BAIHU:int = 26;
        public static const ZHUQUE:int = 27;
        public static const XUANWU:int = 28;
        public static const LOCK:int = 29;
        public static const UNLOCK:int = 30;
        public static const FAILURE:int = 31;
        public static const NOT_ITEM:int = 32;
        public static const ALREADY_ACTIVATE:int = 33;
        public static const NOT_THE_PLAYER:int = 34;
        public static const NOT_ACTIVATE:int = 35;
        public static const NO_ENOUGH_STATEPOINT:int = 36;
        public static const CAN_NOT_EVOLVE:int = 37;
        public static const NOT_BLOODLINE_LEVEL_LIMIT:int = 38;
        public static const NOT_USE_XUE_PO:int = 39;
        public static const NO_ENOUGH_XUE_HUN_SHI:int = 40;
        public static const MAX_ACTIVATE_LENGTH:int = 41;
        public static const NO_ENOUGH_ACTIVATE_NUM:int = 42;
        public static const NO_ENOUGH_LEVEL:int = 43;
        public static const NO_XUE_LING_JIE_JING:int = 44;
        public static const get_bloodline_info:Object = {module:116, action:0, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], Utils.UByteUtil, Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.UByteUtil]};
        public static const awaken_bloodline:Object = {module:116, action:1, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const buy_bloodline:Object = {module:116, action:2, request:[], response:[Utils.UByteUtil]};
        public static const strengthen_player_bloodline:Object = {module:116, action:3, request:[Utils.IntUtil, [Utils.IntUtil]], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil]]};
        public static const assign_potential_point:Object = {module:116, action:4, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const refresh_conversion_rate:Object = {module:116, action:5, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const save_conversion_rate:Object = {module:116, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const equip_bloodline:Object = {module:116, action:7, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const unequip_bloodline:Object = {module:116, action:8, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const reset_potential_point:Object = {module:116, action:9, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const change_conversion_rate_lock_flag:Object = {module:116, action:10, request:[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_top_10:Object = {module:116, action:11, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const activate:Object = {module:116, action:12, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const one_key_strengthen:Object = {module:116, action:13, request:[Utils.IntUtil, [Utils.IntUtil]], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil]]]};
        public static const activate_two_later:Object = {module:116, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const evolve:Object = {module:116, action:15, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const refresh_conversion_rate1:Object = {module:116, action:16, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const save_conversion_rate1:Object = {module:116, action:17, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const change_conversion_rate_lock_flag1:Object = {module:116, action:18, request:[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_two_stage_info:Object = {module:116, action:19, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const two_stage_activate:Object = {module:116, action:20, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const two_stage_skill_activate:Object = {module:116, action:21, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const third_stage_activate:Object = {module:116, action:22, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_bloodline_info", "awaken_bloodline", "buy_bloodline", "strengthen_player_bloodline", "assign_potential_point", "refresh_conversion_rate", "save_conversion_rate", "equip_bloodline", "unequip_bloodline", "reset_potential_point", "change_conversion_rate_lock_flag", "get_top_10", "activate", "one_key_strengthen", "activate_two_later", "evolve", "refresh_conversion_rate1", "save_conversion_rate1", "change_conversion_rate_lock_flag1", "get_two_stage_info", "two_stage_activate", "two_stage_skill_activate", "third_stage_activate"];

        public function Mod_Bloodline_Base()
        {
            return;
        }// end function

    }
}
