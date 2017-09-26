package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_Farm_Base extends Object
    {
        public static const PLANT:int = 0;
        public static const NO_PLANT:int = 1;
        public static const EXP_HERBS:int = 2;
        public static const COIN_HERBS:int = 3;
        public static const XIANLING_HERBS:int = 4;
        public static const WAR:int = 5;
        public static const INVITE:int = 6;
        public static const NOINVITE:int = 7;
        public static const SUCCESS:int = 8;
        public static const TOP_HERBS:int = 9;
        public static const NOT_ENOUGH_INGOT:int = 10;
        public static const IS_TOP_HERBS:int = 11;
        public static const NO_ENOUGHT_COIN_TREE_COUNT:int = 12;
        public static const NO_ENOUGHT_XIANLING_TREE_COUNT:int = 13;
        public static const PACK_FULL:int = 14;
        public static const REACH_MAX_LAND_COUNT:int = 15;
        public static const NOT_PLAYER_ROLE:int = 16;
        public static const IS_MAIN_ROLE:int = 17;
        public static const ROLE_LEVEL:int = 18;
        public static const PASS:int = 19;
        public static const REMAIN:int = 20;
        public static const NO_REMAIN:int = 21;
        public static const NO_INGOT:int = 22;
        public static const LIMIT_NUM:int = 23;
        public static const NO_ENOUGTH_TIMES:int = 24;
        public static const NO_VIP:int = 25;
        public static const IS_PLANT:int = 26;
        public static const CAN_NOT_UP:int = 27;
        public static const FAILED:int = 28;
        public static const NOT_ENOUGTH_COIN:int = 29;
        public static const NOT_ENOUGTH_INGOT:int = 30;
        public static const ERROR:int = 31;
        public static const ITEM_PACK_FULL:int = 32;
        public static const get_farmlandinfo_list:Object = {module:13, action:0, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil], Utils.IntUtil]};
        public static const get_player_roleinfo_list:Object = {module:13, action:1, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]};
        public static const get_herbs_seed:Object = {module:13, action:2, request:[Utils.UByteUtil], response:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const refresh_herbs_seed:Object = {module:13, action:3, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const get_top_herbs_seed:Object = {module:13, action:4, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const plant_herbs:Object = {module:13, action:5, request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil]};
        public static const harvest:Object = {module:13, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]};
        public static const reclamation:Object = {module:13, action:7, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const check_role_state:Object = {module:13, action:8, request:[Utils.IntUtil, Utils.UByteUtil], response:[Utils.UByteUtil]};
        public static const harvest_check_remain_exp:Object = {module:13, action:9, request:[Utils.IntUtil], response:[Utils.IntUtil, Utils.UByteUtil]};
        public static const get_simple_farmlandinfo:Object = {module:13, action:10, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const clear_farmland_cd:Object = {module:13, action:11, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const buy_coin_tree_count_info:Object = {module:13, action:12, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const buy_coin_tree_count:Object = {module:13, action:13, request:[], response:[Utils.UByteUtil, Utils.IntUtil]};
        public static const coin_tree_count_notify:Object = {module:13, action:14, request:[], response:[Utils.IntUtil]};
        public static const ingot_for_farmland:Object = {module:13, action:15, request:[Utils.IntUtil], response:[Utils.IntUtil]};
        public static const up_farmland_level:Object = {module:13, action:16, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const xianling_tree_count_notify:Object = {module:13, action:17, request:[], response:[Utils.IntUtil]};
        public static const xianling_tree_count_info:Object = {module:13, action:18, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const is_player_get_xian_ling_gift:Object = {module:13, action:19, request:[], response:[Utils.ByteUtil]};
        public static const player_get_xian_ling_gift:Object = {module:13, action:20, request:[], response:[Utils.UByteUtil, Utils.ByteUtil]};
        public static const get_new_farmlandinfo_list:Object = {module:13, action:21, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]]};
        public static const new_farmland_herbs_list:Object = {module:13, action:22, request:[], response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const buy_new_herbs:Object = {module:13, action:23, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const plant_new_herbs:Object = {module:13, action:24, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const harvest_new:Object = {module:13, action:25, request:[Utils.IntUtil], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]};
        public static const new_clear_farmland_cd:Object = {module:13, action:26, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_farmlandinfo_list", "get_player_roleinfo_list", "get_herbs_seed", "refresh_herbs_seed", "get_top_herbs_seed", "plant_herbs", "harvest", "reclamation", "check_role_state", "harvest_check_remain_exp", "get_simple_farmlandinfo", "clear_farmland_cd", "buy_coin_tree_count_info", "buy_coin_tree_count", "coin_tree_count_notify", "ingot_for_farmland", "up_farmland_level", "xianling_tree_count_notify", "xianling_tree_count_info", "is_player_get_xian_ling_gift", "player_get_xian_ling_gift", "get_new_farmlandinfo_list", "new_farmland_herbs_list", "buy_new_herbs", "plant_new_herbs", "harvest_new", "new_clear_farmland_cd"];

        public function Mod_Farm_Base()
        {
            return;
        }// end function

    }
}
