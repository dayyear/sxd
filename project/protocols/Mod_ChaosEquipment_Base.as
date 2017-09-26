package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_ChaosEquipment_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const PLAYER_ITEM_NOT_EXIST:int = 1;
        public static const PLAYER_ROLE_NOT_EXIST:int = 2;
        public static const GRID_NOT_EXIST:int = 3;
        public static const CHAOS_MONSTER_PACK_FULL:int = 4;
        public static const NOT_ENOUGH_ST_LEVEL:int = 5;
        public static const EQUIP_CHAOS_ITEM:int = 6;
        public static const EQUIP_SAME_ATTR:int = 7;
        public static const CHAOS_ITEM_PACK_FULL:int = 8;
        public static const CHAOS_MONSTER_LIMIT:int = 9;
        public static const NOT_ENOUGH_CHAOS_ITEM:int = 10;
        public static const NOT_ENOUGH_COIN:int = 11;
        public static const NOT_ENOUGH_CHAOS_MONSTER:int = 12;
        public static const BREAK_COUNT_LIMIT:int = 13;
        public static const CAN_NOT_RESOLVE:int = 14;
        public static const NOT_ENOUGH_SCRAP:int = 15;
        public static const FAILURE:int = 16;
        public static const CAN_NOT_EAT:int = 17;
        public static const NOT_ENOUGH_SOUL:int = 18;
        public static const TIMES_LIMIT:int = 19;
        public static const get_pack_chaos_monster_list:Object = {module:124, action:0, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], [Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_role_chaos_monster_list:Object = {module:124, action:1, request:[Utils.IntUtil], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const move_chaos_monster:Object = {module:124, action:2, request:[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_pack_chaos_item_list:Object = {module:124, action:3, request:[], response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const move_chaos_item:Object = {module:124, action:5, request:[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const make_chaos_item:Object = {module:124, action:6, request:[Utils.ShortUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const chaos_monster_break:Object = {module:124, action:7, request:[Utils.IntUtil, Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const make_chaos_monster:Object = {module:124, action:8, request:[Utils.ShortUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil], [Utils.ShortUtil, Utils.IntUtil]]};
        public static const get_player_chaos_ling_ye:Object = {module:124, action:9, request:[], response:[Utils.IntUtil]};
        public static const sell_player_chaos_monster:Object = {module:124, action:10, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const sell_player_chaos_item:Object = {module:124, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const player_chaos_monster_item_id_list:Object = {module:124, action:12, request:[], response:[[Utils.ShortUtil]]};
        public static const resolve_player_chaos_monster:Object = {module:124, action:13, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.ShortUtil, Utils.IntUtil], [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_soul_info:Object = {module:124, action:14, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const exchange_soul:Object = {module:124, action:15, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const eat_soul:Object = {module:124, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]], Utils.IntUtil]};
        public static const Actions:Array = ["get_pack_chaos_monster_list", "get_role_chaos_monster_list", "move_chaos_monster", "get_pack_chaos_item_list", "move_chaos_item", "make_chaos_item", "chaos_monster_break", "make_chaos_monster", "get_player_chaos_ling_ye", "sell_player_chaos_monster", "sell_player_chaos_item", "player_chaos_monster_item_id_list", "resolve_player_chaos_monster", "get_soul_info", "exchange_soul", "eat_soul"];

        public function Mod_ChaosEquipment_Base()
        {
            return;
        }// end function

    }
}
