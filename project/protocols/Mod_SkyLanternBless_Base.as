package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SkyLanternBless_Base extends Object
    {
        public static const GOLD:int = 0;
        public static const RED:int = 1;
        public static const PURPLE:int = 2;
        public static const BLUE:int = 3;
        public static const WHITE:int = 4;
        public static const STATE_POINT:int = 5;
        public static const XIAN_LING:int = 6;
        public static const DRAGONBALL:int = 7;
        public static const COIN:int = 8;
        public static const FATE:int = 9;
        public static const ITEM:int = 10;
        public static const QI_HUN:int = 11;
        public static const NEI_DAN:int = 12;
        public static const CARD_SOUL:int = 13;
        public static const SUCCESS:int = 14;
        public static const NOT_ENOUGH_INGOT:int = 15;
        public static const NON_ACTIVITY_TIME:int = 16;
        public static const PACK_FULL:int = 17;
        public static const FATE_PACK_FULL:int = 18;
        public static const NON_OPEN_FUNCTION:int = 19;
        public static const SHI_TUO:int = 20;
        public static const NEW_BLESS:int = 21;
        public static const PLAYER_INFO:int = 22;
        public static const FREE_BLESS:int = 23;
        public static const OPEN:int = 24;
        public static const CLOSE:int = 25;
        public static const INGOT:int = 26;
        public static const FREE:int = 27;
        public static const ROLE_SCRAP_FULL:int = 28;
        public static const LOST_DEPLOY_FUN_NOT_OPEN:int = 29;
        public static const get_activity_time:Object = {module:122, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_bless_rank:Object = {module:122, action:1, request:[], response:[[Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const get_player_info:Object = {module:122, action:2, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil]};
        public static const bless:Object = {module:122, action:3, request:[], response:[Utils.UByteUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const bless_notify:Object = {module:122, action:4, request:[], response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const close_sky_lantern_bless:Object = {module:122, action:5, request:[], response:[]};
        public static const win_sky_lantern_bless:Object = {module:122, action:6, request:[], response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil]};
        public static const get_player_bless_cost:Object = {module:122, action:7, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil]};
        public static const multi_bless:Object = {module:122, action:8, request:[], response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const get_player_rank_bless_item_id:Object = {module:122, action:9, request:[], response:[Utils.IntUtil, [Utils.IntUtil, Utils.ShortUtil]]};
        public static const choice_rank_bless_item_id:Object = {module:122, action:10, request:[Utils.IntUtil], response:[Utils.UByteUtil]};
        public static const Actions:Array = ["get_activity_time", "get_bless_rank", "get_player_info", "bless", "bless_notify", "close_sky_lantern_bless", "win_sky_lantern_bless", "get_player_bless_cost", "multi_bless", "get_player_rank_bless_item_id", "choice_rank_bless_item_id"];

        public function Mod_SkyLanternBless_Base()
        {
            return;
        }// end function

    }
}
