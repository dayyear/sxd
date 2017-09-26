package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StUnionActivity_Base extends Object
    {
        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCESS:int = 2;
        public static const HAD_GIFT:int = 3;
        public static const NON_WISH_ID:int = 4;
        public static const NON_WISH_ITEM:int = 5;
        public static const HAD_CHOOSED:int = 6;
        public static const BLESS_SUCCESS:int = 7;
        public static const WISH_SUCCESS:int = 8;
        public static const NO_CHOOSED_ITEM:int = 9;
        public static const HAD_WISH:int = 10;
        public static const HAD_BLESS:int = 11;
        public static const NO_START_WISH:int = 12;
        public static const NON_SAME_ST_UNION:int = 13;
        public static const BLESS_REQUEST:int = 14;
        public static const HAD_GET:int = 15;
        public static const NO_ENOUGH_COIN:int = 16;
        public static const NO_ENOUGH_INGOT:int = 17;
        public static const NO_ENOUGH_VIP:int = 18;
        public static const NO_ENOUGH_ST_UNION_LEVEL:int = 19;
        public static const POWER_FAME_FUN_NOT_OPEN:int = 20;
        public static const TODAY_LIMIT:int = 21;
        public static const get_st_union_tree_info:Object = {module:179, action:0, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.UByteUtil, [Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil], Utils.UByteUtil]};
        public static const choose_wish_item:Object = {module:179, action:1, request:[Utils.ShortUtil], response:[Utils.UByteUtil]};
        public static const start_bless:Object = {module:179, action:2, request:[], response:[Utils.UByteUtil]};
        public static const need_bless_player:Object = {module:179, action:3, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil], Utils.ByteUtil]};
        public static const bless_st_union_player:Object = {module:179, action:4, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const request_bless:Object = {module:179, action:5, request:[], response:[]};
        public static const notify:Object = {module:179, action:6, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]};
        public static const player_get_tree_gift:Object = {module:179, action:7, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const get_st_union_god_info:Object = {module:179, action:10, request:[], response:[Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const st_union_god_incense:Object = {module:179, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_st_union_tree_info", "choose_wish_item", "start_bless", "need_bless_player", "bless_st_union_player", "request_bless", "notify", "player_get_tree_gift", "get_st_union_god_info", "st_union_god_incense"];

        public function Mod_StUnionActivity_Base()
        {
            return;
        }// end function

    }
}
