package com.protocols
{
    import com.haloer.utils.*;

    public class Mod_StZhaoCha_Base extends Object
    {
        public static const OPEN:int = 0;
        public static const READY:int = 1;
        public static const CLOSE:int = 2;
        public static const SUCCESS:int = 3;
        public static const NOT_OPEN:int = 4;
        public static const IN_MATCH:int = 5;
        public static const IN_GAME:int = 6;
        public static const NOT_ENOUGH_LEVEL:int = 7;
        public static const NO_MATCH:int = 8;
        public static const FAILED:int = 9;
        public static const RIGHT:int = 10;
        public static const ERROR:int = 11;
        public static const CD_TIME:int = 12;
        public static const SHI_ZHONG:int = 13;
        public static const FANG_DA_JING:int = 14;
        public static const NOT_ENOUGH_ITEM:int = 15;
        public static const get_st_zhao_cha_status:Object = {module:162, action:0, request:[], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const join_st_zhao_cha:Object = {module:162, action:1, request:[], response:[Utils.UByteUtil]};
        public static const exit_st_zhao_cha:Object = {module:162, action:2, request:[], response:[Utils.UByteUtil]};
        public static const notify_start_game:Object = {module:162, action:3, request:[], response:[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_image_number:Object = {module:162, action:4, request:[], response:[Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil]};
        public static const pick_the_diff:Object = {module:162, action:5, request:[Utils.IntUtil, Utils.IntUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const notify_game_result:Object = {module:162, action:6, request:[], response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]};
        public static const use_item:Object = {module:162, action:7, request:[Utils.UByteUtil], response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]};
        public static const get_player_item:Object = {module:162, action:8, request:[], response:[Utils.ShortUtil, Utils.ShortUtil]};
        public static const get_player_ranking:Object = {module:162, action:9, request:[], response:[[Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil]]};
        public static const notify_compititor_player_info:Object = {module:162, action:10, request:[], response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]};
        public static const notify_10_end_time:Object = {module:162, action:11, request:[], response:[Utils.UByteUtil]};
        public static const get_player_info:Object = {module:162, action:12, request:[], response:[Utils.IntUtil, Utils.IntUtil]};
        public static const Actions:Array = ["get_st_zhao_cha_status", "join_st_zhao_cha", "exit_st_zhao_cha", "notify_start_game", "notify_image_number", "pick_the_diff", "notify_game_result", "use_item", "get_player_item", "get_player_ranking", "notify_compititor_player_info", "notify_10_end_time", "get_player_info"];

        public function Mod_StZhaoCha_Base()
        {
            return;
        }// end function

    }
}
