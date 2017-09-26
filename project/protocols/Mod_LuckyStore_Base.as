package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_LuckyStore_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const BEFORE_GET_TIME:int = 1;
        public static const PACK_FULL:int = 2;
        public static const FIND_IMMORTAL_NUM_FULL:int = 3;
        public static const COIN:int = 4;
        public static const ITEM:int = 5;
        public static const SKILL:int = 6;
        public static const FIND_IMMORTAL_NUM:int = 7;
        public static const LUCKY_YES:int = 8;
        public static const LUCKY_NO:int = 9;
        public static const LUCKY_SUCCESS:int = 10;
        public static const LUCKY_NPC_NO_EXIST:int = 11;
        public static const LUCKY_NPC_ITEM_NO_EXIST:int = 12;
        public static const LUCKY_ITEM_ALREADY_BOUGHT:int = 13;
        public static const LUCKY_NO_FREE_GRID:int = 14;
        public static const LUCKY_INSUFFICIENT_COIN:int = 15;
        public static const LUCKY_INSUFFICIENT_INGOT:int = 16;
        public static const LUCKY_FAILURE:int = 17;
        public static const NOT_ENOUGTH_PACK:int = 18;
        public static const NOT_ENOUGTH_INGOT:int = 19;
        public static const NOT_ENOUGTH_COIN:int = 20;
        public static const NOT_ENOUGTH_SKILL:int = 21;
        public static const NOT_ENOUGTH_DAOYUAN:int = 22;
        public static const JEWEL_PACK_FULL:int = 23;
        public static const TIME_OUT:int = 24;
        public static const A:int = 25;
        public static const B:int = 26;
        public static const C:int = 27;
        public static const D:int = 28;
        public static const SCRAP_FULL:int = 29;
        public static const TIMES_LIMIT:int = 30;
        public static const FAILURE:int = 31;
        public static const GREEN:int = 32;
        public static const BLUE:int = 33;
        public static const PURPLE:int = 34;
        public static const GOLD:int = 35;
        public static const SCRAP:int = 36;
        public static const LINK_SOUL:int = 37;
        public static const get_super_box_get_time_and_statu:Object = {module:87, action:1, request:[], response:[Utils.ByteUtil]};
        public static const open_super_box:Object = {module:87, action:2, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_super_box_get_record:Object = {module:87, action:3, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_lucky_store_item_list:Object = {module:87, action:5, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.ShortUtil]};
        public static const buy_lucky_store_item:Object = {module:87, action:6, request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_auto_refresh_lucky_store:Object = {module:87, action:7, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.ShortUtil]};
        public static const close_lucky_store_panel:Object = {module:87, action:8, request:[], response:[Utils.UByteUtil]};
        public static const lucky_store_online:Object = {module:87, action:9, request:[], response:[Utils.UByteUtil]};
        public static const black_shop_item_list:Object = {module:87, action:10, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]]};
        public static const buy_black_shop_item:Object = {module:87, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const notify_auto_refresh_black_store:Object = {module:87, action:12, request:[], response:[Utils.ByteUtil]};
        public static const scrap_item_list:Object = {module:87, action:13, request:[], response:[[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_scrap_item:Object = {module:87, action:14, request:[Utils.UByteUtil, Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const link_soul_item_list:Object = {module:87, action:15, request:[], response:[[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_link_soul_item:Object = {module:87, action:16, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_auto_refresh_new_store:Object = {module:87, action:17, request:[], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_super_box_get_time_and_statu", "open_super_box", "get_player_super_box_get_record", "get_lucky_store_item_list", "buy_lucky_store_item", "notify_auto_refresh_lucky_store", "close_lucky_store_panel", "lucky_store_online", "black_shop_item_list", "buy_black_shop_item", "notify_auto_refresh_black_store", "scrap_item_list", "buy_scrap_item", "link_soul_item_list", "buy_link_soul_item", "notify_auto_refresh_new_store"];

        public function Mod_LuckyStore_Base()
        {
            return;
        }// end function

    }
}
