package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SealSoul_Base extends Object
    {
        public static const SUCCEED:int = 0;
        public static const FAILED:int = 1;
        public static const YES:int = 2;
        public static const NO:int = 3;
        public static const NO_ENOUGH_INGOT:int = 4;
        public static const LOCK:int = 5;
        public static const NO_ENOUGH_COIN:int = 6;
        public static const NO_RECORD:int = 7;
        public static const NO_LOCK:int = 8;
        public static const INVALID_LOCATION:int = 9;
        public static const PLAYER_ERROR:int = 10;
        public static const NOT_ENOUGH_STONE:int = 11;
        public static const NOT_ENOUGH_NINE:int = 12;
        public static const NOT_ENOUGH_HSTONE:int = 13;
        public static const MAX_ADDITION:int = 14;
        public static const LEVEL_LIMIT:int = 15;
        public static const NOT_GOLDEN:int = 16;
        public static const NO_ENOUGH_PROP:int = 17;
        public static const soul_info_by_location:Object = {module:34, action:1, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const swap_soul:Object = {module:34, action:2, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const move_soul:Object = {module:34, action:3, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_item_info_by_role_id:Object = {module:34, action:4, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], Utils.UByteUtil]};
        public static const open_player_soul_key:Object = {module:34, action:5, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const soul_attribute_reset:Object = {module:34, action:6, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_tower_key:Object = {module:34, action:7, request:[], response:[Utils.IntUtil, Utils.ByteUtil]};
        public static const sell_player_soul:Object = {module:34, action:8, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_ten_times_reset_value:Object = {module:34, action:9, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const set_player_soul_value:Object = {module:34, action:10, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_item_info_by_player_item_id:Object = {module:34, action:11, request:[Utils.IntUtil], response:[Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]]};
        public static const get_reset_count:Object = {module:34, action:12, request:[], response:[Utils.IntUtil]};
        public static const get_stone_count:Object = {module:34, action:13, request:[], response:[Utils.IntUtil]};
        public static const lock:Object = {module:34, action:14, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const will_to_unlock:Object = {module:34, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_get:Object = {module:34, action:17, request:[], response:[Utils.ByteUtil]};
        public static const get_day_stone:Object = {module:34, action:18, request:[Utils.ByteUtil], response:[Utils.ByteUtil, Utils.IntUtil]};
        public static const swap_seal_soul:Object = {module:34, action:19, request:[Utils.IntUtil], response:[Utils.ByteUtil]};
        public static const day_stone_count:Object = {module:34, action:20, request:[], response:[Utils.IntUtil]};
        public static const save_lock:Object = {module:34, action:21, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const up_buff:Object = {module:34, action:22, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const up_soul_attribute_addition:Object = {module:34, action:23, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const get_hstone_count:Object = {module:34, action:24, request:[], response:[Utils.IntUtil]};
        public static const upgrade_to_orange:Object = {module:34, action:25, request:[Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const get_prop_count:Object = {module:34, action:26, request:[], response:[Utils.IntUtil]};
        public static const upgrade_orange_attribute_add_percent:Object = {module:34, action:27, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["soul_info_by_location", "swap_soul", "move_soul", "get_item_info_by_role_id", "open_player_soul_key", "soul_attribute_reset", "get_tower_key", "sell_player_soul", "get_ten_times_reset_value", "set_player_soul_value", "get_item_info_by_player_item_id", "get_reset_count", "get_stone_count", "lock", "will_to_unlock", "notify_get", "get_day_stone", "swap_seal_soul", "day_stone_count", "save_lock", "up_buff", "up_soul_attribute_addition", "get_hstone_count", "upgrade_to_orange", "get_prop_count", "upgrade_orange_attribute_add_percent"];

        public function Mod_SealSoul_Base()
        {
            return;
        }// end function

    }
}
