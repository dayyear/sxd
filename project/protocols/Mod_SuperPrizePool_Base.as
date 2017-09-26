package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_SuperPrizePool_Base extends Object
    {
        public static const SUCCESS:int = 0;
        public static const NON_ACTIVITY_TIME:int = 1;
        public static const NO_ENOUGH_COUNT:int = 2;
        public static const PACK_FULL:int = 3;
        public static const NOT_ENOUGH_FATE_GRID:int = 4;
        public static const DRAGONBALL_NO_FREE_GRID:int = 5;
        public static const NO_ENOUGH_TICKET:int = 6;
        public static const AWARD_LIST:int = 7;
        public static const get_activity_info:Object = {module:203, action:0, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_info:Object = {module:203, action:1, request:[], response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil]};
        public static const start_lottery:Object = {module:203, action:2, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_exchange_info:Object = {module:203, action:3, request:[], response:[Utils.IntUtil, [Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]};
        public static const exchange_award:Object = {module:203, action:4, request:[Utils.ShortUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify:Object = {module:203, action:5, request:[], response:[Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const close_super_prize_pool:Object = {module:203, action:6, request:[], response:[]};
        public static const get_award_list:Object = {module:203, action:7, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const notify_server_ticket_change:Object = {module:203, action:8, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_activity_info", "get_player_info", "start_lottery", "get_exchange_info", "exchange_award", "notify", "close_super_prize_pool", "get_award_list", "notify_server_ticket_change"];

        public function Mod_SuperPrizePool_Base()
        {
            return;
        }// end function

    }
}
