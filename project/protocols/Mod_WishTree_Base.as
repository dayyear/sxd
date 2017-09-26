package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_WishTree_Base extends Object
    {
        public static const RED:int = 0;
        public static const GOLD:int = 1;
        public static const PURPLE:int = 2;
        public static const BLUE:int = 3;
        public static const GREEN:int = 4;
        public static const SPECIAL:int = 5;
        public static const STATE_POINT:int = 6;
        public static const XIAN_LING:int = 7;
        public static const ROLE_SCRAP:int = 8;
        public static const COIN:int = 9;
        public static const FATE:int = 10;
        public static const ITEM:int = 11;
        public static const QI_HUN:int = 12;
        public static const NEI_DAN:int = 13;
        public static const SUCCESS:int = 14;
        public static const NOT_ENOUGH_INGOT:int = 15;
        public static const NON_ACTIVITY_TIME:int = 16;
        public static const PACK_FULL:int = 17;
        public static const FATE_PACK_FULL:int = 18;
        public static const NON_OPEN_FUNCTION:int = 19;
        public static const NEED_VIP_LEVEL_ONE:int = 20;
        public static const NEED_VIP_LEVEL_FOUR:int = 21;
        public static const SHI_TUO:int = 22;
        public static const PLAYER_INFO:int = 23;
        public static const REFRESH_WISH_TREE:int = 24;
        public static const CHANGE_ROLE_SCRAP:int = 25;
        public static const RANK_AWARD_COUNT_LIMIT:int = 26;
        public static const SELF_COUNT_LIMIT:int = 27;
        public static const NON_SAME_GAME_SERVER:int = 28;
        public static const YES:int = 29;
        public static const NO:int = 30;
        public static const ROLE_SCRAP_FULL:int = 31;
        public static const FUNCTION_UNOPEN:int = 32;
        public static const get_wish_tree_info:Object = {module:145, action:0, request:[], response:[[Utils.UByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_wish_cost:Object = {module:145, action:2, request:[], response:[Utils.ByteUtil, Utils.ShortUtil]};
        public static const start_wish:Object = {module:145, action:3, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil], Utils.ShortUtil]};
        public static const wish_notify:Object = {module:145, action:4, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil]]};
        public static const bless_bag_rank_info:Object = {module:145, action:5, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil], Utils.ShortUtil]};
        public static const approve_and_get_award:Object = {module:145, action:6, request:[Utils.IntUtil], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const close_wish_tree:Object = {module:145, action:7, request:[], response:[]};
        public static const can_get_special_award:Object = {module:145, action:8, request:[], response:[Utils.UByteUtil]};
        public static const get_player_wish_role_scrap:Object = {module:145, action:9, request:[], response:[Utils.ByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ShortUtil], [Utils.IntUtil, Utils.IntUtil]]};
        public static const choice_wish_role_scrap:Object = {module:145, action:10, request:[Utils.ByteUtil], response:[Utils.UByteUtil]};
        public static const get_activity_info:Object = {module:145, action:11, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const choice_wish_item:Object = {module:145, action:12, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_wish_tree_info", "get_player_wish_cost", "start_wish", "wish_notify", "bless_bag_rank_info", "approve_and_get_award", "close_wish_tree", "can_get_special_award", "get_player_wish_role_scrap", "choice_wish_role_scrap", "get_activity_info", "choice_wish_item"];

        public function Mod_WishTree_Base()
        {
            return;
        }// end function

    }
}
