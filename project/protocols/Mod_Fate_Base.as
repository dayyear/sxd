package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Fate_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const BAG_FULL:int = 1;
        public static const INVALID_GRID:int = 2;
        public static const FATE_CAN_PICK_UP:int = 3;
        public static const FAILED:int = 4;
        public static const NOT_ENOUGH_INGOT:int = 5;
        public static const MAX_BAG_NUMBER:int = 6;
        public static const HAVE_SAME_TYPE_FATE:int = 7;
        public static const HAVE_WEAR_ON:int = 8;
        public static const INVALID_POSITION:int = 9;
        public static const INVALID_LEVEL:int = 10;
        public static const INVALID_FATE_NPC_ID:int = 11;
        public static const FULL_TEMP_BAG:int = 12;
        public static const NOT_ENOUGH_COIN:int = 13;
        public static const IN_BAG:int = 14;
        public static const ON_ROLE:int = 15;
        public static const BAG_TO_ROLE:int = 16;
        public static const ROLE_TO_BAG:int = 17;
        public static const MAX_LEVEL:int = 18;
        public static const CANT_MERGE:int = 19;
        public static const CANT_TAICHU_QIANLI:int = 20;
        public static const NO_MERGE_ENOUGH_LEVEL:int = 21;
        public static const INVALID_NPC_ID:int = 22;
        public static const FULL_BUY_TIMES:int = 23;
        public static const FATE_CAN_EXCHANGE:int = 24;
        public static const NOT_ENOUGH_LEVEL:int = 25;
        public static const NOT_ENOUGH_COUNT:int = 26;
        public static const PURPLE:int = 27;
        public static const YELLOW:int = 28;
        public static const NO_ENOUGH_BAGS:int = 29;
        public static const NO_ENOUGH_COINS:int = 30;
        public static const NO_ENOUGH_LEVEL:int = 31;
        public static const FATE_PACK_FULL:int = 32;
        public static const PLAYER_CANCEL:int = 33;
        public static const UPGRADED_ALL:int = 34;
        public static const FUNCTION_NO_OPEN:int = 35;
        public static const NOT_ENOUGH_COINS:int = 36;
        public static const TRUE:int = 37;
        public static const FALSE:int = 38;
        public static const NOT_ENOUGH_MING_GONG:int = 39;
        public static const NOT_BREAKTHROUGHS:int = 40;
        public static const LIMILT_NUM:int = 41;
        public static const get_fate_npc:Object = {module:22, action:0, request:[], response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.IntUtil]};
        public static const get_temp_fate:Object = {module:22, action:1, request:[], response:[[Utils.LongUtil, Utils.ShortUtil]]};
        public static const pickup_fate:Object = {module:22, action:2, request:[[Utils.LongUtil]], response:[Utils.UByteUtil, [Utils.LongUtil]]};
        public static const sale_temp_fate:Object = {module:22, action:3, request:[[Utils.LongUtil]], response:[Utils.UByteUtil]};
        public static const get_bag_list:Object = {module:22, action:4, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.ShortUtil], Utils.ByteUtil], Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const buy_bag_grid:Object = {module:22, action:5, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_role_fate_list:Object = {module:22, action:6, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.ShortUtil], Utils.ByteUtil], Utils.IntUtil, Utils.ByteUtil]};
        public static const wear_on:Object = {module:22, action:7, request:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil]};
        public static const discard_fate:Object = {module:22, action:8, request:[Utils.IntUtil], response:[]};
        public static const appoint_fate_npc:Object = {module:22, action:9, request:[Utils.ByteUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil]};
        public static const wear_off_fate:Object = {module:22, action:10, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const change_fate_grid:Object = {module:22, action:12, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const merge:Object = {module:22, action:13, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.ShortUtil], Utils.ShortUtil]};
        public static const change_position:Object = {module:22, action:14, request:[Utils.IntUtil, Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_player_role_fate_power:Object = {module:22, action:15, request:[Utils.IntUtil], response:[Utils.IntUtil]};
        public static const get_merge_data:Object = {module:22, action:16, request:[Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.ShortUtil]};
        public static const merge_all_in_bag:Object = {module:22, action:17, request:[], response:[]};
        public static const buy_fate_npc:Object = {module:22, action:18, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const exchange_fate:Object = {module:22, action:19, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const get_scrap_amount:Object = {module:22, action:20, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const merge_all_normal_in_bag:Object = {module:22, action:21, request:[Utils.UByteUtil], response:[]};
        public static const exchange_unknow_fire:Object = {module:22, action:22, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_fate_cat_skill:Object = {module:22, action:23, request:[], response:[Utils.IntUtil, Utils.ShortUtil, [Utils.IntUtil]]};
        public static const use_fate_cat_skill:Object = {module:22, action:24, request:[[Utils.IntUtil]], response:[Utils.UByteUtil]};
        public static const crazy_fate:Object = {module:22, action:25, request:[Utils.IntUtil], response:[]};
        public static const cancel_crazy_fate:Object = {module:22, action:26, request:[], response:[]};
        public static const notify_crazy_fate_result:Object = {module:22, action:27, request:[], response:[Utils.UByteUtil, [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_upgrade_fate_npc_id:Object = {module:22, action:28, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const upgrade_fate_npc:Object = {module:22, action:29, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_fate_inn_upgrade_flag:Object = {module:22, action:30, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_ming_gong_info:Object = {module:22, action:31, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const exchange_ming_gong:Object = {module:22, action:32, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const breakthroughs_fate:Object = {module:22, action:33, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const exchange_ming_gong_scrap:Object = {module:22, action:34, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_fate_npc", "get_temp_fate", "pickup_fate", "sale_temp_fate", "get_bag_list", "buy_bag_grid", "get_role_fate_list", "wear_on", "discard_fate", "appoint_fate_npc", "wear_off_fate", "change_fate_grid", "merge", "change_position", "get_player_role_fate_power", "get_merge_data", "merge_all_in_bag", "buy_fate_npc", "exchange_fate", "get_scrap_amount", "merge_all_normal_in_bag", "exchange_unknow_fire", "get_fate_cat_skill", "use_fate_cat_skill", "crazy_fate", "cancel_crazy_fate", "notify_crazy_fate_result", "get_upgrade_fate_npc_id", "upgrade_fate_npc", "get_fate_inn_upgrade_flag", "get_ming_gong_info", "exchange_ming_gong", "breakthroughs_fate", "exchange_ming_gong_scrap"];

        public function Mod_Fate_Base()
        {
            return;
        }// end function

    }
}
